;;; scratch.el --- Function to load scratch message file
;;; Commentary:
;;; Function to load scratch message file
;;;
;;; Code:

(let ((filename "~/.emacs.d/scratchbuffermsg.txt"))
  (when (and (file-exists-p filename)
             (get-buffer "*scratch*"))
    (with-current-buffer "*scratch*"
      (erase-buffer)
      (insert-file-contents filename))))
