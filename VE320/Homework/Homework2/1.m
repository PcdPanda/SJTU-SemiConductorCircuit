clc;
T=linspace(0,600);
E=1.170-(4.73e-4*(T.^2))./(636+T);
plot(T,E);