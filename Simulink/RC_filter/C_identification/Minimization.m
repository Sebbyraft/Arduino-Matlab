
R = 10.09*10^3;
f = @(x)Get_Square_Error(R,x);

[x, fval] = fminbnd(f, 80e-6, 120e-6);
display('Capacitor Value');
x