(add-to-list 'load-path (expand-file-name lslibpath "auto-install"))

(require 'auto-install)

(setq auto-install-directory  (expand-file-name "~/.emacs.d/auto-install/"))

(if (boundp 'http-proxy)
  (setq url-proxy-services '(("http" . http-proxy)) ) )

(auto-install-update-emacswiki-package-name t)

(auto-install-compatibility-setup)

;(auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
;(auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el")
;(auto-install-from-url "https://github.com/kiwanami/emacs-anything-books/raw/master/anything-books.el")

;;http://www.emacswiki.org/AutoInstall
(provide 'shi-auto-install)
