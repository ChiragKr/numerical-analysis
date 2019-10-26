%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%       Adams fourth-order Predictor Corrector Method     ****%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****
%%%%                   y(t0) = y0.                           *****
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
format long;
tinit = 0;
tfinal = 1;
yinit = 0;

N = 10;

for p = 1:5
    
h = (tfinal-tinit)/N;

t(1) = tinit;
y(1) = yinit;
    
for j = 1:N
    t(j+1) = j*h;
end

%%%% RK-4 Method
 for j = 1:3
        k1 = fab4(t(j),y(j));
        k2 = fab4(t(j) + h/2, y(j)+ h*k1/2);
        k3 = fab4(t(j) + h/2, y(j) + h*k2/2);
        k4 = fab4(t(j) + h, y(j) + h*k3);
        y(j+1) = y(j) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
 end
    
 
  %%%% Predictor-Corrector Method %%%%%%%
 
 for k = 4:N
     y(k+1) = y(k) + (h/24)*(55*fab4(t(k),y(k))-59*fab4(t(k-1),y(k-1)) +...
         37*fab4(t(k-2),y(k-2)) - 9*fab4(t(k-3),y(k-3)));  %%% Predictor
     
      y(k+1) = y(k) + (h/24)*(9*fab4(t(k+1),y(k+1)) + 19*fab4(t(k),y(k)) -...
         5*fab4(t(k-1),y(k-1)) + fab4(t(k-2),y(k-2)));  %%% Corrector
 end
 
 
 %%%%%% Exact Soln %%%%
 for j = 1:N+1
        exact(j) = (1/5)*t(j)*exp(3*t(j))-(1/25)*exp(3*t(j))+(1/25)*exp(-2*t(j));
 end
    
    [y' exact']
    
    error(p) = max(abs(exact-y));
    
    N = 2*N;
    
end


for j = 1:4
     order(j) = log(error(j)/error(j+1))/log(2);
end
 
 