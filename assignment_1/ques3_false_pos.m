%% Function defination 
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
TOL=10^(-6);
format long;
old = b;
fa = feval(f,a);
fb = feval(f,b);
Nmax = 100;

%% Iteration scheme
pvalues=[]; flag =0;
for i = 1 : Nmax
	new = b - fb * ( b - a ) / ( fb - fa );
	fnew = feval(f,new);
	fprintf ( '\t\t %3d \t (%.10f,%.10f) \t %.10f \n', i, a, b, new )
	
	if ( abs(new-old) < TOL ) 
        flag=1;
	   break
	elseif ( fa * fnew < 0 )
	   b = new;
	   fb = fnew;
	else
	   a = new;
	   fa = fnew;
    end
    error(i) = abs(new-old);
	old = new;
	pvalues = [pvalues;old];
    
end

%% Error plot "p_n - p_{n-1}"
figure; plot([1:i], error); grid on;
xlabel("iterations"); ylabel("|p_n - p_{n-1}|");
title("Error")

%% Printing results
fprintf('The approximate root is %.10f',new)
if flag == 0 
    disp(' Maximum number of iterations exceeded')
end



