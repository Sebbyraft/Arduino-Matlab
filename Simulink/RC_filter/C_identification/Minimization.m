clear all; clc; close all;

tau = 0;
% 100 uF capacitor
% [x, fval] = fminbnd(f, 80e-6, 120e-6);

% 10 uF capacitor
f = @Get_Square_Error
options = optimset('PlotFcns',@optimplotfval,'TolX', 0.00000000001);
x = fminbnd(f, 9.8e-6, 10.2e-6, options);

display('Capacitor Value');
x