;;;
;; -*- coding: utf-8 -*-
;

; (add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs4ls"))

(require 'shi-unicad)
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
;(require 'shi-nxhtml)






;;(setq-default save-place t)
(desktop-save-mode 1)


;;;  http://stackoverflow.com/questions/2627289/how-to-replace-a-region-in-emacs-with-yank-buffer-contents
;;   How to replace a region in emacs with yank buffer contents?
;
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode 1) ; makes the region visible
(line-number-mode 1)    ; makes the line number show up
(column-number-mode 1)  ; makes the column number show up

;;; 
;;
;
;(set-language-environment 'utf-8)
;(prefer-coding-system 'iso-2022-jp)
;(prefer-coding-system 'shift_jis)
;(prefer-coding-system 'euc-jp)
;(prefer-coding-system 'gb18030)
;(prefer-coding-system 'utf-8)

;;;
;; http://linux.seindal.dk/2004/08/07/gnu-emacs-and-utf-8-locale/
;

(if (eq system-type 'gnu/linux)
    (progn
        ;;;  http://stackoverflow.com/questions/2901541/which-coding-system-should-i-use-in-emacs
        ;;
        ;
        (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
        (set-language-environment 'utf-8)
        (setq locale-coding-system 'utf-8)
        (set-default-coding-systems 'utf-8)
        ;; (set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
        ;; according to online this will course copy error.
        (set-keyboard-coding-system 'utf-8)
        (set-terminal-coding-system 'utf-8)
        ;; (unless (eq system-type 'windows-nt)
        ;; (set-selection-coding-system 'utf-8))
        (prefer-coding-system 'utf-8)
        (set-clipboard-coding-system 'utf-8)
     )
)


;; (if (eq system-type 'windows-nt)
;;     (progn
;;     )
;; )

(provide 'shi)
