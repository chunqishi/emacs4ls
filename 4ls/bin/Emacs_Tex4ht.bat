@echo off
REM @NAME: Tex4ht.bat 
REM @TIME: 2013-04-23 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM @REF: http://www.tug.org/utilities/texconv/textopc.html
REM @REF: http://tug.org/applications/tex4ht/mn-commands.html
REM @REF: 
REM @INF:
REM @USAGE:
REM @PARMS:
REM @REUIRED: latex, tex4ht,


if [%1]==[] goto usage
set WORK_HOME=%CD%
set FILENAME=%~n1
set BAT_HOME=%~dp0
set TEX_HOME=%~dp1

cd TEX_HOME
if not exist %TEX_HOME%\html mkdir %TEX_HOME%\html
REM: @COMMENT notice delete .
echo y | del /S %TEX_HOME%\html\* 



REM @COMMENT: usage of latex4ht
REM htlatex $1 "$2" "$3" "$4" "$5"
REM $1 is the name of the file containing the latex source. It is passed to all the tools in the chain.
REM $2 is part of a parameter passed to a mysterious command \HCode defined in place for the latex command, 
REM and whose mission I didn't try to understand. options is for the tex4ht.sty and *.4ht.
REM I  will ignore this parameter until someone better equiped than me can discover its function
REM $3 is passed to tex4ht as part of the -i option, and thus serve to specify a folder for fonts.
REM $4 is passed to t4ht so looks like a place where we can specify additional switches for t4ht.
REM $5 is passed to latex, so it looks like a place where we can specify additional switches for latex.

htlatex %FILENAME%.tex html "" -dhtml "--interaction=nonstopmode"

REM REM: mk4ht oolatex filename
REM htlatex %FILENAME% "xhtml,charset=utf-8,ooffice, dbcs/!" "ooffice/! -cmozhtf" "-coo -dhtml" "-interaction=nonstopmode"
REM 
REM pause
REM 
REM REM: 
REM htlatex %FILENAME% "xhtml,charset=utf-8,uni-html4, dbcs/!,word" "symbol/!" "-cvalidate -dhtml"  "-interaction=nonstopmode"
REM 

:clean
del %FILENAME%.4tc %FILENAME%.4ct %FILENAME%.tmp %FILENAME%.xref %FILENAME%.idv %FILENAME%.lg %FILENAME%.html %FILENAME%.css %FILENAME%.dvi   > nul
cd %WORK_HOME%


:usage
echo.
echo Usage: %0 file.tex
echo *** NOTICE ***: %TEX_HOME%\html will be deleted!
echo.

REM: @COMMENT end. 
:exit