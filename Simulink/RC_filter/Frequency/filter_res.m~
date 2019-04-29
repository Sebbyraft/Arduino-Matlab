clear all; close all; clc;
%% 1
periods = [0.01 0.015 0.02 0.025 0.04 0.06 0.08 0.2 0.4 0.8 1];
periods = [0.01 0.02 0.03 0.04 0.06 0.08 0.2 0.4 0.8 1];

omega = [0 0.2 0.4 0.8 2 2.6 3.9 6.4 7.9 10.6 16];
omega = [0 0.4 0.8 2 2.6 3.9 6.4 7.9 10.6 16];

%% 2
% periods = [0.01 0.011 0.012 0.013 0.014 0.015 0.017 0.019 0.021 0.025 0.03 0.045 0.06 0.07 0.1 0.3];
% omega = [16 14.4 13.2 12.3 11.4 10.6 9.398 8.398 7.598 6.399 5.399 9.599 2.599 2.2 1.6 0.5999];
model = 'RC';
Fs = 1/0.001;

figure(1);
figure(2);
for i=1:length(periods)
    T = periods(i)
    
    sim(model);
    
    volt_caps(i, :) = voltage_capacitor;
    volt_ress(i, :) = voltage_resistor;
    
    %% FFT capacitor
    S = voltage_capacitor;
    L = length(S);
    Y = fft(S);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    f = Fs*(0:(L/2))/L;
    ffts_c(i,:) = P1;
    
    figure(1);
    plot(f, P1, 'LineWidth', 2); hold on;
    xlim([0 20]);
    
    %% FFT resistor
    S = voltage_resistor;
    L = length(S);
    Y = fft(S);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    f = Fs*(0:(L/2))/L;
    ffts_r(i,:) = P1;
    figure(2);
    plot(f, P1, 'LineWidth', 2); hold on;
    xlim([0 20]);
end
