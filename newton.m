%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                   Newton's Method                             %%%  
%%%   approximate the root of an arbitrary function using the     %%%
%%%                    Newton's Method                            %%%
%%%                                                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

close all;

f=@(x) x^3+2*x^2-3*x-1;
fprime =@(x) 3*x^2+4*x-3;

x0 = 1.0 ; %  initial approximation to location of root
TOL = 10^(-5); % absolute error convergence tolerance
Nmax =100; % maximum number of iterations to be performed

flag=0;
for i = 1 : Nmax
    fold=f(x0);
    fprimeold=fprime(x0);
	dx = fold / fprimeold;
    x0 = x0 - dx;
	fprintf ( '\t\t %3d \t %.10f \n', i, x0 );
	
	if ( abs(dx) < TOL ) 
	   flag=1;
	   break
	end
end

%%
if flag == 0
    disp('Maximum number of iterations exceeded.')
end

%%
fprintf('\n The approximate fixed point is %f', x0)