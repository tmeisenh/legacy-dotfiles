# Z shell configuration file for the local system.
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
#********************************************************************

# Add rvm/ruby
if [[ -s "${HOME}/.rvm/scripts/rvm" ]] ; then
  source "${HOME}/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  source "/usr/local/rvm/scripts/rvm"
fi
