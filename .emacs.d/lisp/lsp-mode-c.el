;;; lsp-mode-c.el --- Package configuration for lsp for c/c++
;;; Commentary:
;;; Emacs lsp mode for c/c++ configuration --- Package configuration for lsp c/c++
;;; Code:

(defun setup-lsp-mode-c()
  (use-package ccls
    :ensure t
    :hook
    ((c-mode c++-mode objc-mode cuda-mode) .
     (lambda () (require 'ccls) (lsp)))
    :config
    (setq ccls-executable "/usr/bin/ccls")))

(provide 'lsp-mode-c)

;;; lsp-mode-c.el ends here
