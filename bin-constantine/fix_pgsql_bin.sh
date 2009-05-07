#!/bin/bash
# Simple script which creates file links between two directories

sourcedir=/opt/local/lib/pgsql8/bin
destdir=/opt/local/bin

for arg in $(ls $sourcedir )
do
	echo "creating link  $sourcedir/$arg --> $destdir/$arg"
	ln -s $sourcedir/$arg $destdir/$arg
done

echo "Done linking."
