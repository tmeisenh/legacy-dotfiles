# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# UN/SET OPTIONS grouped by action
# man zshoptions for more information
# Completion Options
setopt alwaystoend 
setopt alwayslastprompt 
setopt completealiases 
setopt completeinword
unset autoparamslash

# Ambigious Completions
setopt autolist 
setopt automenu 
setopt nobeep
unset menu_complete

# Globbing Options
setopt extended_glob 
setopt glob_dots 
setopt globcomplete 
setopt nullglob

# History Options
setopt appendhistory 
setopt extendedhistory 
setopt banghist
is5 && setopt sharehistory 
is5 && setopt histignoredups 

# PUSHD/POPD
setopt pushdtohome 
setopt autopushd 
setopt pushdignoredups 
setopt pushdminus 
setopt pushdsilent

# Miscellaneous
setopt notify 
setopt autoresume 
setopt noclobber 
setopt rcquotes 
setopt login 
setopt longlistjobs 
setopt printeightbit 
setopt nohup 
setopt pathdirs 
setopt markdirs 
setopt zle 
setopt vi 
setopt no_sh_word_split
#setopt correct_all

unset printexitvalue 
unset bgnice 
unset mailwarning 
unset flow_control 
unset rmstarsilent
# cdablevars will match for cd anything that fits the pattern at any
# point in the absolute path to pwd.  So, if in $HOME, it will match
# on /, /home, and /home/*/.  This is a performance nightmare
# on corporate systems.
unset cdablevars

#unset correct_all
#unset correct
