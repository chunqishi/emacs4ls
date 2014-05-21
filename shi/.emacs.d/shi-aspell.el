(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))


;;;
;; Use Aspell for spell checking
;
(setq-default ispell-program-name "aspell")
;;(setq ispell-program-name "aspell")
(require 'ispell)

(provide 'shi-aspell)

