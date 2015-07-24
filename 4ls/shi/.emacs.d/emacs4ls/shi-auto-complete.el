(add-to-list 'load-path (expand-file-name lslibpath "auto-complete-1.5.0") )

(require 'auto-complete-config)
(ac-config-default)
;;; ac-dictionary-directories is defined in the auto-complete.el, so obviously emacs will not find it. So simply change the order of the statements: 
;;  http://stackoverflow.com/questions/4281583/i-get-a-error-when-i-try-install-auto-complete-in-emacs
; 
(add-to-list 'ac-dictionary-directories (expand-file-name lslibpath "auto-complete-1.5.0/dict"))
(global-auto-complete-mode t)

(provide 'shi-auto-complete)
