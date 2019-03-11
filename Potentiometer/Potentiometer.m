%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('/dev/cu.usbmodem141201','Mega2560');

%% LED Analog pin
pinA0 = 'A0';

%% Voltage reading
  time = 200;
  i = 1;
  figure;
   while time > 0
      voltage(i) = readVoltage(a_mega, pinA0);
      time = time - 1;

      plot(voltage(i),'.','LineWidth',2, 'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',20);
      ylim([0 5]);
      i = i + 1;
      
      pause(0.1);
   end
   
   figure,
   plot(voltage,'LineWidth',2);
   
%% Clear Arduino object
clear a_mega;