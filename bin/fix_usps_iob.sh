#!/bin/bash
# $Id$

tt="__"

# Don't forget xml and properties files...
for arg in $(find . -type f -name "*.java")
do
	mv $arg "$arg$tt"
	sed s/gov.usps/com.indexoutofbounds/g "$arg$tt" > $arg
	rm "$arg$tt"
done

for arg in $(find . -type f -name "*.xml")
do
	mv $arg "$arg$tt"
	sed s/gov.usps/com.indexoutofbounds/g "$arg$tt" > $arg
	rm "$arg$tt"
done
