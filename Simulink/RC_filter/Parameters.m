%% Time series input
voltage_capacitor_s = timeseries(voltage_capacitor, time);
voltage_resistor_s = timeseries(voltage_resistor, time);

%% Parameters #1
% R = 10.09*10^(3);
% C = 99.55*10^(-6);
%% Parameters #2
R = 10.19*10^3;
C = 10.88*10^(-6);
tau = R*C;

%% ideal tau #1
% i_tau = 1;

%% ideal tau #2
i_tau = 0.1;
