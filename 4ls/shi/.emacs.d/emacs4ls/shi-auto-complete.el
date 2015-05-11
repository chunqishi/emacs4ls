(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp/auto-complete-1.3.1"))

(require 'auto-complete-config)
(ac-config-default)
;;; ac-dictionary-directories is defined in the auto-complete.el, so obviously emacs will not find it. So simply change the order of the statements: 
;;  http://stackoverflow.com/questions/4281583/i-get-a-error-when-i-try-install-auto-complete-in-emacs
; 
(add-to-list 'ac-dictionary-directories "~/.emacs.d/shi-lisp/auto-complete-1.3.1/dict")
(global-auto-complete-mode t)

(provide 'shi-auto-complete)
