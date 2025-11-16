function[z, res, k] = metodo_secanti(f, x0, x1, e, kmax)

if (x0 == x1) 
    error("x0 and x1 must be !=");
end

err = e + 1;
xn = x1; xno = x0; xnew = 0;
k = 0;
while (err > e && k < kmax)
    xnew = xn - f(xn)/((f(xn) - f(xno)) / (xn - xno));
    err = abs(xnew - xn);
    xno = xn;
    xn = xnew;
    k = k + 1;
end
fprintf("k = %d", k);
z = xnew;
res = f(xnew);
