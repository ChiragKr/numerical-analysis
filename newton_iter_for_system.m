% Author - Ambarish Prashant Chandurkar
% Non-linear systems using Newton Raphson Method (for three variables)
clc;
close all;
clear all;

syms x y;

f=x*(y^2) + (x^2)*y + (x^4) - 3; % Enter the first function here
fx=diff(f,x); fy=diff(f,y); %Calculation of partial derivatives

g=(x^3)*(y^5) - 2*(x^5)*y - (x^2) + 2;% Enter the second function here
gx=diff(g,x); gy=diff(g,y); %Calculation of partial derivatives

epsilon = 10^-6;
num_iter = 10;
x0 = 0.5;
y0 = 0.5;

xk = x0; yk = y0; %The intial approximations

for i=1:num_iter %Upto 5 iterations are considered
    
    fk=vpa(subs(f,[x y],[xk yk])); % Calculation of function values at each iteration
    gk=vpa(subs(g,[x y],[xk yk]));

    fxk=vpa(subs(fx,[x y],[xk yk])); %Evalution of partial derivatives at each iteration
    fyk=vpa(subs(fy,[x y],[xk yk]));

    gxk=vpa(subs(gx,[x y],[xk yk]));
    gyk=vpa(subs(gy,[x y],[xk yk]));

    xyk = [xk yk]'; %The old values of x,y
    J = [fxk fyk; gxk gyk]; % The jacobian matrix
    Fk = [fk gk]'; % Matrix of function values
    
    display(xyk);
    xykplus1 = (xyk - J\Fk); %The Iteration formula
    
    if abs(xykplus1 - xyk) < epsilon %Stopping Criterion for iterations
        break;
    end
    
    xk = xykplus1(1,1);
    yk = xykplus1(2,1);
    
end
xyans = xyk - rem(xyk, epsilon); %Displaying results upto required accuracy
fprintf('The Root Matrix is :\n');
display(xyans);

vpa(subs(f,[x y],xyk'))
vpa(subs(g,[x y],xyk'))



