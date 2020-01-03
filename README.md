# ![TeXStyle](graphics/logo.png)

This is a `XeLaTeX` style that I use for most of the documents I write, along
with a few classes that make use of and extend it. While this mostly consists of
several packages that I've often used brought together into one, there are some
slight modifications to make them work well together/look acceptable.

## Installation

Currently, the only way to install the style is to compile it yourself.
You will need:

+ GNU Make
+ A LaTeX installation, this has been tested against texlive 2019

### Compiling from Source

**Note**: You will need to set the `TEXMFLOCAL` environment variable before
compiling. If you don't want to install texstyle system-wide, you can set this
to `~/.cache`.

+ Run `configure`, this will make the required directories and check for any
  necessary environment variables.
+ Run `make (build|texstyle|texstyle-notes)` to generate the appropriate target.
+ This should generate, among other things, the source and documentation files
  for the project in the build directory.
+ Install the files by running `make install`.

### Installing Pre-Built Source

If you've acquired a pre-built source file from somewhere, you will need to
extract the files to a directory that is visible to your TeX compiler. For
platform specific instructions on where this might be, see the [platform
guide](./docs/platform.md).
