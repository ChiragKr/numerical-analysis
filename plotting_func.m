%% Function definition
u = 2000; v = 750; m_0 = 150000;
g = 9.81; q = 2700;
f = @(t) sin(t);
g = @(t) cos(t);

a=10;  b=30;

%% Plotting function f(t)
X = -2*pi:0.1:2*pi;
S = -2*pi:0.1:2*pi;
C = -2*pi:0.1:2*pi;
n = 1;
for x = -2*pi:0.1:2*pi
S(n) = f(x);
C(n) = g(x);
n = n + 1;
end

plot(X,S,X,C);
grid on;
xlabel("time (t)");
ylabel("f(t)");
title("f(t) = v-u*log(m_0/(m_0-q*t))+g*t");