.PHONY: all test clean vim git zsh

all: vim git zsh

vim:
	cp vim/.vimrc ~/.vimrc
	mkdir -p ~/.vim
	cp -r vim/autoload ~/.vim/
	cp -r vim/bundle   ~/.vim/
	cp -r vim/colors   ~/.vim/
	cp -r vim/doc      ~/.vim/
	cp -r vim/syntax   ~/.vim/

git:
	cp git/.gitconfig ~/.gitconfig


zsh:
	cp zsh/.zshrc ~/.zshrc


