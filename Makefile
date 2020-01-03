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

.PHONY : clean
clean :
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(notes_dir)/out/*

.PHONY : install
install :
	cp build/*.pdf $(docs_dir)/
	cp build/texstyle.sty $(install_dir)/
	cp build/texstyle-notes.cls $(install_dir)/
