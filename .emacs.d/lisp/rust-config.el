;;; rust-config.el --- Package configuration for rust
;;; Commentary:
;;; Emacs rust configuration --- Package configuration for Emacs rust
;;; Code:

(use-package rustic
  :ensure t
  :config
  (setq lsp-rust-server 'rust-analyzer)
  (setq rustic-format-on-save t))

(provide 'rust-config)

;;; rust-config.el ends here
