close all; clear all; clc;

%% FFT
load('test_001.mat');

Fs = 1/0.001;

in = input("Voltage Capacitor [1], Voltage Resistor [2]: \n => ");

if in == 1
    S = voltage_capacitor;
elseif in == 2
    S = voltage_resistor;
end

L = length(S);
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f, P1, 'LineWidth', 2) 

if in == 1
    title('Single-Sided Amplitude Spectrum of Capacitor Voltage', 'FontSize', 20);
elseif in == 2
    title('Single-Sided Amplitude Spectrum of Resistor Voltage', 'FontSize', 20);    
end

grid on;
ylabel('|Y(f)|', 'FontSize', 16)
xlabel('f (Hz)', 'FontSize', 16)
xlim([0 3]);

%% Bode
tau = R*C;

NUM = [1];
DEN = [tau 1];

G = tf(NUM, DEN);

[mag,phase,wout] = bode(G);                    
mag = squeeze(mag);                                             
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                                     
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');
figure,
subplot(2,1,1);
semilogx(wout, 20*log10(mag), '-b',  dB3(1), 20*log10(dB3(3)), '+r', 'MarkerSize',10)
title('Bode Diagram');
ylabel('Magnitude (dB)');
grid on;
subplot(2,1,2);
semilogx(wout, phase, '-b',  dB3(1), dB3(2), '+r', 'MarkerSize',10)
ylabel('Phase (deg)');
xlabel('Frequency (rad/s)');
grid on;
set(findall(gcf,'type','line'),'linewidth',2)
set(findall(gcf,'type','text'),'FontSize',20)