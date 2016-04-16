REM @NAME: Emacs_SumatraPDF.bat 
REM @TIME:2012-08-23 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM @REF: http://fofou.appspot.com/sumatrapdf/topic?id=2140330 (BATCH 4 SumatraPDF)
REM @REF: http://william.famille-blum.org/blog/static.php?page=static081010-000413 (SumatraPDF 4 Emacs)
REM @REF: http://ss64.com/nt/syntax-args.html (BATCH Syntax)
REM @INF: this the batch file for connecting SumatraPDF(http://blog.kowalczyk.info/software/sumatrapdf/free-pdf-reader.html) and Emacs(http://www.gnu.org/software/emacs/) + AUCTEX(http://www.gnu.org/software/auctex/) under Windows OS.
REM @USAGE: ~/.emacs
REM     (setq TeX-view-program-list '(("Sumatra" "C:/Program Files (x86)/GNU Emacs 23.4/bin/Emacs_SumatraPDF.bat %o %t %n") )) 
REM     (setq TeX-view-program-selection '((output-pdf "Sumatra") (output-dvi "Yap") ((output-dvi style-pstricks) "dvips and start") (output-html "start"))) 
REM 
REM @PARMS: %1 (path-of-pdf) %2 (path-of-tex) %3 (line-number)
REM @REUIRED: Emacs, SumatraPDF, AUCTEX, and DDEClient ( http://ftp.gnu.org/old-gnu/emacs/windows/docs/ntemacs/contrib/ddeclient.zip )

@echo off 

REM @COMMENT: the dash %~1 removes stupid quotation marks 
set PDF_FILE=%CD%\%~1
set TEX_FILE=%CD%\%~2
set LINE_IN_TEX=%3
set BAT_HOME=%~dp0


REM @WARNING: NO quotation marks allowed!!! 
REM set EMACS_EXE=C:\Program Files (x86)\GNU Emacs 23.4\bin\emacsclientw.exe
REM set DDECLIENT_EXE=C:\Program Files (x86)\GNU Emacs 23.4\bin\ddeclient.exe
REM set SUMATRA_EXE=C:\Program Files (x86)\GNU Emacs 23.4\bin\SumatraPDF.exe
REM 

REM @COMMENT: if Emacs_SumatraPDF.ini exists, read EMACS_EXE, DDECLIENT_EXE,  SUMATRA_EXE from Emacs_SumatraPDF.ini
set INI_FILE=%BAT_HOME%\Emacs_SumatraPDF.ini
for /f "delims=/" %%L in (%INI_FILE%) do (
	for /f "tokens=1,2 delims==" %%M in ("%%L") do (
		if "%%M"=="EMACS_EXE" set EMACS_EXE=%%N
		if "%%M"=="DDECLIENT_EXE" set DDECLIENT_EXE=%%N
		if "%%M"=="SUMATRA_EXE" set SUMATRA_EXE=%%N
	)
)

REM @COMMENT: if Emacs_SumatraPDF.ini not exists, then using the default setting: Emacs_SumatraPDF.bat, SumatraPDF.exe, emacsclientw.exe, and ddeclient.exe are under the directory $EMACS_HOME$\bin
if "%EMACS_EXE%"=="" set EMACS_EXE=%BAT_HOME%\emacsclientw.exe
if "%DDECLIENT_EXE%"=="" set DDECLIENT_EXE=%BAT_HOME%\ddeclient.exe
if "%SUMATRA_EXE%"=="" set SUMATRA_EXE=%BAT_HOME%\SumatraPDF.exe


REM @COMMENT: get the name of sumatrapdf.
for %%N in (%SUMATRA_EXE%) do set SUMATRA_EXE_NAME=%%~nxN

REM @COMMENT: check whether sumatrapdf process is runing.
tasklist /FI "IMAGENAME eq %SUMATRA_EXE_NAME%" 2>NUL | find /I /N "%SUMATRA_EXE_NAME%">NUL
if "%ERRORLEVEL%" NEQ "0" start %SUMATRA_EXE% -reuse-instance "%PDF_FILE%" -inverse-search "%EMACS_EXE% --alternate-editor=\"%BAT_HOME%\runemacs.exe\" --no-wait +%%l \"%%f\""

REM @COMMENT forward position through DDClient.
echo [ForwardSearch("%PDF_FILE%","%TEX_FILE%",%LINE_IN_TEX%,0,0,1)] | "%DDECLIENT_EXE%" SUMATRA control

REM @COMMENT EXIT BAT.
:exit
