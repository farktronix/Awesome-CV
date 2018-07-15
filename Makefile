.PHONY: examples

TEX = xelatex
RESUME_DIR = resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

all: $(foreach x, coverletter resume, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(TEX) $<
	open resume.pdf

coverletter.pdf: coverletter.tex
	$(TEX) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
