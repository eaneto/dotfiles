;;; custom.el --- custom set variables.
;;; Commentary:
;;; Custom set variables --- custom set variables.

;;; Code:

(custom-set-variables
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"])
 '(ansi-term-color-vector
   [unspecified "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"] t)
 '(custom-enabled-themes (quote (base16-tomorrow-night)))
 '(package-selected-packages
   (quote
	(dumb-jump ag apache-mode elixir-mode vue-mode mmm-mode python-docstring popwin eshell-prompt-extras color-identifiers-mode highlight-indent-guides telephone-line yaml-mode dockerfile-mode company-anaconda anaconda-mode pyenv-mode all-the-icons neotree gh-md sphinx-doc arduino-mode evil-magit async magit flycheck latex-preview-pane function-args ## python-doctring web-mode markdown-mode php-mode rjsx-mode js2-mode evil py-autopep8 goto-chg undo-tree auto-complete elpy base16-theme which-key use-package)))
 '(send-mail-function (quote mailclient-send-it))
 '(standard-indent 4))

(custom-set-faces)

;;; custom.el ends here
