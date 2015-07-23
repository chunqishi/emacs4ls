(add-to-list 'load-path (expand-file-name lslibpath "auto-install"))

(require 'auto-install)

(setq auto-install-directory "~/.emacs.d/shi-lisp/auto-install/")
(setq url-proxy-services '(("http" . "proxy.kuins.net:8080")) )
(auto-install-compatibility-setup)

;(auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
;(auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el")
;(auto-install-from-url "https://github.com/kiwanami/emacs-anything-books/raw/master/anything-books.el")

;;http://www.emacswiki.org/AutoInstall
(provide 'shi-auto-install)
