#!/bin/bash
# $Id$

tt="__"

# Don't forget xml and properties files...
for arg in $(find . -type f -name "*.java")
do
	echo "/* \$Id\$ */" >> $arg$tt
	cat $arg >> $arg$tt
	mv "$arg$tt" $arg
	dos2unix $arg
done

# Buggy
for arg in $(find . -type f -name "*.xml")
do
	head -n 1 $arg >> $arg$tt
	echo "<!-- \$Id\$ -->" > $arg$tt
	cat $arg >> $arg$tt
	mv "$arg$tt" $arg
	dos2unix $arg
done

for arg in $(find . -type f -name "*.properties")
do
	echo "# \$Id\$" >> $arg$tt
	cat $arg >> $arg$tt
	mv "$arg$tt" $arg
	dos2unix $arg
done

# Buggy
for arg in $(find . -type f -name "*.sh")
do
	head -n 1 $arg >> $arg$tt
	echo "# \$Id\$" >> $arg$tt
	cat $arg >> $arg$tt
	mv "$arg$tt" $arg
	dos2unix $arg
done
