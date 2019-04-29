
clear all;
periods = [0.01, 0.1, 0.5];
model = 'RC_filter_2';

figure;
for i=1:length(periods)
  period = periods(i);
  sim(model);
  subplot(3,1,i)
  plot(time, voltage_resistor, 'LineWidth', 2); hold on;
  plot(time, voltage_capacitor, 'LineWidth', 2.2); hold on;
  title("RC Filter (Input Signal Period: "+periods(i)+" [s])", 'FontSize', 20);
  xlabel("Time [s]", 'FontSize', 16);
  xlim([0 tout(end)]);
  ylabel("Voltage [V]", 'FontSize', 16);
  legend({"Measured Input","Measured Output"}, 'FontSize', 16);
  grid on;
end

