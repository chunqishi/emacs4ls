;; Auto-tex (chabaud@celar.fr)
;; Automatic compilation of TeX files on saving
;; (inspired from html-mode.el auto-browsing feature)

(defun tex-file-and-delete-window ()
  "Tex file and shrink the tex window to 9 lines."
  (tex-file)
  (save-selected-window
    (switch-to-buffer-other-window (get-buffer "*tex-shell*"))
    (shrink-window (- (window-height) 9))
    (end-of-buffer))
  
;  (delete-window (get-buffer-window (get-buffer "*tex-shell*")))
  )

(defun tex-autoview-mode (&optional arg)
  "Toggle automatic texing upon saving buffer.
With positive prefix ARG always turns texing on, with negative ARG always off.
Can be used as a value for `tex-mode-hook'."
  (interactive "P")
  (if (setq arg (if arg
		    (< (prefix-numeric-value arg) 0)
		  (and (boundp 'after-save-hook)
		       (memq 'tex-file-and-delete-window after-save-hook))))
      (setq after-save-hook (delq 'tex-file-and-delete-window after-save-hook))
    (make-local-hook 'after-save-hook)
    (add-hook 'after-save-hook 'tex-file-and-delete-window t 0)
    )
  (message "Autotexing turned %s."
	   (if arg "off" "on")))

;; Now adding the menu entry
(add-hook 'tex-mode-hook
	  '(lambda () (define-key tex-mode-map [menu-bar tex tex-autoview-mode]
			'("Automatic Tex Toggle" . tex-autoview-mode))))

;; End of auto-tex.el
