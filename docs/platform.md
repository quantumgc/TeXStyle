# Platform Specific Changes

Given that TeX runs on a number of platforms, there are a number of settings that need to be tweaked in order to make TeXStyle work well on all of them.
If the instructions in this document are followed, the command `\usepackage{TeXStyle}` should work in all projects on that machine (except for the browser based case).

## Contents

1. [Browser based](#browser-based)
1. [Windows](#windows)
1. [Linux](#linux)
1. Mac

## Browser based

Browser based TeX editors rely on a web browser to edit the TeX source and use a server to compile the source into a document.
As such, they are somewhat limited when it comes to installing packages.

One method that is guaranteed of making a package visible to the compiler is placing it in the project root folder.
The compiler will definitely see the package on compilation and should run without any trouble.
The downside of this is that the file will not be visible to any other projects and this will have to be repeated for each project you intend to use `TeXStyle` with.

That being said, your platform of choice may have varying restrictions and freedoms on what can and cannot be done.
Before you attempt to use anything, read the documentation your platform provides on installing packages.

## Windows

Windows users using TeXStudio are probably using [MiKTeX](https://miktex.org/) as a back-end.
If you know this isn't the case and you're using [TeXLive](https://www.tug.org/texlive/) or something else, you probably know where to find help when it comes to installing packages from source and don't need to read this.

Those who are using MiKTeX should read up on the `texmf` folder and what it's used for.
A good start is [this SE thread](https://tex.stackexchange.com/questions/420620/what-is-texmf-and-what-is-its-relation-to-tex/420623) (don't worry about the fact that it's for Linux, this applies to most TeX distributions).
Once you've understood that, [this](https://tex.stackexchange.com/questions/69483/create-a-local-texmf-tree-in-miktex#69484) thread should tell you how to create a local tree.

In your local `texmf` tree place `TeXStyle.sty` and whatever class files you want in an appropriate subdirectory.

## Linux

A default install of TeXLive generates a `~/texmf` directory which should be used to install local packages.
Read [the thread](https://tex.stackexchange.com/questions/420620/what-is-texmf-and-what-is-its-relation-to-tex/420623) mentioned earlier and place `TeXStyle.sty` and whatever class files you want in an appropriate subdirectory.

## Mac

MacTeX is literally repackaged LaTeX.
Since macOS is also a *NIX at a [core](https://www.opengroup.org/openbrand/register/brand3632.htm "officially, macOS can be called UNIX compliant while Linux can't") level, the installation instructions shouldn't be too different from those for Linux.