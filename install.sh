#!/bin/bash

SRC="$(pwd)"
DEST=$HOME

install-dotfiles() {
	echo "Installing tmeisenh dotfiles..."
  cp -rp ${SRC}/zsh ${DEST}/.zsh-tmeisenh-dotfiles
	cp -rp ${SRC}/zsh/zshrc ${DEST}/.zshrc 
  mkdir ${DEST}/.zsh-cache

	echo "setting links to other dot files..."
	cp -rp ${SRC}/zlogout ${DEST}/.zlogout 
	cp -rp ${SRC}/logout ${DEST}/.logout 
	cp -rp ${SRC}/LS_COLORS ${DEST}/.dir_colors

	echo "setting up vim..."
	cp -rp ${SRC}/vim ${DEST}/.vim 
	cp -rp ${SRC}/vimrc ${DEST}/.vimrc 

  echo "setting up info/doc directories..."
	cp -rp ${SRC}/how-to/ ${DEST}/
  
  echo "setting up bin directories..."
	cp -rp ${SRC}/bin/ ${DEST}/
	cp -rp ${SRC}/bin-freebsd ${DEST}/
	cp -rp ${SRC}/bin-darwin ${DEST}/

  echo "setting up git..."
  cp -rp ${SRC}/git/gitconfig ${DEST}/.gitconfig
 
	echo "DONE with install tasks."
}
  

uninstall-dotfiles() {
  rm_cmd="/bin/rm"
	echo "Uninstalling zsh, vim, and everything else from ${DEST}..."
	$rm_cmd -f ${DEST}/.zshrc 
	$rm_cmd -f ${DEST}/.zlogout 
	$rm_cmd -rf ${DEST}/.zsh-tmeisenh-dotfiles
	$rm_cmd -f ${DEST}/.zprofile
	$rm_cmd -rf ${DEST}/.zsh-cache
	$rm_cmd -rf ${DEST}/.zcompdump

	$rm_cmd -f ${DEST}/.logout 

	$rm_cmd -f ${DEST}/.vimrc 
	$rm_cmd -f ${DEST}/.viminfo 
	$rm_cmd -f ${DEST}/vim
	$rm_cmd -f ${DEST}/.dir_colors

	$rm_cmd -rf ${DEST}/bin
	$rm_cmd -rf ${DEST}/bin-freebsd
	$rm_cmd -rf ${DEST}/bin-darwin
	$rm_cmd -rf ${DEST}/how-to
}

uninstall-dotfiles
install-dotfiles
