'DOCappend - appends a document (including HTML) as a new page with an optional title to a Word document (.DOC/.DOCX files), creating it if it doesn't exist
'Author: George Birbilis / Zoomicon (www.zoomicon.com)
'Version: 20221014

'On Error Resume Next

const MSG_SYNTAX = "Syntax: DOCappend sourceOrNewFile appendFile [title]"
const MSG_FINISHED = "" '"Finished"
const wdPasteDefault = 0
const wdPageBreak = 7
const wdStory = 6
const wdMove = 0 'Collapse selection (https://learn.microsoft.com/en-us/office/vba/api/word.wdmovementtype)

'----------------------------------------

dim word, sourceOrNewFile, appendFile, sourceDoc

'----------------------------------------

Sub ParseCommandLine
 Dim args
 Set args = wscript.arguments
 if (args.count < 1) or (args.count > 3) then
  msgbox MSG_SYNTAX
  wscript.quit
 end if
 
 sourceOrNewFile = args.item(0)
 
 appendFile = args.item(1)
 
 if (args.count = 3) then
   title = args.item(2)
  else
   title = ""
  end if
End Sub

'----------------------------------------

Sub StartServers
 '-- Start Word
 Set word = CreateObject("Word.Application")
 word.DisplayAlerts = False
 'word.Visible = true
End Sub

'----------------------------------------

Sub ProcessFile(filename, insertBreak)
 'Dim appendDoc
 'Set appendDoc = word.Documents.Open(filename)
 'word.Selection.WholeStory
 'word.Selection.Copy
 
 sourceDoc.Activate

 word.Selection.InsertFile filename, "", false, false, true
 
 if insertBreak then word.Selection.InsertBreak wdPageBreak

 if (Title <> "") then
  word.Selection.TypeText(Title)
  word.Selection.TypeParagraph
  word.Selection.TypeParagraph  
 end if
 
 'word.Selection.PasteAndFormat wdPasteDefault
 'word.Selection.Paste 'use this one so that it works for Word2000 too
 
 'appendDoc.Close
 'Set appendDoc = Nothing
End Sub
 
Function FileExists(filename)
 Dim fso
 Set fso = CreateObject("Scripting.FileSystemObject")
 FileExists = fso.FileExists(filename)
 Set fso = Nothing
End Function
 
Sub Process
 if FileExists(sourceOrNewFile) then
  Set sourceDoc = word.Documents.Open(sourceOrNewFile)
 else
  Set sourceDoc = word.Documents.Add
  sourceDoc.SaveAs sourceOrNewFile
 end if

 word.Selection.EndKey wdStory, wdMove
 
 ProcessFile appendFile, true
 sourceDoc.Save
 sourceDoc.Close
 Set sourceDoc = Nothing
End Sub

'----------------------------------------

Sub Cleanup
 word.Quit
 Set word = Nothing
 if MSG_FINISHED<>"" then MsgBox(MSG_FINISHED)
End Sub

'----------------------------------------

ParseCommandLine
if FileExists(appendFile) then
 StartServers
 Process
 Cleanup 
end if
