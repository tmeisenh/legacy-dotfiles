# $Id: zshrc 27 2013-01-27 02:01:48Z tmeisenh $
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

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

# ls is a special case, since I have a ton of aliases to it.
alias ls="ls -F -T 0 -b -h -X"
alias lsd="ls -d -T 0 -b -h -X *(-/DN)"
alias llsd="ls -ld -T 0 -b -h -X *(-/DN)"
alias lsa="ls -ld -h -X -b -T 0 .*"
alias last_mod="ls -Flat -h -b -X -T 0"

# if we have core utils (freebsd)
`isExists gls` && alias ls="gls --color -F -T 0 -b -h -X"
`isExists gls` && alias lsd="gls --color -d -T 0 -b -h -X *(-/DN)"
`isExists gls` && alias llsd="gls --color -ld -T 0 -b -h -X *(-/DN)"
`isExists gls` && alias lsa="gls --color -ld -h -X -b -T 0 .*"
`isExists gls` && alias last_mod="gls --color -Flat -h -b -X -T 0"

alias bz="tar -xvjf"
alias ctar="tar -vzcf"
alias utar="tar -xvzf"
alias ltar="tar -vztf"
alias cp="nocorrect gcp"

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
