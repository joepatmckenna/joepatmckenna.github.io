program precision
implicit none
	! store the default kind of a double precision real
	integer, parameter :: rp = kind(0.d0)
	! declare single precision, parameter pi1
	real, parameter :: pi1 = 2.*acos(0.)
	! declare double precision, parameter pi2
	real(rp), parameter :: pi2  = 2._rp*acos(0._rp)
	character(2) :: s

	s = "pi"
	
	print*, rp
	write(*,*) 'single precision zero = ',0.
	write(*,*) 'double precision zero = ',0.d0
	write(*,*) 'double precision zero = ',0._rp
	write(*,*) 'double precision zero = ',real(0.,rp)
	write(*,*) 'single precision ',s,'1 = ',pi1
	write(*,*) 'double precision ',s,'2 = ',pi2
	write(*,*) 's.p. acc., d.p. rep. ',s,' = ',2._rp*acos(0.)
end program precision
