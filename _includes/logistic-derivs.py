import numpy as np
import matplotlib.pyplot as plt


# logistic function
def f(x):
    return 1.0 / (1.0 + np.exp(-x))


# derivative of logistic function
def df(n, x):
    # compute coeffs
    c = np.zeros((n + 1, n + 1), dtype=int)
    c[0, 0] = 1
    for i in np.arange(1, n + 1):
        for j in np.arange(n, -1, -1):
            c[i, j] = ((j + 1) * c[i - 1, j] - j * c[i - 1, j - 1])
    # compute derivative as series
    for i in np.arange(n + 1):
        res = c[i, n] * f(x)
        for j in np.arange(n - 1, -1, -1):
            res = res + c[i, j]
            res = res * f(x)
    return res


x = np.linspace(-5, 5, 100)[:, np.newaxis].repeat(16, axis=1).T
y = np.array([df(n, x[n]) for n in range(16)])

fig, ax = plt.subplots(4, 4, figsize=(8, 6))
for xi, yi, i in zip(x, y, range(16)):
    ax[i / 4, i % 4].plot(xi, yi, 'k-', label="n = %i" % (i))
    ax[i / 4, i % 4].legend()
plt.savefig('../assets/img/logistic-derivs.png')
