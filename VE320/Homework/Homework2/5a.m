clc;
E=linspace(0.3,0.3+2*0.0259);
f=1./(exp(E./0.0259)+1);
plot(E,f);
