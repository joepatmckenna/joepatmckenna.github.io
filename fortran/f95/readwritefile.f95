program readwritefile
implicit none
	integer :: i
	integer, parameter :: rp = kind(0.d0)
	real(rp) :: x
	
	open(10,file='readfile.dat',action='read')
	open(11,file='writefile.dat',action='write')
	do i=1,5 ! i know that 'readfile.dat' has 5 lines
		! read from file
		read(10,*) x
		! write to file
		write(11,*) gamma(x) ! the gamma function
	end do
	close(11) ! remember to close each opened file
	close(10)
end program readwritefile
