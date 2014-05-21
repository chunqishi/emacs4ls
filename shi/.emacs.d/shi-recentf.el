(add-to-list 'load-path (expand-file-name "~/.emacs.d/shi-lisp"))

;http://www.emacswiki.org/RecentFiles
;http://stackoverflow.com/questions/50417/how-do-i-get-list-of-recent-files-in-gnu-emacs

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;http://stackoverflow.com/questions/50417/how-do-i-get-list-of-recent-files-in-gnu-emacs
;http://www.emacswiki.org/RecentFiles

(provide 'shi-recentf)

