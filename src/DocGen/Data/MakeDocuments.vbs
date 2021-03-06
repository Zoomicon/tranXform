'Description: Generates .DOC documents by replacing .XLS data into given templates
'Author: George Birbilis (birbilis@kagi.com) / Zoomicon (www.zoomicon.com)
'Version: 20091028

ON ERROR RESUME NEXT

const FOLDER_OUT = "Output"
const FOLDER_TEMPLATES = "Templates"

'---------------------------------------------------

const MSG_SYNTAX = "Drop the .XLS file onto this icon to generate documents using the .XLS data based on the templates"
const MSG_FINISHED = "Finished"

const COL_TAG = 1
const COL_VALUE = 2

'---------------------------------------------------

Sub WordReplace(word,findText,replaceText)
 'const wdFindStop = 0 'this is the opposite of replace all
 const wdReplaceAll=2
 const wdFindContinue = 1
 const wdGoToPage = 1
 const wdGoToNext = 2
 word.Selection.GoTo wdGoToPage, wdGoToNext, 1
 word.Selection.Find.ClearFormatting
 'word.Selection.Find.Replacement.ClearFormatting
 word.Selection.Find.Execute findText,False,True,False,False,False,True,wdFindContinue,False,replaceText,wdReplaceAll
End Sub

'---------------------------------------------------

dim fso, word, excel

Sub StartServers
 '-- Start FileSystemObject
 set fso = CreateObject("Scripting.FileSystemObject")

 '-- Start Word
 set word = CreateObject("Word.Application")
 'word.Visible = true

 '-- Start Excel
 set excel = CreateObject("Excel.Application")
End Sub

'---------------------------------------------------

dim xlsfilename, templatesfolder, outfolder

Sub ParseCommandLine
 Dim args, xlsfile, xlsparentfolder
 set args = wscript.arguments
 if args.count = 0 then
  msgbox MSG_SYNTAX
  wscript.quit
 end if
 xlsfilename = args.item(0)
 set xlsfile = fso.GetFile(xlsfilename)
 xlsparentfolder = xlsfile.ParentFolder.ParentFolder.Path
 templatesfolder = xlsparentfolder + "\" + FOLDER_TEMPLATES
 outfolder = xlsparentfolder + "\" + FOLDER_OUT
End Sub

'---------------------------------------------------

dim book, sheet

Sub OpenXLS
 '-- Open Excel workbook
 set book = excel.Workbooks.Open(xlsfilename)
 '-- Use 1st worksheet
 set sheet = book.Worksheets.Item(1)
End Sub

'---------------------------------------------------

Sub ProcessFolder(docfolder, outfolder)
 'MsgBox "[" + docfolder + "] --> [" + outfolder + "]"
 For Each f in fso.GetFolder(docfolder).Files
  dim docfilename, outfilename
  docfilename = f.Path
  outfilename = outfolder + "\" + f.Name
  MsgBox f.Name
  'MsgBox "[" + docfilename + "] --> [" + outfilename + "]"
  ProcessFile docfilename, outfilename
 Next
End Sub

'---------------------------------------------------

Sub ProcessFile(docfilename, outfilename)
 dim document
 set document = word.Documents.Open(docfilename)
 'document.SelectAllEditableRanges

 dim maxrow, row
 maxrow = sheet.UsedRange.Rows.Count
 '-- Process each worksheet row (one replacement pair per row)
 for row = 1 to maxrow
  WordReplace word, sheet.Cells(row, COL_TAG), sheet.Cells(row, COL_VALUE)
 next

 document.SaveAs outfilename
 'document.PrintOut

 document.Close
 set document = Nothing
End Sub

'---------------------------------------------------

Sub Cleanup
 '-- cleanup
 set sheet = Nothing
 excel.Workbooks.Close
 set book = Nothing
 excel.Quit
 set excel = Nothing

 word.Quit
 set word = Nothing

 set fso = Nothing

 if MSG_FINISHED<>"" then MsgBox(MSG_FINISHED)
End Sub

'---------------------------------------------------
'-- MAIN
'---------------------------------------------------

StartServers
ParseCommandLine
OpenXLS
ProcessFolder templatesfolder, outfolder
Cleanup
