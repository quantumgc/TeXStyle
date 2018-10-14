# Changelog

## [0.0.3d2]

### Additions

+ Now able to use `hyperref`'s `autoref` macro to reference theorems with
  correct labelling.
  For this to work, `hyperref` must either be loaded before `TeXStyle` or loaded
  afterwards with a `useHyperrefMacros` option passed to TeXStyle.
  *(Partially Document)*
  

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
