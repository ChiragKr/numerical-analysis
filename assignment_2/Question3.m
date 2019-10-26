%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Second-order Adams-Bashforth Method                ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
format long;

tinit = 0;
tfinal = 10;
yinit = 1;

%% Second-order Adams-Bashforth Method 
h_test = [0.005, 0.0025, 0.001];
for p = 1:3
    h = h_test(p);
    N = (tfinal-tinit)/h;

    t(1) = tinit;
    y(1) = yinit;
    
    for j = 1:N
        t(j+1) = j*h;
    end

    %%% 2nd order RK method for computed initial data
    for i = 1
        k1 = fab2(t(i), y(i));
        k2 = fab2(t(i + 1), y(i) + h*k1);
        y(i+1) = y(i) + (h/2)*(k1 + k2);
    end
    
    %%% Adams-Bashforth Method %%%
    for i = 2:N 
        y(i+1) = y(i) + (h/2)*(3*fab2(t(i),y(i))-fab2(t(i-1),y(i-1)));
    end
    
    %%% Exact Soln %%%
    for j = 1:N+1
        exact(j) = sin(t(j)) + cos(t(j));
    end
    
    [t' y' exact']   
    error(p) = max(abs(exact-y));
 
end

%% Order of Convergence
order = 1:2;
for j = 1:2
    order(j) = log(error(j)/error(j+1))/ log(h_test(j)/h_test(j+1));
end
[order]

%% Graphical Visulization of results
hold on;
f = plot(t,y,'r');
e = plot(t,exact,'*');
grid on;
hold off;
legend([f, e],'2 step Adams Bashforth','Exact Solution');

%% differential equation RHS
function H = fab2(t,y)
    H = -50*y + 51*cos(t) + 49*sin(t);
end
