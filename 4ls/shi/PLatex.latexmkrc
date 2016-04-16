$latex = 'platex -file-line-error -kanji=utf8 -guess-input-enc -synctex=1';
$bibtex = 'pbibtex -kanji=utf8';
$makeindex = 'mendex -U';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -g > %D';
$ps2pdf = 'ps2pdf.bat %O %S %D';
$pdf_mode = 3;
