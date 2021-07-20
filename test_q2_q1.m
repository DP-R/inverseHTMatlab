clc; clear all;
x=[0 10 20 35 50 65 80 100]/1000
y=[0.999 0.919 0.842 0.753 0.683 0.630 0.600 0.582];
th_b=77.4;
L=0.1;

k=linspace(20,60,9)
m=sqrt((9.8*0.6)./(k*0.0009))
sigma=0.008;
%yfit=th_b*(cosh(m*(L-x))/cosh(m*L));
fitspace=zeros(length(x),length(k));
for i=1:length(x)
   for j=1:length(k)
    fitspace(i,j)=th_b*(cosh(m(j)*(L-x(i)))/cosh(m(j)*L));
   end
end
fitspace=fitspace'-(y*77.4);
fitspace
p=ones(3)
