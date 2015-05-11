(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))

;http://www.emacswiki.org/RecentFiles
;http://stackoverflow.com/questions/50417/how-do-i-get-list-of-recent-files-in-gnu-emacs

;;; http://gregorygrubbs.com/emacs/10-tips-emacs-windows/
;;
;
;(if (file-directory-p "c:/cygwin/bin")
;    (add-to-list 'exec-path "c:/cygwin/bin"))
	
;;  set shell to bash
;(setq shell-file-name "C:\cygwin\bin\mintty.exe -")
;(setq shell-file-name "bash")
;(setq explicit-shell-file-name shell-file-name)

(defun shell-cygwin-mintty ()
  "Run cygwin mintty in shell mode."
  (interactive)
  (setq explicit-shell-file-name "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
  (call-interactively 'shell))
	
	
;;  In Emacs init, set tramp-default-method to “sshx” or “scpx”
;(cond  ((eq window-system 'w32)
;	(setq tramp-default-method "scpx"))
;       (t
;	(setq tramp-default-method "scpc")))

(setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")
(require 'cygwin-mount)
(cygwin-mount-activate)
(require 'setup-cygwin)


;; (let* ((cygwin-root "c:/cygwin")
;;        (cygwin-bin (concat cygwin-root "/bin")))
;;   (when (and (eq 'windows-nt system-type)
;;   	     (file-readable-p cygwin-root))
    
;;     (setq exec-path (cons cygwin-bin exec-path))
;;     (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
    
;;     ;; By default use the Windows HOME.
;;     ;; Otherwise, uncomment below to set a HOME
;;     ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))
    
;;     ;; NT-emacs assumes a Windows shell. Change to baash.
;;     (setq shell-file-name "bash")
;;     (setenv "SHELL" shell-file-name) 
;;     (setq explicit-shell-file-name shell-file-name) 
    
;;     ;; This removes unsightly ^M characters that would otherwise
;;     ;; appear in the output of java applications.
;;     ;;(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))


;http://stackoverflow.com/questions/50417/how-do-i-get-list-of-recent-files-in-gnu-emacs
;http://www.emacswiki.org/RecentFiles

(provide 'shi-cygwin)

