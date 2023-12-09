%% Part B
X = -1:10^-2:1;
SINX = sin(X)
P5  = arrayfun(@(z) p(z, 5), X);
P10 = arrayfun(@(z) p(z, 10), X);
P20 = arrayfun(@(z) p(z, 20), X);
plot(X, SINX)
hold on
plot(X, P5)
hold on
plot(X, P10)
hold on
plot(X, P20)
legend('sin(x)','P5', 'P10', 'P20')
title("Polynomial Interpolation of Runge(x) on interval [-1,1]")

%% Part A
% Input:
%      z = input value to the polynomial
%      n = number of points to interpolate function
% Output:
%      y = output value of interpolation polynomial

function y = p(z,n)
% (0) Create uniform mesh of n_1 point (-1,1)
x = -1:2/n:1;

% (1) Divided Difference Method:
a = zeros(1, n+1);
for i = 1:n+1
    a(i) = f(x(i));
end

for j = 1:n
    for i = n+1:-1:j+1
        a(i) = (a(i) - a(i-1)) / ((x(i) - x(i-j)));
    end
end

% (2) Evaluate polynomial using Horner's Algorithm
y = a(n+1);
    for i = n:-1:1
        y = y*(z-x(i)) + a(i);
    end
end

function y = f(x)
%y = sin(x);
y = 1 / (1+25*x^2)
end





