tmux :
	rm -rf ~/.tmux/plugins/tpm ~/.config/tmux/plugins
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -rf ~/.config/tmux/tmux.conf
	mkdir -p ~/.config/tmux
	ln -s $(shell pwd)/tmux.conf ~/.config/tmux/tmux.conf
	~/.tmux/plugins/tpm/bin/install_plugins

.PHONY : tmux
