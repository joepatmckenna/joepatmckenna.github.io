import normal_forms as nf
from sympy.functions import sin, cos
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d


# define using sympy symbolic functions
def f(x, y):
    return sin(x) * cos(y)


# create figure
fig = plt.figure(figsize=(4, 3))
ax = fig.add_subplot(111, projection='3d')

# create x- and y-grids
x = np.linspace(-np.pi, np.pi)
y = np.linspace(-np.pi, np.pi)
X, Y = np.meshgrid(x, y)

# plot f(x,y)
Z = [[f(xi, yi) for yi in Y[:, 0]] for xi in X[0]]
ax.plot_wireframe(X, Y, Z, color='k', rstride=5, cstride=5, label='$f$')

# plot 10-jet
J = nf.jet(f, (0, 0), 10)
Z = [[J(xi, yi) for yi in Y[:, 0]] for xi in X[0]]
ax.plot_wireframe(X, Y, Z, rstride=5, cstride=5, label='$J_{10}$')

# configure and show
ax.set_zlim(-2, 2)
plt.legend()
plt.tight_layout()
plt.show()
