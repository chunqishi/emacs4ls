;(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp/nxhtml"))

;; (require 'workaround-mumamo-buffer-file-name-warnings)

;; Workaround the annoying warnings:
;;    Warning (mumamo-per-buffer-local-vars):
;;    Already 'permanent-local t: buffer-file-name

(when (and (equal emacs-major-version 24)
           (equal emacs-minor-version 2))
  (eval-after-load "mumamo"
    '(setq mumamo-per-buffer-local-vars
           (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

(load "~/.emacs.d/shi-lisp/nxhtml/autostart.el")


(provide 'shi-nxhtml)
