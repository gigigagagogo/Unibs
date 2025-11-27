A = [6 1 -2 2 1; 0 -3 3 -2 1; 2 0.5 5 -1 -2; 0 1 2 -3 2; 0.5 -1 1 0.4 2];
b = [15; 0; 4; 6; 13.1];


x0 = zeros(5,1);
tol = 13-12;
kmax = 500;
[x, res, k, resv] = gradiente(A,b,x0,tol,kmax);

[xgc, resgc, kgc, resvgc] = gradiente(A,b,x0,tol,kmax);

% chiamo bcgstab

[xb, resb, kb, resvb] = bcgstab(A, b, xo, tol, kmax);

figure(1); clf

semilogy((0:k)', resv, 'DisplayName', 'gradiente')
legend('-dynamiclegend')
hold on
grid on
semilogy((0:kgc)', resvg, 'DisplayName', 'gradiente coniugato')
semilogy((0:kb)', resvb, 'DisplayName', 'bcgstab')

xlabel('k');
ylabel('norme dei residui');
