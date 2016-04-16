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
set BAT_NAME=%~0

:next
if "%~1"=="" goto all
set PDF_FILE=%CD%\%~1
set PS_FILE=%~dp1%~n1.eps

if not [%~x1]==[.pdf]  (
echo.
echo ***WARN*** %~x1 file, not PDF.
shift 
goto next
)
REM echo %BAT_HOME% %PDF_FILE% %PS_FILE%
REM if [%2]==[-eps] set PS_FILE=%CD%\%~3
REM echo %BAT_HOME% %PDF_FILE% %PS_FILE%

REM @COMMENT: pdf2eps <page number> <pdf file without ext>
set TEMP=%DATE:/=-%_%TIME::=-%
set TEMP=%~dp1%~n1.%TEMP: =_%

REM @COMMENT:
pdffonts "%PDF_FILE%"
echo.
REM echo pdfcrop "%PDF_FILE%" "%TEMP%.pdf"
pdfcrop "%PDF_FILE%" "%TEMP%.pdf"
REM echo pdftops -eps "%TEMP%.pdf"  "%TEMP%.eps" 
pdftops -eps "%TEMP%.pdf"  "%PS_FILE%" 
REM echo epstool --copy --bbox "%TEMP%.eps" "%PS_FILE%"
REM epstool --copy --bbox "%TEMP%.eps" "%PS_FILE%"
del  "%TEMP%.pdf"
echo.
echo %~n1.pdf D======:)  %~n1.eps
echo.
shift
goto next
:all



:usage
echo.
echo Usage: %BAT_NAME% file.pdf file2.pdf ...
REM echo *** NOTICE ***: 
echo.


:exit