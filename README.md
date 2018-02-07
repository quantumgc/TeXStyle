# TeXStyle

This is a LaTeX style that I use for most of the documents I write. While this mostly consists of several packages that I've often used brought together into one, there are some slight modifications to make them work well together/look acceptable.

## How to use the style

TeXStyle is a single style split across several files, as a result you might need to do some fiddling to get it to work correctly.

### Linux/TeXLive

Create the directory `~/texmf/tex/latex/TeXStyle` and copy/symlink `TeXStyle.sty` as well as the folders `classes` and `components` to it. I may add a script to automate this in the future.

## Additional Macros/Tweaks

### Draft Mode

+ `\marEmp{emphasis}{note}{size}` emphasise a piece of text at the start of the note.
+ `\marNote{note}{size}` a note to the side of the page.

### Math Mode

+ `\implied`, `\nImplies`, `\nImplied` and `\nEquiv` for left, negated right, negated left and negated double-headed arrows respectively. For succinctness.
+ `\Cont` adds a text reference mark to represent a contradiction for proofs.
+ Inverse hyperbolic functions

### Referencing Labels

+ `\PagRef{arg}` provides a reference to a label with the page it can be found on.
+ `\QuickRef{arg}` provides a reference to just the label.

### Environments

+ Theorems
  + Corollaries
  + Lemmas
+ Examples
  + Example
+ Definitions
  + Sub-definitions (`subDef`)
+ Propositions
  + Sub-propositions (`subProp`)

and unnumbered variants thereof. Also included is a semi-customised listings environment.

## Classes

Currently, only a default class with customised spacing and an A4 page set in B4 paper with the extra space allocated to margin comments when draft mode is turned on.

## To-Do

+ Add bibliography support
+ Write more Header/Footer customisation
+ Configure default graphics details
+ Add template files
+ Add multicols configured environment