A = [6 1 -2 2 1;
    1 3 1 -2 0;
    -2 1 4 -1 -1;
    2 -2 -1 4 2;
    1 0 -1 2 3
    ];
b = [15; 2; 3; 21; 21];

x0 = rand(5,1);
tol = 1e-12;
kmax = 500;

[x, res, k, resv] = gradiente(A,b,x0,tol,kmax)

[xg, resg, kg, resvg] = gradiente_coniugato(A,b,x0,tol,kmax)



figure(1); clf

semilogy(0:k, resv, 'LineWidth', 2, 'DisplayName', 'gradiente')
legend ('-dynamiclegend')
hold on
semilogy(0:kg, resvg, 'LineWidth',2, 'DisplayName', 'gradiente coniugato')
grid on
xlabel('x')
ylabel('residui')


