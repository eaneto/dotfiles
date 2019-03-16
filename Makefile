PYTHON=python3

config:
	cp -R config/.emacs.d/ $HOME/
	cp config/.vimrc $HOME/.vimrc
	cp config/.vimrc_background $HOME/.vimrc_background
	@echo "Emacs and vim config done."

	cp -R config/polybar/ $HOME/.config/
	cp config/i3/config $HOME/.config/i3/
	@echo "i3wm and polybar config done."

	cp config/config.fish $HOME/.config/fish/
	cp config/.zshrc $HOME/.zshrc
	cp config/.Xresources $HOME/.Xresources
	cp config/.gitignore_global $HOME/
	@xrdb -merge ~/.Xresources
	@echo "Configs done."

main:
	dnf install emacs i3 rxvt-unicode-256color zsh dmenu i3lock light youtube-dl
	$(PYTHON) -m pip install requests bs4
	config
