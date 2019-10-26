%% Bisection Method for finding zeros of a function
clear all;
close all;

%% Function definition
Q = 20; g = 9.81;
A = @(y) 3*y + y^2/2;
B = @(y) 3 + y;
f = @(y) 1 -(Q^2/(g*(A(y)^3)))*B(y);
a=0.5;  b=2.5;

%% Plotting graph of f(y)
X = a:0.1:b;
Y = a:0.1:b;
n = 1;
for x = a:0.1:b
Y(n) = f(x);
n = n + 1;
end
plot(X,Y); grid on;
xlabel("y");
ylabel("f(y)");
title("f(y) = 1 -({Q^2}/{g*A^3})*B")

%% Stopping criterium
TOL = 10^(-6);
Nmax = floor ( log((b-a)/TOL) / log(2) ) + 1
pvalues=zeros(Nmax,1);

%% Iteration Scheme
for i = 1 : Nmax
    p = (a+b)/2;
	pvalues(i)=p;
    sfa = f(a);
    sfp = sign(f(p));
    fprintf( '\t\t %3d \t (%.6f,%.6f) \t %.10f \n', i, a, b, p)
	if ( (b-a)<2*TOL || sfp == 0 ) 
	   break
	elseif ( sfa * sfp < 0 )
	   b = p;
	else
	   a = p;
	   sfa = sfp;
    end
end

%% Absolute Error computation
plast =p;
errors=pvalues-plast*ones(Nmax,1);
fprintf('Approximate value |  Absolute Error\n\n')
fprintf(' %.10f     |  %.10f\n',[pvalues errors]');

figure; plot(errors); grid on;
xlabel("iteration n");
ylabel("|e_{n+1} - e_n|");
title('Absolute error e_n')
