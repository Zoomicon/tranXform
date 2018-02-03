@echo off

DEL Results.txt 2>nul

FOR /R %%f in (ResX\*.resx) DO CALL :process %%f

START Results.txt

PAUSE

GOTO :EOF

::--------------------------------------

:process

ECHO.
ECHO.
ECHO Processing %1
ECHO.

bin\XSLTransform.exe %1 xslt\ResX_WordCount.xslt out.tmp

ECHO %~nx1 >> Results.txt
TYPE out.tmp >> Results.txt
ECHO. >> Results.txt
ECHO. >> Results.txt

DEL out.tmp

GOTO :EOF
