%% Goal: Use a computer to calculate derivate of a function

% (0) Set up variables 
%x = 0;
%true_derivative = 1;
x = 0.5;
true_derivative = cos(0.5);
fx = f(x);

% (1) Estimate the Derivative 
H = 1:54;
H = 4.^(-H);
% fileID = fopen('Forward_Diff.txt','w');
fileID = fopen('Central_Diff.txt','w');
for h= H
    if h == 0
        break
    end
    % Forward Difference
    % d = (f(x+h) - fx) / h;

    % Central Difference
    d = (f(x+h) - f(x-h)) / (2*h);
    fprintf(fileID, "x = %.1d | f'(x) = %17.15f | N = %18.16f | error = %3.1e\n", x, d, f(x+h)-fx, abs(true_derivative - d));
end


% (2) Define function
function y = f(x)
e = exp(1);     % MATLAB does not have a symbol referring to e, but a function that computes e^x
%y = e^x;
y = sin(x);
end