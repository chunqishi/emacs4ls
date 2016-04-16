@echo off
REM @NAME: Notepad++_SumatraPDF.bat 
REM @TIME:2014-10-30 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM @REF: http://johnbruer.com/2013/05/21/latex-editing-using-notepad/ (LaTeX Editing Using Notepad++)
REM @INF: this the batch file for connecting SumatraPDF(http://blog.kowalczyk.info/software/sumatrapdf/free-pdf-reader.html) and Notepad++(http://notepad-plus-plus.org/) under Windows OS.
REM 
REM @PARMS: %1 (full-path-of-tex)  %2 (line-number)   [%3(view-only-tag)]
REM @REUIRED: Notepad++, SumatraPDF, and DDEClient ( http://ftp.gnu.org/old-gnu/emacs/windows/docs/ntemacs/contrib/ddeclient.zip )

	set BAT_HOME=%~dp0
	set TEX_HOME=%~dp1
	set TEX_FILE=%~f1
	set TEX_PATH=%~pdn1
	set TEX_FILE_NAME=%~n1
	set TEX_FILE_SUFFIX=%~x1
	set TEX_BUILD=%TEX_HOME%build
	set LINE_IN_TEX=%2
	set VIEW_PDF=%3
	set AUX_FILE_NAME=%TEX_FILE_NAME%.aux
	set LOG_FILE_NAME=%TEX_FILE_NAME%.log
	set PDF_FILE_NAME=%TEX_FILE_NAME%.pdf
	set AUX_FILE=%TEX_BUILD%\%AUX_FILE_NAME%
	set LOG_FILE=%TEX_BUILD%\%LOG_FILE_NAME%
	set PDF_FILE=%TEX_BUILD%\%PDF_FILE_NAME%
	
	if NOT EXIST "%TEX_FILE%" (
		echo NOT exist file ["%TEX_FILE%"]
		sleep 3
		goto :BAT_EXIT
	)
	if NOT "%TEX_FILE_SUFFIX%"==".tex" (
		echo NOT tex file ["%TEX_FILE%"], its extension is "%~x1"
		sleep 3
		goto :BAT_EXIT
	)

	REM @COMMENT: if Notepad++_SumatraPDF.ini not exists, then using the default setting: Emacs_SumatraPDF.bat, SumatraPDF.exe, emacsclientw.exe, and ddeclient.exe are under the directory $EMACS_HOME$\bin
	if "%SUMATRA_EXE%"=="" set SUMATRA_EXE=%PROGRAMFILES(x86)%\SumatraPDF\SumatraPDF.exe
	if NOT EXIST "%SUMATRA_EXE%" set SUMATRA_EXE=%BAT_HOME%\SumatraPDF.exe
	if NOT EXIST "%SUMATRA_EXE%" set SUMATRA_EXE=%PROGRAMFILES(x86)%\Notepad++\SumatraPDF.exe
	if "%NOTEPADPLUSPLUS_EXE%"=="" set NOTEPADPLUSPLUS_EXE=%PROGRAMFILES(x86)%\Notepad++\notepad++.exe
	if "%DDECLIENT_EXE%"=="" set DDECLIENT_EXE=%BAT_HOME%\ddeclient.exe
	if NOT EXIST "%DDECLIENT_EXE%" set DDECLIENT_EXE=%PROGRAMFILES(x86)%\ddeclient.exe
	if NOT EXIST "%DDECLIENT_EXE%" set DDECLIENT_EXE=%PROGRAMFILES(x86)%\Notepad++\ddeclient.exe

	cd /d %TEX_HOME%
	if NOT EXIST "%TEX_BUILD%" mkdir "%TEX_BUILD%"
	 
	REM @COMMENT: get the name of sumatrapdf.
	for %%N in ("%SUMATRA_EXE%") do set SUMATRA_EXE_NAME=%%~nxN
	
	REM @COMMENT: check whether sumatrapdf process is runing.
	REM @REF (http://ss64.com/nt/start.html)	
	REM tasklist /FI "IMAGENAME eq %SUMATRA_EXE_NAME%" 2>NUL | find /I /N "%SUMATRA_EXE_NAME%">NUL
	REM if "%VIEW_PDF%"=="" if "%ERRORLEVEL%" NEQ "0" if EXIST "%PDF_FILE%" start "InverseSearch" /MIN  "%SUMATRA_EXE%" -reuse-instance "%PDF_FILE%" -inverse-search "\"%NOTEPADPLUSPLUS_EXE%\" -n%%l \"%%f\""
	
	if NOT "%VIEW_PDF%"=="" goto :VIEW_PDF
	
	pdflatex.exe -draftmode -interaction=errorstopmode -output-directory="%TEX_BUILD%" "%TEX_PATH%"
	echo. && echo.
	bibtex.exe "%AUX_FILE%"
	echo. && echo.
	pdflatex.exe -draftmode -interaction=batchmode -output-directory="%TEX_BUILD%" "%TEX_PATH%"
	echo. && echo.
	pdflatex.exe -synctex=-1 -interaction=batchmode -output-directory="%TEX_BUILD%" "%TEX_PATH%"
	echo. && echo.
	
	type "%LOG_FILE%" | findstr Warning:
	
:VIEW_PDF	
	tasklist /FI "IMAGENAME eq %SUMATRA_EXE_NAME%" 2>NUL | find /I /N "%SUMATRA_EXE_NAME%">NUL
	if "%ERRORLEVEL%" NEQ "0" start "ViewPDF" /MAX "%SUMATRA_EXE%" -reuse-instance "%PDF_FILE%" -inverse-search "\"%NOTEPADPLUSPLUS_EXE%\" -n%%l \"%%f\""
	sleep 1
	echo [ForwardSearch("%PDF_FILE%","%TEX_FILE%",%LINE_IN_TEX%,0,0,1)] | "%DDECLIENT_EXE%" SUMATRA control
	sleep 1
	start "ViewPDF" /MAX "%NOTEPADPLUSPLUS_EXE%" -n20  "%TEX_FILE%"
:BAT_EXIT   
	exit /b
   