all :
	@echo '=== REQUIRES ROOT ==='
	@echo 'make nvim'
	@echo 'make ripgrep'
	@echo
	@echo '=== run as your normal user ==='
	@echo 'make nvim-env'
	@echo

nvim : you-must-be-root

ripgrep : you-must-be-root

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
