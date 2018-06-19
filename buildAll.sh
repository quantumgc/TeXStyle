#!/usr/bin/bash

cd ./src/TeXStyle
xelatex -output-directory=out -jobname=test build.dtx
cd ./src/TeXStyle-article
xelatex -output-directory=out -jobname=test build.dtx
