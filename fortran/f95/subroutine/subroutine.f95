subroutine stats(n,i1,i2,i3,minimum,maximum,median,mean)
implicit none
	integer, intent(in) :: n
	integer, intent(inout) :: i1,i2,i3
	integer, intent(out) :: minimum,maximum,median
	real, intent(out) :: mean

	! compute min and max
	minimum = min(i1,i2,i3) ! min: intrinsic function
	maximum = max(i1,i2,i3) ! max: intrinsic function
	! compute median
	if (i1==minimum.or.i1==maximum) then
		if (i2==minimum.or.i2==maximum) then
			median = i3
		else
			median = i2
		end if		
	else
		median = i1
	end if
	! compute mean
	mean = (real(i1)+real(i2)+real(i3))/real(n)
	! order i1, i2, i3	
	i1=minimum
	i2=median
	i3=maximum
end subroutine stats
