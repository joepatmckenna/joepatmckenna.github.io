program allocation
implicit none
	real, allocatable :: A(:), B(:,:)
	integer :: i, j
	
	allocate(A(1:5),B(3,3))
	A = (/ 1., 2., 3., 4., 5. /)
	write(*,*) 'A=',A
	
	forall (i=1:3,j=1:3) B(i,j)=i+j
	write(*,*) 'B='
	do i=1,3
		write(*,*) B(i,:)
	end do	
	deallocate(A,B)

end program allocation
