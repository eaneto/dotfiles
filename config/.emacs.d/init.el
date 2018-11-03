;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

(custom-set-variables
 '(jdee-server-dir "~/jdee-server")
 '(package-selected-packages
   (quote
	(eshell-prompt-extras color-identifiers-mode highlight-indent-guides telephone-line yaml-mode dockerfile-mode company-anaconda anaconda-mode pyenv-mode all-the-icons neotree gh-md sphinx-doc arduino-mode evil-magit async magit flycheck jdee latex-preview-pane function-args ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key use-package)))
 '(send-mail-function (quote mailclient-send-it))
 '(standard-indent 4))

(load "~/.emacs.d/scratch.el")
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/linux-style.el")
(load "~/.emacs.d/customizations.el")

(custom-set-faces)
