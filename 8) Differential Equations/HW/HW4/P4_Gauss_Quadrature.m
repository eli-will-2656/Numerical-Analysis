% Goal: Test accuracy of Gaussian Curvature Formulas

I = 2 / exp(1);         % Correct value of the integral
fprintf("Integral: %.15f\n", I)

approx_1 = f(1/sqrt(3)) + f(-1/sqrt(3));
fprintf("\nGuassian quadrature approximation (n = 1): %.15f\n", approx_1)
fprintf("Accuracy: %.2d\n\n", abs(I - approx_1))

approx_2 = (5/9)*f(-sqrt(3)/sqrt(5)) + (5/9)*f(sqrt(3)/sqrt(5)) + (8/9)*f(0);
fprintf("Guassian quadrature approximation (n = 2): %.15f\n", approx_2)
fprintf("Accuracy: %.2d\n\n", abs(I - approx_2))






function y = f(x)
y = x * exp(double(x));
end