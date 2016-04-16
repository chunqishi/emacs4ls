@echo off
REM @NAME: Texlipse_SumatraPDF_Inverse.bat 
REM @TIME:2012-08-23 @AUTHOR:shi(chunqi.shi@hotmail.com)
REM 
set TEX_FILE=%~1
set LINE_IN_TEX=%~2
java -classpath "C:\eclipse-jee-mars-2-win32-x86_64\eclipse\plugins\net.sourceforge.texlipse_1.5.0\texlipse.jar" net.sourceforge.texlipse.viewer.util.FileLocationClient -p 55000 -f "%TEX_FILE%" -l %LINE_IN_TEX%
:exit
