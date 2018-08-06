#!/usr/bin/bash

cd ./src/TeXStyle
xelatex -output-directory=out -jobname=test build.dtx
cd ../TeXStyle-article
xelatex -output-directory=out -jobname=test build.dtx
