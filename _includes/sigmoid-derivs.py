import numpy as np
import matplotlib.pyplot as plt


def f(x):
    """sigmoid function"""
    return 1.0 / (1.0 + np.exp(-x))


def df(n, x):
    """nth derivative of sigmoid function"""
    # compute coeffs
    c = np.zeros(n + 1, dtype=int)
    c[0] = 1
    for i in range(1, n + 1):
        for j in range(i, -1, -1):
            c[j] = -j * c[j - 1] + (j + 1) * c[j]
    # compute derivative as series
    res = 0.0
    for i in range(n, -1, -1):
        res = f(x) * (c[i] + res)
    return res


x = np.linspace(-5, 5, 1000)[:, np.newaxis].repeat(16, axis=1).T
y = np.array([df(n, x[n]) for n in range(16)])

fig, ax = plt.subplots(4, 4, figsize=(8, 6))
for xi, yi, i in zip(x, y, range(16)):
    ax[i / 4, i % 4].plot(xi, yi, 'k-', label="n = %i" % (i))
    ax[i / 4, i % 4].legend()
plt.savefig('../assets/img/sigmoid-derivs.png')
