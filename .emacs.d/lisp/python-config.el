;;; python-config.el --- Package configuration for python packages
;;; Commentary:
;;; Emacs python configuration --- Package configuration for python
;;; Code:

(defun setup-python-packages()
  (use-package elpy
    :ensure t
    :init
    (elpy-enable)
    (setq elpy-rpc-python-command "python3.7")
    (setq python-shell-interpreter "python3.7"
          python-shell-interpreter-args "-i"))

  (use-package py-autopep8
    :ensure t
    :config
    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

  (use-package pyenv-mode
    :ensure t)

  (use-package flycheck-mypy
    :ensure t)

  (flycheck-define-checker
    python-mypy ""
    :command ("mypy"
              "--ignore-missing-imports" "--fast-parser"
              "--python-version" "3.7"
              source-original)
    :error-patterns
    ((error line-start (file-name) ":" line ": error:" (message) line-end))
    :modes python-mode)

  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t))

(provide 'python-config)

;;; python-config.el ends here
