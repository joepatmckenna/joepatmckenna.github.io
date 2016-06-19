program array
implicit none
	integer :: i, j, n
	integer, dimension(5) :: A
	integer :: B(5)
	real, dimension(-3:1) :: C
	real :: D(-2:2)
	integer :: E(2, 2), F(-1:1,2), eye(3,3)
	
	character(1024) :: frmt

	A = (/ 1, 2, 3, 4, 5 /) ! explicit assignment
	write(*,'(a,5(i0,1x))') 'A = ',A ! write as space-delimited row

	B=(/(2*i,i=1,size(B))/) ! implicit do loop in explicit constructor
	write(*,'(a)') '(as a column) B ='
	write(*,'(i0)') B ! write as column

	do i=1,size(B)
		B(i)=2*i
	end do
	write(*,'(a)') '(as a row) B ='
	write(*,'(5(i0,x))') B ! write as row

	write(*,'(a,i0)'), 'A dot B = ',dot_product(A,B) ! dot product
	
	C = (/ 1., 3., 5., 4., 2. /)
	write(*,'(a,3(f0.0,1x))') 'C(-2:0) = ',C(-2:0) ! middle 3 elements as space-delimited row

	forall(i=-2:2) D(i)=real(i)**2. ! forall declaration, more concise than do loop
	write(*,'(a,5(f0.0,1x))') 'D(:) = ', D(:)
	write(*,'(a,f0.0)'),'maxval(D) = ',maxval(D)
	write(*,'(a,f0.0)'),'minval(D) = ',minval(D)
	write(*,'(a,i0)'),'lbound(D) = ',lbound(D)
	write(*,'(a,i0)'),'ubound(D) = ',ubound(D)

	E = reshape((/1,2,3,4/),(/2,2/))
	write(*,*) '(unformatted) E = ',E
	write(*,*) '(formatted) E = '
	do i=1,2
		write(*,'(2(i0,1x),a,i0,a)') E(i,:),' (row ',i,')'
	end do
	write(*,*) '(formatted) E = '
	do i=1,2
		write(*,'(2(i0,1x),a,i0,a)') E(:,i),' (col ',i,')'
	end do

	F = reshape((/1,2,3,4,5,6/),(/3,2/))
	write(*,'(a)') 'F = '
	do i=-1,1
		write(*,'(2(i0,1x))') F(i,:)
	end do
	write(*,'(a)') 'F = '
	write(*,'(2(i0,1x))') transpose(F)
	
	n=3
	forall(i=1:n,j=1:n) eye(i,j)=(i/j)*(j/i) ! trick for creating identity matrix
	write(*,'(a)') 'eye = '
	write(frmt,'(a,i0,a)') '(',n,'(i0,1x))' ! write to frmt string
	write(*,frmt) eye ! write eye with frmt string
end program array
