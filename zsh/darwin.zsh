# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#
# A lot of things here may be Apple OS X specific and also specific to using
# Darwin Ports for OS X (www.darwinports.org)
#********************************************************************

# System  specific environment variables and settings
VIM=/usr/local/share/vim/vim74
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

export VIM


# homebrew manpath additions
if [ -f /usr/local/opt/coreutils/libexec/gnubin ]; then
    MANPATH=/usr/local/opt/coreutils/libexec/gnubin:$MANPATH
fi

# Hash common directories
hash -d log=/var/log

# Usage: diskeject drive_number
# Description: kills a process
diskeject () { 
    echo -n "unmounting drive $1..."
    drutil tray eject -drive $1
}

# End
