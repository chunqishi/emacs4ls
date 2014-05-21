@echo off 
REM @NAME: Emacs_PDF2PS.bat 
REM @TIME:2012-08-23 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM @REF: http://tex.stackexchange.com/questions/20883/how-to-convert-pdf-to-eps
REM @REF: 
REM @REF: 
REM @REF: 
REM @INF: 
REM @USAGE:
REM 
REM 
REM 
REM @PARMS: %1 (path-of-pdf) [%2 (path-of-ps)]
REM @REUIRED: pdfcrop, pdftops


REM @COMMENT: the dash %~1 removes stupid quotation marks 
set BAT_HOME=%~dp0

set TIME_MARK=%DATE:/=-%_%TIME::=-%
set TIME_MARK=%TIME_MARK: =_%

%BAT_HOME%bibtool.exe -d -o merged_%TIME_MARK%.bib -s %*

:exit