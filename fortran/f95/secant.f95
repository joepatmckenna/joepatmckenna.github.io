program secant
implicit none
	integer, parameter :: rp = kind(0.d0)
	real(rp) :: x0, x1, y0, y1, m, tol
	integer :: step, maxstep
	
	tol = 1.e-5_rp ! set tolerance
	maxstep = 1e5 ! set max # steps

	x0 = 1._rp ! initialize x
	x1 = 2._rp
	y0 = f(x0) ! initialize f(x)
	y1 = f(x1)
	step = 0 ! initialize step counter
	do while (abs(x1-x0)>tol.and.step<maxstep)
		m = (y1-y0)/(x1-x0) ! compute slope
		x0 = x1 ! store x
		x1 = x1 - y1/m ! iterate x
		y0 = y1 ! store f(x)
		y1 = f(x1) ! update f(x)
		step = step + 1 ! increment step counter
		write(*,*) step, x1, y1
	end do
	if (abs(x1-x0)<=tol) then
		write(*,*) 'f(x) = 0 for x = ',x1
	else
		write(*,*) 'Method did not converge before ',maxstep,' steps.'
	end if
contains
	function f(x)
		integer, parameter :: rp = kind(0.d0)
		real(rp), intent(in) :: x
		real(rp) :: f
		f = log(x)-1._rp/exp(x)
	end function
end program secant
