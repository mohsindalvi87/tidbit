set terminal epslatex
set output 'pgffigures/pgf-graphs-01-figure51-gnuplottex-fig1.tex'
set terminal epslatex color size 14.5cm, 6cm
set key top left
set xlabel '$ x [1] $'
set ylabel '$ y [1] $'
f1(x)=sin(x**2)
plot f1(x) title '$ y_1 = \sin(x^2) $'
