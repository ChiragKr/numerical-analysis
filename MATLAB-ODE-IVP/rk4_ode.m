%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Fourth-order Runge-Kutta Method                    ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    clear all;
    close all;
    
    for p = 1:5
        
    tinit = 0;
    tfinal = 5;
    yinit = 1;
    N(p) = 20*p;
    h(p) = (tfinal-tinit)/N(p);
    t = zeros(N(p)+1,1);
    y = zeros(N(p)+1,1);
    t(1) = tinit;
    y(1) = yinit;
    
    for j = 1:N(p)
        t(j+1) = t(j) + h(p);
        k1 = f(t(j),y(j));
        k2 = f(t(j) + h(p)/2, y(j)+ h(p)*k1/2);
        k3 = f(t(j) + h(p)/2, y(j) + h(p)*k2/2);
        k4 = f(t(j) + h(p), y(j) + h(p)*k3);
        y(j+1) = y(j) + (h(p)/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    for j = 1:N(p)+1
        exact(j) = 1/(1 + t(j)^2);
    end
    
    error(p) = max(abs(exact'-y));
    
    end
    
    %%%%%%%%% order of convergence %%%%
    
    for k = 1:4
         order(k) = log(error(k)/error(k+1))/log(h(k)/h(k+1))
    end
    
    
    format long
    [exact' y]
    
    