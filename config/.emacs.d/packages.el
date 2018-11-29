;;; packages.el --- Package configuration file
;;; Commentary:
;;; Emacs Packages configuration --- Package configuration for Emacs
;;;
;;;                  _
;;; _ __   __ _  ___| | ____ _  __ _  ___  ___
;;;| '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
;;;| |_) | (_| | (__|   < (_| | (_| |  __/\__ \
;;;| .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
;;;|_|                         |___/
;;;
;;; Code:

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
(setq python-shell-interpreter "python3"
	  python-shell-interpreter-args "-i")

(use-package py-autopep8
  :ensure t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'anaconda-mode)
(require 'pyenv-mode)

(use-package company
  :ensure t
  :config
  (eval-after-load "company"
	'(add-to-list 'company-backends 'company-anaconda)))

(add-hook 'python-mode-hook 'anaconda-mode)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package magit
  :ensure t
  :defer t)

;; Evil mode.
(require 'evil)
(evil-mode 1)

(use-package evil-magit
  :ensure t
  :config (setq evil-magit-state 'motion))

(require 'evil-magit)

(use-package ag
  :ensure t)

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
		 ("M-g p" . dumb-jump-back)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
		 ("M-g x" . dumb-jump-go-prefer-external)
		 ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :init (dumb-jump-mode)
  :config
  (setq dumb-jump-force-searcher 'ag)
  (setq dumb-jump-prefer-searcher 'ag)
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
			   '("components\\/.*\\.js\\'" . rjsx-mode)))

(use-package vue-mode
  :ensure t)

(require 'php-mode)

(use-package apache-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package function-args
  :ensure t
  :init (fa-config-default))

(use-package arduino-mode
  :ensure t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme
	  (if (display-graphic-p) 'icons 'arrow))

(require 'all-the-icons)

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  :ensure t)

(latex-preview-pane-enable)

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

;; Regular auto-complete initialization
(use-package auto-complete
  :ensure t)

(require 'auto-complete-config)
(ac-config-default)

;; Sphinx-doc config.
(add-hook 'python-mode-hook (lambda ()
                     (require 'sphinx-doc)
                     (sphinx-doc-mode t)))

(use-package python-docstring
  :ensure t)

(use-package elixir-mode
  :ensure t)

(require 'telephone-line)
(telephone-line-mode 1)

(require 'iso-transl)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

(add-hook 'after-init-hook #'global-flycheck-mode)

;;; packages.el ends here
