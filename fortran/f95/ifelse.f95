program ifelse
implicit none
	integer :: n = 0	
	if (n>0) then
		write(*,*) 'n is positive'
	else if (n<0) then
		write(*,*) 'n is negative'
	else
		write(*,*) 'n is zero'
	end if
end program ifelse
