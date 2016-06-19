module matrixmodule
implicit none
	! define a new data type called matrix
	type matrix
		real, allocatable :: element(:,:)
	end type matrix
contains
	! initialize matrix with zeros
	subroutine matrix_zeros(m, n, mat)
		integer, intent(in) :: m, n
		type(matrix), intent(out) :: mat
		integer :: i, j
		! allocate memory for matrix
		allocate(mat%element(m,n))
		do i=1,m
			do j=1,n
				mat%element(i,j)=0.
			end do
		end do
	end subroutine matrix_zeros

	! compute matrix inf-norm
	function matrix_infnorm(mat)
		type(matrix), intent(in) :: mat
		real :: matrix_infnorm
		integer :: m, i
		
		! count number of rows
		m=size(mat%element(:,1))		
		! find maximum absolute row sum
		matrix_infnorm=0.
		do i=1,m
			matrix_infnorm=max(matrix_infnorm,sum(abs(mat%element(i,:))))
		end do
	end function matrix_infnorm
	
	! print matrix
	subroutine matrix_print(mat)
		type(matrix) :: mat
		integer :: m, i

		! count number of rows
		m=size(mat%element(:,1))
		! print one row at a time	
		do i=1,m
			print*, mat%element(i,:)
		end do
	end subroutine matrix_print

	! destroy matrix
	subroutine matrix_destroy(mat)
		type(matrix) :: mat
		deallocate(mat%element)
	end subroutine matrix_destroy
end module matrixmodule

program matrixex
use matrixmodule
implicit none
	! declare a matrix
	type(matrix) :: mat
	integer :: m=2, n=2, i, j

	! initialize matrix as zeros
	call matrix_zeros(m,n,mat)
	write(*,*) '2x2 zero matrix: '
	call matrix_print(mat)
	! assign elements of matrix
	do i=1,m
		do j=1,n
			mat%element(i,j)=real(i**j)
		end do
	end do
	write(*,*) 'new 2x2 matrix: '
	call matrix_print(mat)
	write(*,*) 'The inf-norm of the last matrix is ', matrix_infnorm(mat)
	! destroy matrix
	call matrix_destroy(mat)
		
end program matrixex
