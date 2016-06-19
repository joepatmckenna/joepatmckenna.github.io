module pointmodule
implicit none
	! define a new data type called point
	type point
		real :: x(3)
	end type point
contains
	! define a function that operates on points
	function magnitude(pt)
		type(point), intent(in) :: pt
		real :: magnitude
		magnitude=sqrt(sum(pt%x**2))
	end function magnitude
end module pointmodule

program typeex
use pointmodule
implicit none
	! declare a point
	type(point) :: pt
	
	! set the values of 'x' in 'pt'
	pt%x(1)=1.
	pt%x(2)=2.
	pt%x(3)=3.
	! print point and magnitude
	write(*,*) pt
	write(*,*) magnitude(pt)
end program typeex
