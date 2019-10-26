%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% False Position Method                               %%%
% FALSE_POS uses method of false position (regula falsi)%%
% to locate the root of a nonlinear function            %%       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=@(x) x^3+2*x^2-3*x-1;
a=1;
b=2;
TOL=10^(-6);
format long;
old = b;
fa = feval(f,a);
fb = feval(f,b);
Nmax=100;

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
	pvalues=[pvalues;old];
    
end
fprintf('The approximate root is %.10f',new)
if flag == 0 
    disp('Maximum number of iterations exceeded')
end


