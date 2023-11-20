all :
	@echo '=== REQUIRES ROOT ==='
	@echo 'make nvim'
	@echo 'make ripgrep'
	@echo
	@echo '=== run as your normal user ==='
	@echo 'make nvim-env'
	@echo

nvim : you-must-be-root
	rm -rf nvim-linux64.tar.gz
	wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
	rm -rf nvim-linux64
	tar -xvzf nvim-linux64.tar.gz
	rm -rf /usr/local/etc/nvim-linux64
	mv nvim-linux64 /usr/local/etc/
	rm -rf /usr/local/bin/nvim /usr/local/bin/vim
	ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/nvim
	ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/vim
	rm -rf nvim-linux64.tar.gz

ripgrep : you-must-be-root
	rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl
	tar -xvzf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	cp ./ripgrep-13.0.0-x86_64-unknown-linux-musl/rg /usr/local/bin/
	rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz ripgrep-13.0.0-x86_64-unknown-linux-musl/

you-must-be-root :
	@test $(shell id -u) = 0

nvim-env :
	rm -rf ~/.local/share/nvim/
	rm -rf ~/.config/nvim
	mkdir -p ~/.config
	ln -s $(shell pwd) ~/.config/nvim
	#nvim
	nvim --headless "+Lazy! install" +qa
	nvim --headless "+TSUpdate" +qa

.PHONY : all nvim ripgrep you-must-be-root nvim-env
