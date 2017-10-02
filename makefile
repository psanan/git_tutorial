slides.pdf : slides.tex
	pdflatex $<
	pdflatex $<

clean : 
	rm -f  slides.vrb slides.aux slides.log slides.toc slides.snm slides.out slides.nav

allclean : clean
	rm -f slides.pdf

.PHONY : clean allclean
