
%% Merging

%% 1 
omega = [omega_3_a];
mod = [mod_3_a];
pha = [pha_3_a];

%% 1 3 
% omega = [omega_1_a omega_3_a];
% mod = [mod_1_a mod_3_a];
% pha = [pha_1_a pha_3_a];

%% 1 3 5 
% omega = [omega_1_a omega_3_a omega_7_a];
% mod = [mod_1_a mod_3_a mod_7_a];
% pha = [pha_1_a pha_3_a pha_7_a];

%% 1 3 5 9
% omega = [omega_1_a omega_3_a omega_7_a omega_9_a];
% mod = [mod_1_a mod_3_a mod_7_a mod_9_a];
% pha = [pha_1_a pha_3_a pha_7_a pha_9_a];

%% Bode
NUM = [1];
DEN = [1.01 1];

G = tf(NUM, DEN);

[mag,phase,wout] = bode(G);                    
mag = squeeze(mag);                                             
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                                     
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');
figure,
subplot(2,1,1);
semilogx(wout, 20*log10(mag)); hold on;
semilogx(omega, mod, '*','Color',[.8 .3 .3] ,'MarkerSize', 15);
title('Bode Diagram');
ylabel('Magnitude (dB)'); grid on;
set(findall(gcf,'type','line'),'linewidth',2)
set(findall(gcf,'type','text'),'FontSize',20)
legend({'Ideal', 'Real'})
subplot(2,1,2);
semilogx(wout, phase); hold on;
semilogx(omega, pha, '*','Color',[.8 .3 .3],'MarkerSize', 15);
ylabel('Phase (deg)');
xlabel('Frequency (rad/s)');
legend({'Ideal', 'Real'})
grid on;
set(findall(gcf,'type','line'),'linewidth',2)
set(findall(gcf,'type','text'),'FontSize',20)
%%%%%%%%