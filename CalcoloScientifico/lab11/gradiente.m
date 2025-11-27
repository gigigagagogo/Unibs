function [x, res, k, resv] = gradiente(A, b, x0, tol, kmax)

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
    d = r;
    nr = norm(r);
    res = nr / nb;
    resv = [resv; res];
    k = k + 1;
end






