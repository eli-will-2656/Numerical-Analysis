% Goal: Find Cholesky factorization A = LL^T
% (0) Set up matrices
n = 4;

A = [4 3 2 1;
    3 3 2 1;
    2 2 2 1;
    1 1 1 1;]

L = zeros(4);

% (1) Calculate cholesky factorization
for k = 1:n

    %(1.1) Diagonal entry
    sum = A(k,k);
    for s = 1:k-1
        sum = sum - L(k,s)^2;
    end
    sum = sum^(1/2);
    L(k,k) = sum;


    % (1.2) Remaining column entries
    for i = k+1:n
        sum = A(i,k);
        for s = 1:k-1
            sum = sum - L(i,s)*L(k,s);
        end
        sum = sum / L(k,k);
        L(i,k) = sum;
    end   
end

L

L*L.'
