Taylor's Series
===============

In order to compute the normal form of an equation :math:`\dot{x}=f(x)`, the :class:`normal_forms.normal_form.normal_form` class first computes the Taylor series of :math:`f(x)` up to a specified degree :math:`k`. The class that implements the Taylor series of :math:`f(x)` at a specified center :math:`x_0` up to a specified degree :math:`k` is :class:`normal_forms.jet.jet`.

The reason why the class is called ``jet`` is that the :math:`k`-jet centered at :math:`x_0` of a function :math:`f(x)` is the Taylor's series truncated at degree :math:`k`:

.. math::

   J_k(x) = \sum_{0\leq |m|\leq k}\frac{f^{(m)}(x_0)}{m!}(x-x_0)^{m}.

Like when creating a ``normal_form`` object, :math:`f(x)`, :math:`x_0`, and :math:`k` should be supplied to create the ``jet`` object, and non-algebraic functions in :math:`f(x)` should be defined with the ``sympy`` variants of those functions. Once the ``jet`` is created, it can be evaluated at points in the domain:

.. ipython::

  In [0]: from normal_forms import jet
  
  In [0]: import sympy
  
  In [0]: f = lambda x: sympy.exp(x)
  
  In [0]: h = jet(f, x=0, k=10)

  In [0]: h(1)


The formula above makes sense for :math:`f:\mathbb{R}^n\rightarrow\mathbb{R}^p` with any natural number dimensions :math:`n` and :math:`p` when :math:`m` is a multiindex :math:`m=(m_1,\ldots,m_n)` with derivative, exponent, factorial, and absolute value defined as

.. math::

   f^{(m)} &= \frac{\partial^{m_1}}{\partial^{m_1} x_1}\cdots\frac{\partial^{m_n}}{\partial^{m_n} x_n}f \\
   x^{m} &= x^{m_1}\cdots x^{m_n} \\
   m! &= m_1!\cdots m_n! \\
   |m| &= |m_1|+\cdots+|m_n|.

To follow are a few examples for different choices of domain :math:`\mathbb{R}^n` and range :math:`\mathbb{R}^p` of :math:`f`.

A :math:`\mathbb{R}\rightarrow\mathbb{R}` example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The domain and range may have the same dimension, for example, :math:`f(x)=\sin(x)`:

.. plot:: normal_forms/examples/jet/R1_to_R1.py

A :math:`\mathbb{R}\rightarrow\mathbb{R}^2` example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The dimension of the range may be greater than the dimension of the domain, for example, :math:`f(t)=(\sin(t),\cos(t))` viewed here as a parametric plot in the :math:`xy`-plane:

.. plot:: normal_forms/examples/jet/R1_to_R2.py

A :math:`\mathbb{R}^2\rightarrow\mathbb{R}` example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The dimension of the range may be less than the dimension of the domain, for example, :math:`f(x,y)=\sin(x)\cos(y)`:

.. plot:: normal_forms/examples/jet/R2_to_R1.py
