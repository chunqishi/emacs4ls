(defvar lspath "~/.emacs.d/emacs4ls/" "The is the path for provided el files")

(let ((default-directory lspath))
     (normal-top-level-add-subdirs-to-load-path) )
(add-to-list 'load-path (expand-file-name lspath) )


(require 'shi)
(setq debug-on-error t)

