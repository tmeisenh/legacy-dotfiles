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

bindkey "^[OH" beginning-of-line       ## home
bindkey "^[OF" end-of-line             ## end
bindkey "^[OA" up-line-or-search       ## up arrow for back-history-search
bindkey "^[OB" down-line-or-search     ## down arrow for fwd-history-search

# color man pages, whoa...
VIM=/usr/share/vim/vim73
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log

function search_apt() {
 apt-cache search "${1}"
}

#********************************************************************
# environment stuff
#********************************************************************

export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-amd64
export M2_HOME=/usr/share/maven
export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/gradle-1.2
export ANDROID_HOME=/home/travis/android-sdk/sdk
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin: \
        $HOME/.rvm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools: \
        $PATH
