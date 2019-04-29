function f = calcola_errore(x,funzione,Tp,Ts)
N=(size(x,2)-1)/2;
a0=x(1);
an=x(2:N+1);
bn=x(N+2:end);
sviluppo_serie=calcola_fourier(a0,an,bn,Tp,Ts)';
f=sum((sviluppo_serie-funzione).^2);
return