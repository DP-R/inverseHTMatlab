clc;clear all;
X=[0;0.1;0.2;0.35;0.5;0.65;0.8;1];
Y=[4.34;4.25;4.17;4.05;3.96;3.88;3.83;3.8]
[xrow,xcol]=size(X);

Z=X;
Z(:,2)=ones(xcol,1);

A=inv(Z'*Z)*(Z'*Y)
xsquare_x_x_n=Z'*Z
xy_y=Z'*Y