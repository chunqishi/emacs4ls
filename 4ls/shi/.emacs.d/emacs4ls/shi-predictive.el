(add-to-list 'load-path (expand-file-name lslibpath "predictive"))

;; dictionary locations
(add-to-list 'load-path (expand-file-name lslibpath "predictive/latex"))
;(add-to-list 'load-path (expand-file-name lslibpath "predictive/texinfo"))
;(add-to-list 'load-path (expand-file-name lslibpath "predictive/html"))

;;;
;;  http://superuser.com/questions/326431/why-is-emacs-predictive-mode-not-working-for-latex-documents/328812#328812
;   Predictive mode requires compilation

(require 'predictive)
;(autoload 'predictive-mode "predictive" "Turn on Predictive Completion Mode." t)
;(set-default 'predictive-auto-add-to-dict t)
;(add-hook 'major-mode-hook 'turn-on-predictive-mode)	  

;;;
;;  http://www.dr-qubit.org/predictive/predictive-user-manual/html/index.php
;   
(autoload 'predictive-mode "predictive"
   "Turn on Predictive Mode." t)
(autoload 'auto-completion-mode "auto-completion"
   "Turn on Auto Completion Mode." t)

(predictive-mode)
   
(global-set-key (kbd "C-x TAB") 'auto-completion-mode)

;; Use space and punctuation to accept the current the most likely completion.
;(setq auto-completion-syntax-alist (quote (global accept . word))) 
;; Avoid completion for short trivial words.
;(setq auto-completion-min-chars (quote (global . 2))) 
	  
(provide 'shi-predictive)
