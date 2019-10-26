clear all;
close all;

%% Plotting graph of function
g = @(x) 9*exp(-x)*cos(2*pi*x) - 3;
X = 0:0.01:0.5; Y = -100:4:100; 
n = 1;
for x = 0:0.01:0.5
Y(n) = g(x);
n = n + 1;
end
plot(X,Y); grid on;
xlabel('Time (t)'); 
ylabel('Oscillating Current (I)');

fprintf("Considering the interval [0,0.5]\n"); SecantMethod(0,0.5);




%% Secant Method applied with different intervals.
%  x0,x1   initial approximations to location of root
function y = SecantMethod(x0,x1)
    f = inline('9*exp(-x)*cos(2*pi*x) - 3','x');
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