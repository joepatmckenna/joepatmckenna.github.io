import normal_forms as nf
from sympy.functions import sin, cos
import numpy as np
import matplotlib.pyplot as plt


# define using Sympy symbolic functions
def f(x):
    return sin(x), cos(x)


# create figure
fig, ax = plt.subplots(1, 1, figsize=(4, 3))

# create x- and y-grids
x = np.linspace(-np.pi, np.pi)

# plot f(x) as a parameterized fcn
y = np.array([f(xi) for xi in x])
ax.plot(y[:, 0], y[:, 1], 'k-', lw=3, label='$f$')

# plot k-jets as parameterized functions for k=1,3,5,7,9
for k in range(1, 10, 2):
    J = nf.jet(f, 0, k)
    y = np.array([J(xi) for xi in x])
    ax.plot(y[:, 0], y[:, 1], label='$J_{%i}$' % (k, ))

# configure and show
ax.set_xlim(-2, 2)
ax.set_ylim(-2, 2)
plt.legend()
plt.tight_layout()
plt.show()
