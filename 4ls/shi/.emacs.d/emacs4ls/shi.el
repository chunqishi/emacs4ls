;;;
;; -*- coding: utf-8 -*-
;

(defvar lslibpath (expand-file-name lspath "shi-lisp") "The is the path for third-party el files")
(add-to-list 'load-path (expand-file-name lslibpath))

; (message "info: %s" lslibpath)

(require 'shi-unicad)
(require 'shi-column)
(require 'shi-auto-install)
(require 'shi-auctex)
(require 'shi-aspell)
(require 'shi-backup)
(require 'shi-changes)
(require 'shi-anything)
(require 'shi-thesaurus)
(require 'shi-yasnippet)
(require 'shi-predictive)
(require 'shi-auto-complete)
(require 'shi-auto-complete-auctex)
(require 'shi-windows-path)
;(require 'shi-cygwin)
(require 'shi-powershell)
(require 'shi-recentf)
(require 'shi-indent)
;(require 'shi-nxhtml)


(if (boundp 'lshttpproxy)
    (setq url-proxy-services (list (cons "http" lshttpproxy))) )


(desktop-save-mode 1)

;;;  http://stackoverflow.com/questions/2627289/how-to-replace-a-region-in-emacs-with-yank-buffer-contents
;;   How to replace a region in emacs with yank buffer contents?
;
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode 1) ; makes the region visible
(line-number-mode 1)    ; makes the line number show up
(column-number-mode 1)  ; makes the column number show up


(provide 'shi)
