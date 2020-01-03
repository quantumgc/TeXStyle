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
	chktex $(texstyle_dir)/out/texstyle.sty

test-notes : $(notes_dir)/out/texstyle-notes.cls
	chktex $(notes_dir)/out/texstyle-notes.cls

test : $(texstyle_dir)/out/texstyle.sty $(notes_dir)/out/texstyle-notes.cls
	chktex $(texstyle_dir)/out/texstyle.sty
	chktex $(notes_dir)/out/texstyle-notes.cls

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

.PHONY : clean
clean :
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(notes_dir)/out/*

.PHONY : install
install :
	cp build/*.pdf $(docs_dir)/
	cp build/texstyle.sty $(install_dir)/
	cp build/texstyle-notes.cls $(install_dir)/
