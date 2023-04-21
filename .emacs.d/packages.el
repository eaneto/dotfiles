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

(setq package-check-signature nil)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package all-the-icons
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  :config
  (exec-path-from-shell-copy-env "OPENAI_KEY")
  (exec-path-from-shell-copy-env "LSP_USE_PLISTS"))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  :hook (go-mode . yas-minor-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  (go-mode . lsp-deferred)
  (html-mode . lsp)
  (javascript-mode . lsp)
  (css-mode . lsp)
  (scss-mode . lsp)
  (rustic-mode . lsp)
  :config
  (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("~/.local/bin/terraform-lsp" "-enable-log-file"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

  (add-hook 'terraform-mode-hook #'lsp)
  ;; 100mb
  (setq gc-cons-threshold 100000000)
  ;; 1mb
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-lens-enable nil))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "M-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "M-k") 'company-select-previous-or-abort))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package telephone-line
  :ensure t
  :init
  (telephone-line-mode 1))

(require 'iso-transl)

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top))

(use-package counsel
  :ensure t
  :init
  (ivy-mode 1)
  :config
  (setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  ;; TODO: Change TAB and RET on the minibuffer to work like smex
  (define-key ivy-minibuffer-map (kbd "M-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "M-k") 'ivy-previous-line))

(use-package ivy-xref
  :ensure t
  :init
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package org
  :config
  (setq org-clock-sound "~/Music/ding.wav"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda () (org-bullets-mode 1))))

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

(use-package ansible
  :ensure t
  :config
  (add-hook 'yaml-mode-hook '(lambda () (ansible 1))))

(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode))

(use-package hl-todo
  :ensure t
  :init
  (global-hl-todo-mode))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/ufp_logo.txt"
        dashboard-center-content t
        dashboard-projects-backend 'project-el
        dashboard-items '((recents . 5)
                          (projects . 5))
        dashboard-set-footer nil))

(use-package gptel
  :config
  (setq gptel-api-key (getenv "OPENAI_KEY")))

(use-package citar
  :custom
  (citar-bibliography '("~/projects/research/references.bib"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/awesome-tab"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/cql-mode"))

(defun setup-cql-mode()
  "Setup for cql mode."
  (require 'cql-mode)
  (add-to-list 'auto-mode-alist '("\\.cql\\'" . cql-mode)))

(defun setup-awesome-tab()
  "Setup for awesome tab."
  (require 'awesome-tab)
  (setq awesome-tab-display-icon t)
  (awesome-tab-mode t))

(setup-awesome-tab)
(setup-cql-mode)

(require 'evil-config)
(require 'custom-modes-config)
(require 'lsp-mode-c)
(require 'rust-config)
(require 'python-config)

;;; packages.el ends here
