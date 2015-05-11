(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs4ls/"))
(let ((default-directory "~/.emacs.d/emacs4ls/")) 
     (normal-top-level-add-subdirs-to-load-path))
  
(require 'shi)
(setq debug-on-error t)

