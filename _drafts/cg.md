---
layout: post
title:  conjugate gradient with a c++ matrix class
date:   2017-04-18 14:35:06 -0400
categories: c++ matrix optimization
custom_css:
- //cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css
- /css-js/pseudocode/pseudocode.min.css
custom_js:
- //cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js
- /css-js/pseudocode/pseudocode.min.js
---

C++ is fast for scientific computing but has a cumbersome syntax. To make matrix computations easier to code, I wrote a templated matrix class in this [matrix.hpp](https://www.github.com./joepatmckenna/matrix.hpp) repo. The class allows the programmer to define a matrix with `matrix<double> A(3,3);` and multiply two matrices with `A*B`, for example. To demonstrate the usefulness of the class, let's solve the following linear regression problem:

Find the line $$f(x)=c_0+c_1x_1+\cdots+c_nx_n$$ that best fits the $$m$$ independent vectors $$x^{(i)}\in\mathbb{R}^n$$ and corresponding dependent values $$y\in\mathbb{R}^m$$, $$m\gg n$$; that is, find $$c_0,c_1,\ldots,c_n\in\mathbb{R}$$ that minimize the error $$E=\sum_{i=1}^m [y_i-f(x^{(i)})]^2$$.

Let's first frame the problem in linear algebra. Write the vectors $$x^{(i)}$$ as the rows of a matrix $$X$$ with a prepended column of $$1$$s and arrange the coefficients $$c_i$$ in a vector $$c$$:
\begin{align}
X = \begin{bmatrix}
1 & x^{(1)}_1 & \cdots & x^{(1)}_n \\\
1 & x^{(2)}_1 & \cdots & x^{(2)}_n \\\
\vdots & \vdots &  & \vdots \\\
1 & x^{(m)}_1 & \cdots & x^{(m)}_n
\end{bmatrix} \text{ and }
c = \begin{bmatrix}
c_0 \\\ c_1 \\\ \vdots \\\ c_n
\end{bmatrix}.
\end{align}

Check for yourself that $$E=\|y-Xc\|_2^2$$. To find the minimizer $$c$$, we will use [conjugate gradient](https://en.wikipedia.org/wiki/Conjugate_gradient_method), an iterative method for solving $$Ac=b$$ for $$c$$ when $$A$$ is symmetric and positive definite. The method works by descending the quadratic energy function $$\frac12x^TAx-x^Tb$$ to its unique minimum in a sequence of directions $$p_k$$ conjugate with respect to $$A$$, i.e. $$p_k^TAp_{k+1}=0$$. The method is summarized by the following algorithm:

<pre class="pseudocode">
% This quicksort algorithm is extracted from Chapter 7, Introduction to Algorithms (3rd edition)
\begin{algorithm}
\caption{conjugate gradient}
\begin{algorithmic}
\PROCEDURE{ciig}{$A, p, r$}
  \IF{$p &lt; r$}
    \STATE $q = $ \CALL{Partition}{$A, p, r$}
    \STATE \CALL{Quicksort}{$A, p, q - 1$}
    \STATE \CALL{Quicksort}{$A, q + 1, r$}
  \ENDIF
\ENDPROCEDURE
\PROCEDURE{Partition}{$A, p, r$}
  \STATE $x = A[r]$
  \STATE $i = p - 1$
  \FOR{$j = p$ \TO $r - 1$}
    \IF{$A[j] &lt; x$}
      \STATE $i = i + 1$
      \STATE exchange
      $A[i]$ with     $A[j]$
    \ENDIF
    \STATE exchange $A[i]$ with $A[r]$
  \ENDFOR
\ENDPROCEDURE
\end{algorithmic}
\end{algorithm}
</pre>


To see how this method is applicable to the linear regression problem, notice:

1. The image of $$X$$ at the minimizer $$c$$ is perpendicular to the residual $$y-Xc$$, so $$X^T(y-Xc)=0$$, and therefore the solution $$c$$ to $$X^TXc=X^Ty$$ minimizes $$E$$.
2. $$X^TX$$ is symmetric since it equals its transpose.
3. If $$X$$ has full rank i.e. if at least $$n+1$$ of the $$x^{(i)}$$ are independent, then $$Xc\neq0$$ for all $$c\neq0$$ and $$c^TX^TXc=\|Xc\|_2^2>0$$ for all $$c\neq0$$. That is, $$X^TX$$ is positive definite.

Then, let $$A=X^TX$$ and $$b=X^Ty$$. We will use the conjugate gradient method to solve $$Ac=b$$ for $$c$$. A conjugate gradient function using the `matrix` class in the [matrix.hpp](https://www.github.com./joepatmckenna/matrix.hpp) repo amounts to:

{% gist joepatmckenna/339320c7e050d4bbc300ad076403598d %}
    
