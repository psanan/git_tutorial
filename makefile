slides.pdf : slides.tex
	pdflatex $<
	pdflatex $<

clean : 
	rm -f slides.pdf  slides.vrb slides.aux slides.log slides.toc slides.snm slides.out slides.nav

.PHONY : clean
