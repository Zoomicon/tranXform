'PPTmerge - merges several PowerPoint presentations (.PPT/.PPTX files) together
'Author: George Birbilis (birbilis@kagi.com) / Zoomicon (www.zoomicon.com)
'Version: 20180202

'On Error Resume Next

const ONLY_PPT = false 'set to true to allow concatenation only of .PPT/.PPTX files (not other file formats that PowerPoint can also open)
const MSG_SYNTAX = "Drop a folder with PowerPoint (.PPT/.PPTX) presentations onto this icon to produce a PowerPoint (.PPTX) file with the concatenation of these presentations"
const MSG_FINISHED = "" '"Finished" 'set a non-empty message here to show a popup when finished
const TXT_SUFFIX = "_MERGED.pptx"

'----------------------------------------

dim powerpoint, fs, folderpath, outpptname, folder, outppt

'----------------------------------------

Sub ParseCommandLine
 Dim args
 Set args = wscript.arguments
 if args.count = 0 then
  msgbox MSG_SYNTAX
  wscript.quit
 end if
 folderpath = args.item(0)
 outpptname = folderpath + TXT_SUFFIX
End Sub

'----------------------------------------

Sub StartServers
 '-- Start PowerPoint
 Set powerpoint = CreateObject("PowerPoint.Application")
 'powerpoint.Visible = true 'may need to do this for merge to work
 Set fs = CreateObject("Scripting.FileSystemObject")
 Set folder = fs.GetFolder(folderpath)
End Sub

'----------------------------------------

Sub DeleteOldOutput
 If fs.FileExists(outpptname) Then
  fs.DeleteFile(outpptname)
 End If
End Sub
 
Sub ProcessFile(filename)
 outppt.Slides.InsertFromFile filename, outppt.Slides.Count 'Insert at the end (append)
End Sub
 
Sub ProcessFolder
 DeleteOldOutput
 Dim f, first
 first = true
 For Each f in folder.Files
  if (not ONLY_PPT) or (ucase(right(f.path,4)) = ".PPT") or (ucase(right(f.path,5)) = ".PPTX") then
   'MsgBox f.path 'uncomment this to show a popup for each merged file
   if first then
    'Set outppt = powerpoint.Presentations.Open(f.path)
    '--- using this code so that a temp file isn't created in the input folder (else it processes that one too)
    Set outppt = powerpoint.Presentations.Add
    outppt.SaveAs outpptname
    ProcessFile f.path
    '---
    first = False
   else
    ProcessFile f.path
   end if
  end if
 Next
 If Not first Then 'if at least one file was processed
  outppt.Save
  outppt.Close
 End If
End Sub

'----------------------------------------

Sub Cleanup
 Set outppt = Nothing
 powerpoint.Quit
 Set powerpoint = Nothing
 Set folder = Nothing
 Set fs = Nothing
 if MSG_FINISHED<>"" then MsgBox(MSG_FINISHED)
End Sub

'----------------------------------------

ParseCommandLine
StartServers
ProcessFolder
Cleanup 
