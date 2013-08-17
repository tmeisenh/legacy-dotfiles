#!/bin/bash

#TOP="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP="$(pwd)"
DEST=$HOME

install-dotfiles() {
	echo "Installing ZSH..."
	echo "Backing up your .zshrc if neccessary..."
	!(ls ${DEST}/.zshrc > /dev/null 2> /dev/null) || mv ${DEST}/.zshrc ${DEST}/zshrc.bak 
  ln -s ${TOP}/zsh ${DEST}/.zsh-tmeisenh-dotfiles
	ln -s ${TOP}/zsh/zshrc ${DEST}/.zshrc 
  mkdir ${DEST}/.zsh-cache

	echo "setting links to other dot files..."
	ln -s ${TOP}/zlogout ${DEST}/.zlogout 
	ln -s ${TOP}/logout ${DEST}/.logout 
	ln -s ${TOP}/LS_COLORS ${DEST}/.dir_colors

	echo "setting up vim..."
	!(ls ${DEST}/.vimrc > /dev/null 2> /dev/null) || mv ${DEST}/.vimrc ${DEST}/vimrc.bak
	!(ls ${DEST}/.vim > /dev/null 2> /dev/null) || mv ${DEST}/.vim ${DEST}/vim.bak
	ln -s ${TOP}/vim ${DEST}/.vim 
	ln -s ${TOP}/vimrc ${DEST}/.vimrc 

  echo "setting up info/doc directories..."
	ln -s ${TOP}/how-to/ ${DEST}/
  
  echo "setting up bin directories..."
	ln -s ${TOP}/bin/ ${DEST}/
	ln -s ${TOP}/bin-freebsd ${DEST}/
	ln -s ${TOP}/bin-darwin ${DEST}/

  echo "setting up git..."
	!(ls ${DEST}/.gitconfig > /dev/null 2> /dev/null) || mv ${DEST}/.gitconfig ${DEST}/gitconfig.bak
  ln -s ${TOP}/git/gitconfig ${DEST}/.gitconfig
 
	echo "DONE with install tasks."
}
  

uninstall-dotfiles() {
 rm_cmd="/bin/rm"
	echo "Uninstalling zsh, vim, and everything else from ${DEST}..."
	$rm_cmd -vf ${DEST}/.zshrc 
	$rm_cmd -vf ${DEST}/.zlogout 
	$rm_cmd -vf ${DEST}/.zsh-tmeisenh-dotfiles
	$rm_cmd -vf ${DEST}/.zprofile
	$rm_cmd -vrf ${DEST}/.zsh-cache
	$rm_cmd -vrf ${DEST}/.zcompdump

	$rm_cmd -vf ${DEST}/.logout 

	$rm_cmd -vf ${DEST}/.vimrc 
	$rm_cmd -vf ${DEST}/.viminfo 
	$rm_cmd -vf ${DEST}/vim
	$rm_cmd -vf ${DEST}/.dir_colors

	$rm_cmd -vrf ${DEST}/bin
	$rm_cmd -vrf ${DEST}/bin-freebsd
	$rm_cmd -vrf ${DEST}/bin-darwin
	$rm_cmd -vrf ${DEST}/how-to
}

uninstall-dotfiles
install-dotfiles
