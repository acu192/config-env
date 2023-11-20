all : nvim tmux

nvim :
	cd nvim && sudo make ripgrep
	cd nvim && sudo make nvim
	cd nvim && make nvim-env

tmux :
	cd tmux && make tmux

.PHONY : all nvim tmux
