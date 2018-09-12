(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jdee-server-dir "/home/eldron/jdee-server")
 '(package-selected-packages
   (quote
	(company-anaconda anaconda-mode pyenv-mode company-arduino all-the-icons neotree gh-md sphinx-doc arduino-mode evil-magit async magit flycheck jdee latex-preview-pane function-args java-snippets react-snippets ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key try use-package)))
 '(standard-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)

(let ((filename "~/.emacs.d/scratchbuffermsg.txt"))
  (when (and (file-exists-p filename)
             (get-buffer "*scratch*"))
    (with-current-buffer "*scratch*"
      (erase-buffer)
      (insert-file-contents filename))))
;;(setq initial-scratch-message "\
;; _____                          
;;| ____|_ __ ___   __ _  ___ ___ 
;;|  _| | '_ ` _ \ / _` |/ __/ __|
;;| |___| | | | | | (_| | (__\__ \ \n
;;|_____|_| |_| |_|\__,_|\___|___/
;;")

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

(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)

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

(setq evil-magit-state 'motion)
(require 'evil-magit)

(use-package function-args
  :ensure t)

(fa-config-default)

(use-package arduino-mode
  :ensure t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'anaconda-mode)
(require 'pyenv-mode)

(require 'all-the-icons)

(latex-preview-pane-enable)

;; Regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; Sphinx-doc config.
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

;; Removes tool bar.
(tool-bar-mode -1)

;; Display line numbers
(global-linum-mode t)

;; Autoclose brackets, quotes.
(electric-pair-mode 1)

;; Sets tabs width to 4 spaces.
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(global-set-key (kbd "RET") 'newline-and-indent)

(scroll-bar-mode 0)

;; Sets bash to be used as shell.
(setq explicit-shell-file-name "/bin/zsh")

(setq ido-enable-flex-matching t)
(setq ido-everyehere t)
(ido-mode t)

(defalias 'list-buffers 'ibuffer)

(setq c-default-style "linux")
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/Projects/linux")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))
