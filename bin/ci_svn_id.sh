#!/bin/bash
# $Id$

tt="__"

# Don't forget xml and properties files...
for arg in $(find . -type f -name "*.java")
do
	svn propset svn:keywords "Id" $arg
done

for arg in $(find . -type f -name "*.xml")
do
	svn propset svn:keywords "Id" $arg
done

for arg in $(find . -type f -name "*.properties")
do
	svn propset svn:keywords "Id" $arg
done
