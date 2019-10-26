%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Second-order Adams-Bashforth Method                ****%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
close all;
format long;
tinit = 0;
tfinal = 5;
yinit = 1;

N = 20;
for p = 1:5
h = (tfinal-tinit)/N;

t(1) = tinit;
y(1) = yinit;
    
for j = 1:N
    t(j+1) = j*h;
end

    for i = 1
        k1 = fab2(t(i), y(i));
        k2 = fab2(t(i + 1), y(i) + h*k1);
        y(i+1) = y(i) + (h/2)*(k1 + k2);
    end 
    
  for i = 2:N 
     y(i+1) = y(i) + (h/2)*(3*fab2(t(i),y(i))-fab2(t(i-1),y(i-1)));
  end
    

    for j = 1:N+1
        exact(j) = sin(t(j)) + cos(t(j));
    end
    
    [y' exact'];
    
    error(p) = max(abs(exact-y));
    
    N = 2*N;
    
end

 for j = 1:4
     order(j) = log(error(j)/error(j+1))/log(2);
 end
