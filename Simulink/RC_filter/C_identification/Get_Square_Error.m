function [f] = Get_Square_Error(x)
    R = 10.19*10^3
    %% Simulation
    model = 'C_identification'
    %% Load parameters
    tau = R*x
    % Start simulation
    sim(model);
    f = sq(end);
    clear model
    
end