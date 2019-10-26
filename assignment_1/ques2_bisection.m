%% Bisection Method for finding zeros of a function
clear all;
close all;

%% Function definition
u = 2000; v = 750; m_0 = 150000;
g = 9.81; q = 2700;
f = @(t) v-u*log(m_0/(m_0-q*t))+g*t;
a=10;  b=30;

%% Plotting function f(t)
X = 0:100;
Y = 0:100;
n = 1;
for x = 0:100
Y(n) = f(x);
n = n + 1;
end
plot(X,Y); grid on;
xlabel("time (t)");
ylabel("f(t)");
title("f(t) = v-u*log(m_0/(m_0-q*t))+g*t");


%% Stopping criterium
TOL = 10^(-6);
Nmax = floor ( log((b-a)/TOL) / log(2) ) + 1
pvalues=zeros(Nmax,1);

%% Main loop
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
