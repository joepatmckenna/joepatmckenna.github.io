---
layout: post
title:  getting started with scientific computing in modern fortran
date:   2017-04-18 14:35:06 -0400
categories: fortran scientific computing
---


<pre class="pseudocode">
\begin{algorithm}
\caption{conjugate gradient}
\begin{algorithmic}
\PROCEDURE{conjugate_gradient}{$A,b,c_0,\varepsilon$}
\STATE $k = 0$
\STATE $p_0 = r_0 = b - Ac_0$
\WHILE {$\|r_k\|>\varepsilon$}
\STATE $\alpha_k = r_k^Tr_k/p_k^TAp_k$
\STATE $c_{k+1} = c_k + \alpha_kp_k$
\STATE $r_{k+1} = r_k - \alpha_kAp_k$
\STATE $\beta_k = r_{k+1}^Tr_{k+1}/r_k^Tr_k$
\STATE $p_{k+1} = r_{k+1} + \beta_kp_k$
\STATE $k = k+1$
\ENDWHILE
\RETURN $c_k$
\ENDPROCEDURE
\end{algorithmic}
\end{algorithm}
</pre>
