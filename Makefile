pdf:
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex && \
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex
clean:
	rm -rf *.{aux,log,out,loe,ilg,ind,idx}
	find . -type f -name "*~" -exec rm {} \;
	rm -rf Dezvoltare\ web\ cu\ PHP.{toc,pdf}
	rm -rf Dezvoltare\ web\ cu\ PHP-start.{toc,pdf}
push:
	git co stable && git push && git co integration && git merge stable && git push

starter-pdf:
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP-start.tex && \
	pdflatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP-start.tex
