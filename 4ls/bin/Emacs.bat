@echo off 
REM @NAME: Emacs.bat 
REM @TIME:2013-04-25 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM @REF: http://www.emacswiki.org/emacs-es/EmacsClient
REM @INF:  ------------------------------------------------------------
REM @INF: |    @echo off                                               |
REM @INF: |    "%~dp0emacsclientw.exe" -na "%~dp0runemacs.exe" "%~1"   |
REM @INF:  ------------------------------------------------------------
REM @USAGE: 
REM 
REM @REUIRED: Emacs (Win32)

REM set BAT_HOME=%~dp0
REM set EMACS_EXE_NAME=emacs.exe
REM set RUN_EMACS_WIN32=%BAT_HOME%runemacs.exe
REM set EMACS_CLIENT_WIN32=%BAT_HOME%emacsclientw.exe
REM 
REM @COMMENT: check whether emacs process is runing, IF NOT runemacs.exe
REM tasklist /FI "IMAGENAME eq %EMACS_EXE_NAME%" 2>NUL | find /I /N "%EMACS_EXE_NAME%">NUL
REM if "%ERRORLEVEL%" NEQ "0" (
REM "%RUN_EMACS_WIN32%"
REM )

REM if not "%~1"=="" "%EMACS_CLIENT_WIN32%" -na "%RUN_EMACS_WIN32%" "%~1"
set filename=%~1

if "%~1"=="" (
    set filename=%HOMEPATH%\Desktop
)

"%~dp0emacsclientw.exe" -na "%~dp0runemacs.exe" "%filename%"
REM echo "%~dp0emacsclientw.exe" -na "%~dp0runemacs.exe" "%~1" > Emacs.bat.log