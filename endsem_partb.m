clc 
% please see only 1st and 2nd iterations, 3rd is just done for my clarity
%wxyz means wxy(z)
%dWxyz means dJ/dwxy(z) 
syms m w011 w111 w012 w112
x=[0.025,0.05,0.075,0.1];
phi=[0.815,0.717,0.657,0.551];
J=0.5*sum((w112*w111^2*exp(w011)*exp(w111*x)-m^2*(w112*exp(w011)*exp(w111*x)+w012)).^2+(w112*exp(w011)*exp(w111*x)+w012-phi).^2);
djw011=diff(J,w011);
djw111=diff(J,w111);
djw012=diff(J,w012);
djw112=diff(J,w112);
djm=diff(J,m);
alpha=0.1;
% Initiation
W011=0;
W111=-5;
W012=0;
M=5;
W112=1;
disp('Gradients 1st iteration')
dW011=round(subs(subs(subs(subs(subs(djw011,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW111=round(subs(subs(subs(subs(subs(djw111,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW012=round(subs(subs(subs(subs(subs(djw012,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW112=round(subs(subs(subs(subs(subs(djw112,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dM=round(subs(subs(subs(subs(subs(djm,w011,W011),w012,W012),w111,W111),m,M),w112,W112),7)
disp('After First Iteration')
W011=W011-alpha*dW011
W111=W111-alpha*dW111
W012=W012-alpha*dW012
M=M-alpha*dM
W112=W112-alpha*dW112
% 2nd iteration
disp('Gradients 2nd iteration')
dW011=round(subs(subs(subs(subs(subs(djw011,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW111=round(subs(subs(subs(subs(subs(djw111,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW012=round(subs(subs(subs(subs(subs(djw012,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW112=round(subs(subs(subs(subs(subs(djw112,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dM=round(subs(subs(subs(subs(subs(djm,w011,W011),w012,W012),w111,W111),m,M),w112,W112),7)
disp('After 2nd iteration')
W011=W011-alpha*dW011
W111=W111-alpha*dW111
W012=W012-alpha*dW012
M=M-alpha*dM
W112=W112-alpha*dW112
% 3rd iteration
disp('Gradients 3rd iteration')
dW011=round(subs(subs(subs(subs(subs(djw011,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW111=round(subs(subs(subs(subs(subs(djw111,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW012=round(subs(subs(subs(subs(subs(djw012,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dW112=round(subs(subs(subs(subs(subs(djw112,w011,W011),w012,W012),w111,W111),m,M),w112,W112),4)
dM=round(subs(subs(subs(subs(subs(djm,w011,W011),w012,W012),w111,W111),m,M),w112,W112),7)
disp('After 3rd iteration')
W011=W011-alpha*dW011
W111=W111-alpha*dW111
W012=W012-alpha*dW012
M=M-alpha*dM
W112=W112-alpha*dW112
