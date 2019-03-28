sample_time = 0.01;
simulation_time = 30;

figure;
plot(t_out, voltage_capacitor, t_out, voltage_resistor, 'LineWidth', 2); hold on;
title("RC Filter (out)", 'FontSize', 20);
xlabel("Time [s]", 'FontSize', 16);
ylabel("Voltage [V]", 'FontSize', 16);
legend({"Capacitor", "Resistor"}, 'FontSize', 16);