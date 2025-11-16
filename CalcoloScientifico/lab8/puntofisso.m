function [alpha, k, errv] = puntofisso(phi, x0, tol, kmax)

k = 0;
err = tol + 1;
errv = [err];

while(err > tol && k < kmax)
    xnew = phi(x0);
    err = abs(xnew - x0);
    errv = [errv;err];
    k = k + 1;
    x0 = xnew;
end

alpha = xnew;

