from normal_forms import normal_form
import sympy
import numpy as np
from for_plotting import before_and_after


# Guckenheimer, Excercise 3.4.5
def f(x, y, mu=0):
    f1 = y
    f2 = -mu * y - x + x * x * x
    return f1, f2


h = normal_form(f, (0, 0), 3)
before_and_after(f, h, -2, 2, -2, 2)
