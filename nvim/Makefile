nvim-env :
	rm -rf ~/.local/share/nvim/
	rm -rf ~/.config/nvim
	mkdir -p ~/.config
	ln -s $(shell pwd) ~/.config/nvim
	#nvim
	nvim --headless "+Lazy! install" +qa
	nvim --headless "+TSUpdate" +qa

.PHONY : nvim-env
