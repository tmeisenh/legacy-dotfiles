#!/usr/local/bin/bash
#
# For FreeBSD systems, you'll need to manually invoke bash to run
# this script since /usr/local/bin/bash isn't a valid shell.
# /usr/local/usr/local/bin/bash ./install.sh

SRC="$(pwd)"
DEST=$HOME

cp_cmd="/bin/cp"
rm_cmd="/bin/rm"
mv_cmd="/bin/mv"

install-dotfiles() {
	echo "Installing tmeisenh dotfiles..."
  $cp_cmd -pLR ${SRC}/zsh ${DEST}/.zsh-tmeisenh-dotfiles

  !(ls $HOME/private.zsh > /dev/null 2> /dev/null) || $mv_cmd $HOME/private.zsh ${DEST}/.zsh-tmeisenh-dotfiles/private.zsh


  $cp_cmd -pLR ${SRC}/zsh/zshrc ${DEST}/.zshrc 
  mkdir ${DEST}/.zsh-cache

  echo "setting links to other dot files..."
  $cp_cmd -pLR ${SRC}/zlogout ${DEST}/.zlogout 
  $cp_cmd -pLR ${SRC}/logout ${DEST}/.logout 
  $cp_cmd -pLR ${SRC}/LS_COLORS ${DEST}/.dir_colors

  echo "DONE with install tasks."
}
  

uninstall-dotfiles() {
  echo "Uninstalling zsh from ${DEST}..."
  $mv_cmd ${DEST}/.zsh-tmeisenh-dotfiles/private.zsh $HOME/private.zsh
  $rm_cmd -f ${DEST}/.zshrc 
  $rm_cmd -f ${DEST}/.zlogout 
  $rm_cmd -rf ${DEST}/.zsh-tmeisenh-dotfiles
  $rm_cmd -f ${DEST}/.zprofile
  $rm_cmd -rf ${DEST}/.zsh-cache
  $rm_cmd -rf ${DEST}/.zcompdump

  $rm_cmd -f ${DEST}/.logout 

  echo "Manualy remove $HOME/private.zsh if you didn't alter it."
}

uninstall-dotfiles
install-dotfiles
