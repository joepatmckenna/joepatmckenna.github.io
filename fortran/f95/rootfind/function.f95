function f(x)
use constants
implicit none
	real(rp), intent(in) :: x
	real(rp) :: f
	f=log(x)-1._rp/exp(x)
end function f

function fp(x)
use constants
implicit none
	real(rp), intent(in) :: x
	real(rp) :: fp
	fp=1._rp/x+1._rp/exp(x)
end function fp
