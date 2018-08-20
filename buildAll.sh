#!/bin/sh

ROOTDIR="$(pwd)"
TEXSTYLEDIR="$ROOTDIR/src/TeXStyle"
TEXSTYLEARTDIR="$ROOTDIR/src/TeXStyle-article"

JOBNAME="test"

compile_command () {
  echo "compiling document in $1, jobname $2"
  cd "$1"
  xelatex -output-directory=out -jobname="$2" -interaction=batchmode -halt-on-error build.dtx
}

if [[ -n "$1" ]]; then
  JOBNAME="$1"
fi

echo "Compiling with jobname $JOBNAME"

echo "First compile"
echo "####################################################################################################"
compile_command "$TEXSTYLEDIR" "$JOBNAME"
compile_command "$TEXSTYLEARTDIR" "$JOBNAME-article"
echo

echo "Second compile"
echo "####################################################################################################"
compile_command "$TEXSTYLEDIR" "$JOBNAME"
compile_command "$TEXSTYLEARTDIR" "$JOBNAME-article"
