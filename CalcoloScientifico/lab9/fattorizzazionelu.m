function [L, U, P] = fattorizzazionelu(A, pivot)

x = [];
[n,m] = size(A);
if n ~= m
    disp('Attenzione A non è quadrata')
    return
end

% Inizializzo la matrice P che memorizza gli scambi di righe
P = eye(n); % Inizializzo la matrice P come matrice identità

for k = 1: n-1
    if (pivot) 
        % pivotazione
        [~, r] = max(abs(A(k:n,k))); % la ~ vuol dire che il primo parametro che ci esce in output non ci interessa % r è la posizione relativamente al sottovettore che parte da riga k
        r = r + k-1; % posizione r all'interno della matrie
        % scambio le righe di A
        temp = A(k, :);
        A(k, :) = A(r, :);
        A(r, :) = temp;
        temp = P(k, :);
        P(k, :) = P(r, :);
        P(r, :) = temp;
    end
    for i = k+1: n
        if A(k,k) == 0
            disp('Attenzione, termine diagonale nullo')
            return
        end
        A(i,k) = A(i,k) / A(k,k);
        for j = k+1: n
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end
U = triu(A); % una amtrice triangolare superiore, il cui triangolo superiore contiene il triangolo superiore di A
L = tril(A, -1) + eye(n);

