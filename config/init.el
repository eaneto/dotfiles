(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
			     (package-refresh-contents)
			     (package-install 'use-package))
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package auto-complete
  :ensure t)

(use-package py-autopep8
  :ensure t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'evil)
(evil-mode 1)

(use-package js2-mode
  :ensure t)

(use-package rjsx-mode
  :ensure t)

(add-to-list 'auto-mode-alist
	     '("components\\/.*\\.js\\'" . rjsx-mode))

(use-package php-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package yasnippet
  :ensure t)

(use-package function-args
  :ensure t)

(fa-config-default)

;; Removes tool bar.
(tool-bar-mode -1)
;; Autoclose brackets, quotes.
(electric-pair-mode 1)

(setq tab-width 4)
(setq explicit-shell-file-name "/bin/bash")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (function-args java-snippets react-snippets ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
