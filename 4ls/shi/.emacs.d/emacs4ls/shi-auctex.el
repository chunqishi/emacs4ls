(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(add-hook 'BibTex-mode-hook 'turn-on-flyspell)

;;http://www.gnu.org/software/auctex/manual/auctex.html#Folding	
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
;;(add-hook 'find-file-hook 'TeX-fold-buffer t)
;;http://www.gnu.org/software/auctex/manual/auctex.html#Folding

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1 -interaction=nonstopmode  -shell-escape ")
 '(TeX-PDF-mode t)
 '(TeX-bar-LaTeX-buttons (quote (new-file open-file dired kill-buffer save-buffer undo cut copy paste search-forward [separator nil] latex next-error view bibtex nil)))
 '(TeX-bar-TeX-buttons (quote (new-file open-file dired kill-buffer save-buffer undo cut copy paste search-forward [separator nil] tex next-error view bibtex nil)))
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-output-view-style (quote (("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f") ("^dvi$" "." "yap -1 %dS %d") ("^pdf$" "." "SumatraPDF.exe -inverse-search \"emacsclientw.exe\" -reuse-instance %o") ("^html?$" "." "start \"\" %o"))))
 '(TeX-view-predicate-list nil)
 '(TeX-view-program-list (quote (("SumatraPDF" "Emacs_SumatraPDF.bat %o %t %n"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "SumatraPDF") (output-html "start"))))
 '(TeX-view-style (quote (("^epsf$" "start \"\" %f") ("." "yap -1 %dS %d") (" ^pdf$" "SumatraPDF.exe -reuse-instance %o")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; http://william.famille-blum.org/blog/static.php?page=static081010-000413 
(require 'sumatra-forward)
;; http://william.famille-blum.org/blog/static.php?page=static081010-000413


;; http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
;; http://stackoverflow.com/questions/5233041/emacs-and-the-server-unsafe-error
;;;
;; Suppress error "directory ~/.emacs.d/server is unsafe" 
;
 (require 'server)
  (when (and (= emacs-major-version 23)
         (= emacs-minor-version 1)
         (equal window-system 'w32))
    ;; Suppress error "directory ~/.emacs.d/server is unsafe" on Windows.
    (defun server-ensure-safe-dir (dir) "Noop" t))
(server-start)
;; http://stackoverflow.com/questions/5233041/emacs-and-the-server-unsafe-error
;; http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start


;; http://gnuemacscolorthemetest.googlecode.com/svn/html/index-tex.html
;; http://emacswiki.org/emacs/ColorTheme
(require 'color-theme)
(color-theme-initialize)
(color-theme-wheat)
;; http://emacswiki.org/emacs/ColorTheme
;; http://gnuemacscolorthemetest.googlecode.com/svn/html/index-tex.html


;; http://stackoverflow.com/questions/2478895/emacs-auctex-can-one-auto-fill-section-labels
(add-hook 'LaTeX-mode-hook (function turn-on-reftex))
(setq reftex-plug-into-AUCTeX t)
;; http://stackoverflow.com/questions/2478895/emacs-auctex-can-one-auto-fill-section-labels

;;http://fchabaud.free.fr/English/default.php?COUNT=2&FILE0=Tricks&FILE1=Emacs
(load "auto-tex")
;;http://fchabaud.free.fr/English/default.php?COUNT=2&FILE0=Tricks&FILE1=Emacs

;;http://stackoverflow.com/questions/7885853/emacs-latexmk-function-throws-me-into-an-empty-buffer
;http://stackoverflow.com/questions/7587287/how-do-i-bind-latexmk-to-one-key-in-emacs-and-have-it-show-errors-if-there-are-a
;(defun run-latexmk ()
;  (interactive)
;  (let ((TeX-save-query nil)
;        (TeX-process-asynchronous nil)
;        (master-file (TeX-master-file)))
;    (TeX-save-document "")
;    (TeX-run-TeX "latexmk" "latexmk" master-file)
;    (if (plist-get TeX-error-report-switches (intern master-file))
;        (TeX-next-error t)
;      (minibuffer-message "latexmk done"))))
;(add-hook 'LaTeX-mode-hook (lambda () (local-set-key (kbd "C-a") #'run-latexmk)))
;

;;;
;;http://stackoverflow.com/questions/9249458/latex-emacs-automatically-open-tex-help-buffer-on-error-and-close-it-after-c
;
(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
      (progn ;; Do the following commands in sequence
        (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
            (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
          ) ;; That should close the window
        (kill-buffer "*TeX Help*") ;; This should kill the buffer
        )
    )
  )

(defun run-view ()	
     "Run View"
	(interactive)
	(TeX-PDF-mode t) 
    (TeX-command "View" (quote TeX-master-file) -1)
	(TeX-command "Clean" (quote TeX-master-file) -1)
	(setq TeX-show-compilation t) 
	)
  
(defun run-latexmk ()
  "Run: Save & Latexmk"
  (interactive)
  (let ((TeX-save-query nil)
        (TeX-process-asynchronous nil)
        (master-file (TeX-master-file)))
  (TeX-save-document "")
  (TeX-run-TeX "Latexmk" 
        (TeX-command-expand "latexmk %s" 
		 (lambda (ext-ignored nondir)
            (TeX-master-file t nondir)))
                 master-file)
  (if (plist-get TeX-error-report-switches (intern master-file))
   (TeX-next-error t)   
   (progn    
    (demolish-tex-help)	
	(minibuffer-message "Latexmk Done!")	
	))))

	
(add-hook 'LaTeX-mode-hook (lambda () (local-set-key (kbd "C-a") #'run-latexmk)))
;;http://stackoverflow.com/questions/7885853/emacs-latexmk-function-throws-me-into-an-empty-buffer

;;http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?AUCTeX
;http://stackoverflow.com/questions/2199678/how-to-call-latexmk-in-emacs-and-jump-to-next-error
(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                      (add-to-list 'TeX-command-list
                                   '("Latexmk" "latexmk %s"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk")))))

(add-hook 'LaTeX-mode-hook
           (function (lambda ()
                       (add-to-list 'TeX-command-list
                                    '("HTLatex" "htlatex %s"
                                      TeX-run-TeX nil (latex-mode) :help "Run HTLatex")))))


;;http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?AUCTeX
(provide 'shi-auctex)
