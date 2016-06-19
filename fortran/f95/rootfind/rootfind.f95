program rootfind
use constants
implicit none
	real(rp) :: x0, x1, tol=1.e-5_rp
	integer :: step, maxstep = 1e5
	real(rp), external :: f, fp

	! The secant method
	x0 = 1._rp
	x1 = 2._rp
	call secant(x0,x1,f,tol,maxstep)
	write(*,*) 'By the secant method, x = ',x1

	! Newton's method
	x0 = 1._rp
	x1 = 2._rp
	call newton(x0,x1,f,fp,tol,maxstep)
	write(*,*) "By Newton's method, x = ",x1
end program rootfind
