function [z, k, res] = metodoBisezione(f,a,b,e,kmax)

k = 0;
err = 1 + e;
while (err > e && k < kmax)
    c = (a + b)/2;
    y = f(c);
    err = (b - a)/2;
    if (y == 0)
        err = 0;
    else
        if (y*f(a) < 0)
            b = c;
        else
            a = c;
        end
        k = k + 1;
    end
    fprintf("%d. [%d %d] con valore %d\n", k, a, b, c);

end
z = c;
res = y;
