# ![TeXStyle](graphics/logo.png)

This is a `XeLaTeX` style that I use for most of the documents I write, along with a few classes that make use of and extend it.
While this mostly consists of several packages that I've often used brought together into one,
there are some slight modifications to make them work well together/look acceptable.

## Installation

TeXStyle can be installed either through the use of pre-built packages and classes (recommended) or by generating packages from source yourself.

### Installing Pre-Built Source

Download the latest version from the [build folder](https://mega.nz/#F!ikFXXJyS!GfjAadqWMMIBercQpy-3uw)
(currently a personal MEGA folder, I'll figure out a better solution later)
and extract the files to a directory that is visible to your TeX compiler.
For platform specific instructions on where this might be, see the [platform guide](./docs/platform.md).

### Compiling from Source

Currently, compiling from source is only supported for Linux.
You're welcome to adapt these instructions for another OS, but YMMV.

+ Run [`prepare.sh`](./prepare.sh), this creates the necessary directories for the build files to appear in.
+ Change to the directory containing the project you want to build.
+ Run `xelatex -output-directory=out -jobname=test build.dtx` changing names as appropriate.
+ This should generate, among other things, the source and documentation files for the project in the out directory.
