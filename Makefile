LATEX:=latex
PDFLATEX:=pdflatex
THESIS=thesis
SOURCE_FILES:=$(wildcard *.tex)
PS2PDF=ps2pdf -sPAPERSIZE=letter
BIB_FILES= $(wildcard *.bib)

refresh: clean pdf

all: $(THESIS).pdf

thesis: $(THESIS).pdf

all-lazy: pdf-lazy

$(THESIS).pdf: $(SOURCE_FILES) $(BIB_FILES)
	$(PDFLATEX) --jobname=$(THESIS) $(SOURCE_FILES)
	-bibtex $(THESIS)
	$(PDFLATEX) --jobname=$(THESIS) $(SOURCE_FILES)
	$(PDFLATEX) --jobname=$(THESIS) $(SOURCE_FILES)

clean:
	rm -f *.dvi *.aux *.bbl *.blg *.toc *.ind *.out *.brf *.ilg *.idx *.log *.soc
	rm -rf $(THESIS).ps $(THESIS).pdf $(THESIS).lof $(THESIS).lot
	rm -rf $(PROPOSAL).ps $(PROPOSAL).pdf $(PROPOSAL).lof $(PROPOSAL).lot
