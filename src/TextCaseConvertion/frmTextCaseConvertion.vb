'Description: Text case convertion utility
'Version: 13Oct2003
'Author: George Birbilis

Public Class frmTextCaseConvertion
 Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

 Public Sub New()
  MyBase.New()

  'This call is required by the Windows Form Designer.
  InitializeComponent()

  'Add any initialization after the InitializeComponent() call

 End Sub

 'Form overrides dispose to clean up the component list.
 Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
  If disposing Then
   If Not (components Is Nothing) Then
    components.Dispose()
   End If
  End If
  MyBase.Dispose(disposing)
 End Sub

 'Required by the Windows Form Designer
 Private components As System.ComponentModel.IContainer

 'NOTE: The following procedure is required by the Windows Form Designer
 'It can be modified using the Windows Form Designer.  
 'Do not modify it using the code editor.
 Friend WithEvents btnCamelCase As System.Windows.Forms.Button
 Friend WithEvents btnUpperCase As System.Windows.Forms.Button
 Friend WithEvents btnLowerCase As System.Windows.Forms.Button
 Friend WithEvents TextBox As System.Windows.Forms.TextBox
 <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
  Me.TextBox = New System.Windows.Forms.TextBox()
  Me.btnCamelCase = New System.Windows.Forms.Button()
  Me.btnUpperCase = New System.Windows.Forms.Button()
  Me.btnLowerCase = New System.Windows.Forms.Button()
  Me.SuspendLayout()
  '
  'TextBox
  '
  Me.TextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
              Or System.Windows.Forms.AnchorStyles.Right)
  Me.TextBox.Location = New System.Drawing.Point(8, 8)
  Me.TextBox.Name = "TextBox"
  Me.TextBox.Size = New System.Drawing.Size(384, 22)
  Me.TextBox.TabIndex = 0
  Me.TextBox.Text = ""
  '
  'btnCamelCase
  '
  Me.btnCamelCase.Location = New System.Drawing.Point(8, 104)
  Me.btnCamelCase.Name = "btnCamelCase"
  Me.btnCamelCase.Size = New System.Drawing.Size(112, 23)
  Me.btnCamelCase.TabIndex = 1
  Me.btnCamelCase.Text = "Camel case"
  '
  'btnUpperCase
  '
  Me.btnUpperCase.Location = New System.Drawing.Point(8, 40)
  Me.btnUpperCase.Name = "btnUpperCase"
  Me.btnUpperCase.Size = New System.Drawing.Size(112, 23)
  Me.btnUpperCase.TabIndex = 2
  Me.btnUpperCase.Text = "Upper case"
  '
  'btnLowerCase
  '
  Me.btnLowerCase.Location = New System.Drawing.Point(8, 72)
  Me.btnLowerCase.Name = "btnLowerCase"
  Me.btnLowerCase.Size = New System.Drawing.Size(112, 23)
  Me.btnLowerCase.TabIndex = 3
  Me.btnLowerCase.Text = "Lower case"
  '
  'frmTextCaseConvertion
  '
  Me.AutoScaleBaseSize = New System.Drawing.Size(6, 15)
  Me.ClientSize = New System.Drawing.Size(400, 136)
  Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.btnLowerCase, Me.btnUpperCase, Me.btnCamelCase, Me.TextBox})
  Me.Name = "frmTextCaseConvertion"
  Me.Text = "Text case convertion"
  Me.ResumeLayout(False)

 End Sub

#End Region

#Region "converters"

 '@description: convert a phrase to camel-case, with each word having its first letter upper-case and the rest lower-case
 '@author: George Birbilis
 '@version: 13Oct2003

 Public Function CamelCase(ByRef thePhrase As String) As String
  Dim chars As Char() = thePhrase.ToCharArray()
  Dim i As Integer
  Dim result As String = ""
  Dim inWord As Boolean = False
  For i = 0 To chars.Length - 1
   Dim c As Char = chars(i)
   If inWord Then
    result &= LCase(c)
   Else
    result &= UCase(c)
   End If
   inWord = (c <> " ") 'must do at end of loop so that it doesn't affect the 1st character of the string
  Next i
  Return result
 End Function

#End Region

 Private Sub btnUpperCase_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpperCase.Click
  TextBox.Text = UCase(TextBox.Text)
 End Sub

 Private Sub btnLowerCase_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLowerCase.Click
  TextBox.Text = LCase(TextBox.Text)
 End Sub

 Private Sub btnCamelCase_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCamelCase.Click
  TextBox.Text = CamelCase(TextBox.Text)
 End Sub

End Class
