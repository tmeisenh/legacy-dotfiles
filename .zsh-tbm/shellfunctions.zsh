# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

setenv() { export $1=$2 }  # csh compatibility

# Usage: pskill <application/program name>
# Description: kills a process
function pskill () { 
    kill -9 $(ps ax | grep $1 | awk --posix '{ print $1 }')
    echo -n "Killed $1 process..."
}

# Usage: smartextract <file>
# Description: extracts archived files
# This uses the aliases defined above
function smartextract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)
                bz $1
                ;;
            *.tar.gz)
                utar $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.jar)
                jar xf $1
                ;;
            *.tar)
                utar $1
                ;;
            *.tbz2)
                bz $1
                ;;
            *.tgz)
                utar $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *)
                echo "'$1' cannot be extracted via smartextract()." 
                ;;
        esac
    else
        echo "'$1' is not a valid file."
    fi
}

# Usage: show-archive <archive>
# Description: view archive without unpack
function showarchive() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.gz)  
                gunzip -c $1 | tar -tf - -- 
                ;;
            *.tar)
                tar -tf $1 
                ;;
            *.tgz)
                tar -ztf $1 
                ;;
            *.zip)
                unzip -l $1 
                ;;
            *.bz2)
                bzless $1 
                ;;
            *)
                echo "'$1' cannot be shown via showarchive" 
                ;;
        esac
    else
        echo "'$1' is not a valid archive"
    fi
}


function normalize () {
    if [ -z $1 ]; then
        echo "Usage: normalize <file>";
    else    
        if [ -f $1 ]; then
            perl -pi -e 's/\r\n/\n/g' $1
            perl -pi -e 's/\r/\n/g' $1
        else
            echo "'$1' is not a valid file"
        fi
    fi
}

# This only works if the remote host allows password authentication
# If you leave the passphrase blank you won't have to type a password for
# access into the remote system.
#
# We set permissions as such because I had problems on my BSD box
# We also rm -f to make sure the file gets deleted
function ssh-automate-login () {
    echo "Checking to see if a public key exists."

    if [ ! -f .ssh/id_rsa ]; then
        echo "None found, generating a 2048 bit rsa key."
	echo "Hit enter/return for no passphrase."
        ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
    else
        echo "Found existing ssh-keygen key, using that."
    fi

    echo "Copying public key to remote host."
    ssh $1 "([ -d ~/.ssh ]||mkdir -m 700 ~/.ssh) && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub
    
    echo "Done!"
} 

# alias b/c i'm old
alias sshbless=ssh-automate-login

function create_remote_git() {
    ssh $1 "mkdir -m 700 ~/git/$2.git && cd ~/git/$2.git && git --bare init"
}

# Generates a random password using apg.
function random_password() {
    echo "Here are ten random passwords for you.  Pick one, or run again. \n\n"
    apg -q -m 10 -x 10 -M NC -n 10 -t
}

function prompt_fix_white() {
    PROMPT="%{${fg_red}%}%n@%m %@ %{${fg_lblue}%}%1d %# %{${fg_white}%}"
}

function prompt_fix_black() {
    PROMPT="%{${fg_red}%}%n@%m %@ %{${fg_lblue}%}%1d %# %{${fg_black}%}"
}

# lowercases a string
function to_lower() {
    echo $1 | tr "[:upper:]" "[:lower:]"
}

# uppercases a string 
function to_upper() {
    echo $1 | tr "[:lower:]" "[:upper:]"
}

function unix_timestamp_to_date() {
    perl -e "require 'ctime.pl'; print &ctime($1);"
}

function delete_dsstore() {
  find $1 -name ".DS_Store" -depth -exec rm {} \;
}

