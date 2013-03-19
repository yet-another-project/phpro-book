R-CEDILLA=$(shell ./diacritice.sh)
PDFLATEX=xelatex
PDFFLAGS=-halt-on-error -interaction=nonstopmode -file-line-error -shell-escape
PROJECT=Dezvoltare-web-cu-PHP
MAKEINDEX=makeindex
MAKEINDEXFLAGS=
NOMENCLATUREFLAGS=-s nomencl.ist
INDICES=abv en-ro important term

.PHONY: clean push cedilla

preview: clean preview-2ndpass
	mv "$(PROJECT)-preview.pdf" "dezvoltare_web_cu_php-$(shell date +'%d_%m_%Y').pdf"
preview-1stpass: cedilla
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT)-preview.tex" > error.log 2>&1 && \
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT)-preview.tex" > error.log 2>&1
$(INDICES):
	$(MAKEINDEX) $(MAKEINDEXFLAGS) $@.idx
preview-2ndpass: preview-1stpass $(INDICES)
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT)-preview.tex" | ./filter.sh

book: clean book-1stpass $(INDICES)
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" | ./filter.sh 2>&1
book-1stpass: cedilla
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" > error.log 2>&1 && \
	$(PDFLATEX) $(PDFFLAGS) "$(PROJECT).tex" > error.log 2>&1

tutoring: cedilla
	$(PDFLATEX) $(PDFFLAGS) "Tutoring.tex" > error.log 2>&1 && \
	$(MAKEINDEX) $(MAKEINDEXFLAGS) *.idx && \
	$(PDFLATEX) $(PDFFLAGS) "Tutoring.tex" > error2.log 2>&1
clean:
	rm -rf *.{aux,log,out,loe,ilg,ind,idx,pyg}
	find . -type f -name "*~" -exec rm {} \;
	find . -type f -name "*.aux" -exec rm {} \;
	rm -rf *.{toc,pdf}
push:
	git co stable && git push && git co integration && git merge stable && git push
cedilla:
	$(R-CEDILLA)
