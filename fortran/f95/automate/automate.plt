reset
set style line 1 linetype 1 linecolor rgb 'black' linewidth 2
set term postscript eps size 4 in, 2 in enhanced font 'Helvetica,12'
set output 'figure.eps'
set border 1+2
set xlabel 'x'
set tics out nomirror
set ytics .5
set multiplot layout 1,2
	set ylabel 'sin x'
	plot 'figure.dat' using 1:2 with lines ls 1 notitle
	set ylabel 'cos x'
	plot 'figure.dat' using 1:3 with lines ls 1 notitle
unset multiplot
