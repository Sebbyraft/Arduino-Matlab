%%
clc; clear all; close all;         

ps = [53 33 23 13 11 9 7 5 3 1 .7 .5 .3 .1];
for k=1:length(ps)
%% Simulation
    T=ps(k);
    w=2*pi/T;

    amp=5;
    sim('Fourier_Series_Sim')
    %% Output signal
    figure
    plot(time, u); hold on;
    plot(time, y); grid on;
    legend('ingresso', 'uscita')
    xlabel('t [s]')
    ylabel('u(t), y(t) [V]')

    ti = time(end)-T;
    index = find(time>=ti);  
    clear ti

    ufind = u(index);
    yfind = y(index);
    timeint = time(index);
    timeint = timeint - timeint(1);  % Shift  t1=0 

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
            % Quarta armonica
            sommaya4 = 0; sommayb4 = 0; sommaua4 = 0; sommaub4 = 0;
            % Quinta armonica
            sommaya5 = 0; sommayb5 = 0; sommaua5 = 0; sommaub5 = 0;
            % Sesta armonica
            sommaya6 = 0; sommayb6 = 0; sommaua6 = 0; sommaub6 = 0;
            % Settima armonica
            sommaya7 = 0; sommayb7 = 0; sommaua7 = 0; sommaub7 = 0;
            % Ottava armonica
            sommaya8 = 0; sommayb8 = 0; sommaua8 = 0; sommaub8 = 0;
            % Nona armonica
            sommaya9 = 0; sommayb9 = 0; sommaua9 = 0; sommaub9 = 0;
            % Decima armonica
            sommaya10 = 0; sommayb10 = 0; sommaua10 = 0; sommaub10 = 0;            
        end
        % Integrazione col metodo backward Eulero
        sommaya0 = sommaya0 + yfind(i+1)*(timeint(i+1)-timeint(i));
        sommaya1 = sommaya1 + yfind(i+1)*cos(w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb1 = sommayb1 + yfind(i+1)*sin(w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya2 = sommaya2 + yfind(i+1)*cos(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb2 = sommayb2 + yfind(i+1)*sin(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya3 = sommaya3 + yfind(i+1)*cos(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb3 = sommayb3 + yfind(i+1)*sin(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya4 = sommaya4 + yfind(i+1)*cos(4*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb4 = sommayb4 + yfind(i+1)*sin(4*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya5 = sommaya5 + yfind(i+1)*cos(5*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb5 = sommayb5 + yfind(i+1)*sin(5*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya6 = sommaya6 + yfind(i+1)*cos(6*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb6 = sommayb6 + yfind(i+1)*sin(6*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya7 = sommaya7 + yfind(i+1)*cos(7*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb7 = sommayb7 + yfind(i+1)*sin(7*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya8 = sommaya8 + yfind(i+1)*cos(8*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb8 = sommayb8 + yfind(i+1)*sin(8*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya9 = sommaya9 + yfind(i+1)*cos(9*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb9 = sommayb9 + yfind(i+1)*sin(9*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaya10 = sommaya10 + yfind(i+1)*cos(10*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommayb10 = sommayb10 + yfind(i+1)*sin(10*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        
        
        sommaua0 = sommaua0 + ufind(i+1)*(timeint(i+1)-timeint(i));
        sommaua1 = sommaua1 + ufind(i+1)*cos(w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub1 = sommaub1 + ufind(i+1)*sin(w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua2 = sommaua2 + ufind(i+1)*cos(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub2 = sommaub2 + ufind(i+1)*sin(2*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua3 = sommaua3 + ufind(i+1)*cos(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub3 = sommaub3 + ufind(i+1)*sin(3*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua4 = sommaua4 + ufind(i+1)*cos(4*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub4 = sommaub4 + ufind(i+1)*sin(4*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua5 = sommaua5 + ufind(i+1)*cos(5*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub5 = sommaub5 + ufind(i+1)*sin(5*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua6 = sommaua6 + ufind(i+1)*cos(6*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub6 = sommaub6 + ufind(i+1)*sin(6*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua7 = sommaua7 + ufind(i+1)*cos(7*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub7 = sommaub7 + ufind(i+1)*sin(7*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua8 = sommaua8 + ufind(i+1)*cos(8*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub8 = sommaub8 + ufind(i+1)*sin(8*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua9 = sommaua9 + ufind(i+1)*cos(9*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub9 = sommaub9 + ufind(i+1)*sin(9*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaua10 = sommaua10 + ufind(i+1)*cos(10*w*timeint(i+1))*(timeint(i+1)-timeint(i));
        sommaub10 = sommaub10 + ufind(i+1)*sin(10*w*timeint(i+1))*(timeint(i+1)-timeint(i));
    end

    Tapprox=timeint(end)-timeint(1);
    ybar = sommaya0/Tapprox;
    ya1=2*sommaya1/Tapprox; yb1=2*sommayb1/Tapprox; 
    ya2=2*sommaya2/Tapprox; yb2=2*sommayb2/Tapprox; 
    ya3=2*sommaya3/Tapprox; yb3=2*sommayb3/Tapprox; 
    ya4=2*sommaya4/Tapprox; yb4=2*sommayb4/Tapprox; 
    ya5=2*sommaya5/Tapprox; yb5=2*sommayb5/Tapprox; 
    ya6=2*sommaya6/Tapprox; yb6=2*sommayb6/Tapprox; 
    ya7=2*sommaya7/Tapprox; yb7=2*sommayb7/Tapprox; 
    ya8=2*sommaya8/Tapprox; yb8=2*sommayb8/Tapprox; 
    ya9=2*sommaya9/Tapprox; yb9=2*sommayb9/Tapprox; 
    ya10=2*sommaya10/Tapprox; yb10=2*sommayb10/Tapprox; 

    ubar = sommaua0/Tapprox;
    ua1=2*sommaua1/Tapprox; ub1=2*sommaub1/Tapprox; 
    ua2=2*sommaua2/Tapprox; ub2=2*sommaub2/Tapprox; 
    ua3=2*sommaua3/Tapprox; ub3=2*sommaub3/Tapprox; 
    ua4=2*sommaua4/Tapprox; ub4=2*sommaub4/Tapprox; 
    ua5=2*sommaua5/Tapprox; ub5=2*sommaub5/Tapprox; 
    ua6=2*sommaua6/Tapprox; ub6=2*sommaub6/Tapprox; 
    ua7=2*sommaua7/Tapprox; ub7=2*sommaub7/Tapprox; 
    ua8=2*sommaua8/Tapprox; ub8=2*sommaub8/Tapprox; 
    ua9=2*sommaua9/Tapprox; ub9=2*sommaub9/Tapprox; 
    ua10=2*sommaua10/Tapprox; ub10=2*sommaub10/Tapprox; 

    yinf1 = ybar + ya1*cos(w*timeint)+ yb1*sin(w*timeint);
    yinf2 = yinf1 + ya2*cos(2*w*timeint)+ yb2*sin(2*w*timeint);
    yinf3 = yinf2 + ya3*cos(3*w*timeint)+ yb3*sin(3*w*timeint);
    yinf4 = yinf3 + ya4*cos(4*w*timeint)+ yb4*sin(4*w*timeint);
    yinf5 = yinf4 + ya5*cos(5*w*timeint)+ yb5*sin(5*w*timeint);
    yinf6 = yinf5 + ya6*cos(6*w*timeint)+ yb6*sin(6*w*timeint);
    yinf7 = yinf6 + ya7*cos(7*w*timeint)+ yb7*sin(7*w*timeint);
    yinf8 = yinf7 + ya8*cos(8*w*timeint)+ yb8*sin(8*w*timeint);
    yinf9 = yinf8 + ya9*cos(9*w*timeint)+ yb9*sin(9*w*timeint);
    yinf10 = yinf9 + ya10*cos(10*w*timeint)+ yb10*sin(10*w*timeint);
    
    uinf1 = ubar + ua1*cos(w*timeint)+ ub1*sin(w*timeint);
    uinf2 = uinf1 + ua2*cos(2*w*timeint)+ ub2*sin(2*w*timeint);
    uinf3 = uinf2 + ua3*cos(3*w*timeint)+ ub3*sin(3*w*timeint);
    uinf4 = uinf3 + ua4*cos(4*w*timeint)+ ub4*sin(4*w*timeint);
    uinf5 = uinf4 + ua5*cos(5*w*timeint)+ ub5*sin(5*w*timeint);
    uinf6 = uinf5 + ua6*cos(6*w*timeint)+ ub6*sin(6*w*timeint);
    uinf7 = uinf6 + ua7*cos(7*w*timeint)+ ub7*sin(7*w*timeint);
    uinf8 = uinf7 + ua8*cos(8*w*timeint)+ ub8*sin(8*w*timeint);
    uinf9 = uinf8 + ua9*cos(9*w*timeint)+ ub9*sin(9*w*timeint);
    uinf10 = uinf9 + ua10*cos(10*w*timeint)+ ub10*sin(10*w*timeint);

%     figure,
%     plot(timeint, ufind, 'k', timeint, uinf1, 'ro', timeint, uinf2, 'kx', timeint, uinf3, 'c+');hold on;
%     plot(timeint, uinf4, 'k', timeint, uinf5, 'ro', timeint, uinf6, 'kx', timeint, uinf7, 'c+');hold on;
%     plot(timeint, uinf8, 'k', timeint, uinf9, 'ro', timeint, uinf10);
%     legend('ingresso', 'I arm', 'I+II arm', 'I+II+III arm', 'I+II+III+IV arm', 'I+II+III+IV+V arm', 'I+II+III+IV+V+VI arm',  'I+II+III+IV+V+VI+VII arm',...
%     'I+II+III+IV+V+VI+VII+VIII arm', 'I+II+III+IV+V+VI+VII+VIII+IX arm', 'I+II+III+IV+V+VI+VII+VIII+IX+X arm')
%     xlabel('t'), ylabel('u(t)')
% 
%     figure,
%     plot(timeint, yfind, 'k', timeint, yinf1, 'ro', timeint, yinf2, 'kx', timeint, yinf3, 'c+'); hold on;
%     plot(timeint, yinf4, 'k', timeint, yinf5, 'ro', timeint, yinf6, 'kx', timeint, yinf7, 'c+'); hold on;
%     plot(timeint, yinf8, 'k', timeint, yinf9, 'ro', timeint, yinf10); 
%     legend('ingresso', 'I arm', 'I+II arm', 'I+II+III arm', 'I+II+III+IV arm', 'I+II+III+IV+V arm', 'I+II+III+IV+V+VI arm',  'I+II+III+IV+V+VI+VII arm',...
%     'I+II+III+IV+V+VI+VII+VIII arm', 'I+II+III+IV+V+VI+VII+VIII+IX arm', 'I+II+III+IV+V+VI+VII+VIII+IX+X arm')
%     xlabel('t'), ylabel('y(t)')
    
   
    figure,
    plot(timeint, ufind, 'k', timeint, uinf10);
    legend('ingresso', 'I+II+III+IV+V+VI+VII+VIII+IX+X arm')
    xlabel('t'), ylabel('u(t)')

    figure,
    plot(timeint, yfind, 'k', timeint, yinf10); 
    legend('uscita', 'I+II+III+IV+V+VI+VII+VIII+IX+X arm')
    xlabel('t'), ylabel('y(t)')

    % Risposta in frequenza: guadagno statico
    Hamp0=ybar/ubar;
    
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: prima armonica
    Hamp1=20*log10(sqrt(ya1^2+yb1^2)/sqrt(ua1^2+ub1^2));
    fu1=atan2(ub1,ua1)+2*pi*(atan2(ub1,ua1)<0);
    fy1=atan2(yb1,ya1)+2*pi*(atan2(yb1,ya1)<0);
    Hfase1=fu1-fy1;
    
    omega_1_a(i) = w;
    mod_1_a(i) = Hamp1; 
    pha_1_a(i) = Hfase1*180/(pi);

    % Errore relativo percentuale di modulo e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di modulo e fase I armonica')
    mod1=20*log10(1/sqrt(1+w^2));
    erramp1=(Hamp1-mod1)/mod1*100
    fase1=-atan2(w,1);
    errfase1=(Hfase1-fase1)/fase1*100
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: seconda armonica
    Hamp2=20*log10(sqrt(ya2^2+yb2^2)/sqrt(ua2^2+ub2^2));
    fu2=atan2(ub2,ua2)+2*pi*(atan2(ub2,ua2)<0);
    fy2=atan2(yb2,ya2)+2*pi*(atan2(yb2,ya2)<0);
    Hfase2=fu2-fy2;

    omega_2_a(i) = 2*w;
    mod_2_a(i) = Hamp2; 
    pha_2_a(i) = Hfase2*180/(pi);
    
    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase II armonica')
    mod2=20*log10(1/sqrt(1+(2*w)^2));
    (Hamp2-mod2)/mod2*100;
    fase2=-atan2(2*w,1);
    (Hfase2-fase2)/fase2*100;
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: terza armonica
    Hamp3=20*log10(sqrt(ya3^2+yb3^2)/sqrt(ua3^2+ub3^2));
    fu3=atan2(ub3,ua3)+2*pi*(atan2(ub3,ua3)<0);
    fy3=atan2(yb3,ya3)+2*pi*(atan2(yb3,ya3)<0);
    Hfase3=fu3-fy3;
    
    omega_3_a(i) = 3*w;
    mod_3_a(i) = Hamp3; 
    pha_3_a(i) = Hfase3*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod3=20*log10(1/sqrt(1+(3*w)^2));
    (Hamp3-mod3)/mod3*100;
    fase3=-atan2(3*w,1);
    (Hfase3-fase3)/fase3*100;
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: quarta armonica
    Hamp4=20*log10(sqrt(ya4^2+yb4^2)/sqrt(ua4^2+ub4^2));
    fu4=atan2(ub4,ua4)+2*pi*(atan2(ub4,ua4)<0);
    fy4=atan2(yb4,ya4)+2*pi*(atan2(yb4,ya4)<0);
    Hfase4=fu4-fy4;
    
    omega_4_a(i) = 4*w;
    mod_4_a(i) = Hamp4; 
    pha_4_a(i) = Hfase4*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod4=20*log10(1/sqrt(1+(4*w)^2));
    (Hamp4-mod4)/mod4*100;
    fase4=-atan2(4*w,1);
    (Hfase4-fase4)/fase4*100;   
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: quinta armonica
    Hamp5=20*log10(sqrt(ya5^2+yb5^2)/sqrt(ua5^2+ub5^2));
    fu5=atan2(ub5,ua5)+2*pi*(atan2(ub5,ua5)<0);
    fy5=atan2(yb5,ya5)+2*pi*(atan2(yb5,ya5)<0);
    Hfase5=fu5-fy5;
    
    omega_5_a(i) = 5*w;
    mod_5_a(i) = Hamp5; 
    pha_5_a(i) = Hfase5*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod5=20*log10(1/sqrt(1+(5*w)^2));
    (Hamp5-mod5)/mod5*100;
    fase5=-atan2(5*w,1);
    (Hfase5-fase5)/fase5*100;    
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: sesta armonica
    Hamp6=20*log10(sqrt(ya6^2+yb6^2)/sqrt(ua6^2+ub6^2));
    fu6=atan2(ub6,ua6)+2*pi*(atan2(ub6,ua6)<0);
    fy6=atan2(yb6,ya6)+2*pi*(atan2(yb6,ya6)<0);
    Hfase6=fu6-fy6;
    
    omega_6_a(i) = 6*w;
    mod_6_a(i) = Hamp6; 
    pha_6_a(i) = Hfase6*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod6=20*log10(1/sqrt(1+(6*w)^2));
    (Hamp6-mod6)/mod6*100;
    fase6=-atan2(6*w,1);
    (Hfase6-fase6)/fase6*100;     
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: settima armonica
    Hamp7=20*log10(sqrt(ya7^2+yb7^2)/sqrt(ua7^2+ub7^2));
    fu7=atan2(ub7,ua7)+2*pi*(atan2(ub7,ua7)<0);
    fy7=atan2(yb7,ya7)+2*pi*(atan2(yb7,ya7)<0);
    Hfase7=fu7-fy7;
    
    omega_7_a(i) = 7*w;
    mod_7_a(i) = Hamp7; 
    pha_7_a(i) = Hfase7*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod7=20*log10(1/sqrt(1+(7*w)^2));
    (Hamp7-mod7)/mod7*100;
    fase7=-atan2(7*w,1);
    (Hfase7-fase7)/fase7*100; 
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: ottava armonica
    Hamp8=20*log10(sqrt(ya8^2+yb8^2)/sqrt(ua8^2+ub8^2));
    fu8=atan2(ub8,ua8)+2*pi*(atan2(ub8,ua8)<0);
    fy8=atan2(yb8,ya8)+2*pi*(atan2(yb8,ya8)<0);
    Hfase8=fu8-fy8;
    
    omega_8_a(i) = 8*w;
    mod_8_a(i) = Hamp8; 
    pha_8_a(i) = Hfase8*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod8=20*log10(1/sqrt(1+(8*w)^2));
    (Hamp8-mod8)/mod8*100;
    fase8=-atan2(8*w,1);
    (Hfase8-fase8)/fase8*100;     
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: nona armonica
    Hamp9=20*log10(sqrt(ya9^2+yb9^2)/sqrt(ua9^2+ub9^2));
    fu9=atan2(ub9,ua9)+2*pi*(atan2(ub9,ua9)<0);
    fy9=atan2(yb9,ya9)+2*pi*(atan2(yb9,ya9)<0);
    Hfase9=fu9-fy9;
    
    omega_9_a(i) = 9*w;
    mod_9_a(i) = Hamp9; 
    pha_9_a(i) = Hfase9*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod9=20*log10(1/sqrt(1+(9*w)^2));
    (Hamp9-mod9)/mod9*100;
    fase9=-atan2(9*w,1);
    (Hfase9-fase9)/fase9*100;     
%%%%%%%%%%%%%%%%%%%%
    % Risposta in frequenza: nona armonica
    Hamp10=20*log10(sqrt(ya10^2+yb10^2)/sqrt(ua10^2+ub10^2));
    fu10=atan2(ub10,ua10)+2*pi*(atan2(ub10,ua10)<0);
    fy10=atan2(yb10,ya10)+2*pi*(atan2(yb10,ya10)<0);
    Hfase10=fu10-fy10;
    
    omega_10_a(i) = 10*w;
    mod_10_a(i) = Hamp10; 
    pha_10_a(i) = Hfase10*180/(pi);

    % Errore relativo percentuale di ampiezza e fase per H(s)=1/1+s
    disp('Errori relativi percentuali di ampiezza e fase III armonica')
    mod10=20*log10(1/sqrt(1+(10*w)^2));
    (Hamp10-mod10)/mod10*100;
    fase10=-atan2(10*w,1);
    (Hfase10-fase10)/fase10*100;      
%%%%%%%%%%%%%%%%%%%%    
    disp('Periodo')
    T
end

Plotter_2;