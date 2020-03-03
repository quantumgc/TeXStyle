SHELL := /bin/sh
LUALATEX := lualatex --interaction=nonstopmode --output-directory ./out
VERSION := 0.0.6

working_dir := $(@pwd)
install_dir := ${TEXMFLOCAL}/tex/latex/texstyle
docs_dir := ${TEXMFLOCAL}/doc
texstyle_dir := src/texstyle
notes_dir := src/notes
common_dir := src/common

texstyle_preqs := \
$(addprefix $(texstyle_dir)/,$(addsuffix .dtx, \
texstyle options graphics)) \
$(addprefix $(common_dir)/,$(addsuffix .dtx, \
colours glyphs environments))

notes_preqs := \
$(addprefix $(notes_dir)/,$(addsuffix .dtx, \
texstyle-notes options document headers)) \
$(addprefix $(common_dir)/,$(addsuffix .dtx, \
colours glyphs environments))

# Building
.PHONY : build texstyle notes
texstyle $(texstyle_dir)/out/texstyle.sty : $(texstyle_preqs)
	rm -rf $(texstyle_dir)/out/*
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.ins

notes $(notes_dir)/out/texstyle-notes.cls : $(notes_preqs)
	rm -rf $(notes_dir)/out/*
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.ins

build : $(texstyle_preqs) $(notes_preqs)
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(notes_dir)/out/*
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.ins
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.ins

# Testing
.PHONY : test test-texstyle test-notes
test-texstyle : $(texstyle_dir)/out/texstyle.sty
	for file in $(texstyle_preqs); do \
		chktex -q $$file ; \
    done
	chktex -q $(texstyle_dir)/out/texstyle.sty
	for file in $(texstyle_preqs); do \
		lacheck $$file ; \
    done
	lacheck $(texstyle_dir)/out/texstyle.sty

test-notes : $(notes_dir)/out/texstyle-notes.cls
	for file in $(notes_preqs); do \
		chktex -q $$file ; \
    done
	chktex -q $(notes_dir)/out/texstyle-notes.cls
	for file in $(notes_preqs); do \
		lacheck $$file ; \
    done
	lacheck $(notes_dir)/out/texstyle-notes.cls

test : $(texstyle_dir)/out/texstyle.sty $(notes_dir)/out/texstyle-notes.cls
	for file in $(texstyle_preqs); do \
		chktex -q $$file ; \
    done
	chktex -q $(texstyle_dir)/out/texstyle.sty
	for file in $(texstyle_preqs); do \
		lacheck $$file ; \
    done
	lacheck $(texstyle_dir)/out/texstyle.sty
	for file in $(notes_preqs); do \
		chktex -q $$file ; \
    done
	chktex -q $(notes_dir)/out/texstyle-notes.cls
	for file in $(notes_preqs); do \
		lacheck $$file ; \
    done
	lacheck $(notes_dir)/out/texstyle-notes.cls

# Documentation
.PHONY : docs docs-texstyle docs-notes
docs-texstyle $(texstyle_dir)/out/texstyle.pdf : $(texstyle_dir)/out/texstyle.sty
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.dtx
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.dtx

docs-notes $(notes_dir)/out/texstyle-notes.pdf : \
$(notes_dir)/out/texstyle-notes.cls  $(texstyle_dir)/out/texstyle.sty
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.dtx
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.dtx

docs : $(texstyle_dir)/out/texstyle.sty $(notes_dir)/out/texstyle-notes.cls
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.dtx
	@cd $(texstyle_dir) && $(LUALATEX) texstyle.dtx
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.dtx
	@cd $(notes_dir)    && $(LUALATEX) texstyle-notes.dtx

# Cleaning, installation and packaging
.PHONY : clean install package
clean :
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(notes_dir)/out/*
	rm -rf tmp/

install : \
$(addprefix $(texstyle_dir)/out/texstyle,.sty .pdf)\
$(addprefix $(notes_dir)/out/texstyle-notes,.cls .pdf)
	mkdir tmp
	cp $(addprefix $(texstyle_dir)/out/texstyle,.sty .pdf) tmp/
	cp $(addprefix $(notes_dir)/out/texstyle-notes,.cls .pdf) tmp/
	mv tmp/texstyle.pdf tmp/texstyle-notes.pdf $(docs_dir)/
	mv tmp/texstyle.sty tmp/texstyle-notes.cls $(install_dir)/
	rmdir tmp

# Packaging
package : \
$(addprefix $(texstyle_dir)/out/texstyle,.sty .pdf)\
$(addprefix $(notes_dir)/out/texstyle-notes,.cls .pdf)
	mkdir tmp
	mkdir tmp/docs

	cp README.md tmp/
	cp LICENSE tmp/
	cp -r fonts tmp/
	cp $(addprefix $(texstyle_dir)/out/texstyle,.sty .pdf) tmp/
	mv tmp/texstyle.pdf tmp/docs/
	cp $(addprefix $(notes_dir)/out/texstyle-notes,.cls .pdf) tmp/
	mv tmp/texstyle-notes.pdf tmp/docs/
	cp --parents `find ./src -name \*.dtx` tmp/

	ls -R tmp
	mkdir "builds/${VERSION}"
	mv tmp "texstyle-${VERSION}"
	zip -r "builds/${VERSION}/texstyle-${VERSION}.zip" "texstyle-${VERSION}"
	tar -cz -f "builds/${VERSION}/texstyle-${VERSION}.tar.gz" "texstyle-${VERSION}/"
	rm -rf "texstyle-${VERSION}"
