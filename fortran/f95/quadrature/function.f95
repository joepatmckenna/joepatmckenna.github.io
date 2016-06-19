! f(x)=e^(-x^2)
function f(x)
use constants
implicit none
	real(rp), intent(in) :: x
	real(rp) :: f
	f = exp(-x**2._rp)
end function f

! Left Endpoint Quadrature Rule
function left_endpoint(n,a,b,f)
use constants
implicit none
	! number of grid points
	integer, intent(in) :: n
	! left and right endpoints of interval
	real(rp), intent(in) :: a,b
	! integrand
	real(rp), external :: f
	! return value
	real(rp) :: left_endpoint
	! local variables
	integer :: i
	real(rp) :: x, dx

	dx = (b-a)/n
	left_endpoint = 0._rp
	do i=0,n-1
		x=a+i*dx
		left_endpoint=left_endpoint+f(x)*dx
	end do
end function left_endpoint

! Midpoint Quadrature Rule
function midpoint(n,a,b,f)
use constants
implicit none
	! number of grid points
	integer, intent(in) :: n
	! left and right endpoints of interval
	real(rp), intent(in) :: a,b
	! integrand
	real(rp), external :: f
	! return value
	real(rp) :: midpoint
	! local variables
	integer :: i
	real(rp) :: x, dx

	dx = (b-a)/n	
	midpoint = 0._rp
	do i=0,n-1
		x=a+(2._rp*i+1._rp)*dx/2._rp
		midpoint=midpoint+f(x)*dx
	end do
end function midpoint
