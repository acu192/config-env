all :
	@echo '=== REQUIRES ROOT ==='
	@echo 'make nvim'
	@echo
	@echo '=== run as your normal user ==='
	@echo 'make fonts'
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

fonts : font-jetbrains font-ubuntu
	# The JetBrains font seems to have the best usage/support among the NvChad community.
	# All options here:
	#   https://github.com/ryanoasis/nerd-fonts/releases/tag/v3.0.2

font-jetbrains :
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
	unzip JetBrainsMono.zip -d font
	# The following works on Ubuntu (not sure if it works on any other distros)...
	mkdir -p ~/.local/share/fonts/
	cp font/JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts/
	fc-cache -fv
	rm -rf JetBrainsMono.zip font/

font-ubuntu :
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
	unzip UbuntuMono.zip -d font
	# The following works on Ubuntu (not sure if it works on any other distros)...
	mkdir -p ~/.local/share/fonts/
	cp font/UbuntuMonoNerdFont-Regular.ttf ~/.local/share/fonts/
	fc-cache -fv
	rm -rf UbuntuMono.zip font/

.PHONY : all nvim you-must-be-root kickstartnvim nvchad fonts font-jetbrains font-ubuntu
