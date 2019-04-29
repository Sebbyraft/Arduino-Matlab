close all; clc; clear all;
figure,
load('f_001.mat');

fftc = ffts_c;
fftr = ffts_r;

for i=1:length(periods)
    g_s(i,:) =  10*log10(abs(fftc(i,:)./fftr(i,:)));
    [m1(i), in(i)] = min(g_s(i,:));
end    

omega1 = omega;
% m = flip(m);
%% Bode
tau = 1.0001;

NUM = [1];
DEN = [tau 1];

G = tf(NUM, DEN);

[mag,phase,wout] = bode(G);                    
mag = squeeze(mag);                                             
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                             


semilogx(wout, 20*log10(mag),'LineWidth',2); hold on;
title('Bode Diagram','FontSize', 20);
xlabel('Frequency (Hz)', 'FontSize', 16);
ylabel('Magnitude (dB)', 'FontSize', 16);
grid on;

%semilogx(omega, m1, '*'), hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('f_002.mat');

fftc = ffts_c;
fftr = ffts_r;

for i=1:length(periods)
    g_s(i,:) =  10*log10(abs(fftc(i,:)./fftr(i,:)));
    [m2(i), in(i)] = min(g_s(i,:));
end    
omega2 = omega;
% m = flip(m);
%% Bode
tau = 1.0001;

NUM = [1];
DEN = [tau 1];

G = tf(NUM, DEN);

[mag,phase,wout] = bode(G);                    
mag = squeeze(mag);                                             
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;     

m2 = flip(m2);
m3 = [m1 m2];
omega3 = [omega1 omega2];

semilogx(omega3, m3, '*'), hold on;

legend({'Simulated Bode Diagram', 'Real Bode Diagram'}, 'FontSize', 16);