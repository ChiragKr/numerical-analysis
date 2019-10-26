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


N = input('The no. sub-intervals N = ')
t0 = 0;
tn = 5;
y0(1) = 1;
y1(1) = 1;
y2(1) = 1;
h = (tn - t0)/N;

for j = 1:N+1
    t(j) = t0 + (j-1)*h;
end

for j = 1:N
    y0(j + 1) = y0(j) + h*func(t(j),y0(j)); %%% theta = 0
    y1(j + 1) = y1(j) + h*func(t(j + 1),y0(j + 1)); %%% theta = 1
    y2(j + 1) = y2(j) + (h/2)*(func(t(j),y2(j)) + func(t(j+1),y0(j+1))); %%% theta = 1/2
end

%%%%%%%%%%%%%%%%% Exact Soln %%%%%%%

for j = 1:N+1
    exact(j) = 1/(1 + t(j)^2);
end

[y0' y1', y2' exact']

plot(t,y0,'r',t,y1,'b',t,y2,'g',t,exact,'*')
