program formatio
implicit none
	integer, parameter :: rp = kind(0.d0)
	real(rp), parameter :: pi = 2._rp*acos(0._rp)
	character(len=100) :: frmt
	integer :: n = 1
	real(rp) :: x, y, z

	frmt = '(a,i5,i5,i5)'
	write(*,frmt) 'Integer: width 5 : ',n,n+4,n+9
	frmt = '("Same as above: ",3i5)'
	write(*,frmt) n,n+4,n+9

	x = 111.111_rp
	y = 222.222_rp
	z = 333.333_rp
	write(*,'(a)') '1 space, Floating point: width 7, dec. 3 : '
	frmt = '(3(1x,f7.3))'
	write(*,frmt) x,y,z

	x = x*pi
	y = y*pi
	z = z*pi
	write(*,*)'Scientific: width 30, dec. 15, exp. 3, 2 per line : '
	frmt = '(2es30.15e3)'
	write(*,frmt) pi,x,y,z
	
	frmt = '(a12, 1x, es20.15)'
	write(*,frmt) 'width too small',pi

	frmt = '(a, 1x, i0, 1x, f0.16)'
	write(*,frmt) 'default width',n+100,pi
end program formatio
