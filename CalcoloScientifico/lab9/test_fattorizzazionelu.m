A = [10 2 3 -2; 2 20 20 -1; 3 -6 4 3; -3 0 3 1];
b = [5; 24; 13; -2];
[L,U] = fattorizzazionelu(A);

y = forsub(L, b) % Solve Ly = b
x = backsub(U, y) % Solve Ux = y

c = [10; -3; 2; 0];
% Risolvo il sistema Az = c

% Lt = c % sistema triangolare inferiore
% Uz = t % sistema triangolare superore

t = forsub(L, c)
z = backsub(U, t)