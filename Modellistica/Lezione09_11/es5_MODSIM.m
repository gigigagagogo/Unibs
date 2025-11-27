clear all
alfa1= 0.02;
alfa2 = 0.001;
K = 100;
b = 0.1;
x0 = [10,10]';
ueq = 0.5;
ys = 80;

% x1 quantità di alga
% x2 quantità di pesci
% dx1/dt = x1 * (1 - x1/K) - alfa1 * x1 * x2;
% dx2/dt = -b * x2 + alfa2 * x1 * x2 + u;
% y = x1
syms x1 x2 u
f = [x1 * (1 - x1/K) - alfa1 * x1 * x2; -b * x2 + alfa2 * x1 * x2 + u];
xeq_s = solve (subs(f,u,ueq) == 0)


% Le soluzioni devono essere reali perché ragioniamo in R
xeq1 = double([xeq_s.x1(1), xeq_s.x2(1)])
xeq2 = double([xeq_s.x1(2), xeq_s.x2(2)])
xeq3 = double([xeq_s.x1(3), xeq_s.x2(3)])

J_s = jacobian(f, [x1,x2])
J1 = double(subs(J_s, [x1, x2, u], [xeq1, u]))
aval1 = eig(J1)
J2 = double(subs(J_s, [x1, x2, u], [xeq2, u]))
aval2 = eig(J2)
J3 = double(subs(J_s, [x1, x2, u], [xeq3, u]))
aval1 = eig(J3)


% per il calcolo del controllore linearizzante devo calcolare il grado
% relativo del sistema S
y = x1 % non dipende esplicitamente da u =>S non ha gr = 0
% calcolo dy/dt = grad(y) * dx/dt = grad(y)*f (derivata della funzione
% composta vettoriale)
dy = jacobian(y, [x1,x2]) * f % non dipende esplicitamente da u =>S non ha gr = 1
ddy = jacobian(dy, [x1, x2]) * f % dipende esplicitamente da u =>S non ha gr = 2

% Il controllo u_lin che tende ddy = v (nuovo ingresso esterno del
% controllo linearizzante) sarà:
syms v
u_lin = solve(ddy == v, u) % controllo linearizzante

% questo controllore prende in ingresso v (e x1, x2 del sistema) e rende la
% relazione tra y e v lineare. In particolare, la relazione sarà ddy == v
% => fdt Y(s) = 1/s^2 * V(s)
% nello spazio degli stati il sitema linearizzato diventa
% dz1 = z2
% dz2 = v
% y = z1

% z NON è x, ma è legato ad x dalla relazione z = T(x) dove T è il
% diffeomorfismo (se y = h(x))
% T(x) = [h; grad(h)*f]
% Calcolo il controllore v = -K * z + F
% Assumo che F non dipenda da z(t)
% dz/dt = Az + Bv
% y = Cz
A = [0 1; 0 0];
B = [0;1];
C = [1 0];
% dz/dt = Az + Bz(-Kz + F)
% dz/dt = (A - BK)z + BF
K = place(A, B, [-0.1, -10])

% dz1 = z2
% dz2 = v = -K*z + F
% y = z1

% All'equilibrio:
% dz1/dt = 0 => z2 = 0
% dz2/dt = 0 => -K*z + F = 0 => -K(1)*z(1) - K(2)*z(2) + F = 0
% y = ys = z(1)
% => -K(1)*ys + F = 0 => F = K(1)*ys => v = -K*z + K(1)*ys
% z = T(x) = [h(x); grad(h)*f]

T = [y; jacobian(y, [x1, x2])*f] 