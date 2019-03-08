%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('/dev/cu.usbmodem141201','Mega2560');

%% LED Digital pin
led = 'D8';

%% Blinking
   for i = 1:10
      writeDigitalPin(a_mega, led, 0);
      pause(0.5);
      writeDigitalPin(a_mega, led, 1);
      pause(0.5);
   end

%% Clear Arduino object
clear a_mega;