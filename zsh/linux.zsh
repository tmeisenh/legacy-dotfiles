# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# Linux-related zsh aliases and functions
#********************************************************************

alias ls="ls --color -F -T 0 -b -h -H -X"

bindkey "^[OH" beginning-of-line       ## home
bindkey "^[OF" end-of-line             ## end
bindkey "^[OA" up-line-or-search       ## up arrow for back-history-search
bindkey "^[OB" down-line-or-search     ## down arrow for fwd-history-search

# color man pages, whoa...
VIM=/usr/share/vim/vim73
export PAGER='/usr/local/bin/vimpager'
#export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log

function search_apt() {
 apt-cache search "${1}"
}

#********************************************************************
# environment stuff
#********************************************************************

export JAVA_HOME=/usr/lib/jvm/java-6-oracle
export IDEA_JDK=$JAVA_HOME
export M3_HOME=/usr/local/apache-maven
export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/gradle
export ANDROID_HOME=~/android-sdk/sdk
export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin:$HOME/.rvm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
