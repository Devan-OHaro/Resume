# Makefile for Resume Project

# Main directories
MAIN_DIR := .
RESUME_DIR := resumes
COVER_LETTER_DIR := cover_letters

# Output files
RESUME_OUTPUT := $(MAIN_DIR)/Resume.pdf
COVER_LETTER_OUTPUT := $(MAIN_DIR)/CoverLetter.pdf

# Main .tex files
RESUME_MAIN := $(RESUME_DIR)/main.tex
COVER_LETTER_MAIN := $(COVER_LETTER_DIR)/main.tex

# Directories for dependencies
TEX_DIRS := $(RESUME_DIR) $(COVER_LETTER_DIR) bibliography styles

# LaTeX compiler
LATEX := pdflatex
LATEX_FLAGS := -jobname 

# Pattern rules for building PDFs
.PHONY: all clean

all: $(RESUME_OUTPUT) $(COVER_LETTER_OUTPUT)

# Build Resume PDF
$(RESUME_OUTPUT): $(RESUME_MAIN) $(wildcard $(RESUME_DIR)/sections/*.tex) \
                  $(wildcard $(RESUME_DIR)/figures/*) \
                  $(wildcard $(TEX_DIRS)/*)
	cd $(RESUME_DIR) && $(LATEX) $(LATEX_FLAGS) Resume -output-directory=../ $(RESUME_MAIN) && cd ../
	cd $(RESUME_DIR) && $(LATEX) $(LATEX_FLAGS) Resume -output-directory=../ $(RESUME_MAIN) && cd ../

# Build Cover Letter PDF
$(COVER_LETTER_OUTPUT): $(COVER_LETTER_MAIN) $(wildcard $(COVER_LETTER_DIR)/sections/*.tex) \
                        $(wildcard $(COVER_LETTER_DIR)/figures/*) \
                        $(wildcard $(TEX_DIRS)/*)
	cd $(COVER_LETTER_DIR) && $(LATEX) $(LATEX_FLAGS) Cover_Letter -output-directory=../ $(COVER_LETTER_MAIN) && cd ../
	cd $(COVER_LETTER_DIR) && $(LATEX) $(LATEX_FLAGS) Cover_Letter -output-directory=../ $(COVER_LETTER_MAIN) && cd ../

# Clean up auxiliary files
clean:
	rm -f $(MAIN_DIR)/*.aux $(MAIN_DIR)/*.log $(MAIN_DIR)/*.out \
	      $(MAIN_DIR)/*.toc $(MAIN_DIR)/*.lof $(MAIN_DIR)/*.lot

