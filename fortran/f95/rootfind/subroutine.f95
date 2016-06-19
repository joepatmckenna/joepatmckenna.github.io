subroutine secant(x0,x1,f,tol,maxstep)
use constants
implicit none
	! subroutine arguments
	real(rp), intent(inout) :: x0,x1
	real(rp), external :: f
	real(rp), intent(in) :: tol
	integer, intent(in) :: maxstep
	! local variables, no intent
	integer :: step
	real(rp) :: m
	
	step = 0
	do while (abs(x1-x0)>tol.and.step<maxstep)
		m = (f(x1)-f(x0))/(x1-x0)
		x0 = x1
		x1 = x1 - f(x1)/m
		step=step+1
	end do
	if (step>=maxstep) then
		print*, 'Max steps taken by secant method!'
	end if
end subroutine secant

subroutine newton(x0,x1,f,fp,tol,maxstep)
use constants
implicit none
	! subroutine arguments
	real(rp), intent(inout) :: x0, x1
	real(rp), external :: f, fp
	real(rp), intent(in) :: tol
	integer, intent(in) :: maxstep
	! local variables, no intent
	integer :: step
	real(rp) :: m
	
	step = 0
	do while (abs(x1-x0)>tol.and.step<maxstep)
		m = fp(x1)
		x0 = x1
		x1 = x1 - f(x1)/m
		step=step+1
	end do
	if (step>=maxstep) then
		print*, "Max steps taken by Newton's method!"
	end if
end subroutine newton
