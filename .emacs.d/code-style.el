;;; code-style.el --- Functions to set up code style.
;;; Commentary:
;;; Set up code style --- Functions to set up code style.
;;;
;;; Code:

(defun set-c-code-style()
  "C indentation and code style."
  (setq-default c-default-style "linux")
  (setq-default c-basic-offset 4
                tab-width 4
                indent-tabs-mode nil))

(set-c-code-style)

;;; code-style.el ends here
