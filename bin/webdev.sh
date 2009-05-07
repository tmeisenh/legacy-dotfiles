#!/bin/bash
# $Id$
# Simple script to change the perms accordingly for a web application
# usage: travis@grendel  9:24PM bin % webdev.sh /home/www/html

if [ -n "$1" ]; then
	find $1 -type d -ok chmod 0750 {} \;
	find $1 -type f -ok chmod 600 {} \;
#	find $1 -type f -name '*.jsp' -o -name '*.php' -o -name '*.html'  -ok chmod 644 {} \;
#	find $1 -type f -name '*.sql' -o -name '*.txt' -ok chmod 600 {} \;
fi
