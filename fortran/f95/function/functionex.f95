program functionex
implicit none
	integer, parameter :: rp = kind(0.d0) 
	real(rp):: x, y
	real(rp), external :: f

	x = (1._rp+sqrt(5._rp))/2._rp ! the golden ratio is a root of f
	write(*,*) 'x = ',x,'(before calling f)'
	y = f(x)
	write(*,*) 'x = ',x,'(after calling f)'
	write(*,*) 'f(x) = ',y
end program functionex
