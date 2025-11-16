clear all
b = 0.004;
g = 0.04;
d = 1e-1;
mu = 1e-3;
x0 = [97 3 0];

% Le variabili simboliche vanno definite
syms S I R

% devo studiare un sistema nella forma dx/dt = f(x,u,t)
% CALCOLO PTO DI EQUILIBRIO dx/dt = 0 => f(x,u,t) = 0 -> Quando il sistema
% è in equilibrio vuol dire che nel tempo non cambia, ovvero S, R e I
% rimangono costanti
% Definisco f definendone le 3 componenti

f1 = d - b*S*I - mu*S;
f2 = b*S*I - g*I - mu*I;
f3 = g*I - mu*R;
f = [f1;f2;f3]

% per risolvere sistemi simboli si usa il comando solve

xeq_s = solve(f == 0)

xeq1_s = [xeq_s.S(1), xeq_s.I(1), xeq_s.R(1)];
xeq2_s = [xeq_s.S(2), xeq_s.I(2), xeq_s.R(2)];
 
% è buona cosa convertire i simboli in double
xeq1 = double(xeq1_s);
xeq2 = double(xeq2_s);

% STUDIARE LA STABILITÀ
% Calcolare la jacobiana simbolica di f
J_s = jacobian (f,[S I R]);
% Calcolare la jacobiana nei pti di equilibrio
J1_s = subs(J_s, [S I R], [xeq1(1), xeq1(2), xeq1(3)]);
J1 = double(J1_s);
J2_s = subs(J_s, [S I R], [xeq2(1), xeq2(2), xeq2(3)]);
J2 = double(J2_s);
% Calcolare gli autovalori
aval1 = eig(J1) % INSTABILE perché abbiamo parte reale > 0

aval2 = eig(J2) % AS. STABILE

