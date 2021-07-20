clear all;clc;
a=1200;
x=linspace(0.01,0.06,6);
y=[15.46 14.59 12.66 12.55 11.57 11.42];
Tmea=y
k=14.4;L=0.07;Tl=10;sigma=0.1;
u=[0.001213 0.89898 0.5788]
for s=1:n
    %u=rand(0,1);
    if u(2)>0.5
        q(s+1)=q(s)+sigma*u(1);
    else
        q(s+1)=q(s)-sigma*u(1);
    end
    a(s+1)=normrnd(a(s),sigma^2);
    Tsim(s)=(-q(s)/k).*x+(Tl+(q(s)*L/k));
    pdf(s)=exp(-(sum(abs(Tmea-Tsim).^2))/(2*(sigma^2)))/(sqrt(2*math.pi)*sigma.^2);
    A=min(1,P(s+1)/P(s));
if u(3)<A
    a(s+1)=a(s+1);
    pdf(s+1)=pdf(s+1);
else
    a(s+1)=a(s);
    pdf(s+1)=pdf(s);
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
