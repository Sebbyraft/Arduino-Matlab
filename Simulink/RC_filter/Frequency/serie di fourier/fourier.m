clear all
close all
Tp=1 ;
fs=100;
Ts=1/fs;
t=0:Ts:Tp-Ts;                  
x = sin(2*pi*15*t) + sin(2*pi*20*t);
plot(t,x)
%%
figure
yfft = fft(x);     
f = (0:length(yfft)-1)*fs/length(yfft);
plot(f,abs(yfft))
title('Magnitude')
%%
figure
n = length(x);                         
fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(yfft);
plot(fshift,abs(yshift))
%%
figure
bar(abs(yfft))


%%
xnoise = x + 0.5*gallery('normaldata',size(t),4);
figure
plot(t,xnoise)
figure
ynoise = fft(xnoise);
ynoiseshift = fftshift(ynoise);    
power = abs(ynoiseshift).^2/n; 
plot(fshift,power)
title('Power')
%%
clear all
close all
Tp=1 ;
fs=100;
Ts=1/fs;
t=0:Ts:Tp-Ts;
N=100;
A=1;
%u=A*((t>Tp/3)&(t<Tp*2/3)); %gradino
%u=A.*((t.*(t<=Tp/2)))+ A.*(((Tp/2-t+A/2).*(t>Tp/2))); %dente di sega
u=sin(2*pi*15*t) + sin(2*pi*20*t); %due toni a 15Hz e 20Hz

figure
plot(t,u)
%%
yfft = fft(u);    
f = (0:length(yfft)-1)*fs/length(yfft);
n = length(u);                         
fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(yfft);
plot(fshift,abs(yshift))
title('Magnitude')
figure
bar(f,abs(yfft))
%%


a0=1;
an=0.*ones(1,N);
bn=0.*ones(1,N);
x0=[a0 an bn];
f = @(x)calcola_errore(x,u,Tp,Ts);
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton','MaxFunEvals',10000);
[x,fval] = fminunc(f,x0,options)

a0=x(1);
an=x(2:N+1);
bn=x(N+2:end);
yfft=calcola_fourier(a0,an,bn,Tp,Ts);
figure;plot(t,u-yfft');
%plot(t,yfft,t,u);
%figure;plot(x)