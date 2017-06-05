---
layout: post
title:  expanding a polynomial from factored form
date:   2017-04-18 14:35:06 -0400
categories: fortran
---

Here's some code for computing the coefficients $$c_i$$ of the polynomial $$\sum_{i=0}^n c_ix^i  = \prod_{i=1}^n a(x-r_i)$$ given the factor $$a$$ and roots $$r_i$$. The coefficients are related to the roots by $$c_i = \sum_{\overset{S\subset N}{\#S=n-i}} (-1)^{n-i}\prod_{i\in S} r_i$$ where $$N=\{1,\ldots,n\}$$.

This is a fortran version:
```fortran
{% include poly/expand_polynomial.f90 %}
```
