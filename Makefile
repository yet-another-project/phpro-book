R-CEDILLA=$(shell ./diacritice.sh)
PDFLATEX=xelatex
PDFFLAGS=-halt-on-error -interaction=nonstopmode -file-line-error
PROJECT="Dezvoltare web cu PHP"

.PHONY: clean push cedilla

pdf: cedilla
	$(PDFLATEX) $(PDFFLAGS) $(PROJECT).tex > error.log 2>&1 && \
	$(PDFLATEX) $(PDFFLAGS) $(PROJECT).tex > error2.log 2>&1
	$(PDFLATEX) $(PDFFLAGS) $(PROJECT).tex | ./filter.sh 2>&1
preview: cedilla
	$(PDFLATEX) $(PDFFLAGS) $(PROJECT)-preview.tex > error.log 2>&1 && \
	$(PDFLATEX) $(PDFFLAGS) $(PROJECT)-preview.tex | ./filter.sh && \
	mv $(PROJECT)-preview.pdf "dezvoltare_web_cu_php-$(shell date +'%d_%m_%Y').pdf"
clean:
	rm -rf *.{aux,log,out,loe,ilg,ind,idx}
	find . -type f -name "*~" -exec rm {} \;
	find . -type f -name "*.aux" -exec rm {} \;
	rm -rf *.{toc,pdf}
push:
	git co stable && git push && git co integration && git merge stable && git push
cedilla:
	$(R-CEDILLA)
