;;; rust-config.el --- Package configuration for rust
;;; Commentary:
;;; Emacs rust configuration --- Package configuration for Emacs rust
;;; Code:

(defun setup-rust-packages()
  (use-package rustic
    :ensure t))

(provide 'rust-config)

;;; rust-config.el ends here
