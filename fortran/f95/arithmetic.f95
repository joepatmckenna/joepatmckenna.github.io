program arithmetic
implicit none
	integer :: m = 3, n ! declare two integers, assign value of 3 to m
	real :: x, y ! declare two real numbers

	n = 5.9 ! rounded down to 5
	x = 3 ! converted integer to real number
	y = n ! converted integer to real number

	! no decimal in output
	write(*,*) 'int(3) = ', m
	! rounded down to 5
	write(*,*) 'int(5) = ', n
	! decimal in output
	write(*,*) 'real(3) = ', x
	! converted integer to real
	write(*,*) 'real(5) = ', y
	! integer division is rounded down
	write(*,*) 'int(5)/int(3) = ', n/m
	! real division
	write(*,*) 'real(5)/real(3) = ', y/x
	! converted to real
	write(*,*) 'int(5)/real(3) = ', n/x
	! real(1.)*int(n) is computed first
	write(*,*) 'real(1)*int(5)/int(3) = ', 1.*n/m
	! integer(n)/int(m) is computed first
	write(*,*) 'int(5)/int(3)*real(1) = ', n/m*1.
	! the compiler treats n and m as reals
	write(*,*) 'real(5)/real(3) = ', real(n)/real(m)
	! the compiler treats x and y as integers
	write(*,*) 'int(5.)/int(3.) = ', int(y)/int(x)	
end program arithmetic

