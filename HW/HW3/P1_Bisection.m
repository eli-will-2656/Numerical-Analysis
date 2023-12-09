% Goal: Approximate the point x where two curves intersect
% (0) Inputs to bisection Method
a = 0;
b = 1;
nmax = 52;
eps = 10^(-4);
fa = f(a);
fb = f(b);
if sign(fa) == sign(fb)
    fprintf("function has the same signs at a and b")
end

% (1) Performing bisection method
error = b-a;
for n=0:nmax
    error = error / 2;
    c = a + error;   % Midpoint
    fc = f(c);
    fprintf("n = %i | c = %10.9f | f(c) = %10.9f | error = %2.1d\n", n, c, fc, error);

    % If the error from the midpoint < 1/2 size of our desired interval
    if abs(error) < eps/2
        fprintf("Convergence!")
        break
    end
    
    fc = f(c);
    if f(c) == 0         % If we find the root
        break
    elseif sign(fa) == sign(fc)     % If left end point has same sign as midpoint, replace it
        a = c;
        fa = fc;
    else                % Otherwise, they have opposite signs so replace right end point
        b = c;
        fb = c;
    end
end

% (Optional) Define a local function for the curve f(x)
function y = f(x)
y = P1_func(x);
end