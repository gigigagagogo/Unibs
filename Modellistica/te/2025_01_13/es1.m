syms x1 x2 x3 u

f1 = 0.1*x1-0.2*x2-0.01*x3+0.3*u;
f2 = x2*(1-x2/1000) + 0.1*x3-0.05*x1+0.2*u;
f3 = x3*(1-x3/800) + 0.1*x2 - 0.1*x1 + 0.5*u;

f = [f1; f2; f3]

ueq = 100;

xeq = solve(subs(f, u, ueq) == 0, [x1 x2 x3])

xeq1 = double([xeq.x1(1) xeq.x2(1) xeq.x3(1)]);
xeq2 = double([xeq.x1(2) xeq.x2(2) xeq.x3(2)]);
xeq3 = double([xeq.x1(3) xeq.x2(3) xeq.x3(3)]);
xeq4 = double([xeq.x1(4) xeq.x2(4) xeq.x3(4)]);
[xeq1; xeq2; xeq3; xeq4]


% calcoliamo la stabilità

J = jacobian(f, [x1 x2 x3])

J_eq1 = double(subs(J, [x1 x2 x3 u], [xeq1 ueq]))
J_eq3 = double(subs(J, [x1 x2 x3 u], [xeq3 ueq]))

aval1 = eig(J_eq1)
aval2 = eig(J_eq3)