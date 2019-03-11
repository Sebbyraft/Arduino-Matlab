%% Clean up
clear a_mega;
%% Create an Arduino object using the virtual port and the board name
a_mega = arduino('COM6','Mega2560');

%% Digital pin
segments = ["D2", "D3", "D4", "D5", "D6", "D7", "D8"];

for i=1:7
    configurePin(a_mega, segments(i), 'DigitalOutput');
    writeDigitalPin(a_mega, segments(i), 0);
end

num = input("Number: ");

if(num <= 9 && num>=0)
    toSegments = number_to_segments(num);
    disp(toSegments);
    for i=1:7
        writeDigitalPin(a_mega, segments(i), toSegments(i));
    end
else
    disp("The selected number isn't in range [0 9]");
end
