% Use the trapezoid rule to approximate the integral of f(x) over the inteval [a,b]

a = -1;
b = 1;
I = 2 / exp(1);         % Correct value of the integral
prev_error = 0;
for k = 0:10
    h = 2^(-k);                 % Length of each subinterval
    n = (b-a) / h;       % Number of subintervals

    %% Triangular Rule
    % (1) Add the average of f(x) at the endpts, with the f(x) at the
    % rest of points
    sum = 1/2 * (f(a) + f(b));
    
    for i = 1:n-1
        x_i = a + h*i;
        sum = sum + f(x_i);
    end
    % (2) multiply by step size
    sum = sum*h;
    if k == 0
        fprintf("n = %i;  h = %3.1d;  T(h) = %.15f; |I - T(h)|  = %3.1d;  \n", k, h, sum, abs(I - sum))  % |I - T(h)| /|I - T(h\2)|
    else
        romberg = 4/3 * sum - 1/3 * prev_sum;
        if k ~= 1
            fprintf("n = %i;  h = %3.1d;   T(h) = %.15f; |I - T(h)|  = %3.1d; |I - T(2h)|\\|I - T(h)| = %.1f; R(n,1) = %.15f; |I - R(k-1,0)|\\|I - R(k,0)| = %.1f\n", ...
                k, h, sum, abs(I - sum), abs(I - prev_sum)/abs(I - sum), romberg,  abs(I - prev_romberg)/abs(I - romberg)) 

        else
            fprintf("n = %i;  h = %3.1d;   T(h) = %.15f; |I - T(h)|  = %3.1d; |I - T(2h)|\\|I - T(h)| = %.1f; R(n,1) = %.15f\n", ...
                k, h, sum, abs(I - sum), abs(I - prev_sum)/abs(I - sum), romberg) 

        end
        prev_romberg = romberg;
    end
    % (3) Keep track of previous approximations
    prev_sum = sum;
    
    

end


function y = f(x)
y = x * exp(double(x));
end

