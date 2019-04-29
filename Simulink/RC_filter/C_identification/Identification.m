close all;
clear all;
%% Load data
load('test_002.mat');
measured_input = timeseries(voltage_resistor, time);
measured_capacitor_voltage = timeseries(voltage_capacitor, time);

%% Parameters
R = 10.19*10^3;
% 100 uF capacitor
% C_vec = 80e-6:1e-6:120e-6;

% 10 uF capacitor
C_vec = 70e-6:1e-6:150e-6;
%% Simulink model
model = 'C_identification';
figure;
for i=1:length(C_vec)
    C = C_vec(i);
    tau = R*C;
    
    % Start simulation
    sim(model);
    sim_out(i,:) = square_error;
    plot(time2, square_error, 'LineWidth', 2); hold on;
end
title("Square Errors", 'FontSize', 20);
xlabel("Time [s]", 'FontSize',16);
ylabel("Square Error [V]", 'FontSize',16);
grid on;


to_min = sim_out(:,end);

[m, i] = min(to_min);
display('Capacitor value')
C = C_vec(i)
display('Square Error');
Square_Error = sim_out(i,end)

figure,
plot(to_min, 'LineWidth', 2); grid on;
title("Square Error (Minimization)", 'FontSize', 20);
xlabel("N^\circ Test", 'FontSize',16);
ylabel("Square Error [V]", 'FontSize',16);
%% Final simulation
% tau = R*C;
% sim(model);
% figure,
% plot(time2, sim_c_id, 'LineWidth', 2); hold on;
% plot(time, voltage_capacitor, 'LineWidth', 2); hold on;
% plot(time, voltage_resistor, 'LineWidth', 2); hold on;
% legend({'Identification', 'Real', 'Reference'},'FontSize', 20);