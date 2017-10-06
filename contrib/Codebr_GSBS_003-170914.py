# -x*- coding: cp1252 -*-
#  Codebr_GSBS_001-170910.py 
#  
# Version: 0.003
# Date   : 14.09.2017
# testet ok
#*****************************************************************
# 1 - do Giant Step Baby Step attack on Diffie Hellman algorithm
#
#*****************************************************************
__author__ = "Rolf Häcker"
__copyright__ = "Copyright 2016, 2017"
## __credits__ = " XXX "
## __license__ = "GPL"
__version__ = "0.003"
__maintainer__= "Rolf Häcker"
__email__ = "rolf.haecker@web.de"
__status__ = "Development with documentation provided by Rolf Häcker" 

## import os
from math import sqrt
from random import randint

#->-----------------------------------------------------------------------------
## The Quest as from Friday, August, 18th, 2017
## A) try with brute force:
## n = 2^24 - 3 = 16777213
## g = 5
## g^x = 100 (mod n)
## find x
##
## B) try with baby-step-giant-step method:
## n = 2^40 - 87 = 1099511627689
## g = 13
## g^x = 150 (mod n)
## find x
##
## Quest A)
##n = 16777213        # n = 2^24 - 3
##g = 5
## g^x = 100 (mod n)
##y = 100
## y = 10507961
## Quest B)
n = 1099511627689
g = 13
y = 150
#->-----------------------------------------------------------------------------

##====================================================================================<<<<
def main():
    """ Do Giant Step Baby Step attack decoding Diffie-Hellman """

##
##  Define size of Giant-Step-Table
##  Create Giant-Step-Table
##  dx ~ (n-1)/size
##  dy = g^dx
##  the Giant-Step-Table looks like:
##  (g^0, 0)
##  (g^0*dy,       dx)   = (g^dx, dx)
##  (g^dx*dy,    2*dx)   = (g^(2xdx), 2*dx)
##  (g^2*dx)*dy, 3*dx)   = (g^(3*dx), 3*dx)
##
    size = 100000
    i = 1
    dx = int((n-1)/size)
    print("build Giant-Step-Table")
    print("dx = ", dx)
    
    x = dx
    dy =  modexp (g, x, n) ##  dy = g^dx
    yg = dy
    gstable={yg:x}
    for i in range (1, size):
##        print ("i = ", i)
        gstable [yg] = x
        x += dx
        yg = (yg * dy)%n
    print ("gstable calculated")
##    print (gstable)   

## start with g^x search in Baby-Steps and try
## g^x      found --> x
## g^(x+1)  found --> x-1     ## g^x   *g
## g^(x+2)  found --> x-2     ## g(x+1)*g

    yb = y
    for bs in range(dx):
##        print("bs = ", bs, "yb = ", yb)
        if yb in gstable:
            x = (gstable[yb]-bs)%n
            print("found: ",yb, " bs = ", bs, "gstable[yb] = ", gstable[yb], " --> ", (gstable[yb]-bs)%n)
            break
        yb = (yb*g)%n

    print ("y = ", y)
    print ("x = ", x)
    print ("base                    g = ", g)
    print ("module                  n = ", n)
##====================================================================================<<<<


##------------------------------------------------------------------------------------>>>>
def pow(b, p):
    """ calculate b to the power of p """
    ## p positive integer
    if p==1:
        result = b
    else:
        result = b*pow(b, p-1)              
    return result
##====================================================================================<<<<
##------------------------------------------------------------------------------------>>>>
def modexp(g, u, p):
   """ computes s = (g ^ u) mod p
       args are base g, exponent u, modulus p
       (see Bruce Schneier's book, _Applied Cryptography_ p. 244) """
       
## I've been given the following algorithm that computes s where s = g^u mod p in Python:
## http://stackoverflow.com/questions/5486204/fast-modulo-calculations-in-python-and-ruby
   s = 1
   while u != 0:
      if u & 1:
         s = (s * g)%p
      u >>= 1
      g = (g * g)%p;
   return s
##====================================================================================<<<<

##--------------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
if __name__ == "__main__":
    main() 
##====================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# build Giant-Step-Table
# dx =  10995116
# gstable calculated
# found:  771622173421  bs =  4445214 gstable[yb] =  1030154408272  -->  1030149963058

# build Giant-Step-Table
# dx =  10995116
# gstable calculated
# found:  771622173421  bs =  4445214 gstable[yb] =  1030154408272  -->  1030149963058
# y =  150
# x =  1030149963058
# base                    g =  13
# module                  n =  1099511627689
