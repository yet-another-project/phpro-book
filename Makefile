pdf:
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex
clean:
	rm -rf *.{aux,log,out}
	find . -type f -name "*~" -exec rm {} \;
	rm -rf Dezvoltare\ web\ cu\ PHP.{toc,pdf}
