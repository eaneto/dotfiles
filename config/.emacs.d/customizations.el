;;; customizations.el --- Configs and key maps for Emacs.
;;; Commentary:
;;; Configure Emacs --- Configs and key maps for Emacs.
;;;
;;; Code:

(setq inhibit-startup-message t)

(defun visual-config-modes()
  "Visual modes. Removes tool and menu bar, removes scroll bar and display line numbers."
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (global-linum-mode t))

(defun set-default-indentation()
  "Configures the default indentation (4 spaces)."
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq indent-line-function 'insert-tab)
  (global-set-key (kbd "RET") 'newline-and-indent))

(defun enable-ido-mode()
  "Enables ido-mode."
  (setq-default ido-enable-flex-matching t)
  (setq-default ido-everyehere t)
  (ido-mode 1))

(defun beginning-of-line++ ()
  "Go to first character on a line."
  (interactive)
  (if (bolp)
	  (back-to-indentation)
	(beginning-of-line)))

(visual-config-modes)
(set-default-indentation)
(enable-ido-mode)

;; Autoclose brackets, quotes.
(electric-pair-mode 1)

;; Sets bash to be used as shell.
(defvar explicit-shell-file-name "/bin/bash")

;; Sets ibuffer as default.
(defalias 'list-buffers 'ibuffer)

(global-set-key (kbd "C-a") 'beginning-of-line++)

;; Env variables
(setenv "SCRIPTS" "/home/eldron/Projects/scripts-and-config/scripts/")

;;; customizations.el ends here
