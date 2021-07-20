clear all;clc; close all;
% define params
alpha=0.2;
x = linspace(0.01,0.06,6);
% normalise x
x=(x-min(x))/(max(x)-min(x));
y = [15.46 14.59 12.66 12.55 11.57 11.42];
w=[0 0];
ops=300000000;
% loop
for i=1:ops
    yh=w(1)+w(2)*x;
    dy=yh-y;
%     J=0.5*mean(dy.^2);
    
    dJ(1)=sum(dy);
    dJ(2)=sum(dy.*x);
    if abs(dJ)>=0.000001
        w=w-alpha*dJ;
        disp(i);disp(w);
    else
        break
    end
    
end