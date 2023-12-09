%% HW2 - PROBLEM 2A
% Brute Force Approach
% (1) Draw 3 random numbers from uniform distribution (0, 1), and scale
format long

for m=1:100
    % (1.1) Create Lists
    unsorted_list = rand(3,1);
    scale = [10^(3); 1; 10^(-3)];
    unsorted_list = unsorted_list.*scale;
    sorted_list = sort(unsorted_list);
    
    % (1.2) Compute Sums
    unsorted_sum = 0;
    sorted_sum = 0;
    exact_sum = vpa(0);     % vpa gives 32 digits of (symbolic) precision, rather than 15
    for n=1:3
        exact_sum = exact_sum + unsorted_list(n, 1);
        unsorted_sum = unsorted_sum +  unsorted_list(n, 1);
        sorted_sum = sorted_sum +  sorted_list(n, 1);
    end

    % (1.3) Compute rounding error
    sorted_error = double(vpa(sorted_sum) - exact_sum);
    unsorted_error =  double(vpa(unsorted_sum) - exact_sum);
    
    if abs(sorted_error) < abs(unsorted_error)
        break
    end
end

fprintf("Unsorted List: [%.16f, %.16f, %.16f]\n", transpose(unsorted_list))
fprintf("Sorted List: [%.16f, %.16f, %.16f]\n", transpose(sorted_list))
fprintf("Exact Sum: %.32f\n\n", exact_sum)
fprintf("Sorted Sum: %.32f\n", sorted_sum)
fprintf("Sorted Error: %.32f\n\n", sorted_error)
fprintf("Unsorted Sum: %.32f\n", unsorted_sum)
fprintf("Unsorted Error: %.32f\n", unsorted_error)


