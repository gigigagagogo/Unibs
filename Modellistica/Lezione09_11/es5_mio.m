clear all
alfa1= 0.02;
alfa2 = 0.001;
K = 100;
b = 0.1;
x0 = [10,10]';
ueq = 0.5;
syms x1 x2 u

f1 = x1*(1-x1/K) - alfa1*x1*x2;
f2 = -b*x2 + alfa2*x1*x2 + u;

xeq = solve([subs(f1,u,ueq)==0 subs(f2,u,ueq)==0], [x1 x2]);
xeq_d = double([xeq.x1 xeq.x2])