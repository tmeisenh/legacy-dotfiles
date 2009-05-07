#!/bin/bash
# $Id$
# gets a recursive listing of all files/folders and adds a _ whenever
# a white space is in the name.

#a=`tree -fi --noreport`;

#for arg in $a
for arg in *
do
	mv "$arg" "$(echo "$arg" | sed -e 's/ /_/g')";
done
