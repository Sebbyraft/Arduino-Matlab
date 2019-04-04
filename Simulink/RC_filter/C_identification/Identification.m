%% Load data
load('test_002.mat');
in = timeseries(voltage_resistor, time);
out_1 = timeseries(voltage_capacitor, time);

%% Parameters
R = 10.09*10^3;
C_vec = 90e-6:1e-6:110e-6;

%% Simulink model
model = 'C_identification';
figure;
for i=1:length(C_vec)
    C = C_vec(i);
    tau = R*C;
    
    % Start simulation
    sim(model);
    sim_out(i,:) = square_error;
    plot(square_error, 'LineWidth', 2); hold on;
end

to_min = sim_out(:,end);

[m, i] = min(to_min);
display('Capacitor value')
C = C_vec(i)

%% Final simulation
tau = R*C;
sim(model);
figure,
plot(time2, sim_c_id, 'LineWidth', 2); hold on;
plot(time, voltage_capacitor, 'LineWidth', 2); hold on;
plot(time, voltage_resistor, 'LineWidth', 2); hold on;