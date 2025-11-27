function [x, res, k, resv] = gradiente_coniugato(A, b, x0, tol, kmax)

x = x0;

r = b - A*x;
d = r;
k = 0;

res = tol + 1;
resv = [norm(r)];
nb = norm(b);
while (res > tol && k < kmax)
    v = A*d;
    alpha = (d'*r) / (d'*v);
    x = x + alpha * d;
    r = r -alpha*v;
    beta = (v'*r)/(d'*v); 
    d = r - beta * d;
    nr = norm(r);
    res = nr / nb;
    resv = [resv; res];
    k = k + 1;
end