%%
clc
clear all
close all
%% Simulazione
T=1;
w=2*pi/T;
ub=2;
sim('FFT')
%% Analisi segnale in uscita
figure(1)
plot(u.time, u.signals.values);hold on;
plot(y.time, y.signals.values);
legend('ingresso', 'uscita')
xlabel('t')
ylabel('u(t), y(t)')

ti = u.time(end)-T;
index = find(u.time>=ti);  % Indici corrispondenti a dati di ultimo periodo
clear ti

% Assegnazione dei vettori dell'ultimo periodo
ufind = u.signals.values(index);
yfind = y.signals.values(index);
timeint = u.time(index);
timeint = timeint - timeint(1);  % Shift in modo da avere t1=0 

% Errore relativo percentuale su condizione di regime
disp('Errore relativo percentuale su regime uscita')
(yfind(end) - yfind(1))/min(yfind)*100  

%% Sviluppo di Fourier del segnale d'uscita
% Calcolo del valore medio e delle prime tre armoniche
for i = 1:(length(yfind)-1)
    if i == 1 
        % Valore medio
        sommaya0 = 0; sommaua0 = 0;
        % Prima armonica
        sommaya1 = 0; sommayb1 = 0; sommaua1 = 0; sommaub1 = 0;
        % Seconda armonica
        sommaya2 = 0; sommayb2 = 0; sommaua2 = 0; sommaub2 = 0;
        % Terza armonica
        sommaya3 = 0; sommayb3 = 0; sommaua3 = 0; sommaub3 = 0;
    end
    % Integrazione col metodo backward Eulero
    sommaya0 = sommaya0 + yfind(i+1)*(timeint(i+1)-timeint(i));
    sommaya1 = sommaya1 + yfind(i+1)*cos(w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommayb1 = sommayb1 + yfind(i+1)*sin(w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaya2 = sommaya2 + yfind(i+1)*cos(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommayb2 = sommayb2 + yfind(i+1)*sin(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaya3 = sommaya3 + yfind(i+1)*cos(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommayb3 = sommayb3 + yfind(i+1)*sin(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    
    sommaua0 = sommaua0 + ufind(i+1)*(timeint(i+1)-timeint(i));
    sommaua1 = sommaua1 + ufind(i+1)*cos(w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaub1 = sommaub1 + ufind(i+1)*sin(w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaua2 = sommaua2 + ufind(i+1)*cos(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaub2 = sommaub2 + ufind(i+1)*sin(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaua3 = sommaua3 + ufind(i+1)*cos(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    sommaub3 = sommaub3 + ufind(i+1)*sin(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
end

Tapprox=timeint(end)-timeint(1);
ybar = sommaya0/Tapprox;
ya1=2*sommaya1/Tapprox; yb1=2*sommayb1/Tapprox; 
ya2=2*sommaya2/Tapprox; yb2=2*sommayb2/Tapprox; 
ya3=2*sommaya3/Tapprox; yb3=2*sommayb3/Tapprox; 

ubar = sommaua0/Tapprox;
ua1=2*sommaua1/Tapprox; ub1=2*sommaub1/Tapprox; 
ua2=2*sommaua2/Tapprox; ub2=2*sommaub2/Tapprox; 
ua3=2*sommaua3/Tapprox; ub3=2*sommaub3/Tapprox; 

yinf1 = ybar + ya1*cos(w*timeint)+ yb1*sin(w*timeint);
yinf2 = yinf1 + ya2*cos(2*w*timeint)+ yb2*sin(2*w*timeint);
yinf3 = yinf2 + ya3*cos(3*w*timeint)+ yb3*sin(3*w*timeint);

uinf1 = ubar + ua1*cos(w*timeint)+ ub1*sin(w*timeint);
uinf2 = uinf1 + ua2*cos(2*w*timeint)+ ub2*sin(2*w*timeint);
uinf3 = uinf2 + ua3*cos(3*w*timeint)+ ub3*sin(3*w*timeint);

figure(10)
plot(timeint, ufind, 'k', timeint, uinf1, 'ro', timeint, uinf2, 'kx', timeint, uinf3, 'c+')
legend('ingresso', 'I arm', 'I+II arm', 'I+II+III arm')
xlabel('t'), ylabel('u(t)')

figure(20)
plot(timeint, yfind, 'k', timeint, yinf1, 'ro', timeint, yinf2, 'kx', timeint, yinf3, 'c+')
legend('uscita', 'I arm', 'I+II arm', 'I+II+III arm')
xlabel('t'), ylabel('y(t)')

% Risposta in frequenza: guadagno statico
Hamp0=ybar/ubar;

% Risposta in frequenza: prima armonica
Hamp1=20*log10(sqrt(ya1^2+yb1^2)/sqrt(ua1^2+ub1^2));
fu1=atan2(ub1,ua1)+2*pi*(atan2(ub1,ua1)<0);
fy1=atan2(yb1,ya1)+2*pi*(atan2(yb1,ya1)<0);
Hfase1=fu1-fy1;

% Errore relativo percentuale di modulo e fase per H(s)=1/1+s
disp('Errori relativi percentuali di modulo e fase I armonica')
mod1=20*log10(1/sqrt(1+w^2));
erramp1=(Hamp1-mod1)/mod1*100
fase1=-atan2(w,1);
errfase1=(Hfase1-fase1)/fase1*100

% Risposta in frequenza: seconda armonica
Hamp2=20*log10(sqrt(ya2^2+yb2^2)/sqrt(ua2^2+ub2^2));
fu2=atan2(ub2,ua2)+2*pi*(atan2(ub2,ua2)<0);
fy2=atan2(yb2,ya2)+2*pi*(atan2(yb2,ya2)<0);
Hfase2=fu2-fy2;

% Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
disp('Errori relativi percentuali di ampiezza e fase II armonica')
mod2=20*log10(1/sqrt(1+(2*w)^2));
(Hamp2-mod2)/mod2*100
fase2=-atan2(2*w,1);
(Hfase2-fase2)/fase2*100

% Risposta in frequenza: terza armonica
Hamp3=20*log10(sqrt(ya3^2+yb3^2)/sqrt(ua3^2+ub3^2));
fu3=atan2(ub3,ua3)+2*pi*(atan2(ub3,ua3)<0);
fy3=atan2(yb3,ya3)+2*pi*(atan2(yb3,ya3)<0);
Hfase3=fu3-fy3;

% Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
disp('Errori relativi percentuali di ampiezza e fase III armonica')
mod3=20*log10(1/sqrt(1+(3*w)^2));
(Hamp3-mod3)/mod3*100
fase3=-atan2(3*w,1);
(Hfase3-fase3)/fase3*100
