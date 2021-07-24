a=linspace(15, 18, 1000)
y=1./(1+sqrt(25*10e6./10e7).*10e16./(10.^a))
plot(a,y)
