(add-to-list 'load-path (expand-file-name lslibpath "names-0.5.4") )
;;;
;;
;
(require 'aggressive-indent)

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

; (global-aggressive-indent-mode 1)
; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;;
;; indent-guide
;
(require 'indent-guide)
(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-delay 0.1)
(setq indent-guide-recursive t)
; (setq indent-guide-char ":")





(provide 'shi-indent)