"""In this module we implement naive numerical differention."""
from math import pi, sin, cos


def main():
    x_0 = pi / 3
    f = sin

    for h in [1e-5, 1e-12]:
        y_approx = (f(x_0 + h) - f(x_0)) / h
        y_exact = cos(x_0)
        rel_error = abs((y_exact - y_approx) / y_exact)
        print(f"h:{h}\ny_approx = {y_approx}\ny_exact = {y_exact}\nrel_error={rel_error}\n")
    
    print("The fact that the relative error between the actual derivative of the function and the approximated derivative of the function after we increased the step size goes against my intuition that as the step sizes get closer, so will the approximation")


if __name__ == '__main__':
    main()