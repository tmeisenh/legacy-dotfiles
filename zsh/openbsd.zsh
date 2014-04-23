# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# OpenBSD specific settings
#********************************************************************

export LC_ALL=en_US.UTF-8
export LANG=$LC_ALL

export PKG_URL=ftp://openbsd.mirrors.pair.com/pub/OpenBSD/5.4/packages/amd64
export PKG_PATH

alias ls="colorls -C -G -F -h -x -T"  

export TERM=wsvt25
