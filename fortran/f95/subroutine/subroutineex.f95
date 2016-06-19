program subroutineex
implicit none
	integer :: n = 3
	integer :: i1, i2, i3
	integer :: minimum, maximum, median
	real :: mean

	i1=8
	i2=1
	i3=3
	! call subroutine
	call stats(n,i1,i2,i3,minimum,maximum,median,mean)
	! after calling subroutine
	write(*,*) 'i1,i2,i3 = ',i1,i2,i3,'(after calling stats)'
	write(*,*) 'minimum = ',minimum
	write(*,*) 'maximum = ',maximum
	write(*,*) 'median = ',median
	write(*,*) 'mean = ',mean
end program subroutineex
