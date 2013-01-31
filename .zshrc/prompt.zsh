# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Functions for displaying good stuff in a terminal title
case $TERM in
    *xterm*|rxvt|(K|a)term)
    precmd () {
        print -Pn "\033]0;%n@%m%#  %~  %W :: %T\a" 
    }
    preexec () {
        print -Pn "\033]0;%n@%m%#  <$1>  %W :: %T\a" 
    }
    ;;
esac

# man zshmisc for more information.
# My Prompt: username@hostname current_directory HH:mm %
# Local vars...

#PROMPT="%n@%m %@ %1d %# "

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "%%"; fi
}

PROMPT="%{$fg_bold[green]%}%n@%m %@ %{$fg_bold[blue]%} %1d %{$fg_bold[green]%}$(prompt_char) %{$reset_color%}"
