function segments = number_to_segments(number)

    if number == 0
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 1;
        segments(5) = 1;
        segments(6) = 1;
        segments(7) = 0;
    elseif number == 1
        segments(1) = 0;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 0;
        segments(5) = 0;
        segments(6) = 0;
        segments(7) = 0;  
    elseif number == 2
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 0;
        segments(4) = 1;
        segments(5) = 1;
        segments(6) = 0;
        segments(7) = 1; 
    elseif number == 3
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 1;
        segments(5) = 0;
        segments(6) = 0;
        segments(7) = 1;          
    elseif number == 4
        segments(1) = 0;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 0;
        segments(5) = 0;
        segments(6) = 1;
        segments(7) = 1;
    elseif number == 5
        segments(1) = 1;
        segments(2) = 0;
        segments(3) = 1;
        segments(4) = 1;
        segments(5) = 0;
        segments(6) = 1;
        segments(7) = 1;
    elseif number == 6
        segments(1) = 1;
        segments(2) = 0;
        segments(3) = 1;
        segments(4) = 1;
        segments(5) = 1;
        segments(6) = 1;
        segments(7) = 1;
    elseif number == 7
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 0;
        segments(5) = 0;
        segments(6) = 0;
        segments(7) = 0;
    elseif number == 8
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 1;
        segments(5) = 1;
        segments(6) = 1;
        segments(7) = 1;  
    elseif number == 9
        segments(1) = 1;
        segments(2) = 1;
        segments(3) = 1;
        segments(4) = 0;
        segments(5) = 0;
        segments(6) = 1;
        segments(7) = 1;  
    else
        segments(1) = 0;
        segments(2) = 0;
        segments(3) = 0;
        segments(4) = 0;
        segments(5) = 0;
        segments(6) = 0;
        segments(7) = 0;  
    end
    %segments = flip(segments);
end

