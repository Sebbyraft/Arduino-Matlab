%% Clean up
clear a_mega;

%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('/dev/cu.usbmodem141201','Mega2560');


%% Buzzer pin
pinB = 'D3';
configurePin(a_mega, pinB, 'PWM');

%% Load notes and melody
Notes;
Mario_Melody;



%% Clear Arduino object
clear a_mega;