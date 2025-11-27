syms x2 x1 u
f1 = 2*x2 - 0.1*x1 - 0.5*u;
f2 = x2*(1 - x2/50) - 0.9*x2;

f = [f1; f2]
ueq = 1;
xeq = solve(subs(f, u, ueq) == 0, [x1 x2]); 
xeq1 = double([xeq.x1(1) xeq.x2(1)])
xeq2 = double([xeq.x1(2) xeq.x2(2)])

J_s = jacobian(f, [x1 x2])

J1 = double(subs(J_s, [x1 x2 u], [xeq1, ueq]))
J2 = double(subs(J_s, [x1 x2 u], [xeq2, ueq]))

aval1 = eig(J1)
aval2 = eig(J2)
