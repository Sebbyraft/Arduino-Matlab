%% First of all
% 1) Run RC_filter.slx
% 2) Run RC_filter_simulation.slx
% then run this script

%% Plot
figure;
voltage_capacitor_s = timeseries(voltage_capacitor, time);
voltage_resistor_s = timeseries(voltage_resistor, time);
plot(voltage_capacitor_s, 'LineWidth', 2); hold on;
plot(voltage_resistor_s, 'LineWidth', 2); hold on;
title("RC Filter (Real system)", 'FontSize', 20);
xlabel("Time [s]", 'FontSize', 16);
ylabel("Voltage [V]", 'FontSize', 16);
legend({"Capacitor", "Resistor"}, 'FontSize', 16);

figure;
plot(voltage_capacitor_s, 'LineWidth', 2); hold on;
plot(voltage_capacitor_sim, 'LineWidth', 2); hold on;
title("RC Filter (Real system VS Simulation)", 'FontSize', 20);
xlabel("Time [s]", 'FontSize', 16);
ylabel("Voltage [V]", 'FontSize', 16);
legend({"Real", "Simulation"}, 'FontSize', 16);