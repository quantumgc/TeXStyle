SHELL := /bin/sh
working_dir := $(@pwd)
install_dir := ${TEXMFLOCAL}/tex/latex/texstyle
docs_dir := ${TEXMFLOCAL}/doc

texstyle_dir := src/texstyle
texstyle_preqs := $(addprefix $(texstyle_dir)/,environments.dtx glyphs.dtx \
graphics.dtx miscChanges.dtx texstyle.dtx)
texstyle_objs := $(addprefix $(texstyle_dir)/out/,texstyle.sty texstyle.pdf)

texstyle_notes_dir := src/texstyle-notes
texstyle_notes_preqs := $(addprefix $(texstyle_notes_dir)/,source.dtx texstyle-notes.dtx)
texstyle_notes_objs := $(addprefix $(texstyle_notes_dir)/out/,texstyle-notes.cls texstyle-notes.pdf)

$(texstyle_objs) : $(texstyle_preqs)
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx

$(texstyle_notes_objs) : $(texstyle_notes_preqs)
	cp $(texstyle_dir)out/texstyle.sty $(texstyle_notes_dir)/
	@cd $(texstyle_notes_dir) && xelatex --output-directory=./out texstyle-notes.dtx
	@cd $(texstyle_dir) && xelatex --output-directory=./out -jobname=texstyle texstyle.dtx

.PHONY : build
build : $(texstyle_objs) $(texstyle_notes_objs)
	cp $(texstyle_objs) build/
	cp $(texstyle_notes_objs) build/

.PHONY : texstyle
texstyle : $(texstyle_objs)
	cp $(texstyle_objs) build/


.PHONY : texstyle-notes
texstyle-notes : $(texstyle_notes_objs)
	cp $(texstyle_notes_objs) build/

.PHONY : clean
clean :
	rm -rf $(texstyle_dir)/out/*
	rm -rf $(texstyle_notes_dir)/out/*

.PHONY : install
install :
	cp build/*.pdf $(docs_dir)/
	cp build/texstyle.sty $(install_dir)/
	cp build/texstyle-notes.cls $(install_dir)/
