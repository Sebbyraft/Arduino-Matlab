function y = calcola_fourier(a0,an,bn,Tp,Ts)
t=0:Ts:Tp-Ts;
N=size(an,2);
vett_div=1:N;
vett_w=(vett_div)*2*pi;
for cont_t=1:length(t);
    y_tot(cont_t)=0;
    for cont_n=1:N;
        y_tot(cont_t)=y_tot(cont_t)+ an(cont_n).*sin(vett_w(cont_n)*t(cont_t))+bn(cont_n).*cos(vett_w(cont_n)*t(cont_t)) ;
    end
end
y=a0/2+y_tot(:);
return
