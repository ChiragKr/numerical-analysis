%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      fourth-order Adams-Bashforth Method                ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
format long;

tinit = 0;
tfinal = 1;
yinit = 1;

%% Forth-order Adams-Bashforth Method 
h_test = [0.1, 0.05, 0.025];
for p = 1:3
    h = h_test(p);
    N = (tfinal-tinit)/h;

    t(1) = tinit;
    y(1) = yinit;
    
    for j = 1:N
        t(j+1) = j*h;
    end

    %%% 4th order RK method for computed initial data
    for j = 1:3
        k1 = fab4(t(j),y(j));
        k2 = fab4(t(j) + h/2, y(j)+ h*k1/2);
        k3 = fab4(t(j) + h/2, y(j) + h*k2/2);
        k4 = fab4(t(j) + h, y(j) + h*k3);
        y(j+1) = y(j) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    
    %%% Adams-Bashforth Method %%%
    for k = 4:N
        y(k+1) = y(k) + (h/24)*(55*fab4(t(k),y(k))- 59*fab4(t(k-1),y(k-1))+...
            37*fab4(t(k-2),y(k-2)) - 9*fab4(t(k-3),y(k-3))); 
    end
 
    %%% Exact Soln %%%
    for j = 1:N+1
        exact(j) = (1/3)*(t(j)^3) + exp(-2*t(j));
    end
    
    [y' exact']
    
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
function H = fab4(t,y)
    H = t^2 - 2*exp(-2*t);
end
 
 