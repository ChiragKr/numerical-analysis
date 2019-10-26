%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Second-order Runge-Kutta Method                    ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

tinit = 0;
tfinal = 1;
yinit = 0;

N = 10;
error = 1:5;

%% 2nd Order Runge-Kutta Implementation
for p = 1:5 %%% p-loop for gird-refinement
    
    h = (tfinal-tinit)/N;
    t = zeros(N+1, 1);
    y = zeros(N+1, 1);
    
    t(1) = tinit;
    y(1) = yinit;
    
    for i = 1:N %%% 2nd order Runge-Kutta iteration scheme
        t(i + 1) = t(i) + h;
        k1 = fab2(t(i), y(i));
        k2 = fab2(t(i + 1), y(i) + h*k1);
        y(i+1) = y(i) + (h/2)*(k1 + k2);
    end 

    exact = 1:N+1;
    for j = 1:N+1
        exact(j) = 0.2*t(j)*exp(3*t(j)) - 0.04*exp(3*t(j)) + ...
            0.04*exp(-2*t(j));
    end
    
    [y exact']
    
    error(p) = max(abs(exact'-y));
    
    N = 2*N; %%% refining grid
    
end

%% Order of Convergence
order = 1:4;
 for j = 1:4
     order(j) = log(error(j)/error(j+1))/log(2);
 end
[order]

%% differential equation RHS
function H = fab2(t,y)
    H = t*exp(3*t)-2*y;
end