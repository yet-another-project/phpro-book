R-CEDILLA=$(shell ./diacritice.sh)

.PHONY: clean push cedilla

pdf: cedilla
	xelatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex && \
	xelatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP.tex
preview: cedilla
	xelatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP\-preview.tex && \
	xelatex -halt-on-error -interaction=nonstopmode Dezvoltare\ web\ cu\ PHP\-preview.tex && \
	mv Dezvoltare\ web\ cu\ PHP\-preview.pdf "dezvoltare_web_cu_php-$(shell date +'%d_%m_%Y').pdf"
clean:
	rm -rf *.{aux,log,out,loe,ilg,ind,idx}
	find . -type f -name "*~" -exec rm {} \;
	rm -rf *.{toc,pdf}
push:
	git co stable && git push && git co integration && git merge stable && git push
cedilla:
	$(R-CEDILLA)
