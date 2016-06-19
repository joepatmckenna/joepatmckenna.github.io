program doex
implicit none
	integer :: i, n, factorial = 1
	real :: j, x

	! add 1+2+3+4+5+6+7+8+9+10
	n = 0
	do i=1,10 ! from 1 to 10 increment by 1 
		n=n+i
	end do
	write(*,*) '1+2+3+4+5+6+7+8+9+10 = 10*11/2 ? ',n==10*11/2

	! compute 10 factorial
	do i=10,1,-1 ! from 10 to 1 increment by -1
		factorial=i*factorial
	end do
	write(*,*) '10 factorial = ',factorial

	! add 1 through 10, excluding multiples of 3
	n = 0
	do i=1,10 ! from 1 to 10 increment by 1
		if (mod(i,3)==0) then
			cycle
		end if
		n=n+i
	end do
	write(*,*) '1+2+4+5+7+8+10 = 10*11/2-(3+6+9) ? ',n==10*11/2-(3+6+9)
end program doex
