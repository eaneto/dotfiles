emacs:
	cp config/.emacs.d/*.el ~/.emacs,d/
	cp config/.emacs.d/lisp/*.el ~/.emacs,d/lisp/

vim:
	cp config/.vimrc ~/.vimrc
	cp config/.vimrc_background ~/.vimrc_background

shell:
	cp config/config.fish ~/.config/fish/
	cp config/.zshrc ~/.zshrc
	cp config/.Xresources ~/.Xresources
	xrdb -merge ~/.Xresources

wm:
	cp -R config/polybar/ ~/.config/
	cp config/i3/config ~/.config/i3/

git:
	cp config/.gitignore_global ~/

install:
	dnf install git emacs i3 rxvt-unicode-256color zsh dmenu i3lock light \
		htop libx11-devel freetype-devel fontconfig-devel libXft-devel \
		mpv sxiv polybar ranger
	git
	emacs
	vim
	shell
	wm
