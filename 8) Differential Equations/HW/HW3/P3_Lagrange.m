% Goal: Find and graph the Lagrange cardinal polynomials for nodes x =
% -1,1,3,4

% (0) Define Interval
x = -1:1/50:4;
grid on

% (1) Plot functions
y = arrayfun(@(z) L_0(z), x);
plot(x,y)
hold on 

y = arrayfun(@(z) L_1(z), x);
plot(x,y)
hold on

y = arrayfun(@(z) L_2(z), x);
plot(x,y)
hold on

y = arrayfun(@(z) L_3(z), x);
plot(x,y)
hold on
% Define functions for each lagrange polynomial
function y = L_0(x)
y = (x-1)*(x-3)*(x-4)/(-40);
end

function y = L_1(x)
y = (x+1)*(x-3)*(x-4)/(12);
end

function y = L_2(x)
y = (x+1)*(x-1)*(x-4)/(-8);
end

function y = L_3(x)
y = (x+1)*(x-1)*(x-3)/(15);
end