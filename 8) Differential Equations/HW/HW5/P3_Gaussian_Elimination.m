% Implement Naive Gaussian Elimination and use it to solve a system of
% equations for a known solution.

% (1) Setting up the problem 

for n = [10, 20, 100]
    for i = 1:n
        for j = 1:n
           % A(i,j) = -1 + 2*min([i j]);
            A(i,j) = 1/ (i+j-1);
        end
    end
    x_exact = ones(n, 1);
    b = A*x_exact;
    
    
    % (2) Naive Gaussian Elimination 
    
    % (2.1) Forward elimination
    for k = 1:(n-1)
        for i = k+1:n
            xmult = A(i,k) / A(k,k);
            %A(i,k) = xmult;
    
            for j = k:n
                A(i,j) = A(i,j) - xmult*A(k,j);
            end
            b(i) = b(i) - xmult*b(k);
        end
    end
    x(n,1) = b(n) / A(n,n);
    
    % (2.2) Back substitution
    for i = n-1:-1:1
        sum = b(i);
        for j = i + 1:n
            sum = sum - A(i,j)*x(j);
        end
        x(i) = sum / A(i,i);
    end
    
    
    % (2.3) Evaluating error
    error = x_exact - x;
    error_inf = max(abs(error));
    fprintf("For n = %d, we have an error = %.15f\n", n, error_inf)
end

