---
layout: post
title: derivatives of the logistic function
date: 2018-01-20
categories: 
- calculus
- derivative
- logistic function
- linear albegra
mathjax: true
comments: true
---

The logistic function $f(x)={1 \over 1+e^{-x}}$ is useful in a variety of applications particularly because it can be used to map an unbounded real value to, say, a probability in $[0,1]$. I used the function extensively in my own research to model the probability that an ion channel on an electrically excitable cell's membrane opens in responses to a voltage change. The logistic function can also be used as the so-called activation functions that compactify inputs to hidden layers of neural networks. 

The logistic function is smooth, i.e. has infinitely many continuous derivatives. Just for kicks, I asked whether I could come up with a formula for the $n^{th}$ derivative $f^{(n)}$. I was able to, and the key observations to my approach were

- $f^{(n)}$ can be written as a series with coefficients multiplying powers of $f$, and

- ${d\over dx}$ restricted to truncated series of this form can be written in a neat matrix form.

I don't know if this proof is novel, but it surprised me how much linear algebra it involved, so I will share. Here's the result:

The $n^{th}$ derivative of $f(x)={1 \over 1+e^{-x}}$ is 

$$f^{(n)}(x)=\sum_{k=0}^{n}\sum_{j=0}^k(-1)^j(j+1)^n{k \choose j}f^{k+1}(x)$$

which I think is less fun than the proof:

First, notice that $f'$ is the quadratic series $f-f^2$:

Since $f(x)=(1+e^{-x})^{-1}$, by the chain rule $f'(x)=(1+e^{-x})^{-2}e^{-x}$. With some algebra and noticing $1-f(x)={e^{-x} \over 1+e^{-x}}$, we have $f'(x)={1 \over 1+e^{-x}}{e^{-x} \over 1+e^{-x}} = f(x)[1-f(x)]$.

Next, by the chain rule $(f^k)'=kf^{k-1}f'=kf^k-kf^{k+1}$.

That is to say any term $c_kf^k$ in a series of the form $\sum_{k=1}^{\infty}c_kf^k$ gets mapped by ${d \over dx}$ to $c_kkf^k-c_kkf^{k+1}$. Since $f$ itself is obviously a series of this form ($c_1=1$, $c_k=0$ for $k>1$), hopefully you can imagine differentiating $f$ repeatedly and collecting the coefficients of powers of $f$ at each step. Linear algebra will help us do this systematically.

Let's represent truncated series of the form $\sum_{k=1}^{n}c_kf^k$ by vectors of their coefficients $c=\begin{pmatrix}c_1&\cdots &c_n\end{pmatrix}^T$. The derivative of this series is represented by $D_{n}c$ with the differentiation operator written as the matrix

$$D_{n}=\begin{pmatrix}1\\-1&2\\&-2&3\\&&\ddots&\ddots\\&&&-n&n+1\end{pmatrix}.$$

That the $k^{th}$ column of $D_{n}$ has $k$ on the diagonal and $-k$ on the subdiagonal ensures that the $k^{th}$ coordinate of $c$ contributes $kc_k$ and $-kc_k$ to the $k^{th}$ and $(k+1)^{st}$ coordinates of the product. This is what we should expect from the above remarks on $(c_kf^k)'$.

Here's the leap. $D_{n}$ has $n+1$ distinct eigenvectors

$$v_{n,j}=\begin{pmatrix}{0\choose j}&{1\choose j}&\cdots&{n\choose j}\end{pmatrix}^T$$

with corresponding eigenvalues $j+1$, for $j=0,\ldots,n$ with the convention ${i\choose j}=0$ if $i<j$. I'll defer the proof of this claim to after the current proof. Now, we realize the utility of eigendecompositions for powering.

The logistic function $f$ is represented by the alternating sum of the eigenvectors

$$\begin{pmatrix}1&0&\cdots&0\end{pmatrix}^T = \sum_{j=0}^n(-1)^jv_{n,j}.$$

Sum across the rows of Pascal's triangle with terms alternating in sign to see why:

\begin{array}{ccccc}
+v_{n,0} & -v_{n,1} & +v_{n,2} & -v_{n,3} & \cdots & (-1)^nv_{n,n} \\\\\\
1 & -0 & 0 & -0 & & 0 \\\\\\
1 & -1 & 0 & -0 & & 0 \\\\\\
1 & -2 & 1 & -0 & & 0 \\\\\\
1 & -3 & 3 & -1 & & 0 \\\\\\
\vdots & & & & \ddots & \vdots \\\\\\
{n\choose0} & -{n\choose1} & {n\choose2} & -{n\choose3} & \cdots & (-1)^n{n\choose n}
\end{array}

The work of repeatedly differentiating $f$ is done by multiplying by the $n^{th}$ power of $D_n$. The $n^{th}$ derivative of $f$ is represented by $D_n^n\begin{pmatrix}1&0&\cdots&0\end{pmatrix}^T$:

\begin{aligned}
D_n^n\sum_{j=0}^n(-1)^jv_{n,j} &= \sum_{j=0}^n(-1)^jD_n^nv_{n,j} \\\\\\
&= \sum_{j=0}^n(-1)^j(j+1)^nv_{n,j}.
\end{aligned}

The $k^{th}$ coordinate of this vector is $\sum_{j=0}^n(-1)^j(j+1)^n{k-1 \choose j}$.

Coming back from vector representations to series of the form $\sum_{k=1}^{\infty}c_kf^k(x)$, that last expression is a formula for the coefficient $c_k$ of $f^{(n)}$ as such a series. Then, the full series is $\sum_{k=1}^{\infty}\sum_{j=0}^{\infty}(-1)^j(j+1)^n{k-1 \choose j}f^k(x)$. 

The series gains only one new power of $f$ each time differentiation is applied ($D_n$ is nonzero on the subdiagonal but 0 below the subdiagonal) so we can truncate the $k$ index of the series corresponding to $f^{(n)}$ at $n+1$, and with the convention of the binomial coefficient ("choose") operator mentioned above, we can truncate the $j$ index of that series at $k-1$, so $$f^{(n)}(x) = \sum_{k=1}^{n+1}\sum_{j=0}^{k-1}(-1)^j(j+1)^n{k-1 \choose j}f^k(x).$$ Finally, we shift the $k$ index to start at $0$ to obtain the exact statement of the result above.

Here's a little Python script that produces a plot with reasonable results.

{% highlight Python %}
{% include logistic-derivs.py %}
{% endhighlight %}

![Derivatives of the logistic function]({{ "/assets/img/logistic-derivs.png" | absolute_url }})
