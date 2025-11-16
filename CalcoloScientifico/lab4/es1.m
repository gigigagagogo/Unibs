x = linspace(0.996, 1.004, 10000);
p1 = (x-1).^6;
p2 = x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1;
p3 = 1 + x.*(-6 + x.*(15 + x.*(-20 + x.*(15 + x.*(-6 + x)))));

figure(1); clf

plot(x , p2, 'DisplayName', 'p2(x)')
legend('-dynamiclegend')
hold on
plot(x, p3, 'DisplayName', 'p3(x)')
plot(x, p1, 'DisplayName', 'p1(x)')
xlabel('x');
ylabel('y')
grid on