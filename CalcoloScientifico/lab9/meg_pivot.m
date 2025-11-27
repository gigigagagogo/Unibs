function [x] = meg(A,b)

x = [];
[n,m] = size(A);
if n ~= m
    disp('Attenzione A non è quadrata')
    return
end

[nb, mb] = size(b);
if nb ~= n
    disp('Attenzione b non è compatibile con le dimensioni di A')
    return
end

for k = 1: n-1
    % pivotazione per righe
    [~, r] = max(abs(A(k:n,k))); % la ~ vuol dire che il primo parametro che ci esce in output non ci interessa % r è la posizione relativamente al sottovettore che parte da riga k
    r = r + k-1; % posizione r all'interno della matrie
    % scambio le righe di A
    temp = A(k, :);
    A(k, :) = A(r, :);
    A(r, :) = temp;
    temp = b(k);
    b(k) = b(r);
    b(r) = temp;
    % fine della pivotazione
    for i = k+1: n
        if A(k,k) == 0
            disp('Attenzione, termine diagonale nullo')
            return
        end
        mik = A(i,k) / A(k,k);
        for j = k+1: n
            A(i,j) = A(i,j) - mik*A(k,j);
        end
        b(i) = b(i) - mik*b(k);
    end
end
U = triu(A); % una amtrice triangolare superiore, il cui triangolo superiore contiene il triangolo superiore di A
x = backsub(U, b);


