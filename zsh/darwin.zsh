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
VIM=/opt/local/share/vim/vim72
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

export VIM


# Darwin ports path additions
# Append the Darwin Ports stuff to the front of the path. 
if [ -f /opt/local/bin/port ]; then
    PATH=/opt/local/bin:/opt/local/sbin:$PATH
    MANPATH=/opt/share/man:$MANPATH
fi

# Hash common directories
hash -d log=/var/log
hash -d ports=/opt/local/var/macports/sources/rsync.macports.org/release/ports

export WORK_PC=2UA6240G29.devsub.dev.dce.usps.gov

# Usage: diskeject drive_number
# Description: kills a process
diskeject () { 
    echo -n "unmounting drive $1..."
    drutil tray eject -drive $1
}

# End
