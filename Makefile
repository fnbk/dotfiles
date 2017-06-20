.PHONY: all test clean vim git zsh bash

all: bash

bash:
	cp bash/_bashrc ~/.bashrc
	cp bash/_primary_bashrc ~/.primary_bashrc
	source ~/.bashrc

git:
	cp git/_gitconfig ~/.gitconfig



vim:
	cp vim/_vimrc ~/.vimrc

zsh:
	cp zsh/.zshrc ~/.zshrc


