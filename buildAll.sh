#!/usr/bin/bash

JOBNAME="test"

if [[ -n "$1" ]]; then
  JOBNAME="$1"
fi

echo "Compiling with jobname $JOBNAME"

cd ./src/TeXStyle
xelatex -output-directory=out -jobname="$JOBNAME" build.dtx
cd ../TeXStyle-article
xelatex -output-directory=out -jobname="$JOBNAME""-article" build.dtx
