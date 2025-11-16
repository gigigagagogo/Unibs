function [z, res, k, ERR] = metodoNewton(f, df, x0, e, kmax)
err = e + 1;
k = 0;
z = 0;
ERR = [err];
while (err > e && k < kmax)
    xnew = x0 - f(x0)/df(x0);
    err = abs(xnew - x0);
    ERR = [ERR;err];
    k = k + 1;
    x0 = xnew;
end

z = xnew;
res = f(z);
