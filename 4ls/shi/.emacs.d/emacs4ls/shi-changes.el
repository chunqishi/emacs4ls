
;; http://emacs-fu.blogspot.jp/2009/05/tracking-changes.html
;; higlight changes in documents
(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil)
;; initially hide
;; toggle visibility
(global-set-key (kbd "<f6>")      'highlight-changes-visible-mode) ;; changes
;; remove the change-highlight in region
(global-set-key (kbd "S-<f6>")    'highlight-changes-remove-highlight)
;; alt-pgup/pgdown jump to the previous/next change
;; if you're not already using it for something else...
(global-set-key (kbd "<M-up>") 'highlight-changes-next-change)
(global-set-key (kbd "<M-down>")  'highlight-changes-previous-change)
(set-face-foreground 'highlight-changes nil)
(set-face-background 'highlight-changes "#382f2f")
(set-face-foreground 'highlight-changes-delete nil)
(set-face-background 'highlight-changes-delete "#916868")
;; (highlight-changes ((t (:foreground nil :background "#382f2f"))))
;; (highlight-changes-delete ((t (:foreground nil :background "#916868")))) 
;; http://emacs-fu.blogspot.jp/2009/05/tracking-changes.html


;; http://www.emacswiki.org/emacs/TrackChanges
;; (require 'hilit-chg)
;; (make-empty-face 'highlight-changes-saved-face)
;; (setq highlight-changes-face-list '(highlight-changes-saved-face) )
;; 
;; Example: activate highlight changes with rotating faces for C programming
;; (add-hook 'c-mode-hook
;; 	  (function (lambda ()
;;              (add-hook 'local-write-file-hooks 'highlight-changes-rotate-faces)
;; 	     (highlight-changes-mode t)
;;                     ))
;; )
;; 
;; (defun highlight-changes-remove-after-save ())
;;  "Remove previous changes after save." 
;; (make-local-variable 'after-save-hook)
;; (add-hook 'after-save-hook
;;	    (lambda ()
;;		(highlight-changes-remove-highlight (point-min) (point-max)))
;;  )
;; http://www.emacswiki.org/emacs/TrackChanges

;; http://zhangda.wordpress.com/2012/02/16/188/
;; http://zhangda.wordpress.com/2012/02/16/188/

;;http://www.emacswiki.org/emacs/goto-last-change.el
(autoload 'goto-last-change "goto-last-change"
   "Set point to the position of the last change." t)
(global-set-key (kbd "C-x ,") 'goto-last-change)
;;http://www.emacswiki.org/emacs/goto-last-change.el


(provide 'shi-changes)