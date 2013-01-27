#!/bin/bash

echo -n "Starting Ports sync ... "
port -v sync

echo -n "Done with sync, starting selfupdate ... "

port -v selfupdate

echo -n "Done with self upgrade, finishing with port -cvsa upgrade"

port -cvsua upgrade
