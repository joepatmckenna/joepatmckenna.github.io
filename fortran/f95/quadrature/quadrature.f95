program quadrature
use constants
implicit none
	! number of grid points
	integer :: n
	! left and right endpoints of interval
	real(rp) :: a,b
	! integrand function and quadrature rule functions
	real(rp), external :: f, left_endpoint, midpoint
	
	a = 0._rp
	b = 1._rp
	n = 10

	write(*,*) 'By the Left Endpoint Rule:',left_endpoint(n,a,b,f)
	write(*,*) 'By the Midpoint Rule:',midpoint(n,a,b,f)
	write(*,*) "Analytic value in terms of 'error funciton':",.5*pi**.5*erf(1.)
end program quadrature
