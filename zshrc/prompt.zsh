# $Id: zshrc 27 2013-01-27 02:01:48Z tmeisenh $
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

# Set prompts
# # Text color
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}

# Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}

# Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

reset_color=$'{\e[30m'} # This is usually worthless


# man zshmisc for more information.
# My Prompt: username@hostname current_directory HH:mm %
# Local vars...
p_username=$fg_green
p_hostname=$fg_green
p_directory=$fg_lblue
p_command=$fg_white

# If we're root, then change name to red
if [[ "`whoami`" == "root" ]] ; then
    p_username=$fg_red
fi

# for certain group members, perhaps change the color?
`groups | grep -h "wheel" 1> /dev/null 2> /dev/null`
if [ $? = 0 ]; then
    p_username=$fg_green
fi
# if we're ssh'ing then set prompt to white.
# [[ -n "$SSHSOURCE" ]] && && p_command=$fg_white

# default style to my liking
#PROMPT="%n@%m %@ %1d %# "

PROMPT="%{$p_username%}%n@%{$p_hostname%}%m %@ %{$p_directory%}%1d %# %{$p_command%}"


