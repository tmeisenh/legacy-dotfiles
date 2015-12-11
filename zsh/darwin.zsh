# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#
# Apple Mac OS X related zsh aliases, functions, and settings.
#********************************************************************

# System  specific environment variables and settings
bindkey "^[[H" beginning-of-line       ## home
bindkey "^[[F" end-of-line             ## end

export VIM=/usr/local/share/vim/vim74
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"
export GIT_PAGER='less'

# xcode alias and completion
alias xcode="open -a Xcode"
compctl -g '*.(xcworkspace|xcodeproj)' xcode

# homebrew manpath additions
if [ -d /usr/local/opt/coreutils/libexec/gnuman ]; then
  manpath=(
    /usr/local/opt/coreutils/libexec/gnuman
    $manpath
  )
fi

# Hash common directories
hash -d log=/var/log

# Usage: diskeject drive_number
# Description: kills a process
diskeject () { 
    echo -n "unmounting drive $1..."
    drutil tray eject -drive $1
}

upgrade_homebrew() {
  brew update --verbose
  brew outdated
  brew upgrade
}

#********************************************************************
# environment stuff
#********************************************************************

export JAVA_HOME=`/usr/libexec/java_home`
export GOPATH=$HOME/git/go_workspace

path=(
  $JAVA_HOME/bin 
  $GOPATH/bin 
  $path
)
# End
