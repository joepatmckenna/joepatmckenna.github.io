import normal_forms as nf
from sympy.functions import sin
import numpy as np
import matplotlib.pyplot as plt


# define using Sympy symbolic functions
def f(x):
    return sin(x)


# create figure
fig, ax = plt.subplots(1, 1, figsize=(4, 3))

# create x-grid
x = np.linspace(-np.pi, np.pi)

# plot f(x)
ax.plot(x, [f(xi) for xi in x], 'k-', lw=3, label='$f$')

# plot k-jets for k=1,3,5,7,9
for k in range(1, 10, 2):
    J = nf.jet(f, 0, k)
    ax.plot(x, J(x), label='$J_{%i}$' % (k, ))

# configure and show
ax.set_ylim(-2, 2)
plt.legend()
plt.tight_layout()
plt.show()
