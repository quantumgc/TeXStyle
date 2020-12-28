# Changelog

## [0.0.7]

### bugfixes

+ Fixed an issue in `texstyle` where using the `defaultFonts` option would raise an exception

### additions

+ added the `fontPath` option to set the font directory
+ added two new blackboard bold macros:
  - `\QQ` for ℚ
  - `\PP` for ℙ

### removals

### changes

+ `latexmk` is now used to build the docs as opposed to stock `lualatex`
+ Some of the blackboard bold macros have changed:
  - `\ZZ` replaces `\Z`, this prints ℤ
  - `\RR` replaces `\R`, this prints ℝ

## [0.0.6]

This version mainly focuses on getting the build system into a usable state.
There weren't any changes to how texstyle itself works, but the makefile and install process have been completely redone. I won't go into the details in this changelog. I'll leave that to the documentation.

## [0.0.5]

### bugfixes

+ HyperrefMacros option
+ theorem conflicts with `beamer`, theorem envs are no longer loaded in `beamer`
+ texstyle-notes file extension now fixed
+ issue where certain fonts wouldn't load

### additions

+ makefile and configure script
  + configure checks for the environment variable `TEXMFLOCAL` which it expects
    to be set to the location of a local texmf tree.
+ unumbered theorem environments

### removals

+ `gensymb`
+ redundant Build.dtx
+ prepare script

### changes

+ capitalisation of package names, all lowercase now
+ mono font is now `IBMPlexMono`
+ length scales are now unified

## [0.0.4d2]

### bugfixes

### additions

+ added new `envRefreshLevel` option which sets at what level the numbering on
  the theorems, propositions, etc. refresh.

### removals

### changes

+ **major change**: the class `texstyle-article` is now called `texstyle-notes`.
  any document using the `texstyle-article` class will need to change the
  document class to reflect this.
  this change was made due to how divorced `texstyle-article` became from the
  stock `article` class.
  in the future, a slimmer article class will be made as a replacement.

+ now using `kvoptions` to process package options.

## [0.0.3d2]

### Bugfixes

+ Temporary fix for an issue with the font becoming white on a page split in
  theorem environments.

## [0.0.3d2]

### Additions

+ Now able to use `hyperref`'s `autoref` macro to reference theorems with
  correct labelling.
  For this to work, `hyperref` must either be loaded before `TeXStyle` or loaded
  afterwards with a `useHyperrefMacros` option passed to TeXStyle.
  *(Partially Document)*
+ Changed load order of TeXStyle-article to reflect above changes.
  

### Changes

* Now using `amssymb`, `amsmath` and `centernot` instead of `fdsymbol` as the
  math font. *(Documented)*
+ Upped minor version number

## [0.0.2]

### Additions

+ CHANGELOG and version information.
+ Documentation for TeXStyle-article.
+ Custom headers for TeXStyle-article.
+ PDF metadata.

### Removals

- All packages relating to referencing.

## [0.0.1]

Pre-alpha release, feature list incomplete and not mentioned.
