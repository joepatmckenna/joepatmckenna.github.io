program hw1
implicit none
	integer, parameter :: dp = kind(0.d0)
	real(dp) :: a, r, s, factorial, n, e=exp(1._dp)
	
	a=1._dp	
	r=.5_dp
	s=0._dp
	do while(a>0._dp)
		a=a*r
		s=s+a
	end do
	write(*,*) s
	
	factorial=1._dp
	n=1._dp
	a=1._dp
	s=0._dp
	do while(a>0._dp)
		s=s+a
		factorial=factorial*n
		n=n+1._dp
		a=1._dp/factorial
	end do
	write(*,*) s, e, s-e
	
end program hw1
