close all; clc; clear all;
figure,
load('f_001.mat');

fftc = ffts_c;
fftr = ffts_r;

for i=1:length(periods)
    g_s(i,:) =  10*log10(abs(fftc(i,:)./fftr(i,:)));
    [m(i), in(i)] = min(g_s(i,:));
end    

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


semilogx(wout, 20*log10(mag)); hold on;
title('Bode Diagram');
ylabel('Magnitude (dB)');
grid on;

semilogx(omega, m, '*'), hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
load('f_002.mat');

fftc = ffts_c;
fftr = ffts_r;

for i=1:length(periods)
    g_s(i,:) =  10*log10(abs(fftc(i,:)./fftr(i,:)));
    [m(i), in(i)] = min(g_s(i,:));
end    

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

title('Bode Diagram');
ylabel('Magnitude (dB)');
m = flip(m);
semilogx(omega, m, '*'), hold on;