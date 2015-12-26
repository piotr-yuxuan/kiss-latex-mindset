#!/bin/bash
# This script is to generated the thesis is several formats.
# A known bug is handling $ in environment minted.

# If no argument supplied, apply on thesis
[ -z "$1" ] && filename="thesis" || filename="$1"

args=" --parse-raw --toc "

# Some conversions. Please beware the tex format is not the only source.
if [ ! -f $filename.tex ];
then
    echo "No $filename.tex found in $dirpath, exiting."
    exit -1
else
	# Go in the real directory of this script (likely ../data).
	dirpath=`dirname $(realpath $filename.tex)`
	cd $dirpath
	# Work with formats
	pandoc $args -f latex -t rst -s $filename.tex -o $filename.rst
	pandoc $args -f rst -t markdown -s $filename.rst -o $filename.txt
	pandoc $args -f latex -t markdown -s $filename.tex -o $filename.md
	pandoc $args -f latex -t docx -s $filename.tex -o $filename.docx
	pandoc $args -f latex -t epub -s thesis.tex -o thesis.epub
fi
