; (require 'column-marker)
; (add-hook 'LaTeX-mode-hook (lambda () (interactive) (column-marker-1 80)))

; (global-set-key [?\C-c ?m] 'column-marker-1)

;;;
;; http://www.emacswiki.org/emacs/FillColumnIndicator
;
(require 'fill-column-indicator)

(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'LaTeX-mode-hook 'fci-mode)
; (add-hook 'after-change-major-mode-hook 'fci-mode)

(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


(provide 'shi-column)