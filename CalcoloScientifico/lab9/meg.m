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


