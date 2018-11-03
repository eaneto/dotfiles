;;; customizations.el --- Configs and key maps for Emacs.
;;; Commentary: Configure Emacs --- Configs and key maps for Emacs.

(setq inhibit-startup-message t)

;; Removes tool bar.
(tool-bar-mode -1)

;; Display line numbers
(global-linum-mode t)

;; Autoclose brackets, quotes.
(electric-pair-mode 1)

;; Sets tabs width to 4 spaces.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Removes scroll bar.
(scroll-bar-mode 0)

;; Sets bash to be used as shell.
(setq explicit-shell-file-name "/bin/bash")

;; Enables ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everyehere t)
(ido-mode 1)

;; Sets ibuffer as default.
(defalias 'list-buffers 'ibuffer)

(setq c-default-style "linux")
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(defun beginning-of-line++ ()
  (interactive)
  (if (bolp)
	  (back-to-indentation)
	(beginning-of-line)))
(global-set-key (kbd "C-a") 'beginning-of-line++)
