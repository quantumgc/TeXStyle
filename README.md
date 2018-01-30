# TeXStyle

This is a LaTeX style that I use for most of the documents I write. While this mostly consists of several packages that I've often used brought together into one, there are some modifications to make them work well together/look acceptable.

## How to use the style

+ Download the file MyStyle.sty, either by cloning the git repository entirely or just downloading the file on its own.
+ Place it somewhere on your latex path, your project folder should work in most cases.
+ Include the command `\usepackage{MyStyle}` somewhere in the preamble.

## Additional Macros/Tweaks

### Draft Mode

+ A4 page set in B4 paper with the extra space allocated to margin comments.
+ `\marEmp{emphasis}{note}{size}` emphasise a piece of text at the start of the note.
+ `\marNote{note}{size}` a note to the side of the page.

### Math Mode

+ `\mat{arg}` formats arg in bold, for code legibility when dealing with matrices.
+ `\nImplies`, `\nImplied` and `\nEquiv` for negated right, left and double-headed arrows respectively. For succinctness.
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

## To-Do

+ Add bibliography support
+ Write more Header/Footer customisation
+ Configure default graphics details
+ Add template files