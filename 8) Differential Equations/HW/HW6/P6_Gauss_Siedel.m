% Goal: Implement Gauss-Siedel Algorithm to solve linear system Ax = b

% (0) Parameters 
for c = [2]
    for n = [5]
        eps = 10^(-6);      % Stopping criterion
        converge = 0;       % Boolean to test for converges
        
        % (1) Set up A and b
        A = eye(n);
        A(2,1) = c;
        A(n-1, n) = c;
        
        b = ones(n,1);
        for i=1:n
            if i == 1 || i == n
                b(i) = b(i) + c;
            else
                b(i) = b(i) + 2*c;
                A(i-1, i) = c;
                A(i+1, i) = c;
            end
        end

        % (1.5) Construct iteration matrix 
        L_plus_D = zeros(n);
        U = zeros(n);

        for  j = 1:n
            L_plus_D(j,j) = A(j,j);     % Get diagonal entries
            if j ~= n
                U(j, j+1) = A(j,j+1);
                L_plus_D(j+1,j) = A(j+1, j);
            end
        end

        B = -inv(L_plus_D)*U
        max_eigenvalue = max(abs(eig(B)))




        
        % (2) Implement Gauss-Siedel Algorithm 
        kmax = 1000;
        xprev = zeros(n,1);
        x = zeros(n,1);
        x_solution = ones(n,1);
        
        for k = 1:kmax          % For each iteration
            for i = 1:n         % For each row
                sum = b(i);     % Solve for the ith variable
                for j = 1:n
                    if j ~= i
                        sum = sum - A(i,j)*x(i);
                    end
                end
                sum = sum / A(i,i);
                x(i) = sum;
            end
        
            % Stopping criterion
            if norm (x - xprev) < eps
                fprintf("Solution (iteration #%i, n = %i):\n",k,n)
                x;
                fprintf("Error: %.2d\n", norm(x - x_solution))
                converge = 1;
                break
            else
                xprev = x;
            end
        end
        
        if ~converge
            fprintf("Gauss Siedel did not converge for c = %.2d\n", c)
        else
            fprintf("Gauss Siedel converged for c = %1d\n", c)
        end
    end

end







