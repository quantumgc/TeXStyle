# TeXStyle

This is a `/(Xe|pdf)?LaTeX/` style that I use for most of the documents I write.
While this mostly consists of several packages that I've often used brought together into one, there are some slight modifications to make them work well together/look acceptable.
Also contained are several classes that further refine the style.

## Installation

TeXStyle can be installed either through the use of pre-built packages and classes (recommended) or by generating packages from source yourself.

### Installing Pre-Built Source

Download the latest version from the [build folder](link plox) and extract the files to a directory that is visible to your TeX compiler.
For platform specific instructions on where this might be, see the [platform guide](./docs/platform.md).

### Compiling from Source

Currently only verified for linux users, I'll distribute a dockerfile later if I get round to it.

Clone the repository and navigate to the `src` directory.
Make a new directory named `tmp`.
Execute the command `xelatex -jobname=tmp/TestBuild Build.dtx` and check that `tmp` contains, among other things, the files:

+ Build.readme
+ TestBuild.log
+ TestBuild.pdf
+ TeXStyle.ins
+ TeXStyle.sty
+ some files matching `/^TeXStyle-[A-z]+\.cls$/`

If this is the case, the build was successful and all files matching `/^TeXStyle(-[A-z]+\.cls|\.sty)$/` can be moved into a directory visible to your TeXCompiler.

## Documentation

TeXStyle comes with documentation generated using the `docstrip` utility.
This should be included as `TeXStyle-Documentation.pdf` with an up to date build.
For those compiling the source themselves, this is the `TestBuild.pdf` file.