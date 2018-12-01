;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"])
 '(ansi-term-color-vector
   [unspecified "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"] t)
 '(custom-enabled-themes (quote (base16-tomorrow-night)))
 '(package-selected-packages
   (quote
	(gitignore-mode dumb-jump ag apache-mode elixir-mode vue-mode mmm-mode popwin color-identifiers-mode highlight-indent-guides telephone-line yaml-mode dockerfile-mode pyenv-mode all-the-icons neotree gh-md arduino-mode evil-magit async magit flycheck latex-preview-pane function-args ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key use-package)))
 '(send-mail-function (quote mailclient-send-it))
 '(standard-indent 4))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/scratch.el")
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/linux-style.el")
(load "~/.emacs.d/customizations.el")

;;; init.el ends here
