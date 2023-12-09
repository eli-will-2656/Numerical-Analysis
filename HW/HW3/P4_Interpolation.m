% Goal: Show interpolation polynomial of degree n is unique

x = [1 2 3 4].'
y = [2 1 6 47].'
px = arrayfun(@(z) p(z), x)
qx =  arrayfun(@(z) q(z), x)
check_interpolation = table(x, y, px, qx)

fprintf("The fact that we have found two different polynomials that interpolate these 4 data points does not violate\n" + ...
    "the uniqueness part of the theorem on the existence of polynomial interpolation,\n" + ...
    "because the condition says there is a unique interpolating polynomial of degree atmost n=3.\n" + ...
    " As we have not found two different polynomials of degree 3 or less \n" + ...
    "that interpolate the data, the uniqueness part of the theorem is not violated.")

function y = p(x)
y = 5*x^3 - 27*x^2 +45*x - 21;
end
function y = q(x)
y = x^4  - 5*x^3 + 8*x^2 - 5*x + 3;
end