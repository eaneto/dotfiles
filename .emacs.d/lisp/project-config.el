;;; project-config.el --- Package configuration for evil packages
;;; Commentary:
;;; Emacs Evil configuration --- Package configuration for Emacs evil
;;; Code:

(defun setup-project-packages()
  (use-package ag
    :ensure t)

  (use-package projectile
    :ensure t
    :config
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (setq projectile-project-search-path '("~/projects/"))
    (projectile-mode +1)))

(provide 'project-config)

;;; project-config.el ends here
