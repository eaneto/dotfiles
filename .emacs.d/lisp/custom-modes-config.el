;;; custom-modes-config.el --- Package configuration for custom modes packages
;;; Commentary:
;;; Emacs custom modes configuration --- Package configuration for Emacs custom modes
;;; Code:

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package js2-mode
  :ensure t
  :defer t)

(use-package web-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (setq web-mode-css-indent-offset 4))

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package arduino-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package groovy-mode
  :ensure t
  :defer t)

(use-package feature-mode
  :ensure t)

(use-package terraform-mode
  :ensure t)

(use-package alda-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(provide 'custom-modes-config)

;;; custom-modes-config.el ends here
