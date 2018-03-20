# Platform Specific Changes

Given that TeX runs on a number of platforms, there are a number of settings that need to be tweaked in order to make TeXStyle work well on all of them.

## Contents

1. [Browser based](#browser-based)
1. Windows
1. Mac
1. Linux

## Browser based

Browser based TeX editors rely on a web browser to edit the TeX source and use a server to compile the source into a document.
As such, they are somewhat limited when it comes to installing packages.

One method that is guaranteed of making a package visible to the compiler is placing it in the project root folder.
The compiler will definitely see the package on compilation and should run without any trouble.

That being said, your platform of choice may have further restrictions on what can and cannot be done.
Before you attempt to use anything, read the documentation your platform provides on installing packages.

## Windows

Windows users using TeXStudio are probably using [MiKTeX](https://miktex.org/) as a back-end.
If you know this isn't the case and you're using [TeXLive](https://www.tug.org/texlive/), you probably know where to find help when it comes to installing packages from source and don't need to read this.

Those who are using MiKTeX should read up on the `texmf` folder and what it's used for.
A good start is [this SE thread](https://tex.stackexchange.com/questions/420620/what-is-texmf-and-what-is-its-relation-to-tex/420623) (don't worry about the fact that it's for Linux, this applies to most TeX distributions).
Once you've understood that, [this](https://tex.stackexchange.com/questions/69483/create-a-local-texmf-tree-in-miktex#69484) thread should tell you how to create a local tree and install packages.

## Mac

Good joke.

## Linux

If you've gotten this far, you should know what to do by now.