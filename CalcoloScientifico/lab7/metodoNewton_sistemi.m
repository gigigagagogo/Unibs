function [zero, res, k, errv] = metodoNewton_sistemi(f, Jf, x0, tol, kmax)

err = 1 + tol;
k = 0;
errv = [err];
while (err > tol && k < kmax)
    A = Jf(x0);
    b = - f(x0);
    z = A\b;
    xnew = z + x0;
    err = norm(z);
    errv = [errv; err];
    k = k + 1;
    x0 = xnew;
end

zero = xnew;
res = norm(f(zero));