.PHONY: examples

TEX = xelatex
RESUME_DIR = resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

all: $(foreach x, coverletter resume, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(TEX) $<
	open resume.pdf
	convert -density 400 -depth 8 -background white -alpha remove resume.pdf -resize 33% resume.png

coverletter.pdf: coverletter.tex
	$(TEX) $<

clean:
	rm -rf *.pdf
