   clear all; clc; close all;

tau = 0;
% 100 uF capacitor
% [x, fval] = fminbnd(f, 80e-6, 120e-6);

% 10 uF capacitor
f = @Get_Square_Error
%options = optimset('PlotFcns',@optimplotfval,'TolX', 0.0001);
options = optimset();
x = fminbnd(f, 93e-6, 100e-6, options);

display('Capacitor Value');
x