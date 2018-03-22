# TeXStyle

This is a `/(Xe|pdf)?LaTeX/` style that I use for most of the documents I write, along with a few classes that make use of and extend it.
While this mostly consists of several packages that I've often used brought together into one, there are some slight modifications to make them work well together/look acceptable.

## Installation

TeXStyle can be installed either through the use of pre-built packages and classes (recommended) or by generating packages from source yourself.

### Installing Pre-Built Source

Download the latest version from the [build folder](link plox) and extract the files to a directory that is visible to your TeX compiler.
For platform specific instructions on where this might be, see the [platform guide](./docs/platform.md).

### Compiling from Source

Currently, compiling from source is only supported for linux users.

#### Styles and Classes

This will generate the `TeXStyle.sty` package file, the associated documentation for `TeXStyle.sty` and the `TeXStyle-*.cls` class files.
It will not generate the documentation for the class files.


1. Clone the repository and navigate to the `src` directory.
1. Make a new directory named `tmp`.
1. Execute the command `xelatex -jobname=tmp/TestBuild Build.dtx` and check that `tmp` contains, among other things, the files:
    * `Build.readme`
    * `TestBuild.log`
    * `TestBuild.pdf`
    * `TeXStyle.ins`
    * `TeXStyle.sty`
    * `TeXStyle-*.cls`
1. If this is the case, the build was successful and TeXStyle.sty and any of the class files you want can be moved into a directory visible to your TeXCompiler.

#### Documentation for classes

Due to the nature of `docstrip`, the classes need a separate build file for their documentation.
This hasn't been put into the repository at the time of writing, but to those versed in the ways of `docstrip` it shouldn't be too difficult to write one.
If you need an example, [`Build.dtx`](./src/Build.dtx) is a good start.