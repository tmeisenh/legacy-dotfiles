# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# Note: Some aliases are specifically FreeBSD or "non linux"
# Works on zsh versions > 4.0.9.
#********************************************************************

alias less="$PAGER"
alias zless="$PAGER"

alias -g L="|less"
alias -g M="|more"
alias -g G="|grep"
alias -g Ge="|grep -v grep"
alias -g N="&>/dev/null&"
alias -g T="|tail"
alias -g H="|head"
alias -g SL="|sort | less"
alias -g S="|sort"
alias -g C="|wc -l"

ls --color -d . &>/dev/null 2>&1 && alias ls="ls --color -F -T 0 -b -h -X" || alias ls="ls -F -T -h -C"

alias bz="tar -xvjf"
alias ctar="tar -vzcf"
alias utar="tar -xvzf"
alias ltar="tar -vztf"
alias cp="nocorrect cp"

alias grep="grep -Hn"

alias cl="clear"
alias cls=cl
alias gz=gunzip
alias mkdir="nocorrect mkdir" 
alias mv="nocorrect mv -i"
alias pks="source ~/.zshrc"
alias psaux="ps aux G"
alias rm="rm -i"
alias sl=ls
alias ";ls"=ls
alias ds="du -csh $1 "
alias lss=ds
alias ll="ls -lah"
alias se="smartextract"
alias pingg="ping -c 3 www.google.com"
alias vi="vim -X"
alias svi="sudo vim -X"
alias kill="kill -9"
alias readrc="$PAGER ~/.zshrc"
alias dtsp="date +%F"
