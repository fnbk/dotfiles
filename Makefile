.PHONY: all test clean git nvim fish

all: git nvim fish

git:
	mkdir -p ~/.config/backup && mv ~/.config/git ~/.config/backup/git.$(shell date +%Y-%m-%d-%H%M%S)
	cp -rf git ~/.config/git

nvim:
	mkdir -p ~/.config/backup && mv ~/.config/nvim ~/.config/backup/nvim.$(shell date +%Y-%m-%d-%H%M%S)
	cp -rf nvim ~/.config/nvim

fish:
	mkdir -p ~/.config/backup && mv ~/.config/fish ~/.config/backup/fish.$(shell date +%Y-%m-%d-%H%M%S)
	cp -rf fish ~/.config/fish
	@echo For the changes to take effect please execute:
	@echo source ~/.config/fish/config.fish

