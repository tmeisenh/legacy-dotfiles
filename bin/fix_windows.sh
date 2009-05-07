#!/bin/bash
# $Id$
# Small script which fixes files coming from a Windows (or Mac, I guess) box.
# It replaces a space in a name with an underscore and changes the perms for
# dirctories to DIR_PERM and files to FILE_PERM

DIR_PERM=700;
FILE_PERM=600;

#a=`tree -fi --noreport`;  # for a recursive listing
#for arg in $a
for arg in *
do
	mod_file="$(echo "$arg" | sed -e 's/ /_/g')";
	mv "$arg" "$mod_file";

	if [ -d $mod_file ]; then
		chmod $DIR_PERM $mod_file;
	else
		chmod $FILE_PERM $mod_file;
	fi
done
