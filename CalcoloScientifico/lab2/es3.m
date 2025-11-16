x = linspace(-1, 2, 500);

f = @(x)(2*x-sqrt(2)).^2.*sin(2*x)
g = @(x)(exp(x).*cos(x))

y = f(x);
yg = g(x);

figure(1);

plot(x, y, 'r-*', x, yg, 'b--');

axis([-1, 2, -3, 2]);