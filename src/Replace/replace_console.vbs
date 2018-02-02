'*** Replace_console.vbs (console version)
'*** (C)opyright George Birbilis (birbilis@kagi.com)
'*** Use/modify freely as long as you give credit to the original author
'*** Version: 20060928

if wscript.arguments.count<>3 then
 wscript.echo "Syntax: replace.vbs filename fromToken toToken"
 wscript.quit
end if

SET fso=CreateObject("Scripting.FileSystemObject")

filename=wscript.arguments(0)
fromToken=wscript.arguments(1)
toToken=wscript.arguments(2)

ON ERROR RESUME NEXT

wscript.echo "Opening "+filename
SET file=fso.OpenTextFile(filename,1)
if err.number>0 then 
 wscript.echo err.description
 wscript.quit
end if
contents=file.ReadAll
contents=replace(contents,fromToken,toToken)
file.close

wscript.echo "Saving "+filename
SET file=fso.OpenTextFile(filename,2)
if err.number>0 then 
 wscript.echo err.description
 wscript.quit
end if
SET contents=file.write(contents)
file.close

SET file=nothing
SET fso=nothing

wscript.echo "Done"
wscript.echo 'show an empty line
 