#$latex = 'platex -file-line-error -kanji=utf8 -guess-input-enc -synctex=1';
#$bibtex = 'pbibtex -kanji=utf8';
#$makeindex = 'mendex -U';
#$dvipdf = 'dvipdfmx %O -o %D %S';
#$dvips = 'dvips %O -z -f %S | convbkmk -g > %D';
#$ps2pdf = 'ps2pdf.bat %O %S %D';
#$pdf_mode = 3;

$pdf_mode = 1;
$recorder = 1;
$latex = 'latex -file-line-error -recorder -halt-on-error -shell-escape -synctex=-1 -interaction=nonstopmode -src-specials %O %S';
$pdflatex = 'pdflatex -file-line-error -recorder -halt-on-error -shell-escape -synctex=-1  -interaction=nonstopmode -src-specials %O %S';
$pdf_previewer = 'open -a skim';
$clean_ext = "bbl gls glg glo bak backup %R-blx.bib run.xml ist gst synctex.gz";
$bibtex = 'bibtex %O %B';

#http://stackoverflow.com/questions/7587287/how-do-i-bind-latexmk-to-one-key-in-emacs-and-have-it-show-errors-if-there-are-a
#$pdf_mode = 1;
#$recorder = 1;
#$latex = 'latex -recorder -halt-on-error -interaction=nonstopmode -shell-escape %O %S';
#$pdflatex = 'pdflatex -recorder -halt-on-error -interaction=nonstopmode -shell-escape  %O %S';
#$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
