############################      Makefile     #################################

# Note that you can override things from the command line, for example
#  make LATEXMK=

PDFS = slides.pdf slides_part2.pdf

PDFLATEX=pdflatex --halt-on-error
BIBTEX=bibtex
LATEXMK=latexmk

all   : $(PDFS)

# Main compile with latexmk, if available, otherwise with brute force
ifndef LATEXMK
LATEXMK=
endif
ifeq (${LATEXMK},)
%.pdf : %.tex $(BIBFILES)
	$(PDFLATEX) $<
	$(BIBTEX) $(<:.tex=)
	$(PDFLATEX) $<
	$(PDFLATEX) $<
else
%.pdf : %.tex
	$(LATEXMK) $<
endif

# Clean everything (including final pdfs)
clean :
	rm -f *.aux *.log *.bbl *.blg *-blx.bib *.nav *.snm *.toc *.vrb *.run.xml *.out *.spl *.fls *.fdb_latexmk
	rm -f $(PDFS)

.PHONY : all clean plots
