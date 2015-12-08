#!/bin/bash
# This script is to generated the thesis is several formats.

# If no argument supplied, apply on thesis
[ -z "$1" ] && filename="thesis" || filename="$1"

# Go in the real directory of this script.
dirpath=`dirname $(realpath $0)`
cd $dirpath

# Some conversions. Please beware the tex format is not the only source.
if [ ! -f $filename.tex ];
then
    echo "No $filename.tex found in $dirpath, exiting."
    exit -1
else
	pandoc --toc -f latex -t rst -s $filename.tex -o $filename.rst &> /dev/null
	pandoc --toc -f rst -t markdown -s $filename.rst -o $filename.txt &> /dev/null
	pandoc --toc -f latex -t markdown -s $filename.tex -o $filename.md &> /dev/null
	pandoc --toc -f latex -t docx -s $filename.tex -o $filename.docx &> /dev/null
fi
