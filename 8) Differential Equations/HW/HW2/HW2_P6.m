% Problem 6: Compute Machine Epsilon
x = 1;
while (1 + x) > 1
    x = x/2;
end
y = 2*x;
fprintf("%.17f", y)