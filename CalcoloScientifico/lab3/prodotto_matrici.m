function [c] = prodotto_matrici(a,b)

[n m] = size(a)
[d p] = size(b)

if (m ~= d)
    error('Inner dimensions must agree for matrix multiplication.');
end

c = zeros(n, p); % Initialize the result matrix with zeros

for k = 1: m
    for i = 1: n 
        for j = 1: p
            c(i, j) = c(i, j) + a(i, k) * b(k, j);
        end
    end
end

