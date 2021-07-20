clear all;clc;
a=1000; %--------------------initial guess for 'a' without prior case
q=a;
n=1000; % -----------------------------------number of samples
load Tmea1
Tmea=Tmea1;
%------------- Call forward model
k=14.4;
L=0.07;
TL=10;
x=0.01:0.01:0.06;
Tsim1=(-q'/k).*x+(TL+(q'.*L/k));
sigma=0.1;
xisquare1=(sum(abs(Tmea-Tsim1').^2))/sigma^2;
lidf1=exp(-((xisquare1/2)));
p1=lidf1;
%-------next sample calculation for 'a' and 'b' without prior
for s=2:n
s
u=rand(); %-----Draw a sample from the standard uniform distribution
%-next sample generation from proposal distribution (normal distribution)--
%--with 5 percent of sample as standard deviation--------------------------
a(s)=normrnd(a(s-1),0.05*a(s-1));
%-------------------------------------------------------------------------%
q=a(s);
%--------call forward model
%------------- Call forward model -----------------------------------------
Tsim1=(-q'/k).*x+(TL+(q'.*L/k));
%-call marginal probability values for 'a'
xisquare1(s)=(sum(abs(Tmea-Tsim1').^2))/sigma^2;
lidf1(s)=exp(-((xisquare1(s)/2)));
p1(s)=lidf1(s);
q1(s)=normpdf(a(s-1), a(s),(0.05*a(s-1)));
q2(s)=normpdf(a(s),a(s-1),(0.05*a(s)));
%-------likelihood density ratio and proposal density ratio---------------%
A=(p1(s)/p1(s-1))*(q1(s)/q2(s));
%-------------------------------------------------------------------------%
X=min(1,A); %-----------------------------Acceptance ratio
if u<X
a(s)=a(s);
p1(s)=p1(s);
else
a(s)=a(s-1);
p1(s)=p1(s-1);
end
end
%marginal ppdf------------------------------------------------
ppdf1_a(1)=p1(1);
for kk=2:n
ppdf1_a(kk)=p1(kk);
end
%bun in samples 10%
a1=a((0.1*n)+1:n);
%-------Average value and SD of 'a',b and 'c' for with prior----------------------
B_in_samples=(0.1*n)+1 ;
for jj=B_in_samples:n
j1 = jj-(0.1*n);
mean1_a(j1)=a(jj)*ppdf1_a(jj);
pa_B_in(j1)=ppdf1_a(jj);
end
mean_a=sum(mean1_a)/sum(pa_B_in);
%--------------------------------------------------------------------------
%------Standard devation of 'a',b and 'c' for with prior----------
for jj=B_in_samples:n
j1 = jj-(0.1*n);
sd1_a(j1)=((a(jj)-mean_a).^2)*ppdf1_a(jj);
end
sd_a=sqrt(sum(sd1_a)/sum(pa_B_in));
ppdf_a=pa_B_in/sum(pa_B_in);
[maxppdf_a,h]=max(ppdf_a);
mapa=a1(h);
%-----------------------------------------------------------------------
save session;
scatter(a1,ppdf_a);
xlabel('a');
ylabel('ppdf');
figure
plot(a);
xlabel('No. of samples');
ylabel('a');
