;;; packages.el --- Package configuration file
;;; Commentary:
;;; Emacs Packages configuration --- Package configuration for Emacs
;;;
;;;                   _
;;;  _ __   __ _  ___| | ____ _  __ _  ___  ___
;;; | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
;;; | |_) | (_| | (__|   < (_| | (_| |  __/\__ \
;;; | .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
;;; |_|                         |___/
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

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(defun setup-python-packages()
  (use-package elpy
    :ensure t
    :init (elpy-enable)
    (setq elpy-rpc-python-command "python3")
    (setq python-shell-interpreter "python3"
          python-shell-interpreter-args "-i"))

  (use-package py-autopep8
    :ensure t
    :config
    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
  
  (use-package pyenv-mode
    :ensure t))

(defun setup-irony-packages()
  (use-package irony
    :ensure t
    :init
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
  
  (use-package company-irony
    :ensure t
    :config
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-irony)))
  
  (use-package flycheck-irony
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package fancy-battery
  :ensure t
  :config
  (fancy-battery-mode))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package magit
  :ensure t
  :defer t)

(defun setup-evil-packages()
  (use-package evil
    :ensure t
    :init (evil-mode 1))

  (use-package evil-magit
    :ensure t
    :config
    (setq evil-magit-state 'normal)
    (setq evil-magit-use-y-for-yank nil))

  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1)))

(defun setup-elixir-packages()
  (use-package elixir-mode
    :ensure t
    :defer t
    :config
    (add-hook 'elixir-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'elixir-format nil t))))

  (use-package alchemist
    :ensure t
    :defer t
    :config
    (setq alchemist-key-command-prefix (kbd "C-c /"))))

(defun setup-custom-modes-packages()
  (use-package dockerfile-mode
    :ensure t
    :defer t)
  
  (use-package gitignore-mode
    :ensure t
    :defer t)
  
  (use-package js2-mode
    :ensure t
    :defer t)
  
  (use-package apache-mode
    :ensure t
    :defer t)
  
  (use-package php-mode
    :ensure t
    :defer t
    :config
    (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode)))
  
  (use-package web-mode
    :ensure t
    :defer t
    :config
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (setq web-mode-css-indent-offset 4))
  
  (use-package markdown-mode
    :ensure t
    :defer t)
  
  (use-package arduino-mode
    :ensure t
    :defer t)
  
  (use-package yaml-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
    :ensure t
    :defer t)
  
  (use-package groovy-mode
    :ensure t
    :defer t)

  (use-package kotlin-mode
    :ensure t
    :defer t))

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

(use-package ggtags
  :config
  (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/projects/"))
  (projectile-mode +1))

(use-package function-args
  :ensure t
  :init (fa-config-default))

(use-package neotree
  :ensure t
  :config (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme
	  (if (display-graphic-p) 'icons 'arrow)))

(use-package all-the-icons
  :ensure t
  :defer t)

(use-package latex-preview-pane
  :ensure t
  :init (latex-preview-pane-enable))

(use-package telephone-line
  :ensure t
  :init (telephone-line-mode 1))

(require 'iso-transl)

(use-package highlight-indent-guides
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-character ?\|))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda () (org-bullets-mode 1))))

(use-package nov
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package elfeed
  :ensure t
  :defer t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  (elfeed-feeds
   '("https://undeadly.org/cgi?action=rss")))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(defun configure-awesome-tab()
  (require 'awesome-tab)
  (awesome-tab-mode 1))

(defun configure-company-english-helper()
  (require 'company-english-helper))

(setup-custom-modes-packages)
(setup-evil-packages)
(setup-python-packages)
(setup-irony-packages)
(setup-elixir-packages)
(configure-awesome-tab)
(configure-company-english-helper)

;;; packages.el ends here
