@echo off 
REM @NAME: Emacs_Register.bat 
REM @TIME:2013-04-17 @AUTHOR:shi(chunqi.shi@hotmail.com)

REM @COMMENT: the dash %~1 removes stupid quotation marks 
echo Start ...

NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo .
   echo ==========================================================
   echo .
   echo ######## ########  ########   #######  ########  
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ######   ########  ########  ##     ## ########  
   echo ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo ######## ##     ## ##     ##  #######  ##     ## 
   echo.
   echo.
   echo -------- ERROR: ADMINISTRATOR PRIVILEGES REQUIRED --------
   echo This script must be run as administrator to work properly!  
   echo Please right click on the script and select 
   echo                    "Run As Administrator".
   echo .
   echo ==========================================================
   echo .
   PAUSE
   EXIT /B 1
)

set BAT_HOME=%~dp0

REM @COMMENT: link .emacs .emacs.d to %HOME% 
REM %HOMEDRIVE%%HOMEPATH%
if "%HOME%"=="" set HOME=%APPDATA%
if "%HOME%"=="" set HOME=%HOMEDRIVE%

set _APPDIX=%DATE:/=-%_%time::=-%
set APPDIX=%_APPDIX: =_%
REM @COMMENT: backup previour file.
if exist %HOME%\.emacs ( rename %HOME%\.emacs .emacs.%APPDIX%.bak )
if exist %HOME%\.latexmkrc ( rename %HOME%\.latexmkrc .latexmkrc.%APPDIX%.bak )
if exist %HOME%\.emacs.d ( rename %HOME%\.emacs.d .emacs.d.%APPDIX%.bak )
REM @COMENT: link to the target file
mklink %HOME%\.emacs %BAT_HOME%\shi\.emacs
mklink %HOME%\.latexmkrc %BAT_HOME%\shi\.latexmkrc
mklink /D %HOME%\.emacs.d %BAT_HOME%\shi\.emacs.d

REM @COMMENT: error: The directory `~/.emacs.d/server' is unsafe
REM rmdir /S /Q %BAT_HOME%\shi\.emacs.d\server
set EMACS_SERVER=%HOME%\.emacs.d\server
mkdir "%EMACS_SERVER%"
takeown /f "%EMACS_SERVER%"
icacls "%EMACS_SERVER%" /grant administrators:F




echo.
echo Manual Task:
echo ........................................
echo Please Add Aspell And Emacs To %% PATH %%;
echo. 
echo Aspell:  %BAT_HOME%tools\aspell\bin 
echo Emacs:   %BAT_HOME%bin 
echo. 
echo Append   ";%BAT_HOME%tools\aspell\bin;%BAT_HOME%bin;"  
echo To PATH Environment!
echo ;%BAT_HOME%tools\aspell\bin;%BAT_HOME%bin;|clip
echo ........................................
echo.  

set PATH_APPEND=;%BAT_HOME%tools\aspell\bin;%BAT_HOME%bin;

REM echo check whether in the paths
echo %PATH% | findstr /C:%PATH_APPEND%>nul && (
    set PATH_APPEND=TRUE
) || (
    set PATH_APPEND=FALSE
)

REM echo %PATH_APPEND%

if %PATH_APPEND%==FALSE (
	echo .
	echo ==========================================================
	echo .
	echo We already copy them into your clipboard. 
	echo Just PASTE to end of your PATH environment.
	echo .
	echo ==========================================================
	echo .
	echo Are You Ready? 
	pause
    call rundll32.exe sysdm.cpl EditEnvironmentVariables
)

echo. 
echo ........................................
echo %PATH%
echo ........................................
echo.  
echo Please Check And Make Sure You Added: "%BAT_HOME%tools\aspell\bin; %BAT_HOME%bin;"
echo. 

REM echo Register .tex Associated With Emacs.
REM ftype texfile="emacsclientw -na runemacs" "%1" 
REM assoc .tex=textfile
REM echo.

REM @COMMENT: create desktop shortcut
%BAT_HOME%bin\XXMKLINK.EXE %USERPROFILE%\Desktop\Emacs4LS %BAT_HOME%bin\Emacs.bat "" %BAT_HOME%bin Emacs 3 %BAT_HOME%\bin\emacs.ico

%BAT_HOME%bin\XXMKLINK.EXE %USERPROFILE%\Desktop\BRISS_PDFCrop %BAT_HOME%tools\briss-0.9\briss-0.9.exe "" %BAT_HOME%tools\briss-0.9 BRISS 3 %BAT_HOME%tools\briss-0.9\briss.ico

set REG_FILE=register_texfile.REG
echo Windows Registry Editor Version 5.00 > %REG_FILE%
echo ;>> %REG_FILE%
echo ;[HKEY_CURRENT_USER\Software\GNU\Emacs\HOME] >> %REG_FILE%
echo ;@="%BAT_HOME:\=\\%" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\texfile] >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\texfile\Shell] >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\texfile\Shell\Open] >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\texfile\Shell\Open\Command] >> %REG_FILE%
echo @="%BAT_HOME:\=\\%bin\\emacsclientw.exe -n -a \"%BAT_HOME:\=\\%bin\\runemacs.exe\" \"%%~1\" %%*" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\.tex] >> %REG_FILE%
echo @="texfile" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\.bib] >> %REG_FILE%
echo @="texfile" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\.lco] >> %REG_FILE%
echo @="texfile" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\.sty] >> %REG_FILE%
echo @="texfile" >> %REG_FILE%
echo [HKEY_CURRENT_USER\Software\Classes\.cls] >> %REG_FILE%
echo @="texfile" >> %REG_FILE%

echo.

echo If you want to register associate file "texfile", 
echo Please run (Double Click) register_texfile.REG.
REGEDIT.EXE  /S  "%REG_FILE%"
 
 
echo End!

echo.


pause > nul






