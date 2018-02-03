@echo off

echo VB6FormToWebForm - Convert VB6 form files to (.frm) to ASP.net WebForms (.aspx and .aspx.cs codebehind)
echo Author: George Birbilis (http://zoomicon.com)
echo Version: 20151016 (update from 12Dec2002)
echo.
echo Converting all VB6 forms in current folder...
echo.

::for %%x in (*.frm) do call process %%x MyNamespace no System.Web.UI.Page
for %%x in (*.frm) do call process %%x MyNamespace no MyBaseWebForm

start output
pause
