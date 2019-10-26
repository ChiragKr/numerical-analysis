clear all;
close all;

%% Plotting graph of function
g = @(x) -1.1+0.99403+(1.671*10^-4)*x+(9.7215*10^-8)*x^2-(9.5838*10^-11)*x^3+(1.9520*10^-14)*x^4;
X = -1500:1000; Y = -1500:1000; n = 1;
for x = -1500:1000
Y(n) = g(x);
n = n + 1;
end
plot(X,Y); grid on;
xlabel('Temperature (T)'); 
ylabel('Zero pressure Specific Heat (c_p)');

fprintf("Considering the interval [-1500, -1000]\n"); SecantMethod(-1500,-1000);
fprintf("Considering the interval [400, 600]\n"); SecantMethod(400,600);

%% Secant Method applied with different intervals.
%  x0,x1   initial approximations to location of root
function y = SecantMethod(x0,x1)
    f = inline('-1.1 + 0.99403 + (1.671*10^-4)*x + (9.7215*10^-8)*x^2 - (9.5838*10^-11)*x^3 + (1.9520*10^-14)*x^4','x');
    TOL=10^(-10); %  absolute error convergence tolerance
    Nmax=100;%   maximum number of iterations to be performed
    flag=0;
    older = x0;   old = x1;
    folder = feval(f,older);
    for i = 2 : Nmax
        fold = feval(f,old);
        dx = fold * ( old - older ) / ( fold - folder );
        new = old - dx;
        fprintf('\t\t %3d \t %.15f \n', i, new )
        if ( abs(dx) < TOL ) 
            flag=1;
            break
        else
            older = old;
            old = new;
            folder = fold;
        end
    end
    if flag == 0 
        disp('Maximum number of iterations exceeded') 
    end
end