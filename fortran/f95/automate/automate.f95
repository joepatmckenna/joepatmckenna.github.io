program automate
implicit none
	integer :: i
	real :: x(0:10) ! an array indexed from 0 to 10
	! compute pi and store as a constant
	real, parameter :: pi = 2.*acos(0.)
	
	! populate array of x-values between 0 and 2 pi
	x=(/(i/5.*pi,i=0,10)/)
	
	! write sine and cosine data to file 'figure.dat'
	open(10,file='figure.dat',action='write',status='replace')
	do i=0,10
		write(10,*) x(i), sin(x(i)), cos(x(i))
	enddo
	close(10)	
	! call gnuplot script 'automate.plt' that plots data
	call execute_command_line('gnuplot automate.plt', wait=.true.)
	
	! write LaTeX table to file 'table.tex'
	open(10,file='table.tex',action='write',status='replace')
	write(10,*) '\begin{tabular}{|c|c|c|} \hline'
	write(10,*) '$x$ & $\sin x$ & $\cos x$ \\ \hline'
	do i=0,10
		write(10,*) x(i), '&', sin(x(i)), '&', cos(x(i)), '\\'
	enddo
	write(10,*)'\hline \end{tabular}'
	close(10)
	! call pdflatex on 'automate.tex' to compile report to pdf
	call execute_command_line('pdflatex automate.tex', wait=.true.)
end program automate
