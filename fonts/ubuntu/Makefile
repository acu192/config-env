fonts : font-jetbrains font-ubuntu font-meslo
	# The JetBrains font seems to have the best usage/support among the nvim community.
	# All options here:
	#   https://github.com/ryanoasis/nerd-fonts/releases/tag/v3.0.2
	# Meslo is popular in the zsh community, so I'll add that one too.

font-jetbrains :
	rm -rf JetBrainsMono.zip font/
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
	unzip JetBrainsMono.zip -d font
	# The following works on Ubuntu (not sure if it works on any other distros)...
	mkdir -p ~/.local/share/fonts/
	cp font/JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts/
	fc-cache -fv
	rm -rf JetBrainsMono.zip font/

font-ubuntu :
	rm -rf UbuntuMono.zip font/
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
	unzip UbuntuMono.zip -d font
	# The following works on Ubuntu (not sure if it works on any other distros)...
	mkdir -p ~/.local/share/fonts/
	cp font/UbuntuMonoNerdFont-Regular.ttf ~/.local/share/fonts/
	fc-cache -fv
	rm -rf UbuntuMono.zip font/

font-meslo :
	rm -rf Meslo.zip font/
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
	unzip Meslo.zip -d font
	# The following works on Ubuntu (not sure if it works on any other distros)...
	mkdir -p ~/.local/share/fonts/
	cp font/MesloLGSNerdFontMono-Regular.ttf ~/.local/share/fonts/
	fc-cache -fv
	rm -rf Meslo.zip font/

.PHONY : fonts font-jetbrains font-ubuntu font-meslo
