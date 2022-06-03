;;; rust-config.el --- Package configuration for rust
;;; Commentary:
;;; Emacs rust configuration --- Package configuration for Emacs rust
;;; Code:

(use-package rustic
  :ensure t
  :config
  (setq lsp-rust-server 'rust-analyzer))

(provide 'rust-config)

;;; rust-config.el ends here
