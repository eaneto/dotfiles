;;; rust-config.el --- Package configuration for rust
;;; Commentary:
;;; Emacs rust configuration --- Package configuration for Emacs rust
;;; Code:

(use-package rust-mode
  :ensure)

(use-package rustic
  :ensure
  :config
  (setq rustic-format-on-save t))

(provide 'rust-config)

;;; rust-config.el ends here
