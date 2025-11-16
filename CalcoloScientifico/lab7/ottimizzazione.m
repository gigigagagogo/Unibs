syms t
b = 2500/(1 + 9*exp(-t/3));
b2 = diff (b, 2);
f = matlabFunction(b2);

%Disegno f per localizzare la radice
figure(1);clf
fplot(f, [0 20])
grid on
hold on
xlabel('x')
ylabel('f(t)')

% Scelgo il punto iniziale
x0 = 5; x1 = 9;
tol = 1e-8; kmax = 20;
[z, res, k] = metodo_secanti(f, x0, x1, tol, kmax);

plot(z, res, 'o');