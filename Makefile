all :
	@echo '=== REQUIRES ROOT ==='
	@echo 'make nvim'
	@echo 'make ripgrep'
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
	ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/vim
	rm -rf nvim-linux64.tar.gz

ripgrep : you-must-be-root
	wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	tar -xvzf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	cp ./ripgrep-13.0.0-x86_64-unknown-linux-musl/rg /usr/local/bin/
	rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz ripgrep-13.0.0-x86_64-unknown-linux-musl/

you-must-be-root :
	@test $(shell id -u) = 0

kickstartnvim :
	rm -rf ~/.local/share/nvim/
	rm -rf ~/.config/nvim
	git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
	#nvim
	nvim --headless "+Lazy! sync" +qa

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

.PHONY : all nvim ripgrep you-must-be-root kickstartnvim nvchad fonts font-jetbrains font-ubuntu
