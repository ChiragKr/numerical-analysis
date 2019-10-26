clear;

f = inline('-2*t*y*y', 't', 'y');

sol = inline('exp( 0.25 - (t - 0.5)^2 )', 't');

N = 10; %%input("enter number of sub intervals");
t_0 = 0;
t_N = 5;
h = (t_N - t_0) / N ;

t = t_0:h:t_N;
t(1) =  t_0;

y0(1) = 1; 
y1(1) = 1;
y2(1) = 1;

for j = 1:N+1
    t(j+1) = t(j) + h; 
end

for j = 1:N+1
    y0(j+1) = y0(j) + h*f(t(j), y0(j));
    y1(j+1) = y1(j) + h*f(t(j+1),y0(j+1));
    y2(j+1) = y2(j) + (h/2)*[f(t(j), y2(j)) + f(t(j+1),y0(j+1))];
end

S = t_0:h:t_N;
for j = 1:N+1
    S(j) = sol(t(j));
end

plot(t, y0, t, y1, 'r', t, y2, 'g'); grid on;