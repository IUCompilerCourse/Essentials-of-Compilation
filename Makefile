
.PHONY: all cont continuous clean publish

LATEXMK= latexmk -outdir=./build -pdf

all:
	$(LATEXMK) book.tex

cont: continuous
continuous:
	$(LATEXMK) -pvc book.tex

clean:
	$(LATEXMK) -C book.tex

# Specific to Fall16:
publish:
	scp build/book.pdf tank.soic.indiana.edu:p523-web/book.pdf
