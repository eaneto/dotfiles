;;; python-config.el --- Package configuration for Python
;;; Commentary:
;;; Emacs Python configuration --- Package configuration for Emacs Python
;;; Code:

;; Applies black formatter on save.
(use-package python-black
  :ensure t
  :defer t
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))

;; Remove unused imports on save.
(use-package pyimport
  :ensure t
  :defer t
  :after python
  :hook
  (python-mode . (lambda()
                   (add-hook 'before-save-hook #'pyimport-remove-unused t t))))

;; Order imports with isort on save.
(use-package python-isort
  :ensure t
  :defer t
  :hook
  (python-mode . (lambda()
                   (add-hook 'before-save-hook 'python-isort-on-save-mode))))

(provide 'python-config)

;;; python-config.el ends here
