%% Time series input
voltage_capacitor_s = timeseries(voltage_capacitor, time);
voltage_resistor_s = timeseries(voltage_resistor, time);

%% Parameters
R = 10.19*10^3;
C = 10.93*10^(-6);
tau = R*C;

%% ideal tau
i_tau = 0.1;