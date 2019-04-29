close all;

%% Merging
omega = [omega_f_a omega_s_a];
mod = [mod_f_a mod_s_a];
pha = [pha_f_a pha_s_a];

%% Bode
NUM = [1];
DEN = [0.9 1];

G = tf(NUM, DEN);

[mag,phase,wout] = bode(G);                    
mag = squeeze(mag);                                             
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                                     
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');
figure(100);
subplot(2,1,1);
semilogx(wout, 20*log10(mag)); hold on;
semilogx(omega, mod, '*','Color',[.8 .3 .3] ,'MarkerSize', 10);
title('Bode Diagram');
ylabel('Magnitude (dB)'); grid on;
set(findall(gcf,'type','line'),'linewidth',2)
set(findall(gcf,'type','text'),'FontSize',20)
legend({'Ideal', 'Real'})
subplot(2,1,2);
semilogx(wout, phase); hold on;
semilogx(omega, pha, '*','Color',[.8 .3 .3],'MarkerSize', 10);
ylabel('Phase (deg)');
xlabel('Frequency (rad/s)');
legend({'Ideal', 'Real'})
grid on;
set(findall(gcf,'type','line'),'linewidth',2)
set(findall(gcf,'type','text'),'FontSize',20)
%%%%%%%%