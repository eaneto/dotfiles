(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jdee-server-dir "/home/eldron/jdee-server")
 '(package-selected-packages
        (quote
         (evil-magit async magit flycheck jdee latex-preview-pane function-args java-snippets react-snippets ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key try use-package)))
 '(standard-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Elpy configuration.
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

(ac-config-default)

(use-package py-autopep8
  :ensure t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Evil mode.
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

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package function-args
  :ensure t)

(fa-config-default)

(latex-preview-pane-enable)

;; Regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; Removes tool bar.
(tool-bar-mode -1)

;; Display line numbers
(global-linum-mode t)

;; Autoclose brackets, quotes.
(electric-pair-mode 1)

;; Sets tabs width to 4 spaces.
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(scroll-bar-mode 0)

;; Sets bash to be used as shell.
(setq explicit-shell-file-name "/bin/zsh")


(setq ido-enable-flex-matching t)
(setq ido-everyehere t)
(ido-mode t)

(defalias 'list-buffers 'ibuffer)
