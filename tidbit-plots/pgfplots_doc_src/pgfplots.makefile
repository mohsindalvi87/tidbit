ALL_FIGURE_NAMES=$(shell cat pgfplots.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

-include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

figures/expensiveexampleXtutorials_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_0.pdf: figures/expensiveexampleXtutorials_0.md5
figures/expensiveexampleXtutorials_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_1.pdf: figures/expensiveexampleXtutorials_1.md5
figures/expensiveexampleXtutorials_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_2.pdf: figures/expensiveexampleXtutorials_2.md5
figures/expensiveexampleXtutorials_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_3.pdf: figures/expensiveexampleXtutorials_3.md5
figures/expensiveexampleXtutorials_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_4.pdf: figures/expensiveexampleXtutorials_4.md5
figures/expensiveexampleXtutorials_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_5.pdf: figures/expensiveexampleXtutorials_5.md5
figures/expensiveexampleXtutorials_6.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXtutorials_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXtutorials_6.pdf: figures/expensiveexampleXtutorials_6.md5
figures/expensiveexampleXreference_addplot_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_addplot_0.pdf: figures/expensiveexampleXreference_addplot_0.md5
figures/expensiveexampleXreference_addplot_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_addplot_1.pdf: figures/expensiveexampleXreference_addplot_1.md5
figures/expensiveexampleXreference_addplot_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_addplot_2.pdf: figures/expensiveexampleXreference_addplot_2.md5
figures/expensiveexampleXreference_twodim_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_0.pdf: figures/expensiveexampleXreference_twodim_0.md5
figures/expensiveexampleXreference_twodim_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_1.pdf: figures/expensiveexampleXreference_twodim_1.md5
figures/expensiveexampleXreference_twodim_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_2.pdf: figures/expensiveexampleXreference_twodim_2.md5
figures/expensiveexampleXreference_threedim_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_0.pdf: figures/expensiveexampleXreference_threedim_0.md5
figures/expensiveexampleXreference_threedim_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_1.pdf: figures/expensiveexampleXreference_threedim_1.md5
figures/expensiveexampleXreference_threedim_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_2.pdf: figures/expensiveexampleXreference_threedim_2.md5
figures/expensiveexampleXreference_threedim_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_3.pdf: figures/expensiveexampleXreference_threedim_3.md5
figures/expensiveexampleXreference_threedim_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_4.pdf: figures/expensiveexampleXreference_threedim_4.md5
figures/expensiveexampleXreference_threedim_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_5.pdf: figures/expensiveexampleXreference_threedim_5.md5
figures/expensiveexampleXreference_threedim_6.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_6.pdf: figures/expensiveexampleXreference_threedim_6.md5
figures/expensiveexampleXreference_threedim_7.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_7" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_7.pdf: figures/expensiveexampleXreference_threedim_7.md5
figures/expensiveexampleXreference_threedim_8.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_8" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_8.pdf: figures/expensiveexampleXreference_threedim_8.md5
figures/expensiveexampleXreference_threedim_9.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_9" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_9.pdf: figures/expensiveexampleXreference_threedim_9.md5
figures/expensiveexampleXreference_threedim_10.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_10" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_10.pdf: figures/expensiveexampleXreference_threedim_10.md5
figures/expensiveexampleXreference_threedim_11.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_11" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_11.pdf: figures/expensiveexampleXreference_threedim_11.md5
figures/expensiveexampleXreference_threedim_12.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_12" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_12.pdf: figures/expensiveexampleXreference_threedim_12.md5
figures/expensiveexampleXreference_threedim_13.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_13" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_13.pdf: figures/expensiveexampleXreference_threedim_13.md5
figures/expensiveexampleXreference_threedim_14.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_14" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_14.pdf: figures/expensiveexampleXreference_threedim_14.md5
figures/expensiveexampleXreference_threedim_15.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_15" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_15.pdf: figures/expensiveexampleXreference_threedim_15.md5
figures/expensiveexampleXreference_threedim_16.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_16" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_16.pdf: figures/expensiveexampleXreference_threedim_16.md5
figures/expensiveexampleXreference_threedim_17.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_17" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_17.pdf: figures/expensiveexampleXreference_threedim_17.md5
figures/expensiveexampleXreference_threedim_18.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_18" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_18.pdf: figures/expensiveexampleXreference_threedim_18.md5
figures/expensiveexampleXreference_threedim_19.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_19" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_19.pdf: figures/expensiveexampleXreference_threedim_19.md5
figures/expensiveexampleXreference_threedim_20.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_20" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_20.pdf: figures/expensiveexampleXreference_threedim_20.md5
figures/expensiveexampleXreference_threedim_21.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_21" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_21.pdf: figures/expensiveexampleXreference_threedim_21.md5
figures/expensiveexampleXreference_threedim_22.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_22" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_22.pdf: figures/expensiveexampleXreference_threedim_22.md5
figures/expensiveexampleXreference_threedim_23.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_23" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_23.pdf: figures/expensiveexampleXreference_threedim_23.md5
figures/expensiveexampleXreference_threedim_24.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_24" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_24.pdf: figures/expensiveexampleXreference_threedim_24.md5
figures/expensiveexampleXreference_threedim_interior_colormap_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_0.pdf: figures/expensiveexampleXreference_threedim_interior_colormap_0.md5
figures/expensiveexampleXreference_threedim_interior_colormap_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_1.pdf: figures/expensiveexampleXreference_threedim_interior_colormap_1.md5
figures/expensiveexampleXreference_threedim_interior_colormap_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_2.pdf: figures/expensiveexampleXreference_threedim_interior_colormap_2.md5
figures/expensiveexampleXreference_threedim_interior_colormap_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_3.pdf: figures/expensiveexampleXreference_threedim_interior_colormap_3.md5
figures/expensiveexampleXreference_threedim_surf_explicit_color_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_surf_explicit_color_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_surf_explicit_color_0.pdf: figures/expensiveexampleXreference_threedim_surf_explicit_color_0.md5
figures/expensiveexampleXreference_threedim_surf_explicit_color_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_surf_explicit_color_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_surf_explicit_color_1.pdf: figures/expensiveexampleXreference_threedim_surf_explicit_color_1.md5
figures/expensiveexampleXreference_threedim_contour_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_0.pdf: figures/expensiveexampleXreference_threedim_contour_0.md5
figures/expensiveexampleXreference_threedim_contour_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_1.pdf: figures/expensiveexampleXreference_threedim_contour_1.md5
figures/expensiveexampleXreference_threedim_contour_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_2.pdf: figures/expensiveexampleXreference_threedim_contour_2.md5
figures/expensiveexampleXreference_threedim_contour_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_3.pdf: figures/expensiveexampleXreference_threedim_contour_3.md5
figures/expensiveexampleXreference_threedim_contour_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_4.pdf: figures/expensiveexampleXreference_threedim_contour_4.md5
figures/expensiveexampleXreference_threedim_contour_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_5.pdf: figures/expensiveexampleXreference_threedim_contour_5.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_0.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_0.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_1.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_1.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_2.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_2.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_3.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_3.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_4.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_4.md5
figures/expensiveexampleXreference_threedim_contour_contourdir_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_contourdir_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_contourdir_5.pdf: figures/expensiveexampleXreference_threedim_contour_contourdir_5.md5
figures/expensiveexampleXreference_threedim_contour_6.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_6.pdf: figures/expensiveexampleXreference_threedim_contour_6.md5
figures/expensiveexampleXreference_threedim_contour_7.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_7" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_7.pdf: figures/expensiveexampleXreference_threedim_contour_7.md5
figures/expensiveexampleXcontoursharp.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXcontoursharp" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXcontoursharp.pdf: figures/expensiveexampleXcontoursharp.md5
figures/expensiveexampleXreference_threedim_contour_8.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_8" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_8.pdf: figures/expensiveexampleXreference_threedim_contour_8.md5
figures/expensiveexampleXreference_threedim_contour_9.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_9" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_9.pdf: figures/expensiveexampleXreference_threedim_contour_9.md5
figures/expensiveexampleXreference_threedim_contour_10.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_10" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_10.pdf: figures/expensiveexampleXreference_threedim_contour_10.md5
figures/expensiveexampleXreference_threedim_contour_11.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_11" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_11.pdf: figures/expensiveexampleXreference_threedim_contour_11.md5
figures/expensiveexampleXreference_threedim_contour_12.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_12" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_12.pdf: figures/expensiveexampleXreference_threedim_contour_12.md5
figures/expensiveexampleXreference_threedim_contour_13.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_13" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_13.pdf: figures/expensiveexampleXreference_threedim_contour_13.md5
figures/expensiveexampleXreference_threedim_contour_14.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_14" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_14.pdf: figures/expensiveexampleXreference_threedim_contour_14.md5
figures/expensiveexampleXreference_threedim_parameterized_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_parameterized_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_parameterized_0.pdf: figures/expensiveexampleXreference_threedim_parameterized_0.md5
figures/expensiveexampleXreference_threedim_parameterized_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_parameterized_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_parameterized_1.pdf: figures/expensiveexampleXreference_threedim_parameterized_1.md5
figures/expensiveexampleXreference_threedim_parameterized_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_parameterized_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_parameterized_2.pdf: figures/expensiveexampleXreference_threedim_parameterized_2.md5
figures/expensiveexampleXreference_threedim_parameterized_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_parameterized_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_parameterized_3.pdf: figures/expensiveexampleXreference_threedim_parameterized_3.md5
figures/expensiveexampleXreference_threedim_parameterized_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_parameterized_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_parameterized_4.pdf: figures/expensiveexampleXreference_threedim_parameterized_4.md5
figures/expensiveexampleXreference_threedim_25.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_25" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_25.pdf: figures/expensiveexampleXreference_threedim_25.md5
figures/expensiveexampleXreference_threedim_26.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_26" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_26.pdf: figures/expensiveexampleXreference_threedim_26.md5
figures/expensiveexampleXreference_threedim_27.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_27" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_27.pdf: figures/expensiveexampleXreference_threedim_27.md5
figures/expensiveexampleXreference_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_0.pdf: figures/expensiveexampleXreference_0.md5
figures/expensiveexampleXreference_lena_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_lena_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_lena_0.pdf: figures/expensiveexampleXreference_lena_0.md5
figures/expensiveexampleXreference_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_1.pdf: figures/expensiveexampleXreference_1.md5
figures/expensiveexampleXreference_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_2.pdf: figures/expensiveexampleXreference_2.md5
figures/expensiveexampleXreference_hideaxis_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_hideaxis_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_hideaxis_0.pdf: figures/expensiveexampleXreference_hideaxis_0.md5
figures/expensiveexampleXreference_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_3.pdf: figures/expensiveexampleXreference_3.md5
figures/expensiveexampleXreference_threedimaxis_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_0.pdf: figures/expensiveexampleXreference_threedimaxis_0.md5
figures/expensiveexampleXreference_threedimaxis_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_1.pdf: figures/expensiveexampleXreference_threedimaxis_1.md5
figures/expensiveexampleXreference_threedimaxis_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_2.pdf: figures/expensiveexampleXreference_threedimaxis_2.md5
figures/expensiveexampleXreference_threedimaxis_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_3.pdf: figures/expensiveexampleXreference_threedimaxis_3.md5
figures/expensiveexampleXreference_threedimaxis_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_4.pdf: figures/expensiveexampleXreference_threedimaxis_4.md5
figures/expensiveexampleXreference_threedimaxis_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_5.pdf: figures/expensiveexampleXreference_threedimaxis_5.md5
figures/expensiveexampleXreference_threedimaxis_6.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_6.pdf: figures/expensiveexampleXreference_threedimaxis_6.md5
figures/expensiveexampleXreference_threedimaxis_7.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_7" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_7.pdf: figures/expensiveexampleXreference_threedimaxis_7.md5
figures/expensiveexampleXreference_threedimaxis_8.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_8" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_8.pdf: figures/expensiveexampleXreference_threedimaxis_8.md5
figures/expensiveexampleXreference_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_4.pdf: figures/expensiveexampleXreference_4.md5
figures/expensiveexampleXreference_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_5.pdf: figures/expensiveexampleXreference_5.md5
figures/expensiveexampleXreference_nodes_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_0.pdf: figures/expensiveexampleXreference_nodes_0.md5
figures/expensiveexampleXreference_nodes_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_1.pdf: figures/expensiveexampleXreference_nodes_1.md5
figures/expensiveexampleXreference_nodes_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_2.pdf: figures/expensiveexampleXreference_nodes_2.md5
figures/expensiveexampleXreference_nodes_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_3.pdf: figures/expensiveexampleXreference_nodes_3.md5
figures/expensiveexampleXreference_restrictodomain_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_restrictodomain_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_restrictodomain_0.pdf: figures/expensiveexampleXreference_restrictodomain_0.md5
figures/expensiveexampleXbrewer_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_0.pdf: figures/expensiveexampleXbrewer_0.md5
figures/expensiveexampleXbrewer_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_1.pdf: figures/expensiveexampleXbrewer_1.md5
figures/expensiveexampleXbrewer_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_2.pdf: figures/expensiveexampleXbrewer_2.md5
figures/expensiveexampleXbrewer_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_3.pdf: figures/expensiveexampleXbrewer_3.md5
figures/expensiveexampleXbrewer_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_4.pdf: figures/expensiveexampleXbrewer_4.md5
figures/expensiveexampleXbrewer_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer_5.pdf: figures/expensiveexampleXbrewer_5.md5
figures/expensiveexampleXbrewer-fig-intro-GnBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-fig-intro-GnBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-fig-intro-GnBu.pdf: figures/expensiveexampleXbrewer-fig-intro-GnBu.md5
figures/expensiveexampleXbrewer-seq-BuGn.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-BuGn" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-BuGn.pdf: figures/expensiveexampleXbrewer-seq-BuGn.md5
figures/expensiveexampleXbrewer-seq-PuRd.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-PuRd" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-PuRd.pdf: figures/expensiveexampleXbrewer-seq-PuRd.md5
figures/expensiveexampleXbrewer-seq-Blues.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Blues" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Blues.pdf: figures/expensiveexampleXbrewer-seq-Blues.md5
figures/expensiveexampleXbrewer-seq-BuPu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-BuPu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-BuPu.pdf: figures/expensiveexampleXbrewer-seq-BuPu.md5
figures/expensiveexampleXbrewer-seq-RdPu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-RdPu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-RdPu.pdf: figures/expensiveexampleXbrewer-seq-RdPu.md5
figures/expensiveexampleXbrewer-seq-Greens.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Greens" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Greens.pdf: figures/expensiveexampleXbrewer-seq-Greens.md5
figures/expensiveexampleXbrewer-seq-GnBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-GnBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-GnBu.pdf: figures/expensiveexampleXbrewer-seq-GnBu.md5
figures/expensiveexampleXbrewer-seq-YlGn.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-YlGn" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-YlGn.pdf: figures/expensiveexampleXbrewer-seq-YlGn.md5
figures/expensiveexampleXbrewer-seq-Greys.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Greys" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Greys.pdf: figures/expensiveexampleXbrewer-seq-Greys.md5
figures/expensiveexampleXbrewer-seq-OrRd.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-OrRd" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-OrRd.pdf: figures/expensiveexampleXbrewer-seq-OrRd.md5
figures/expensiveexampleXbrewer-seq-YlGnBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-YlGnBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-YlGnBu.pdf: figures/expensiveexampleXbrewer-seq-YlGnBu.md5
figures/expensiveexampleXbrewer-seq-Oranges.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Oranges" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Oranges.pdf: figures/expensiveexampleXbrewer-seq-Oranges.md5
figures/expensiveexampleXbrewer-seq-PuBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-PuBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-PuBu.pdf: figures/expensiveexampleXbrewer-seq-PuBu.md5
figures/expensiveexampleXbrewer-seq-YlOrBr.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-YlOrBr" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-YlOrBr.pdf: figures/expensiveexampleXbrewer-seq-YlOrBr.md5
figures/expensiveexampleXbrewer-seq-Purples.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Purples" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Purples.pdf: figures/expensiveexampleXbrewer-seq-Purples.md5
figures/expensiveexampleXbrewer-seq-PuBuGn.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-PuBuGn" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-PuBuGn.pdf: figures/expensiveexampleXbrewer-seq-PuBuGn.md5
figures/expensiveexampleXbrewer-seq-YlOrRd.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-YlOrRd" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-YlOrRd.pdf: figures/expensiveexampleXbrewer-seq-YlOrRd.md5
figures/expensiveexampleXbrewer-seq-Reds.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-seq-Reds" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-seq-Reds.pdf: figures/expensiveexampleXbrewer-seq-Reds.md5
figures/expensiveexampleXbrewer-div-BrBG.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-BrBG" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-BrBG.pdf: figures/expensiveexampleXbrewer-div-BrBG.md5
figures/expensiveexampleXbrewer-div-RdGy.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-RdGy" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-RdGy.pdf: figures/expensiveexampleXbrewer-div-RdGy.md5
figures/expensiveexampleXbrewer-div-RdYlBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-RdYlBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-RdYlBu.pdf: figures/expensiveexampleXbrewer-div-RdYlBu.md5
figures/expensiveexampleXbrewer-div-PiYG.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-PiYG" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-PiYG.pdf: figures/expensiveexampleXbrewer-div-PiYG.md5
figures/expensiveexampleXbrewer-div-PuOr.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-PuOr" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-PuOr.pdf: figures/expensiveexampleXbrewer-div-PuOr.md5
figures/expensiveexampleXbrewer-div-RdYlGn.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-RdYlGn" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-RdYlGn.pdf: figures/expensiveexampleXbrewer-div-RdYlGn.md5
figures/expensiveexampleXbrewer-div-PRGn.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-PRGn" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-PRGn.pdf: figures/expensiveexampleXbrewer-div-PRGn.md5
figures/expensiveexampleXbrewer-div-RdBu.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-RdBu" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-RdBu.pdf: figures/expensiveexampleXbrewer-div-RdBu.md5
figures/expensiveexampleXbrewer-div-Spectral.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-div-Spectral" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-div-Spectral.pdf: figures/expensiveexampleXbrewer-div-Spectral.md5
figures/expensiveexampleXbrewer-qualit-Accent.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Accent" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Accent.pdf: figures/expensiveexampleXbrewer-qualit-Accent.md5
figures/expensiveexampleXbrewer-qualit-Pastel1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Pastel1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Pastel1.pdf: figures/expensiveexampleXbrewer-qualit-Pastel1.md5
figures/expensiveexampleXbrewer-qualit-Pastel2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Pastel2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Pastel2.pdf: figures/expensiveexampleXbrewer-qualit-Pastel2.md5
figures/expensiveexampleXbrewer-qualit-Dark2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Dark2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Dark2.pdf: figures/expensiveexampleXbrewer-qualit-Dark2.md5
figures/expensiveexampleXbrewer-qualit-Set1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Set1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Set1.pdf: figures/expensiveexampleXbrewer-qualit-Set1.md5
figures/expensiveexampleXbrewer-qualit-Set2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Set2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Set2.pdf: figures/expensiveexampleXbrewer-qualit-Set2.md5
figures/expensiveexampleXbrewer-qualit-Paired.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Paired" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Paired.pdf: figures/expensiveexampleXbrewer-qualit-Paired.md5
figures/expensiveexampleXbrewer-qualit-Set3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXbrewer-qualit-Set3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXbrewer-qualit-Set3.pdf: figures/expensiveexampleXbrewer-qualit-Set3.md5
figures/expensiveexampleXpatchplot_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXpatchplot_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXpatchplot_0.pdf: figures/expensiveexampleXpatchplot_0.md5
figures/expensiveexampleXpolar_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXpolar_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXpolar_0.pdf: figures/expensiveexampleXpolar_0.md5
figures/expensiveexampleXsmithhuge_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXsmithhuge_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXsmithhuge_0.pdf: figures/expensiveexampleXsmithhuge_0.md5
figures/expensiveexampleXstatistics_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_0.pdf: figures/expensiveexampleXstatistics_0.md5
figures/expensiveexampleXstatistics_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_1.pdf: figures/expensiveexampleXstatistics_1.md5
figures/expensiveexampleXstatistics_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_2.pdf: figures/expensiveexampleXstatistics_2.md5
figures/expensiveexampleXstatistics_3.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_3.pdf: figures/expensiveexampleXstatistics_3.md5
figures/expensiveexampleXstatistics_4.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_4.pdf: figures/expensiveexampleXstatistics_4.md5
figures/expensiveexampleXstatistics_5.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_5.pdf: figures/expensiveexampleXstatistics_5.md5
figures/expensiveexampleXstatistics_6.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXstatistics_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXstatistics_6.pdf: figures/expensiveexampleXstatistics_6.md5
figures/expensiveexampleXmemspeed_0.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_0.pdf: figures/expensiveexampleXmemspeed_0.md5
figures/expensiveexampleXmemspeed_1.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_1.pdf: figures/expensiveexampleXmemspeed_1.md5
figures/expensiveexampleXmemspeed_2.pdf: 
	lualatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_2.pdf: figures/expensiveexampleXmemspeed_2.md5
