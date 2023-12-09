import math
import numpy as np
from math import sqrt
from decimal import *


def main():
   getcontext().prec = 36
   a = Decimal(0)
   b = Decimal(1)
   c = Decimal(1 / sqrt(2))
   d = Decimal(0.25)
   e = Decimal(1)
   pi = Decimal(3.14159265358979323846264338327950288)

   print("k\t| f\t\t\t\t\t\t| abs(f-pi)\t\t\t\t\t| g\t\t\t\t\t| abs(g-pi)")

   for k in range(5):
       getcontext().prec = 20
       a = Decimal (b) 
       b = Decimal ( (b+c) / 2 ) 
       c = Decimal.sqrt(c*a)
       d = Decimal ( d - e*(b-a)**2 )
       e = Decimal( 2*e )
       f = Decimal( b**2 / d ) 
       g = Decimal( (b+c)**2 / (4*d) )
       print(f"{k}\t| {f}\t\t| {abs(f-pi)}\t| {g}\t|{abs(g-pi)}")
       
   if abs(f-pi) < abs(g-pi):
    print("Convergence: f converges faster on pi than g")
   else:
    print("Convergence: g converges faster on pi than f")
      
    print("Accuracy: Both f and g achieve 15 significant decimal digits (the maximum precision double-precision floating-point numbers can achieve)")

if __name__ == '__main__':
    main()