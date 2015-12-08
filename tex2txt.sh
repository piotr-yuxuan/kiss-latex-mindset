#!/bin/bash
pandoc --toc -f latex -t rst -s $1.tex -o $1.rst && pandoc --toc -f rst -t markdown -s $1.rst -o $1.txt && pandoc --toc -f latex -t markdown -s $1.tex -o $1.md && pandoc --toc -f latex -t docx -s thesis.tex -o thesis.docx
