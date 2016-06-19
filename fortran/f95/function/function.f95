function f(x)
implicit none
	integer, parameter :: rp = kind(0.d0) 
	real(rp), intent(in) :: x
	real(rp) :: f

	f=x**2._rp-x-1._rp
end function f
