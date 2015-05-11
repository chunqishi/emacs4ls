(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))

;disable default backup
(setq backup-inhibited t)

;;http://stackoverflow.com/questions/6916529/how-can-i-make-emacs-backup-every-time-i-save
(require 'backup-each-save)
(add-hook 'after-save-hook 'backup-each-save)
;;http://stackoverflow.com/questions/6916529/how-can-i-make-emacs-backup-every-time-i-save


;; http://stackoverflow.com/questions/6138029/how-to-add-a-hook-to-only-run-in-a-particular-mode
;;   (defun a-test-save-hook()
;;   	"Test of save hook"
;;  	(message "banana")
;;   )
;;	(add-hook 'after-save-hook 'a-test-save-hook)
;; http://stackoverflow.com/questions/6138029/how-to-add-a-hook-to-only-run-in-a-particular-mode


(provide 'shi-backup)
