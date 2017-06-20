.PHONY: all test clean vim git zsh bash

all: bash

bash:
	cp bash/_bashrc ~/.bashrc
	cp bash/_primary_bashrc ~/.primary_bashrc
	source ~/.bashrc

git:
	cp git/_gitconfig ~/.gitconfig



vim:
	rm -rf ~/.vim
	rm -f ~/.vimrc
	cp vim/.vimrc ~/.vimrc
	mkdir -p ~/.vim
	cp -r vim/autoload ~/.vim/
	cp -r vim/bundle   ~/.vim/
	cp -r vim/colors   ~/.vim/
	cp -r vim/doc      ~/.vim/
	cp -r vim/ftdetect ~/.vim/
	cp -r vim/ftplugin ~/.vim/
	cp -r vim/syntax   ~/.vim/

zsh:
	cp zsh/.zshrc ~/.zshrc


