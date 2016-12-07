all: book.pdf

book.pdf: book.tex
	pdflatex book
	bibtex book
	pdflatex book
	pdflatex book

remake: clean all

clean:
	rm -f book.pdf
