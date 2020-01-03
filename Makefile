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
texstyle_objs := $(addprefix $(texstyle_dir)/out/,texstyle.sty texstyle.pdf)

notes_preqs := \
$(addprefix $(notes_dir)/,$(addsuffix .dtx, \
texstyle-notes options document headers)) \
$(addprefix $(common_dir)/,$(addsuffix .dtx, \
colours glyphs environments))
notes_objs := $(addprefix $(notes_dir)/out/,texstyle-notes.cls texstyle-notes.pdf)

$(texstyle_objs) : $(texstyle_preqs)
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx

$(notes_objs) : $(notes_preqs)
	cp $(texstyle_dir)/out/texstyle.sty $(notes_dir)/
	@cd $(notes_dir) && xelatex --output-directory=./out texstyle-notes.dtx
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx

.PHONY : build
build : $(texstyle_objs) $(notes_objs)
	cp $(texstyle_objs) build/
	cp $(notes_objs) build/

.PHONY : texstyle
texstyle : $(texstyle_objs)
	cp $(texstyle_objs) build/


.PHONY : texstyle-notes
texstyle-notes : $(notes_objs)
	cp $(notes_objs) build/

.PHONY : clean
clean :
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(notes_dir)/out/*

.PHONY : install
install :
	cp build/*.pdf $(docs_dir)/
	cp build/texstyle.sty $(install_dir)/
	cp build/texstyle-notes.cls $(install_dir)/
