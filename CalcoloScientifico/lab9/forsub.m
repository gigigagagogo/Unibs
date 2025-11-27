function [x] = forsub(L,b)

% forsub: sostituzione in avanti per risolvere Lx = b
% input L = matrice quadrata triangolare inferiore
% b = vettore colonna, termine noto
% output: x = vettore colonna soluzione
% x = forsub(L,b)

[n,m] = size(L);
[nb, mb] = size(b);
if (n ~= m || m ~= nb)
    % o la matrice non è quadrata oppure il numero di colonne di L è
    % diverso dal numero di righe di b
    disp('Attenzione matrice non quadrata o termine noto non compatibile in dimensioni con L')
    x = [];
    return
end

x = zeros(n,1);
for i = 1: n
    % ciclo per la sommatoria
    s = 0;
    for j = 1: i-1
       s = s + L(i,j)*x(j);
    end
    x(i) = (b(i) - s)/L(i,i);
end
