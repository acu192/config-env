all :
	@echo '=== REQUIRES ROOT ==='
	@echo 'make nvim'
	@echo
	@echo '=== run as your normal user ==='
	@echo 'make kickstartnvim'
	@echo 'make nvchad'
	@echo

nvim : you-must-be-root
	rm -rf nvim-linux64.tar.gz
	wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
	rm -rf nvim-linux64
	tar -xvzf nvim-linux64.tar.gz
	rm -rf /usr/local/etc/nvim-linux64
	mv nvim-linux64 /usr/local/etc/
	rm -rf /usr/local/bin/nvim
	ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/nvim
	rm -rf nvim-linux64.tar.gz

you-must-be-root :
	@test $(shell id -u) = 0

kickstartnvim :
	rm -rf ~/.local/share/nvim/
	rm -rf ~/.config/nvim
	git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
	nvim

nvchad :
	rm -rf ~/.local/share/nvim/
	rm -rf ~/.config/nvim
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
	nvim

.PHONY : all nvim you-must-be-root kickstartnvim nvchad
