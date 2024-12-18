tmux :
	rm -rf ~/.tmux/plugins/tpm ~/.config/tmux/plugins
	mkdir -p ~/.tmux/plugins
	mkdir -p ~/.config/tmux/plugins/catppuccin
	git clone https://github.com/acu192/fork-catppuccin-tmux.git ~/.config/tmux/plugins/catppuccin/tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -rf ~/.config/tmux/tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/tmux
	ln -s $(shell pwd)/tmux.conf ~/.config/tmux/tmux.conf
	ln -s $(shell pwd)/tmux.conf ~/.tmux.conf
	~/.tmux/plugins/tpm/bin/install_plugins

.PHONY : tmux
