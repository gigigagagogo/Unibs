% linspace mi permette di scegliere io i punti su cui valuto la funzione.
% Dove in input prendo l'estremo sinistro e destro e quanti punti valutare
x = linspace(-2*pi, 2*pi, 100);
f = @(x) sin(x.^2);
g = @(x) (sin(x).^2);

% y è un vettore della stessa dimensione di x contente tutti i punti
% valutati della funzione
y = f(x);
yg = g(x);

figure(1);

plot(x, y, 'm-*', x, yg, 'r--');
legend('f(x) = sin(x^2)', 'g(x) = (sin(x))^2')

