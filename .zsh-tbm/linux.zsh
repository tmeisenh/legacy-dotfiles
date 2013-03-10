# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# Linux-related zsh aliases and functions
#********************************************************************

alias ls="ls --color -F -T 0 -b -h -X"
alias lsd="ls --color -d -T 0 -b -h -X *(-/DN)"
alias llsd="ls --color -ld -T 0 -b -h -X *(-/DN)"
alias lsa="ls --color -ld -h -X -b -T 0 .*"
alias last_mod="ls --color -Flat -h -b -X -T 0"

# color man pages, whoa...
VIM=/usr/share/vim/vim73
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log
