%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('/dev/cu.usbmodem141201','Mega2560');

%% Digital PIN (PWM PIN ~)
pinBuzzer = 'D3';


time = 100;
i = 1;
figure;
while time > 0
    
    writeDigitalPin(a_mega, pinBuzzer, 0);
    pause(0.5);
    writeDigitalPin(a_mega, pinBuzzer, 1);
    pause(0.5);
    
    time = time - 1;
    
end

%% Clear Arduino object
clear a_mega;