%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                Theta Method for the IVP                 %%%%%%
%%%%                   y'(t) = f(t,y)    t0<=t<=tn           *****%
%%%%                   y(t0) = y0.                           *****%
%%%%                theta = 0   (Forward Euler)              %%%%%%
%%%%                theta = 1   (Backward Euler)             %%%%%% 
%%%%                theta = 1/2 (Modified Euler)             %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc;
clear all;
close all;

N = input('The no. sub-intervals N = ');
t0 = 0;
tn = 4;
h = (tn - t0)/N;

t = t0:h:tn;
for j = 1:N+1
    t(j) = t0 + (j-1)*h;
end

%% Computing Solution using Different Euler Methods
y0 = t0:h:tn; y0(1) = 1;
y1 = t0:h:tn; y1(1) = 1;
y2 = t0:h:tn; y2(1) = 1;
for j = 1:N
    y0(j + 1) = y0(j) + h*func(t(j),y0(j)); %%% theta = 0
    y1(j + 1) = y1(j) + h*func(t(j + 1),y0(j + 1)); %%% theta = 1
    y2(j + 1) = y2(j) + (h/2)*(func(t(j),y2(j)) + ...
        func(t(j+1),y0(j+1))); %%% theta = 1/2
end

%% Exact Solution of the differential Equation
exact = t0:h:tn; y2(1) = 1;
for j = 1:N+1
    exact(j) = exp( 0.25 - (t(j) - 0.5)^2 );
end

%% Tabular form of the results
[t', y0', y1', y2' exact']

%% Graphical Visulization of results
hold on;
f = plot(t,y0,'r');
b = plot(t,y1,'b');
m = plot(t,y2,'g');
e = plot(t,exact,'*');
grid on;
hold off;
legend([f, b, m, e],'Forward Euler','Backward Euler',...
    'Modified Euler','Exact Solution');

%% differential equation RHS
function V = func(t,y)
    V = (1 - 2*t)*y;
end
