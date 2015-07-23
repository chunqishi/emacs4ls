(require 'auto-complete-auctex)


(add-hook 'tex-mode-hook
       (lambda ()
         (require 'ac-tex-ref)
         (set (make-local-variable 'ac-sources)
              '(ac-source-tex-ref
                ac-source-tex-cite))))


(provide 'shi-auto-complete-auctex)
