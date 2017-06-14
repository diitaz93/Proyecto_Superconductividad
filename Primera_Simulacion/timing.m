clear all
J=1; %Constante de Intercambi
s=12; %Numero de pasos de tiempo
t=zeros([1,s]);
for i=1:s
   tic
   H=heissenberg(J,i);
   t(i)=toc;
end
figure;
plot(t)
title('Tiempo vs. Sitios de espin')
xlabel('N')
ylabel('Tiempo (segundos)')