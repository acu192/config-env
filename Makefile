all : nvim

nvim : you-must-be-root
	wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
	tar -xvzf nvim-linux64.tar.gz
	cp nvim-linux64/bin/nvim /usr/local/bin
	rm -rf nvim-linux64.tar.gz nvim-linux64

you-must-be-root :
	@test $(shell id -u) = 0

.PHONY : all nvim you-must-be-root
