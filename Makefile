dezvoltare_web_cu_php.pdf: 
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex
clean:
	rm -rf *.{aux,log,out}