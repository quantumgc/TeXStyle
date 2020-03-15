# ![TeXStyle](graphics/logo.png)

This is a `LaTeX` style that I use for most of the documents I write, along
with a few classes that make use of and extend it. While this mostly consists of
several packages that I've often used brought together into one, there are some
slight modifications to make them work well together/look acceptable.

## Installation

You can either compile the style and documentation yourself or install it using
pre-built sources.

### Compiling from Source

To compile it yourself, you will need:

+ GNU Make
+ A LaTeX installation, this has been tested against texlive 2019

**Note**: You will need to set the `TEXMFLOCAL` environment variable before
compiling. If you don't want to install texstyle system-wide, you can set this
to `~/.cache`.

+ Run `configure`, this will make the required directories and check for any
  necessary environment variables.
+ Run `make (docs|docs-texstyle|docs-notes)` to generate the appropriate target.
+ This should generate, among other things, the source and documentation files
  for the project in `src/<sub-project>/out`
+ Install the files by running `make install`.

### Installing Pre-Built Source

If you've acquired a pre-built source archive, you will need to extract the
files to a directory that is visible to your TeX compiler. For platform specific
instructions on where this might be, see the [platform
guide](./docs/platform.md).

Please note that for the style or class to work out of the box, you will need to
copy the fonts to either the root of the project directory or 
