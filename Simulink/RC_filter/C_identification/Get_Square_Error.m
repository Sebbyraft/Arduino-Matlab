function [SQ_ERR] = Get_Square_Error(R,C)
    model = 'C_identification';
    tau = R*C;
    % Start simulation
    sim(model);
    SQ_ERR = square_error(end);
end

