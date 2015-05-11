(let ((default-directory "~/.emacs.d/emacs4ls/")) 
     (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs4ls/"))
  
(require 'shi)
(setq debug-on-error t)

