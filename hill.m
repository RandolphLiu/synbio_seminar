% Hill equation
x = 0:0.01:2;
hold on
plot(x, Hill(1, 1, x))
plot(x, Hill(1, 2, x))
plot(x, Hill(1, 3, x))
plot(x, Hill(1, 5, x))
plot(x, Hill(1, 1000, x))
axis([min(x) max(x) -0.1 1.1])
xlabel('X/K')
ylabel('f(X)/\beta')
legend('n=1', 'n=2', 'n=3', 'n=5', 'n=\infty')

function y = Hill(K, n, x)
y = 1./(1+(x/K).^n);
end