# Makefile, because I can.
#
update:
	git fetch --all
install: install-dotfiles
deinstall: uninstall-dotfiles

install-dotfiles:
	@echo "Installing ZSH..."
	@echo "Backing up your .zshrc if neccessary..."
	@!(ls $(HOME)/.zshrc > /dev/null 2> /dev/null) || mv $(HOME)/.zshrc $(HOME)/zshrc.bak # Make backup of -zshrc if necessary

	@echo "setting links to other dot files..."
	@ln -s $(PWD)/zshrc $(HOME)/.zshrc 

	@ln -s $(PWD)/zlogout $(HOME)/.zlogout 
	@ln -s $(PWD)/logout $(HOME)/.logout 
	@ln -s $(PWD)/vimrc $(HOME)/.vimrc 
#	@ln -s $(PWD)/dir_colors $(HOME)/.dir_colors
	@ln -s $(PWD)/LS_COLORS $(HOME)/.dir_colors
 
	@echo "DONE with install tasks."
uninstall-dotfiles:
	@echo "Uninstalling ZSH..."
	rm -f $(HOME)/.zshrc 
	rm -f $(HOME)/.zlogout 
	rm -f $(HOME)/.logout 
	rm -f $(HOME)/.vimrc 
	rm -f $(HOME)/.dir_colors
	rm -f ${HOME}/.zshrc
