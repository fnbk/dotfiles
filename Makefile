.PHONY: all test clean vim git

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


