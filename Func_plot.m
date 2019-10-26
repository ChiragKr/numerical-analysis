f = @(x) x^3 - x^2 - 2*x + 1;
X = -2:0.1:2;
Y = -2:0.1:2;
n = 1;
for x = -2:0.1:2;
Y(n) = f(x);
n = n + 1;
end
plot(X,Y); grid on;
xlabel("x"); ylabel("f(x)");
title("f(x) = x^3 - x^2 - 2*x + 1;")