main.pdf: main.tex sections/*.tex references.bib
	latexmk -pdf -interaction=nonstopmode main.tex

.PHONY: clean
clean:
	latexmk -C
	rm -f sections/*.aux
