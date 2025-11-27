% Risolvo con la fattorizzazione di Cholesky

A = [6 1 -2 2 1;1 3 1 -2 0; -2 1 4 -1 -1; 2 -2 -1 4 2; 1 0 -1 2 3];
b = [15;2;3;21;21];

% voglio trasformare A in formato sparso memorizzando solo il triangolo
% superiore
AT = triu(A);
A = sparse(A);

R = chol(A); % calcola il fattore di Cholesky: A = R' * R

% Risolvo il sistema tr. inf R'y = b
y = forsub(R', b);
% Risolvo il s tr sup R x = y

x = backsub(R, y)


