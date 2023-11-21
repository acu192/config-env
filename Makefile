help:
	@echo 'make apt      # install system dependencies'
	@echo 'make all      # install nvim, tmux, bash, htop'

apt : you-must-be-root
	apt update && apt install -y \
		sudo xsel \
		make cmake build-essential \
		git tmux vim htop \
		ffmpeg unzip zip

you-must-be-root :
	@test $(shell id -u) = 0

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

.PHONY : help apt you-must-be-root all nvim tmux bash htop
