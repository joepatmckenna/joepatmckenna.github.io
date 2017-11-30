.. normal_forms documentation master file, created by
   sphinx-quickstart on Fri Jun 30 14:22:00 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Normal forms of dynamical systems in Python
===========================================

This document describes how to use `a Python package`_ to compute normal forms of autonomous differential equations

.. math::

   \frac{dx}{dt} = f(x)


where :math:`f:\mathbb{R}^n\rightarrow\mathbb{R}^n`.


The first section of this documents presents some background and a few examples of normal forms, and the remaining sections present the Python classes that the main :class:`normal_forms.normal_form.normal_form` class uses.

The table of contents of this document is

.. toctree::
   :maxdepth: 2

   normal_forms
   jets
   lie

.. _`a Python package`: https://pypi.python.org/pypi/normal-forms
