function [x] = backsub(U, b)

[n, m] = size(U);

[nb, mb] = size(b);
if (n ~= m || m ~= nb)
    % o la matrice non è quadrata oppure il numero di colonne di L è
    % diverso dal numero di righe di b
    disp('Attenzione matrice non quadrata o termine noto non compatibile in dimensioni con L')
    x = [];
    return
end

x = zeros(nb, 1);

for i = n: -1: 1
    s = 0;
    for j = i + 1: n
        s = s + U(i,j) * x(j);
    end
    x(i) = (b(i) - s)/U(i,i);
end