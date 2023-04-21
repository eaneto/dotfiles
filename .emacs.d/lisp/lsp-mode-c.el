;;; lsp-mode-c.el --- Package configuration for lsp for c/c++
;;; Commentary:
;;; Emacs lsp mode for c/c++ configuration --- Package configuration for lsp c/c++
;;; Code:

(use-package ccls
  :ensure t
  :hook
  ((c-mode c++-mode objc-mode cuda-mode) .
   (lambda () (require 'ccls) (lsp)))
  :init
  (defun +my/ccls-code-lens ()
    (when (member major-mode '(c-mode c++-mode))
      (ccls-code-lens-mode 1)))
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (add-hook 'lsp-after-open-hook #'+my/ccls-code-lens))

(provide 'lsp-mode-c)

;;; lsp-mode-c.el ends here
