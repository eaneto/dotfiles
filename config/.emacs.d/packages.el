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

(use-package dockerfile-mode
  :ensure t
  :defer t)

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

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package magit
  :ensure t
  :defer t)

(use-package persp-mode
  :ensure t
  :config
  (persp-mode))

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

(use-package js2-mode
  :ensure t)

(use-package apache-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package function-args
  :ensure t
  :init (fa-config-default))

(use-package arduino-mode
  :ensure t
  :defer t)

(use-package neotree
  :ensure t
  :config (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme
	  (if (display-graphic-p) 'icons 'arrow)))

(use-package all-the-icons
  :ensure t
  :defer t)

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  :ensure t)

(use-package latex-preview-pane
  :ensure t
  :init (latex-preview-pane-enable))

(use-package elixir-mode
  :ensure t)

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

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x))

(setup-evil-packages)
(setup-python-packages)
(setup-irony-packages)

;;; packages.el ends here
