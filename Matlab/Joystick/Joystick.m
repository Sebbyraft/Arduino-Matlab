%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('/dev/cu.usbmodem141201','Mega2560');

%% Analog pins
pinX = 'A0';
pinY = 'A1';

%% Voltage reading
  time = 100;
  i = 1;
  figure;
   while time > 0
      % "Read" voltage from analog port A0
      voltageX(i) = readVoltage(a_mega, pinX);
       % "Read" voltage from analog port A1
      voltageY(i) = readVoltage(a_mega, pinY);
      time = time - 1;

      plot(voltageX(i),voltageY(i),'.','LineWidth',2, 'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',20);
      ylim([0 5]);
      xlim([0 5]);
      i = i + 1;
      
      pause(0.1);
   end
   
   figure,
   plot(voltageX, voltageY,'LineWidth',2);
   
%% Clear Arduino object
clear a_mega;