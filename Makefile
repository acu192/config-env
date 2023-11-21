help:
	@echo '-------------- STANDARD INSTALLS --------------'
	@echo
	@echo 'make apt      # install system dependencies'
	@echo 'make all      # install nvim, tmux, bash, htop, gitconfig'
	@echo
	@echo '-------------- OPTIONAL INSTALLS --------------'
	@echo
	@echo 'make nodejs'
	@echo 'make pyright'
	@echo 'make rustup'
	@echo 'make awscli'
	@echo

apt : you-must-be-root
	apt update && apt install -y \
		sudo xsel \
		make cmake build-essential \
		git tmux vim htop wget curl \
		ffmpeg unzip zip

you-must-be-root :
	@test $(shell id -u) = 0

all : nvim tmux bash htop gitconfig

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

gitconfig :
	cd gitconfig && make

nodejs :
	sudo apt-get update
	sudo apt-get install -y ca-certificates curl gnupg
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
	echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
	sudo apt-get update
	sudo apt-get install nodejs -y

pyright :
	sudo npm install -g pyright

rustup :
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	bash -lc 'rustup component add rust-analyzer'

awscli :
	rm -rf ./aws awscliv2.zip
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	rm -rf ./aws awscliv2.zip

.PHONY : help apt you-must-be-root all nvim tmux bash htop gitconfig nodejs pyright rustup awscli
