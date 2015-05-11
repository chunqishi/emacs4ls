(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))

;;;  http://www.emacswiki.org/emacs/PowerShell
;;
;
;;;  Powershell Editor
;;
;
(require 'powershell-mode)

;;;  Running Powershell
;;
;
(autoload 'powershell "powershell" "Run powershell as a shell within emacs." t)


(provide 'shi-powershell)

