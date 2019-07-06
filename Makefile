SHELL := /bin/sh
working_dir := $(@pwd)

texstyle_dir := src/texstyle/
texstyle_preqs := $(addprefix $(texstyle_dir),environments.dtx glyphs.dtx \
graphics.dtx miscChanges.dtx texstyle.dtx)
texstyle_objs := $(addprefix $(texstyle_dir)out/,texstyle.sty texstyle.pdf)

texstyle_notes_dir := src/texstyle-notes
texstyle_notes_preqs := $(addprefix $(texstyle_notes_dir),source.dtx texstyle-notes.dtx)
texstyle_notes_objs := $(addprefix $(texstyle_notes_dir)out/,texstyle-notes.cls texstyle-notes.pdf)

$(texstyle_objs) : $(texstyle_preqs)
	@cd $(texstyle_dir) && luatex --output-directory=./out texstyle.dtx

$(texstyle_notes_objs) : $(texstyle_notes_preqs)
	cp $(texstyle_dir)out/texstyle.sty $(texstyle_notes_dir)
	@cd $(texstyle_notes_dir) && luatex --output-directory=./out texstyle-notes.dtx

.PHONY : build
build : $(texstyle_objs) $(texstyle_notes_objs)
	cp $(texstyle_dir)out/texstyle.sty .
	cp $(texstyle_dir)out/texstyle.pdf .
	cp $(texstyle_notes_dir)out/texstyle-notes.cls .
	cp $(texstyle_notes_dir)out/texstyle-notes.pdf .


.PHONY : clean
clean :
	rm -rf $(texstyle_dir)/out
	rm -rf $(texstyle_notes_dir)/out
