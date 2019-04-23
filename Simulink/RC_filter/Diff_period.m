

periods = 1:1:10
model = 'RC_filter_2';

figure;
for i=1:length(periods)
  period = periods(i);
  sim(model);
  plot(voltage_capacitor_s, 'LineWidth', 2.2); hold on;
end

title("RC Filter (Real system)", 'FontSize', 20);
xlabel("Time [s]", 'FontSize', 16);
xlim([0 tout(end)]);
ylabel("Voltage [V]", 'FontSize', 16);
%legend({"Period: "+str(, "Measured Input"}, 'FontSize', 16);
grid on;