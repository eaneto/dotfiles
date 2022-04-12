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

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  :hook (go-mode . yas-minor-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  (go-mode . lsp-deferred)
  :config
  (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("~/.local/bin/terraform-lsp" "-enable-log-file"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

  (add-hook 'terraform-mode-hook #'lsp))

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

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package latex-preview-pane
  :ensure t
  :init
  (latex-preview-pane-enable))

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

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :config (setq lsp-python-ms-executable
      "~/projects/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")

  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

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
(require 'project-config)
(require 'custom-modes-config)
(require 'elixir-config)
(require 'lsp-mode-c)
(require 'rust-config)

;;; packages.el ends here
