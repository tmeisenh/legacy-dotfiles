update:
	svn up
install: install-dotfiles

install-dotfiles:
	@echo "Installing ZSH..."
	@echo "Backing up your .zshrc if neccessary..."
	@!(ls $(HOME)/.zshrc > /dev/null 2> /dev/null) || mv $(HOME)/.zshrc $(PWD)/zshrc.bak # Make backup of -zshrc if necessary

	@echo "setting links to other dot files..."
	@ln -s $(PWD)/zshrc $(HOME)/.zshrc 
	@ln -s $(PWD)/zlogout $(HOME)/.zlogout 
	@ln -s $(PWD)/logout $(HOME)/.logout 
	@ln -s $(PWD)/vimrc $(HOME)/.vimrc 
	@ln -s $(PWD)/dir_colors $(HOME)/.dir_colors

	@echo "DONE with install tasks."
