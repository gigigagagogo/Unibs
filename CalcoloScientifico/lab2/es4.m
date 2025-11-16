[x, y] = meshgrid(-2:.1:2,-2:.1:2);
f = @(x, y)(x.*exp(-x.^2-y.^2))
z = f(x, y);
figure(1)
surf(x, y, z);
colorbar