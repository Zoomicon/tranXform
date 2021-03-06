'Description: Generates multiple choice .DOC documents (from .XLS data
'Author: George Birbilis (birbilis@kagi.com) / Zoomicon (www.zoomicon.com)
'Version: 20090625
'---------------------------------------------------

const COUNT_A = 23
const COUNT_B = 23
const COUNT_C = 24

const COUNT_TEAMS = 1

const COMMENTS_VISIBLE = False '(applies only to the answers document)

const OLD_QUESTION_CHECK_LENGTH = 35

'---------------------------------------------------

const ROW_MIN = 1
const COL_MARKUSE = 1 'use * at this spreadsheet column to mark questions to use
const COL_QUESTION = 2 'question is at this column, followed any number of answers (one per column)

'---------------------------------------------------

const FOLDER_OUT = "Output"
const FOLDER_TEMPLATES = "Templates"
const DOC_OLD_QUESTIONS = "OldQuestions.doc"

const MARK_MULTIPLE_CHOICE = "%MULTIPLE_CHOICE%"

'---------------------------------------------------

const MSG_SYNTAX = "Drop the .XLS file onto this icon to generate documents from the .XLS data based on the templates"
const MSG_TOOMANYQUESTIONS = "You are asking for a greater number of questions than the ones available at the sheet: "
const MSG_FINISHED = "Τέλος"

'---------------------------------------------------

'ON ERROR RESUME NEXT

'---------------------------------------------------

dim fso, word, excel

Sub StartServers
 '-- Start FileSystemObject
 set fso = CreateObject("Scripting.FileSystemObject")
 '-- Start Word
 set word = CreateObject("Word.Application")
 word.DisplayAlerts = False
 word.Visible = False
 '-- Start Excel
 set excel = CreateObject("Excel.Application")
 excel.DisplayAlerts = False
End Sub

'---------------------------------------------------

dim xlsfilename, oldQuestionsFilename, templatesfolder, outfolder

Sub ParseCommandLine
 Dim args, xlsfile, xlsfolder, xlsparentfolder
 set args = wscript.arguments
 if args.count = 0 then
  msgbox MSG_SYNTAX
  wscript.Quit
 end if
 xlsfilename = args.item(0)
 set xlsfile = fso.GetFile(xlsfilename)
 xlsfolder = xlsfile.ParentFolder.Path
 xlsparentfolder = xlsfile.ParentFolder.ParentFolder.Path
 templatesfolder = xlsparentfolder & "\" & FOLDER_TEMPLATES
 outfolder = xlsparentfolder & "\" & FOLDER_OUT
 oldQuestionsFilename = xlsfolder & "\" & DOC_OLD_QUESTIONS
End Sub

'---------------------------------------------------

dim book

Sub OpenXLS
 set book = excel.Workbooks.Open(xlsfilename)  'open Excel workbook
End Sub

'---------------------------------------------------

dim oldQuestionsDoc

Sub OpenOldQuestionsDoc
 set oldQuestionsDoc = word.Documents.Open(oldQuestionsFilename)
End Sub

'---------------------------------------------------


Sub AddComment(sel, cell)
 dim comment
 if (cell.Comment Is Nothing) then Exit Sub
 comment = Trim(cell.Comment.Text)
 if (comment <> "") then 
  sel.Font.Italic = True
  sel.Font.Color = RGB(100,100,100)
  sel.TypeText " { " & comment & " }"
  sel.Font.Color = RGB(0,0,0)
  sel.Font.Italic = False
 end if
End Sub

'---------------------------------------------------

dim question

Sub AddQuestion(document, row, showAnswer)
 document.Activate
 dim sel, cell, text, comment

 set sel = word.Selection


 sel.ParagraphFormat.KeepWithNext = True
 sel.ParagraphFormat.KeepTogether = True
 sel.ParagraphFormat.LeftIndent = 0

 set cell = row.Cells.Item(COL_QUESTION)
 text = Trim(cell.Text)
 if text <> "" then
  sel.TypeText question & ". " & text
  if showAnswer and COMMENTS_VISIBLE then AddComment sel, cell
  sel.TypeParagraph()

  dim i
  for i = COL_QUESTION+1 to row.Cells.Count
   set cell = row.Cells.Item(i)
   text = Trim(cell.Text)
   if text = "" then Exit For

   if showAnswer and cell.Font.Bold then 
    sel.Font.Bold = True
   end if
   sel.ParagraphFormat.LeftIndent = 15
   sel.TypeText chr(asc("Α")+i-COL_QUESTION-1) & ". " & text
   if showAnswer and COMMENTS_VISIBLE then AddComment sel, cell
   sel.TypeParagraph()
   sel.Font.Bold = False
  next


  sel.ParagraphFormat.KeepWithNext = False
  sel.ParagraphFormat.KeepTogether = False
  sel.ParagraphFormat.LeftIndent = 0
  sel.TypeParagraph()

 end if

 set cell = Nothing
 set sel = Nothing
End Sub

'---------------------------------------------------

 const wdFindStop=0
 const wdReplaceNone=0
 const wdReplaceAll=2
 const wdFindContinue=1
 const wdGoToPage=1
 const wdGoToNext=2

Function TextFind(word, document, findText)
 document.Activate
 word.Selection.GoTo wdGoToPage, wdGoToNext, 1 
 word.Selection.Find.ClearFormatting
 TextFind = word.Selection.Find.Execute(findText, False, False, False, False, False, True, wdFindStop, False, "", wdReplaceNone)
End Function

Function TextReplace(word, findText, replaceText)
 word.Selection.GoTo wdGoToPage, wdGoToNext, 1 
 word.Selection.Find.ClearFormatting
 'word.Selection.Find.Replacement.ClearFormatting
 TextReplace = word.Selection.Find.Execute(findText, False, False, False, False, False, True, wdFindContinue, False, replaceText, wdReplaceAll)
End Function

'---------------------------------------------------

Sub ProcessSheet(sheet, document, documentAnswers, questions)
 dim i, row
 for i=1 to ubound(questions) 
  set row = sheet.Rows.Item(questions(i))  
  question = question + 1
  AddQuestion document, row, False
  AddQuestion documentAnswers, row, True
  next
 set row = Nothing
End Sub

'---------------------------------------------------

Function PickQuestions(sheet,count)
 ReDim questions(count)
 if count>sheet.Rows.Count then '!!! should better count the "*" cells at COL_MARKUSE column
  MsgBox MSG_TOOMANYQUESTIONS & sheet.Name
  wscript.Quit
 end if

 dim i, pick, maxrow, isOldQuestion
 maxrow = sheet.UsedRange.Rows.Count
 Randomize
 for i = 1 to count
  Do
   pick = CInt((maxrow-ROW_MIN)*Rnd()) + ROW_MIN 'do not use round
   isOldQuestion = TextFind(word, oldQuestionsDoc, trim(mid(sheet.Cells(pick,COL_QUESTION).Text, 1, OLD_QUESTION_CHECK_LENGTH)) )
   'if isOldQuestion then MsgBox "Old: " & trim(mid(sheet.Cells(pick,COL_QUESTION).Text, 1, OLD_QUESTION_CHECK_LENGTH)) '!!!
  Loop Until (sheet.Cells(pick, COL_MARKUSE).Text = "*") And Not isOldQuestion
  questions(i) = pick
  sheet.Cells(pick, COL_MARKUSE) = "" 'mark this column (temporarily) to not be used (make sure the XLS isn't saved)
 next 

 PickQuestions = questions
End Function

'---------------------------------------------------

Sub Shuffle(array)
 dim i, count, pick, temp
 count = ubound(array)
 Randomize
 for i = 1 to count
  pick = CInt((count-1)*Rnd()) + 1 'do not use round
  temp = array(i)
  array(i) = array(pick)
  array(pick) = temp
 next
End Sub

'---------------------------------------------------

Sub ProcessFile(docfilename, outfilename)
 dim sheetA, sheetB, sheetC
 set sheetA = book.Worksheets.Item(1)
 set sheetB = book.Worksheets.Item(2)
 set sheetC = book.Worksheets.Item(3)

 '-- pick questions
 dim questionsA, questionsB, questionsC
 questionsA = PickQuestions(sheetA, COUNT_A)
 questionsB = PickQuestions(sheetB, COUNT_B)
 questionsC = PickQuestions(sheetC, COUNT_C)

 '----------------------------------

 dim i, document, documentAnswers
 for i = 1 to COUNT_TEAMS
  question = 0 

  set document = word.Documents.Open(docfilename)
  document.SaveAs outfilename & i & "_answers.doc" 'must save this first
  document.SaveAs outfilename & i & ".doc" 'must save this 2nd
  set documentAnswers = word.Documents.Open(outfilename & i & "_answers.doc")
  
  document.Activate
  TextReplace word, MARK_MULTIPLE_CHOICE, "" 'go to multiple choice marker

  documentAnswers.Activate
  TextReplace word, MARK_MULTIPLE_CHOICE, "" 'go to multiple choice marker

  '-- shuffle questions
  Shuffle questionsA
  Shuffle questionsB
  Shuffle questionsC

  '-- process sheets
  ProcessSheet sheetA, document, documentAnswers, questionsA
  ProcessSheet sheetB, document, documentAnswers, questionsB
  ProcessSheet sheetC, document, documentAnswers, questionsC

  document.Save
  documentAnswers.Save

  document.Close
  documentAnswers.Close
 next
 set document = Nothing
 set documentAnswers = Nothing

 '----------------------------------

 set sheetA = Nothing
 set sheetB = Nothing
 set sheetC = Nothing
End Sub

'---------------------------------------------------

Sub ProcessFolder(docfolder, outfolder)
 For Each f in fso.GetFolder(docfolder).Files
  If Left(f.Name,1) <> "~" then
   dim docfilename, outfilename
   docfilename = f.Path
   outfilename = outfolder & "\" & f.Name
   MsgBox f.Name
   ProcessFile docfilename, outfilename
   End If
 Next
End Sub

'---------------------------------------------------

Sub Cleanup
 book.Close False
 set book = Nothing

 excel.Quit
 set excel = Nothing

 oldQuestionsDoc.Close
 set oldQuestionsDoc = Nothing

 word.Visible = False
 word.Quit
 set word = Nothing

 set fso = Nothing

 if MSG_FINISHED<>"" then MsgBox(MSG_FINISHED)
End Sub

'---------------------------------------------------

Sub Main
 StartServers
 ParseCommandLine
 OpenXLS
 OpenOldQuestionsDoc
 ProcessFolder templatesfolder, outfolder
 Cleanup
End Sub

'---------------------------------------------------

Main
