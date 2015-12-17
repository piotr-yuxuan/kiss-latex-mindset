#!/bin/bash
# This script is to generated tex pictures out of *.dia diagrams

for path in ./assets/dia/*
do
	dia=`basename $path`
	dia --nosplash --filter=pstricks-tex --export="assets/$dia.tex" "assets/dia/$dia"
done
