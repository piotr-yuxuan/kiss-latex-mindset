#!/bin/bash

# This script aims at first copying files which should be preserved and then deleting every ingored files.

path=`dirname $(realpath $0)` # Path of the directory of this script. Needed if not in the same directory.
gitignore="" # Here add default patterns. 
preserved="" # Here append default patterns to be dealt with by special function.

# Functions to be invoked on special matchers.
# I guess it won't work for folders not located at the directory root. However
# it's a first shot and I'm not concerned by that case. You should know it though :-)
# $1: the file to be copied to $2.
# $2: the folder to copy $1 in.
custom_patterns () {
	# Here the main goal is to distinguish between directory and files
	if [[ -d $1 ]];
	then
		# If it's a file then it'spretty straightforward.
		target_directory=$2
	else
		# If it's a directory then you should make sure the parents exist.
		target_directory=$2/`dirname $special`
		[[ ! -d $target_directory ]] && mkdir -p $target_directory
	fi
	
	# If it is a symbolic link then don't proceed to action.
	if [[ -h $1 ]];
	then
		echo "File $1 is a symbolic link hence won't be copied."
		return 0
	fi
	
	# If it has been deletec then notify it.
	if [[ ! -f $1 ]];
	then
		echo "File $1 doesn't exist anymore then won't be saved."
		return 0
	fi
	
	cp -R $1 $target_directory
}

# We move into that script location.
cd $path

# General functino to read files.
# $1: path of file to be read;
# $2: variable to append content to.
read_file () {
	while read line
	do
		tmp="$2" # Name substitution for it seems esier not to use dollar-like argument reference.
		eval "$tmp='${!tmp} $line'" # I know this is unsecure, correct me if you have a better idea.
	done < $1
}

read_file ".gitignore" "gitignore"
read_file ".preserved" "preserved"

for special in $preserved # We hereby use patterns not like "$patterns" so it resolves the matching files.
do
	custom_patterns $special "../data/"
done

for matched in $gitignore # We hereby use patterns not like "$patterns" so it resolves the matching files.
do
	find . -name $matched |
	while read file;
	do
		echo "deleting file $file."
		[[ -d $file ]] && rm -rf $file || rm $file
	done
done

