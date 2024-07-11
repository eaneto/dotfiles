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
    (exec-path-from-shell-initialize)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package terraform-mode
  :ensure t
  :config
  (add-hook 'terraform-mode-hook #'outline-minor-mode))

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
  (define-key ivy-minibuffer-map (kbd "M-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "M-k") 'ivy-previous-line))

(use-package ivy-xref
  :ensure t
  :init
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;; This package fixes ivy matches order.
(use-package flx
  :ensure
  :after counsel)

(use-package org
  :config
  (setq org-clock-sound "~/Music/ding.wav"))

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda () (org-superstar-mode 1))))

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
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
	    '(("django"    . "\\.html\\'")))
  (setq web-mode-markup-indent-offset 2)
  (add-hook 'web-mode-hook (lambda () (electric-pair-local-mode -1))))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/ufp_logo.txt"
        dashboard-center-content t
        dashboard-projects-backend 'project-el
        dashboard-items '((projects . 5)
                          (recents . 5))
        dashboard-set-footer nil))

(use-package citar
  :custom
  (citar-bibliography '("~/projects/bewlrm/research/references.bib"))
  (org-cite-global-bibliography '("~/projects/bewlrm/research/references.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package deadgrep
  :ensure)

(use-package ellama
  :init
  (setopt ellama-language "English")
  (require 'llm-ollama)
  (setopt ellama-provider
		  (make-llm-ollama
		   :chat-model "zephyr:latest"
           :embedding-model "zephyr:latest"))
  (setopt ellama-providers
		  '(("zephyr" . (make-llm-ollama
						 :chat-model "zephyr:latest"
						 :embedding-model "zephyr:latest")))))


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/cql-mode"))

(defun setup-cql-mode()
  "Setup for cql mode."
  (require 'cql-mode)
  (add-to-list 'auto-mode-alist '("\\.cql\\'" . cql-mode)))

(setup-cql-mode)

(require 'evil-config)
(require 'custom-modes-config)
(require 'rust-config)
(require 'python-config)

(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (objc-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  (rustic-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  :config
  (fset #'jsonrpc--log-event #'ignore)
  (eglot-events-buffer-size 0))

(use-package eglot-booster
	:after eglot
	:config	(eglot-booster-mode))

(use-package elfeed
  :ensure)

(use-package fish-mode
  :ensure)

(use-package psession
  :ensure
  :config
  (setq psession-save-buffers-unwanted-buffers-regexp "\\(diary\\|\\.jpg\\|\\.png\\|\\*image-native-display\\*\\)$")
  (psession-mode 1))

;;; packages.el ends here
