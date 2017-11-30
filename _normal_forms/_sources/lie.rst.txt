Lie operators for vector fields
===============================

In order to compute the normal form of an equation :math:`\dot{x}=f(x)`, the :class:`normal_forms.normal_form.normal_form` class solves a sequence of equations :math:`L_1g_j=f_j-h_j` and applies a sequence of transformations :math:`e^{L_j}` to the :math:`k`-jet of :math:`f`, where :math:`L_1(\cdot)=[\cdot,f_1(x)]` and :math:`L_j(\cdot)=[\cdot,g_j(x)]` are the Lie brackets with particular homogenous polynomial vector fields :math:`f_1(x)=f'(x_0)x` or :math:`g_j(x)`. This package uses the Lie bracket for vector fields definition :math:`[f(x),g(x)]=f'(x)g(x)-g'(x)f(x)`. The class that implements the Lie bracket with a particular polynomial vector field is :class:`normal_forms.lie_operator.lie_operator`.

Let :math:`\mathcal{V}^n_i` denote the space of :math:`n`-dim, degree :math:`i` polynomial vector fields, and let :math:`s(i)` denote the simplicial number :math:`{n+i-1 \choose i}`. For any degree :math:`i`, the vector field :math:`f_i\in\mathcal{V}_i^n` may be represented as a :math:`ns(i)`-dim column vector, the operator :math:`L_j:\mathcal{V}_i^n\rightarrow\mathcal{V}_{i+j-1}^n` defined by :math:`L_j=[\cdot,g_j(x)]` may be represented as a :math:`ns(i+j-1)\times ns(i)` matrix, and :math:`L_j(f_i)` may be represented as the matrix-vector product.

These representations depend on the choice of basis for :math:`\mathcal{V}^n`. This package implements a basis for :math:`\mathcal{V}_i^n` ordered first by coordinate then by multiindex. For example, the basis for :math:`\mathcal{V}^2_3` is

.. math::

   \left\{\begin{bmatrix}x_1^3\\0\end{bmatrix}, \begin{bmatrix}x_1^2x_2\\0\end{bmatrix} \begin{bmatrix}x_1x_2^2\\0\end{bmatrix} \begin{bmatrix}x_2^3\\0\end{bmatrix} \begin{bmatrix}0\\x_1^3\end{bmatrix} \begin{bmatrix}0\\x_1^2x_2\end{bmatrix} \begin{bmatrix}0\\x_1x_2^2\end{bmatrix} \begin{bmatrix}0\\x_2^3\end{bmatrix}\right\}.

The underlying list of multiindices, :math:`(3,0), (2,1), (1,2), (0,3)` in the example, assumes a descending order according to a *dictionary* ordering, i.e.for two multiindices :math:`m=(m_1,\ldots,m_n)` and :math:`p=(p_1,\ldots,p_n)`, :math:`m>p` if :math:`m_i=p_i` and :math:`m_j>p_j`, for all :math:`i` and a particular :math:`j` such that :math:`0\leq i<j\leq n`.

For example, a vector field

.. math::

   \begin{bmatrix}c_{11}&c_{12}&c_{13}&c_{14}\\c_{21}&c_{22}&c_{23}&c_{24}\end{bmatrix}\begin{bmatrix}x_1^3\\x_1^2x_2\\x_1x_2^2\\x_2^3\end{bmatrix}

in :math:`\mathcal{V}_3^2` is represented as the column vector :math:`\begin{bmatrix}c_{11}&c_{12}&c_{13}&c_{14}&c_{21}&c_{22}&c_{23}&c_{24}\end{bmatrix}^T`.

And, the columns of the matrix representation of :math:`L_j:\mathcal{V}_i^n\rightarrow\mathcal{V}_{i+j-1}^n` are the column vector representations of :math:`L_j` applied to the basis of :math:`\mathcal{V}_i^n`. For example, let :math:`g_2(x_1,x_2)=\begin{bmatrix}x_1^2\\x_2^2\end{bmatrix}` and consider :math:`L_2:\mathcal{V}_3^2\rightarrow\mathcal{V}_4^2` defined by :math:`L_2(\cdot)=[\cdot,g_2(x)]`. Since

.. math::

   L_2(e_1) = e_1'(x)g_2(x)-g_2'(x)e_1(x) = \begin{bmatrix}3x_1^2&0\\0&0\end{bmatrix}\begin{bmatrix}x_1^2\\x_2^2\end{bmatrix}-\begin{bmatrix}2x_1&0\\0&2x_2\end{bmatrix}\begin{bmatrix}x_1^3\\0\end{bmatrix}=\begin{bmatrix}x_1^4\\0\end{bmatrix}

the first column of the matrix representation of :math:`L_2:\mathcal{V}_3^2\rightarrow\mathcal{V}_4^2` is :math:`\begin{bmatrix}1&0&0&0&0 & 0&0&0&0&0\end{bmatrix}^T`.

Finally, :math:`L_j(f_i)` is represented as a column vector computed by the appropriate matrix representation of :math:`L_j` times the column vector representation of :math:`f_i`.

The :class:`normal_forms.lie_operator.lie_operator` class is accessible from the top-level of this package. To create a ``lie_operator`` object, a vector field ``g`` as a ``sympy.Matrix`` and a list of ``sympy.symbols`` representing the variables :math:`x_1,\ldots,x_n` should be supplied. Once the ``lie_operator`` object is constructed, the matrix representation of its action on :math:`\mathcal{V}_j^n` can be accessed as index ``j`` of the object.

.. ipython::

   In [0]: from normal_forms import lie_operator

   In [0]: import sympy

   In [0]: x = sympy.symbols('x_1 x_2')
   
   In [0]: g2 = sympy.Matrix([[x[0]**2],[x[1]**2]])

   In [0]: L2 = lie_operator(g2, x)

   In [0]: L2[3]


The ``lie_operator`` object can be evaluated by passing it a vector field in the form of a ``sympy.Matrix`` as an argument:

.. ipython::

   In [0]: f3 = sympy.Matrix([[x[0]**3],[0]])

   In [0]: L2(f3)
