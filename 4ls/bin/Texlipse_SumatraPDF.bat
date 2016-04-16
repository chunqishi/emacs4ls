@echo off
REM @NAME: Texlipse_SumatraPDF.bat 
REM @TIME:2012-08-23 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM C:\Program Files\SumatraPDF\Texlipse_SumatraPDF.bat "%file" "%texfile" %line
 

REM @COMMENT: the dash %~1 removes stupid quotation marks 
set PDF_FILE=%CD%\%~1
set TEX_FILE=%CD%\%~2
set LINE_IN_TEX=%~3
set BAT_HOME=%~dp0

set SUMATRA_EXE=%BAT_HOME%SumatraPDF.exe

@echo on
"%SUMATRA_EXE%" -inverse-search "\"%BAT_HOME%Texlipse_SumatraPDF_Inverse.bat\" \"%%f\" %%l"  -forward-search "%TEX_FILE%" %LINE_IN_TEX% -reuse-instance "%PDF_FILE%" 

:exit
