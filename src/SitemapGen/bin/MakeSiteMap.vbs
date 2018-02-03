'*** MakeSiteMap.vbs
'*** (C)opyright George Birbilis (birbilis@kagi.com)
'*** Version: 20091028

'-- Globals -----------------------

dim basePath 'As String
dim mapFilename 'As String
dim allowedFileExtensions 'As String
dim fso 'As FileSystemObject
dim mapFile 'As File

'-- Helpers -----------------------

sub debug(ByVal name, value)
 'wscript.echo name+"=<"+value+">"
end sub

sub createFileSystemObject
 set fso=CreateObject("Scripting.FileSystemObject")
end sub

sub parseArguments
 if wscript.arguments.count<2 or wscript.arguments.count>3 then
  wscript.echo "Syntax: MakeSiteMap.vbs basePath mapFilename [allowedFileExtensions]"
  wscript.echo "example: MakeSiteMap.vbs ""www"" ""www\SiteMap.html"" ""html pdf"" (note: ""html"" includes ""htm"" too)"
  terminate
 end if

 basePath=fso.GetAbsolutePathName(wscript.arguments(0))
 if not right(basePath,1)="\" then basePath=basePath+"\" 'append "\" if missing
 debug "basePath", basePath

 mapFilename=wscript.arguments(1)
 debug "mapFilename", mapFilename

 if wscript.arguments.count=3 then
  allowedFileExtensions=wscript.arguments(2)
 else
  allowedFileExtensions=""
 end if
 debug "allowedFileExtensions", allowedFileExtensions
end sub

sub checkExistsFolder(ByVal folderPath)
 if not fso.FolderExists(folderPath) then
  wscript.echo "Non existent path <"+folderPath+">"
  terminate
 end if
end sub

sub createMapFile
 set mapFile=fso.CreateTextFile(mapFilename, true) 'overwrite map file if existing
end sub

sub init
 createFileSystemObject
 parseArguments
 checkExistsFolder(basePath)
 createMapFile
end sub

'--

function getRelativePath(ByVal path)
 getRelativePath=Replace(mid(path,len(basePath)+1),"\","/",1,-1,vbTextCompare)
end function

sub processFile(f, ByVal indent)
 if allowedFileExtensions<>"" then
  if InStr(1, allowedFileExtensions, fso.GetExtensionName(f))=0 then 'run the check only if allowedFileExtensions<>"" (VBScript doesn't provide short-circuit boolean evaluation I think)
   Exit Sub
  End If
 end if
 mapFile.writeline(indent+" <a href="""+getRelativePath(f.Path)+""" alt="""+f.Name+""" target=""sitemap"">"+f.Name+"</a><br />" & vbCrLf)
end sub

sub processFolder(ByVal path, ByVal indent, ByVal showRootFolder)
 dim folder 'As Folder
 dim f 'As File
 checkExistsFolder(path)
 set folder = fso.GetFolder(path)
 '-- folder (tree root)
 if showRootFolder then
  if fso.FileExists(path+"\index.html") then 'folder contains HTML index page
   mapFile.writeline(indent+"+ <b><u><a href="""+getRelativePath(path+"\index.html")+""" alt="""+folder.Name+""" target=""sitemap"">"+folder.Name+"</a></u></b> <br />" & vbCrLf)
  elseif fso.FileExists(path+"\index.xml") then 'folder contains XML index page
   mapFile.writeline(indent+"+ <b><u><a href="""+getRelativePath(path+"\index.xml")+""" alt="""+folder.Name+""" target=""sitemap"">"+folder.Name+"</a></u></b> <br />" & vbCrLf)
  elseif fso.FileExists(path+"\list.xml") then 'folder contains XML index page
   mapFile.writeline(indent+"+ <b><u><a href="""+getRelativePath(path+"\list.xml")+""" alt="""+folder.Name+""" target=""sitemap"">"+folder.Name+"</a></u></b> <br />" & vbCrLf)
  else
   mapFile.writeline(indent+"+ <b><u>"+folder.Name+"</u></b> <br />" & vbCrLf)
  end if
 end if
 '-- subfolders (tree branches)
 Dim indentFolder
 if showRootFolder then 
  indentFolder=indent+"&nbsp;|&nbsp;&nbsp;&nbsp;"
 else 
  indentFolder=indent
 end if
 for each f In folder.SubFolders
  processFolder f.Path, indentFolder, true
 next  
 '-- files (tree leaves)
 'if fso.FileExists(path+"\index.html") Or fso.FileExists(path+"\index.xml") Or fso.FileExists(path+"\list.xml") then exit sub 'folder contains index page, don't display its files 
 Dim indentFile
 if showRootFolder then 
  indentFile=indent+"&nbsp;|--"
 else 
  indentFile=indent
 end if
 for Each f In folder.Files
  processFile f, indentFile
 next
end sub

'--

sub closeMapFile
 if not IsEmpty(mapFile) then 
  mapFile.close
  set mapFile=nothing
 end if
end sub

sub destroyFileSystemObject
 set fso=nothing
end sub
 
sub cleanup
 closeMapFile
 destroyFileSystemObject
end sub

sub terminate
 cleanup
 wscript.quit
end sub

'-- Main program ------------------

init
processFolder basePath, "", false
terminate
