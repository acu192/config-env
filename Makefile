all : nvim tmux bash htop

nvim :
	cd nvim && sudo make ripgrep
	cd nvim && sudo make nvim
	cd nvim && make nvim-env

tmux :
	cd tmux && make tmux

bash :
	cd bash && make

htop :
	cd htop && make

.PHONY : all nvim tmux bash htop
