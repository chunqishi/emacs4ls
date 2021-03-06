@echo off 
REM @NAME: Install.bat 
REM @TIME:2015-04-17 @AUTHOR:shi(chunqi.shi@hotmail.com)

REM @COMMENT: the dash %~1 removes stupid quotation marks 
echo Start ...

NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo .
   echo ==========================================================
   color 0C
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
set LS_HOME=%BAT_HOME%4ls
set AUCTEX_HOME=%BAT_HOME%auctex-11.88
set EMACS_HOME=%BAT_HOME%emacs-24.5
set VERION_HOME=%BAT_HOME%emacs4ls-24.5-0.0.1

IF not exist %VERION_HOME% (mkdir %VERION_HOME%)
robocopy %LS_HOME% %VERION_HOME% /COPYALL /E
robocopy %AUCTEX_HOME% %VERION_HOME% /COPYALL /E
robocopy %EMACS_HOME% %VERION_HOME% /COPYALL /E
call  %VERION_HOME%\Run_Me_Emacs_Register.bat

pause > nul






