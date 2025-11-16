% script per verificare se le funzioni di punto fisso soddisfano l'ipotesi
% del teorema di Ostrowski, per capire se la succ. di punto fisso converge
% o no al punto fisso sqrt(2)

b = @(x)x;
phi1 = @(x) -1/4*x.^2 + x + 1/2;
figure(1); clf
fplot(phi1, [0 3])
hold on 
fplot(b, [0 3], 'k--')
grid on
xlabel('x')
ylabel('y')

phi2 = @(x) -x.^2 + x + 2;
fplot(phi2, [0 2])
hold on 

phi3 = @(x) x/2 + 1./x;
fplot(phi3, [0.5 3])
legend('phi_1(x)', 'y=x', 'phi_2(x)', 'phi_3(x)')
axis equal

x0 = 1;
tol = 1e-10;
kmax = 100;
[alpha1, k1, errv1] = puntofisso(phi1, x0, tol, kmax)
x0 = 1.5;
[alpha2, k2, errv2] = puntofisso(phi2, x0, tol, kmax)

[alpha3, k3, errv3] = puntofisso(phi2, x0, tol, kmax)