@echo off

:: -- VB6FormToWebForm - Convert VB6 form files to (.frm) to ASP.net WebForms (.aspx and .aspx.cs codebehind)
:: -- Author: George Birbilis (http://zoomicon.com)
:: -- Version: 20151016 (update from 1Jan2003)

::echo %1
::goto end

if "%1"=="" goto syntax

echo Converting %1 to %1.aspx and %1.aspx.vb

:: -- Extract the form design from the .frm file into a .txt file

del "%1.design.txt" 2>nul
type "%1" | Util\VBFormDesignFilter > "%1.design.txt"

:: -- Convert the .txt form design file into XML

Util\VBFormDesignToXML "%1" "%1.design.txt" "%1.xml" "ISO-8859-1"
del "%1.design.txt"

:: -- Sort XML tree leaves inside their parent by their TabIndex property

ren "%1.xml" "_%1.xml"
Util\XSLTransform "_%1.xml" XSL\SortByTabIndex.xsl "%1.xml"
del "_%1.xml"

:: -- Use XSL transformations to generate the ASP.net WebForm (.aspx file) and its codebehind VB.net class (.aspx.vb file)

Util\XSLTransform "%1.xml" XSL\WebForm.xsl "output\%1.aspx"
Util\XSLTransform "%1.xml" XSL\WebForm_vb.xsl "output\%1.aspx.vb"
del "%1.xml"

:: -- Set at the .aspx file the information its codebehind file is the generated .aspx.vb one

Util\replaceFilter "#CodebehindFile#" "%1.aspx.vb" "output\%1.aspx" "output\%1.aspx"

:: -- Set at the .aspx and .aspx.vb file the wanted namespace

Util\replaceFilter "#Namespace#" "%2" "output\%1.aspx" "output\%1.aspx"
Util\replaceFilter "#Baseclass#" "%4" "output\%1.aspx.vb" "output\%1.aspx.vb"

if not "%3"=="yes" goto noNamespace
wrapInNamespace "output\%1.aspx.vb" %2

:noNamespace

goto end

:syntax

echo VB6FormToWebForm - Convert VB6 form files to (.frm) to ASP.net WebForms (.aspx and .aspx.cs codebehind)
echo Syntax: %0 VB6form.frm UseNamespace_yes_no [namespace]

:end
