;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "97965ccdac20cae22c5658c282544892959dc541af3e9ef8857dbf22eb70e82b" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" default))
 '(fci-rule-color "#dedede")
 '(git-gutter:update-interval 1)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(line-spacing 0.2)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(jinja2-mode rustic go-mode company-lsp git-gutter-fringe lsp-ui lsp-mode 2048-game ess monokai racket-mode evil-surround ranger hydra origami multi-term writeroom-mode rainbow-mode cider dashboard counsel org-bullets smex evil-matchit symon fireplace python-docstring gitignore-mode mmm-mode popwin color-identifiers-mode highlight-indent-guides telephone-line yaml-mode all-the-icons neotree gh-md async flycheck ## python-doctring evil goto-chg undo-tree which-key use-package))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function 'mailclient-send-it)
 '(standard-indent 4)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d1f21" :foreground "#c5c8c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "ADBO" :family "Source Code Variable")))))

(load "~/.emacs.d/main.el")


;;; init.el ends here
