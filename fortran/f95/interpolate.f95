module interpolate_module
	type row
		real, allocatable :: row(:)
	end type row
end module interpolate_module

program interpolate
use interpolate_module
implicit none

	type(row) :: table(0:5)
	integer :: i, n = 5
	real :: a(5), b(2)

	do i=0,n
		allocate(table(i)%row(0:n-i))
	end do

	do i=0,n
		print*, table(i)%row
	end do


	b=(/2.,3./)
	a=(/1.,b,4.,5./)

	do i=1,5
		print*, a(i)
	end do


end program interpolate
