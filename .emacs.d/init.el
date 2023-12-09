;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)




;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "3a1a6a9cbff383a7122f7b2e5be7ca3c3951cab4705d2303c887368693c75fd3" "f0f5bfda176875f70299b2a3a07e778f23b8af81defe3bc40babd0a85f88d411" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(package-selected-packages
   '(deadgrep flx citar-embark citar exec-path-from-shell gptel writeroom-mode magit protobuf-mode dockerfile-mode latex-preview-pane jinja2-mode olivetti web-mode hl-todo ivy-xref evil-collection flycheck counsel evil-surround diff-hl python-isort pyimport python-black ansible monokai-theme yasnippet yaml-mode which-key use-package telephone-line rustic ranger org-bullets highlight-indent-guides go-mode evil-matchit company all-the-icons))
 '(pdf-latex-command "xelatex"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/main.el")
