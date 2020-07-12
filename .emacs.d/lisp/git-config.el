;;; git-config.el --- Package configuration for git packages
;;; Commentary:
;;; Emacs git configuration --- Package configuration for git
;;; Code:

(defun setup-git-packages()
  (use-package magit
    :ensure t
    :defer t))

(provide 'git-config)

;;; git-config.el ends here
