clc;clear all;format long g;
% define inputs
n=6;
xt=[0 10 20 35 50 65 80 100];
xt=xt/1000
% input X data
yt=[0.999 0.919 0.842 0.753 0.683 0.630 0.600 0.582]; % input Y data
x=xt';y=yt';
a=zeros(5,1);b=zeros(5,1);
z=zeros(n,2);
D=zeros(n,1);
v=[40;0.004]; %initial guess of a, b values
opt=3; %1 for GNA
yfit=zeros(n,1);
k=3;
errtotal=1;
err=zeros(k,1);
eps=0;

count=0;countmax=2; %maximum number of iterations

while errtotal>eps && count<countmax
    fprintf('iteration %d',count+1)
count=count+1;
for i=1:n
    yfit(i)=cosh(v(1)*(0.1-x(i)))/cosh(v(1)*0.1)
yfit(i)=v(1)*(1-exp(-1*v(2)*x(i))); %Yfit function
z(i,1)=0.1*sinh(-sqrt(5400/v(1))*x(i))/(cosh(-sqrt(5400/v(1))*0.1)^2); %Derivative with respective to a
%z(i,2)=v(1)*x(i)*exp(-1*v(2)*x(i)); %Derivative with respective to b
D(i)=y(i)-yfit(i);
end
z %Jacobian matrix
D %Forcing vector
yfit %Yfit vector
%For GNA
if opt==1 
    dV=(z'*z)\(z'*D);
%for MA
elseif opt==2
    dV=(z'*z+0.1*eye(size(z'*z)))\(z'*D);
%for LMA
elseif opt==3 
    dV=(z'*z+0.1*diag(diag(z'*z)))\(z'*D);
    dV
end
v=v+dV;
errtotal=sum(((y-yfit).*(y-yfit))); %Calculating residue
err(count)=errtotal;
a(count)=v(1);
b(count)=v(2);
% vi(1)=v(1);
% vi(2)=v(2);
end
for j =1:length(a)
    fprintf('iter %d\n',j);
disp(a(j)); %Disply a value after the iteration
disp(b(j)); %Disply b value after the iteration
end
% plot(err);
