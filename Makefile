emacs:
	cp config/.emacs.d/*.el ~/.emacs,d/
	cp config/.emacs.d/lisp/*.el ~/.emacs,d/lisp/

config:
	cp config/.vimrc ~/.vimrc
	cp config/.vimrc_background ~/.vimrc_background
	@echo "Emacs and vim config done."

	cp -R config/polybar/ ~/.config/
	cp config/i3/config ~/.config/i3/
	@echo "i3wm and polybar config done."

	cp config/config.fish ~/.config/fish/
	cp config/.zshrc ~/.zshrc
	cp config/.Xresources ~/.Xresources
	cp config/.gitignore_global ~/
	@xrdb -merge ~/.Xresources
	@echo "Configs done."

install:
	dnf install emacs i3 rxvt-unicode-256color zsh dmenu i3lock light youtube-dl
	emacs
	config
