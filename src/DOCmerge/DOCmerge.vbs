'DOCmerge - merges several Word documents (.DOC/.DOCX files) together
'Author: George Birbilis (birbilis@kagi.com) / Zoomicon (www.zoomicon.com)
'Version: 20180202

'On Error Resume Next

const ONLY_DOC = false 'set to true to allow concatenation only of .DOC/.DOCX files (not .TXT etc.)
const MSG_SYNTAX = "Drop a folder with Word (.DOC/.DOCX) documents onto this icon to produce a Word file (.DOCX) with the concatenation of these documents"
const MSG_FINISHED = "" '"Finished"
const TXT_SUFFIX = "_CONCATENATED.docx"
const wdPasteDefault = 0
const wdPageBreak = 7

'----------------------------------------

dim word, fs, folderpath, outdocname, folder, outdoc

'----------------------------------------

Sub ParseCommandLine
 Dim args
 Set args = wscript.arguments
 if args.count = 0 then
  msgbox MSG_SYNTAX
  wscript.quit
 end if
 folderpath = args.item(0)
 outdocname = folderpath + TXT_SUFFIX
End Sub

'----------------------------------------

Sub StartServers
 '-- Start Word
 Set word = CreateObject("Word.Application")
 'word.Visible = true
 Set fs = CreateObject("Scripting.FileSystemObject")
 Set folder = fs.GetFolder(folderpath)
End Sub

'----------------------------------------

Sub DeleteOldOutput
 If fs.FileExists(outdocname) Then
  fs.DeleteFile(outdocname)
 End If
End Sub
 
Sub ProcessFile(filename, insertBreak)
 Dim doc
 Set doc = word.Documents.Open(filename)
 word.Selection.WholeStory
 word.Selection.Copy
 outdoc.Activate
 if insertBreak then word.Selection.InsertBreak wdPageBreak
 'word.Selection.PasteAndFormat wdPasteDefault
 word.Selection.Paste 'use this one so that it works for Word2000 too
 doc.Close
 Set doc = Nothing
End Sub
 
Sub Process
 DeleteOldOutput
 Dim f, first
 first = true
 For Each f in folder.Files
  if (not ONLY_DOC) or (ucase(right(f.path,4)) = ".DOC") or (ucase(right(f.path,5)) = ".DOCX") then
   'MsgBox f.path
   if first then
    'Set outdoc = word.Documents.Open(f.path)
    '--- using this code so that a temp file isn't created in the input folder (else it processes that one too)
    Set outdoc = word.Documents.Add
    outdoc.SaveAs outdocname
    ProcessFile f.path, false
    '---
    first = False
   else
    ProcessFile f.path, true
   end if
  end if
 Next
 If Not first Then 'if at least one file was processed
  outdoc.Save
  outdoc.Close
 End If
End Sub

'----------------------------------------

Sub Cleanup
 Set outdoc = Nothing
 word.Quit
 Set word = Nothing
 Set folder = Nothing
 Set fs = Nothing
 if MSG_FINISHED<>"" then MsgBox(MSG_FINISHED)
End Sub

'----------------------------------------

ParseCommandLine
StartServers
Process
Cleanup 
