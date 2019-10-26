%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                   Secant Method                               %%%  
%%%   approximate the root of an arbitrary function using the     %%%
%%%                    Secant Method                              %%%
%%%                                                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

f = inline('-1.1 + 0.99403 + (1.671*10^-4)*x + (9.7215*10^-8)*x^2 - (9.5838*10^-11)*x^3 + (1.9520*10^-14)*x^4','x');
x0=4;
x1=6; %  x0,x1   initial approximations to location of root
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
