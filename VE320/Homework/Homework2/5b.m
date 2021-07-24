clc;
E=linspace(-0.25-2*0.0259,-0.25);
f=1-1./(exp(E./0.0259)+1);
plot(E,f);