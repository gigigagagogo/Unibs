%f1 = @(x) 1/3 * log(x/2) + x^2;
%f2 = @(x) x^2 + x - 2;

f = @(x) 1/3 * log(x/2) - x + 1;
figure(1); clf
fplot(f,[0.0001, 1]);
grid on
xlabel('x');
ylabel('f(x)');

% Risposta alla doamdna su bisezione
% kmin = log((b-a)/eps) - 1

kmin = log(2e8) - 1

% kmin e' il primo intero successivo a kmin quindi 19

%%
df = @(x) 1./(3*x) - 1;
tol = 1e-8;
kmax = 50;
x0 = 0.1;
[z, res, k, ERR] = metodoNewton(f, df, x0, tol, kmax)
