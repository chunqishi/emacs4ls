;;; http://www.emacswiki.org/emacs/thesaurus.el
;;  replace a word with a synonym looked up in a web service.
;

(require 'thesaurus)

(setq thesaurus-bhl-api-key "42e1d4b5a0f8139d0dbdce6270d09443")  ;; from registration
;; (thesaurus-set-bhl-api-key-from-file "~/BigHugeLabs.apikey.txt")
(define-key global-map (kbd "C-c t") 'thesaurus-choose-synonym-and-replace)

(provide 'shi-thesaurus)

