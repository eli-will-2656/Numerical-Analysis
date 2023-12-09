% Problem 7: Subtractive Cancelation

x = 1;
f0 = 1/6;

fprintf("x\t\t\t f_old \t\t  abs_err \t\t f_new \t\t abs_err\n")
for i = 1:16
    x_values(1,i) = x;
    orig_f_values(1,i) = fx_orig(x);
    abs_error_org(1,i) = abs(fx_orig(x) - f0);
    new_f_values(1,i) = fx_new(x);
    abs_error_new(1,i) = abs(fx_new(x) - f0);
    x = x / 10;
end

for i = 1:16
    fprintf("%.9f %.9f %.9f %.9f %.9f\n",x_values(1,i), orig_f_values(1,i),abs_error_org(1,i), new_f_values(1,i), abs_error_new(1,i))

end
