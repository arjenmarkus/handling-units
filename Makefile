SHELL=/bin/bash
SRC=src/handling_units_dimensions.tex
GRAPH_SRCS=
GRAPHS=$(GRAPH_SRCS:.gv=.pdf)

all: $(GRAPHS)
	rubber --pdf --into tex $(SRC)

clean:
	rubber --clean	--into tex $(SRC)

count:
	texcount $(SRC)

diff: DIFF_FILE_CMD=$(shell latexdiff-vc src/handling_units_dimensions.tex -r origin/main --force|grep Generated|cut -d\  -f4)

diff: $(GRAPHS)
	rubber --pdf --into tex $(DIFF_FILE_CMD)
	rubber --clean --into tex $(DIFF_FILE_CMD)

spellcheck: $(SRC).txt
	codespell -I dictionary.txt $(SRC).txt

%.txt: %
	textidote --clean $^ > $@

%.pdf: %.gv
	dot -Tpdf $^ > $@

.PHONY: all clean count diff spellcheck
