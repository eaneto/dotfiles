;;; rust-config.el --- Package configuration for rust
;;; Commentary:
;;; Emacs rust configuration --- Package configuration for Emacs rust
;;; Code:

(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))

(use-package rustic
  :ensure t
  :after (rust-mode)
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-format-trigger 'on-save)
  (push 'rustic-clippy flycheck-checkers)
  ; Disable rustfmt new buffer
  (setq rustic-format-display-method 'ignore))

(provide 'rust-config)

;;; rust-config.el ends here
