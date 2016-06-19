function f(x)
	integer, parameter :: dp = kind(0.d0)
	real(dp), intent(in) :: x
	real(dp) :: f
	f = x-1._dp-sin(x)
end function

function fp(x)
	integer, parameter :: dp = kind(0.d0)
	real(dp), intent(in) :: x
	real(dp) :: fp
	fp = 1._dp-cos(x)
end function

program newton
implicit none
	integer, parameter :: dp = kind(0.d0)
	real(dp) :: x0, x1, y, m, tol
	integer :: step, maxstep
	real(dp), external :: f, fp
	
	tol = 1.e-5_dp ! set tolerance
	maxstep = 1e5 ! set max # steps

	x0 = 3._dp 
	x1 = x0-f(x0)/fp(x0)
	y = f(x1)
	step = 0 ! initialize step counter
	write(*,*) step, x0, x1, f(x0), f(x1)
	do while (abs(x1-x0)>tol.and.step<maxstep)
		m = fp(x1) ! compute slope
		x0 = x1 ! store x
		x1 = x1 - y/m ! iterate x
		y = f(x1) ! update y
		step = step + 1 ! increment step counter
		write(*,*) step, x0, x1, f(x0), f(x1)
	end do
	if (abs(x1-x0)<=tol) then
		write(*,*) 'f(x) = 0 for x = ',x1
	else
		write(*,*) 'Method did not converge before ',maxstep,' steps.'
	end if
end program newton
