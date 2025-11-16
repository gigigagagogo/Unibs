% La x viene trattata come un vettore. Quando matlab fa un operazione di
% +/- tra vettore e scalare trasforma lo scalare in automatico in vettore
% della stessa dimensione dell'altro

f = @(x)(2*x-sqrt(2)).^2.*sin(2*x);

% figure apre una finestra
figure(1);

% fplot prende in input la funzione e l'intervallo su cui è definita
fplot(f, [-2*pi 2*pi]);
legend('f(x) = (2x-sqrt{2})^2*sin(2x)')
xlabel('x');
ylabel('y');
grid on;

set(gca, 'Fontsize', 18);