function [f] = calcolopi(N)

f = zeros(N,1);
f(2) = 2;
for n = 2: N-1
    f(n+1) = 2^(n-0.5)*sqrt(1-sqrt(1-4^(1-n)*f(n)^2));
    fprintf("il valore è %10.8e\n", f(n+1));
end

e = abs(f-pi)/pi;
e(1) = 0;

figure(1);clf
plot((1:N),f,'o')
xlabel('x')
ylabel('f_n')
grid on

figure(2);clf
semilogy((1:N),e,'o')
xlabel('x')
ylabel('e_n')
grid on