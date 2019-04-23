%% First of all
% 1) Run RC_filter.slx
% 2) Run RC_filter_system.slx
% then run this script

%% Plot
figure;
plot(voltage_capacitor_s, 'LineWidth', 2.2); hold on;
plot(voltage_resistor_s, 'LineWidth', 1.6); hold on;
title("RC Filter (Real system)", 'FontSize', 20);
xlabel("Time [s]", 'FontSize', 16);
xlim([0 tout(end)]);
ylabel("Voltage [V]", 'FontSize', 16);
legend({"Capacitor output", "Measured Input"}, 'FontSize', 16);
grid on;

figure;
plot(voltage_capacitor_s, 'LineWidth', 2); hold on;
plot(voltage_capacitor_sim, 'LineWidth', 2); hold on;
plot(voltage_resistor_s, 'LineWidth', 2); hold on;
title("RC Filter (Real system VS Simulation)", 'FontSize', 20);
xlim([0 tout(end)]);
xlabel("Time [s]", 'FontSize', 16);
ylabel("Voltage [V]", 'FontSize', 16);
legend({"Real output", "Simulated output", "Input"}, 'FontSize', 16);
grid on;