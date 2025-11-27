clear all
% Es 2.1
syms x1 x2 u
f = [3*(x1^2 + x1)*x2; -4*x2 + x1 - x2*u + 3*u];
ueq = 0;
xeq = solve(subs(f,u,ueq), [x1 x2])

xeq1 = double([xeq.x1(1) xeq.x2(1)]) % [0 0]
xeq2 = double([xeq.x1(2) xeq.x2(2)]) % [-1 -0.25]

J_s = jacobian(f, [x1 x2])

J1 = double(subs(J_s, [x1,x2,u], [xeq1, ueq]))
J2 = double(subs(J_s, [x1,x2,u], [xeq2, ueq]))

aval1 = eig(J1) % [-4 0] => xeq1 non è classificabile con il metodo della linearizzazione (perché abbiamo un autovalore = 0)
aval2 = eig(J2) % [-4 0.75] => xeq2 non è stabile (sella)

% Es 2.2
% Per stabilire l'uscita devo calcolare il grado relativo del sistema
% rispetto alle due uscite. Se una delle uscite non ha grado relativo
% massimo la devo scartare. Se entrambe lo hanno max posso sceglierne una
% delle due

y1 = 5*x2; % non ha grado relativo pari a 0
dy1 = jacobian(y1, [x1 x2])*f % compare u quindi ha grado 1 => l'uscita non si può utilizzare per la linearizzazione I/O perché non ha grado max

y2 = 2*x1; % non ha grado relativo pari a 0
dy2 = jacobian(y2, [x1 x2])*f % non dipende da u => grado > 1
ddy2 = jacobian(dy2, [x1 x2])*f % compare u => ha grado 2 = grado max del sistema => possiamo usare questa uscita per la linearizzazione I/O
% Es 2.3
syms v
u_lin = solve(ddy2 == v, u)

% Es 2.4
% Regolazione a zero dello stato significa di fatto che il sistema in z
% deve avere equilibrio pari a [0 0]
% La retroazione deve anche contenere una "parte" -K*z (che abbiamo visto
% permette di definire la dinamica del sistema)
% v = -K*z => dz/dt = Az + Bv = (A -BK) * z, che ha come pto di eq (in z)
% l'origine

%definire [a1, 2*a1]
% a1 deve garantire che il sistema raggiunga l'equilibrio in un tempo T =
% 2s
% T = 2s = % 5*Td => Td = 2/5 => autovalore dominante a1 = -5/2 (inverso
% della costante di tempo dominante del sistema, ovviamente cambiato di
% segno per essere stabile)

a1 = -5/2;
A = [0 1; 0 0];
B = [0; 1];
K = place (A,B,[a1 2*a1]);

% L'ultima cosa che rimane da calcolare è il diffeomorfismo perché 
% v = -K*z = -K*T(x), T(x) = [y2, dy2/dt]
T = [y2; jacobian(y2, [x1 x2])*f]




