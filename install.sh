#!/bin/sh

#TOP="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP="$(pwd)"
DEST=/tmp/shit

install-dotfiles() {
	echo "Installing ZSH..."
	echo "Backing up your .zshrc if neccessary..."
	!(ls ${DEST}/.zshrc > /dev/null 2> /dev/null) || mv ${DEST}/.zshrc ${DEST}/zshrc.bak 
	ln -s ${TOP}/zsh/zshrc ${DEST}/.zshrc 

	echo "setting links to other dot files..."
	ln -s ${TOP}/zlogout ${DEST}/.zlogout 
	ln -s ${TOP}/logout ${DEST}/.logout 
	ln -s ${TOP}/LS_COLORS ${DEST}/.dir_colors

	echo "setting up vim..."
	!(ls ${DEST}/.vimrc > /dev/null 2> /dev/null) || mv ${DEST}/.vimrc ${DEST}/vimrc.bak
	!(ls ${DEST}/.vim > /dev/null 2> /dev/null) || mv ${DEST}/.vim ${DEST}/vim.bak
	ln -s ${TOP}/vim ${DEST}/.vim 
	ln -s ${TOP}/vimrc ${DEST}/.vimrc 

  echo "setting up bin directories..."
	mkdir -p ${DEST}/bin
	cp -a ${TOP}/bin/* ${DEST}/bin/
	ln -s ${TOP}/bin-freebsd ${DEST}/bin-freebsd
	ln -s ${TOP}/bin-darwin ${DEST}/bin-darwin

  echo "setting up git..."
	!(ls ${DEST}/.gitconfig > /dev/null 2> /dev/null) || mv ${DEST}/.gitconfig ${DEST}/gitconfig.bak
  ln -s ${TOP}/git/gitconfig ${DEST}/.gitconfig
 
	echo "DONE with install tasks."
}
  

uninstall-dotfiles() {
	echo "Uninstalling zsh, vim, and everything else..."
	rm -f ${DEST}/.zshrc 
	rm -f ${DEST}/.zlogout 
	rm -f ${DEST}/.logout 
	rm -f ${DEST}/.vimrc 
	rm -f ${DEST}/.dir_colors
	rm -f ${DEST}/.zshrc
	rm -rf ${DEST}/bin
	rm -rf ${DEST}/bin-freebsd
	rm -rf ${DEST}/bin-darwin
}

install-dotfiles
