program montepi
implicit none
	integer, parameter :: rp = kind(0.d0)
	real(rp), parameter :: pi = 2._rp*asin(1._rp)
	real(rp) :: x, y, s = 0., tol = 1.e-5
	integer :: m = 0, n = 0

	! initialize pseudorandom number generator
	call srand(0)

	do while(abs(pi-s)>tol) ! while error > tol
		x = rand() ! random number between 0 and 1
		y = rand()
		if (x**2._rp+y**2._rp<1._rp) then ! if in unit circle
			m=m+1 ! increase count of points in unit circle
		end if
		n=n+1 ! increase count of points in square (+-1,+-1)
		s=4._rp*real(m)/real(n) ! approximate pi
	end do
	write(*,*) m, n, s
end program montepi
