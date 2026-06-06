;;; customizations.el --- Configs and key maps for Emacs.
;;; Commentary:
;;; Configure Emacs --- Configs and key maps for Emacs.
;;;
;;; Code:

(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(defun visual-config-modes()
  "Visual modes. Removes tool and menu bar,
removes scroll bar and display line numbers."
  (setq inhibit-startup-message t)
  (setq-default show-trailing-whitespace t)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (setq display-line-numbers-type 'relative)
  (show-paren-mode 1)
  (global-hl-line-mode))

(defun enable-ido-mode()
  "Enables ido-mode."
  (setq-default ido-enable-flex-matching t)
  (setq-default ido-everyehere t)
  (ido-mode 1))

(defun beginning-of-line++()
  "Go to first character on a line."
  (interactive)
  (if (bolp)
	  (back-to-indentation)
	(beginning-of-line)))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(visual-config-modes)
(setq-default c-basic-offset 4
              tab-width 4)

; Disables flycheck on c/c++ mode.
(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (flycheck-mode -1))))

; Always indent with spaces
(setq indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)
(enable-ido-mode)

(add-hook 'term-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)))

;; Autoclose brackets, quotes.
(electric-pair-mode 1)

;; Sets zsh to be used as shell.
(setq explicit-shell-file-name "/usr/bin/zsh")

;; Sets ibuffer as default.
(defalias 'list-buffers 'ibuffer)

(global-set-key (kbd "C-a") 'beginning-of-line++)

;; Configure js-mode for avro schema defition files
(add-to-list 'auto-mode-alist '("\\.avsc\\'" . js-mode))

(defun set-fifteen-minute-timer()
  (interactive)
  (org-timer-set-timer "00:15:00"))

(defun set-five-minute-timer()
  (interactive)
  (org-timer-set-timer "00:05:00"))

(defvar custom/xref-window-stack nil
  "Stack of windows from which xref definitions were jumped.")

(defun custom/xref-find-definitions-smart ()
  "Window-aware find definition.
Jump to definition in the other window if the target buffer is already
displayed there, otherwise jump in the current window."
  (interactive)
  (let* ((identifier (xref--read-identifier "Find definitions of: "))
         (xrefs (xref-backend-definitions (xref-find-backend) identifier))
         (xref (car xrefs))
         (location (xref-item-location xref))
         (file (expand-file-name (xref-location-group location)))
         (target-window (get-buffer-window (get-file-buffer file) t)))
    (if (and target-window (not (eq target-window (selected-window))))
        (progn
          (push (selected-window) custom/xref-window-stack)
          (xref-find-definitions-other-window identifier))
      (xref-find-definitions identifier))))

(defun custom/xref-pop-marker-stack ()
  "Pop the xref marker stack, returning to the origin window if recorded.
This custom function exists so that it works well with multiple windows."
  (interactive)
  (let ((origin-window (pop custom/xref-window-stack)))
    (if (and origin-window (window-live-p origin-window))
        (let ((current-window (selected-window))
              (current-buffer (current-buffer)))
          (xref-go-back)
          (let ((target-buffer (current-buffer))
                (target-point (point)))
            (if (eq target-buffer current-buffer)
                ;; Same buffer, just go back normally, no window juggling needed
                (goto-char target-point)
              (set-window-buffer current-window current-buffer)
              (select-window origin-window)
              (switch-to-buffer target-buffer)
              (goto-char target-point))))
      (xref-go-back))))

(global-set-key (kbd "M-.") #'custom/xref-find-definitions-smart)
(global-set-key (kbd "M-,") #'custom/xref-pop-marker-stack)

(advice-add 'xref-go-back :after
            (lambda (&rest _) (pop custom/xref-window-stack)))


;;; customizations.el ends here
