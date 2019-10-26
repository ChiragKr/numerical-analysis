%% Composite Trapizod Rule 

%% Function Defination
syms x;
f = @(x) x*log(x) ;
N = 4;
a = 1; b = 2;
Trapezoid(f, a, b, N);

function y = Trapezoid(f, a, b, N)
    %% step size
    h = (b - a)/N;
    sum = 0;
    
    I = h/2[sum];
end