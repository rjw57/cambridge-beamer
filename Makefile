TEX_SRCS=examples/beamerexample-conference-talk.tex

LATEXMK := latexmk -pdf -pdflatex="xelatex %O %S"
BUILD_DIR := build
PDF_DIR := pdf

.DEFAULT: all
.PHONY: all
all: $(addprefix $(PDF_DIR)/, $(TEX_SRCS:.tex=.pdf))

.PHONY: clean
clean:
	rm -rf "$(BUILD_DIR)" "$(PDF_DIR)"

$(PDF_DIR)/%.pdf: %.tex
	mkdir -p "$(BUILD_DIR)/$*"
	$(LATEXMK) -outdir="$(BUILD_DIR)/$*" "$<"
	mkdir -p "$(dir $@)"
	cp "$(BUILD_DIR)/$*/$(notdir $*).pdf" "$@"
