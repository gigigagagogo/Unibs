function [A1] = inversa(A)

% inversa A1 = inversa(A) calcola l'inversa di matrice con la fatt LU
% Input: A matrice quadrata, si suppone sia invertibile
[n,m] = size(A);

A1 = zeros(n);
% fattorizzo la matrice A
[L, U, P] = fattorizzazionelu(A, 1);

for j = 1:n
    % definisco il termine noto del sistema j-esimo
    e = zeros(n, 1); e(j) = 1;
    % risolvo il sistema triangolare inferiore
    y = forsub(L, P*e);
    % risolvo il sistema triangolare superiore
    x = backsub(U, y);
    % salvo x nella colonna j-esima di A1
    A1(:, j) = x;
end