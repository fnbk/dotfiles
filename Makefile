.PHONY: all test clean vim git zsh bash

all: bash

bash:
	cp bash/_bashrc ~/.bashrc
	source ~/.bashrc

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

git:
	cp git/.gitconfig ~/.gitconfig


zsh:
	cp zsh/.zshrc ~/.zshrc


