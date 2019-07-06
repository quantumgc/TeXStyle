texstyle_dir := src/texstyle/
texstyle_preqs := $(addprefix $(texstyle_dir),environments.dtx glyphs.dtx \
graphics.dtx miscChanges.dtx texstyle.dtx)

texstyle_notes_dir := src/texstyle-notes
texstyle_notes_preqs := $(addprefix $(texstyle_notes_dir),source.dtx,texstyle-notes.dtx)

texstyle.sty texstyle.pdf: $(texstyle_preqs)
	cd $(texstyle_dir)
	lualatex --output-directory
