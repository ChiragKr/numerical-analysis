%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Fourth-order Runge-Kutta Method                    ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
format long;
tinit = 0;
tfinal = 5;
yinit = 1;

error = 1:5;

%% 4th Order Runge-Kutta Implementation
for p = 1:5
 
    N(p) = 20*p; %%% refining
    h(p) = (tfinal-tinit)/N(p);
    
    t = zeros(N(p)+1,1);
    y = zeros(N(p)+1,1);
    t(1) = tinit;
    y(1) = yinit;
    
    for j = 1:N(p) %%% 4th order Runge-Kutta iteration scheme
        t(j+1) = t(j) + h(p);
        k1 = f(t(j),y(j));
        k2 = f(t(j) + h(p)/2, y(j)+ h(p)*k1/2);
        k3 = f(t(j) + h(p)/2, y(j) + h(p)*k2/2);
        k4 = f(t(j) + h(p), y(j) + h(p)*k3);
        y(j+1) = y(j) + (h(p)/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    exact = 1:N(p)+1;
    for j = 1:N(p)+1
        exact(j) = 0.2*t(j)*exp(3*t(j)) - 0.04*exp(3*t(j)) + 0.04*exp(-2*t(j));
    end
    [y exact']
    error(p) = max(abs(exact'-y));
    
end

%% Order of Convergence
order = 1:4;
for k = 1:4
    order(k) = log(error(k)/error(k+1))/log(h(k)/h(k+1));
end
[order]
  
%% differential equation RHS
function H = f(t,y)
    H = t*exp(3*t)-2*y;
end
    
    