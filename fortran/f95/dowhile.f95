program dowhile
implicit none
	integer :: n
	real :: x, r = .5
	
	x=r ! initialize x = .1 (binary)
	n=0
	do while(1.+x>1.) ! while 1.000...0001 is greater than 1.
		x=x*r ! shift decimal bit rightward
		n=n+1
	end do
	print*, 'Nearest floating point number greater than 1: '
	print*, 1.+r**n, nearest(1.,1.)
	
	n=0
	do while(.true.) ! infinite loop
		n=n+1
		if (n>10) then
			exit ! exit from while loop
		end if
	end do
	write(*,*) 'n = ',n
end program dowhile
