pdf:
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex
clean:
	rm -rf *.{aux,log,out}
	rm -rf *~
	rm -rf Dezvoltare\ web\ cu\ PHP.{toc,pdf}