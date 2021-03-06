%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('COM6','Mega2560');

key_map = ['1', '2', '3';
           '4', '5', '6';
           '7', '8', '9';
           '*', '0', '#']
       
row_digital_pin = ["D9", "D8", "D7", "D6"];
columns_pin = ["D5", "D4", "D3"];

char = 'U';

for i=1:3
    configurePin(a_mega, columns_pin(i), 'pullup');
end

for i=1:4
    writeDigitalPin(a_mega, row_digital_pin(i), 1);
end

%% This part of code serves to "read" the key from keypad
loop = 1;
pressed = 0;
while loop == 1
    for j=1:4
        writeDigitalPin(a_mega,row_digital_pin(1), 1);
        writeDigitalPin(a_mega,row_digital_pin(2), 1);
        writeDigitalPin(a_mega,row_digital_pin(3), 1);
        writeDigitalPin(a_mega,row_digital_pin(4), 1);
        
        writeDigitalPin(a_mega,row_digital_pin(j), 0);
        for k=1:3
           if(readDigitalPin(a_mega,columns_pin(k)) == 0 && pressed == 0)
               disp(key_map(j,k));
               char = key_map(j,k);
               pressed = 1;
           end
        end
    end
    % While loop exit condition
    if(char == '0')
        loop = 0;
    end
    pause(0.01);
    pressed = 0;
end

%% Clear Arduino object
clear a_mega;