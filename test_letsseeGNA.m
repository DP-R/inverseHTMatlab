clc;clear all;
x=[10,41,79,139,202,298];
y=[3.1,11.8,21.1,29.8,37.4,42.5];
x=x';y=y';
Z=zeros(length(x),2);D=zeros(length(x),1);
v=[1;0.004]
yfit=Z;
k=3;errt=1;
err=zeros(k,1);eps=0;count=0;countmax=10;
while errt>eps && count<countmax
    count=count+1
    for i=1:length(x)
        yfit(i)=v(1)*(1-exp(-1*v(2)*x(i)));
        Z(i,1)=(1-exp(-1*v(2)*x(i)));
        Z(i,2)=v(1)*x(i)*exp(-1*v(2)*x(i));
        D(i)=y(i)-yfit(i);
    end
    dV=Z'*Z\Z'*D

v=v+dV
er=(y-yfit).*(y-yfit)
errt=sum(er);
err(count)=errt;
a(count)=v(1);
b(count)=v(2);
end
disp(a);disp(b);
plot(a,b);
plot(1:count,a)
plot(1:count,b)