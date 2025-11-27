syms x1 x2 u
f1 = 6*(x1^2 + x1) * x2;
f2 = -8*x2 + 2*x1 - x2*u + 6*u;

f = [f1; f2];

ueq = 0;

% calcolo punti di eq
xeq = solve(subs(f, u, ueq) == 0, [x1 x2])

xeq1 = double([xeq.x1(1), xeq.x2(1)])
xeq2 = double([xeq.x1(2), xeq.x2(2)])

% calcolo della stabiilità

J = jacobian(f, [x1 x2])
J_eq1 = double(subs(J, [x1 x2 u], [xeq1 ueq]))
J_eq2 = double(subs(J, [x1 x2 u], [xeq2 ueq]))

aval1 = eig(J_eq1)
aval2 = eig(J_eq2)

% Valutare quale delle due uscite possa essere utilizzata per la linearizzazione del sistema (supponendo in questo caso lo stato misurabile o stimabile).

y1 = 4*x2;

dy1 = jacobian(y1, [x1 x2])*f % grado relativo = 1 => no perche non ha grado relativo == grado del sistema

y2 = 2*x1;
dy2 = jacobian(y2, [x1 x2])*f % grado relativo > 1
ddy2 = jacobian(dy1, [x2 x2])*f %si perche grado relativo = 2 = grado del sistema


% costruire un controllo linearizzante 

syms v
u_lin = solve(ddy2 == v, u)