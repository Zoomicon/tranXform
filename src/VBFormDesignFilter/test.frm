VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{97BD7A06-77E0-11D2-8EAE-008048E27A77}#1.0#0"; "beegdo10.ocx"
Begin VB.Form building 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Κτίρια (Α.11 - Α.19)"
   ClientHeight    =   8025
   ClientLeft      =   600
   ClientTop       =   465
   ClientWidth     =   10215
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   161
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8025
   ScaleWidth      =   10215
   Begin VB.CommandButton Command7 
      Caption         =   "Ακύρωση εισαγωγής νέου κτιρίου"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   40
      Top             =   7080
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.TextBox Text5 
      BackColor       =   &H80000018&
      DataField       =   "ID_BUILDING"
      DataSource      =   "Adodc1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   9240
      TabIndex        =   30
      Text            =   "Text5"
      Top             =   3480
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H80000018&
      DataField       =   "ID_SCHOOL"
      DataSource      =   "Adodc1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   8280
      TabIndex        =   25
      Text            =   "Text3"
      Top             =   3480
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H80000018&
      DataField       =   "SCHOOL_YEAR"
      DataSource      =   "Adodc1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   7320
      TabIndex        =   24
      Text            =   "Text2"
      Top             =   3480
      Visible         =   0   'False
      Width           =   855
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3495
      Left            =   120
      TabIndex        =   20
      Top             =   3480
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   6165
      _Version        =   393216
      Tabs            =   2
      Tab             =   1
      TabHeight       =   882
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Α.17. Ποιά είναι η κατάσταση του κτιρίου"
      TabPicture(0)   =   "building.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Command4"
      Tab(0).Control(1)=   "Command2"
      Tab(0).Control(2)=   "SGGrid2"
      Tab(0).ControlCount=   3
      TabCaption(1)   =   "Α.19. Πότε προβλέπεται συντήρηση του κτιρίου και σε ποιόν τομέα;"
      TabPicture(1)   =   "building.frx":001C
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "SGGrid1"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Command1"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Command3"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).ControlCount=   3
      Begin VB.CommandButton Command4 
         Caption         =   "Προσθήκη νέου είδους τομέα κτιρίου"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -72480
         TabIndex        =   37
         Top             =   2880
         Width           =   3000
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&Διαγραφή"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -68640
         TabIndex        =   36
         Top             =   2880
         Visible         =   0   'False
         Width           =   870
      End
      Begin BeeGridOLEDB10.SGGrid SGGrid2 
         Height          =   2055
         Left            =   -74520
         TabIndex        =   35
         Top             =   720
         Width           =   7335
         _cx             =   12938
         _cy             =   3625
         DataMember      =   ""
         DataMode        =   1
         AutoFields      =   -1  'True
         Enabled         =   -1  'True
         GridBorderStyle =   1
         ScrollBars      =   3
         FlatScrollBars  =   0
         ScrollBarTrack  =   0   'False
         DataRowCount    =   2
         BeginProperty HeadingFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataColCount    =   2
         HeadingRowCount =   1
         HeadingColCount =   1
         TextAlignment   =   0
         WordWrap        =   0   'False
         Ellipsis        =   1
         HeadingBackColor=   -2147483633
         HeadingForeColor=   -2147483630
         HeadingTextAlignment=   0
         HeadingWordWrap =   0   'False
         HeadingEllipsis =   1
         GridLines       =   1
         HeadingGridLines=   2
         GridLinesColor  =   -2147483633
         HeadingGridLinesColor=   -2147483632
         EvenOddStyle    =   0
         ColorEven       =   -2147483628
         ColorOdd        =   -2147483624
         UserResizeAnimate=   1
         UserResizing    =   3
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         UserDragging    =   2
         UserHiding      =   2
         CellPadding     =   15
         CellBkgStyle    =   1
         CellBackColor   =   -2147483643
         CellForeColor   =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         FocusRect       =   1
         FocusRectColor  =   0
         FocusRectLineWidth=   1
         TabKeyBehavior  =   0
         EnterKeyBehavior=   0
         NavigationWrapMode=   1
         SkipReadOnly    =   0   'False
         DefaultColWidth =   1200
         DefaultRowHeight=   255
         CellsBorderColor=   0
         CellsBorderVisible=   -1  'True
         RowNumbering    =   0   'False
         EqualRowHeight  =   0   'False
         EqualColWidth   =   0   'False
         HScrollHeight   =   0
         VScrollWidth    =   0
         Format          =   "General"
         Appearance      =   2
         FitLastColumn   =   0   'False
         SelectionMode   =   0
         MultiSelect     =   0
         AllowAddNew     =   0   'False
         AllowDelete     =   0   'False
         AllowEdit       =   -1  'True
         ScrollBarTips   =   0
         CellTips        =   0
         CellTipsDelay   =   1000
         SpecialMode     =   0
         OutlineLines    =   1
         CacheAllRecords =   -1  'True
         ColumnClickSort =   0   'False
         PreviewPaneColumn=   ""
         PreviewPaneType =   0
         PreviewPanePosition=   2
         PreviewPaneSize =   2000
         GroupIndentation=   225
         InactiveSelection=   1
         AutoScroll      =   -1  'True
         AutoResize      =   1
         AutoResizeHeadings=   -1  'True
         OLEDragMode     =   0
         OLEDropMode     =   0
         Caption         =   ""
         ScrollTipColumn =   ""
         MaxRows         =   1024
         MaxColumns      =   12
         NewRowPos       =   1
         CustomBkgDraw   =   0
         AutoGroup       =   -1  'True
         GroupByBoxVisible=   -1  'True
         GroupByBoxText  =   "Drag a column header here to group by that column"
         AlphaBlendEnabled=   0   'False
         DragAlphaLevel  =   206
         AutoSearch      =   0
         AutoSearchDelay =   2000
         StylesCollection=   $"building.frx":0038
         ColumnsCollection=   $"building.frx":1ACF
         ValueItems      =   $"building.frx":28A6
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Διαγραφή"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7200
         TabIndex        =   34
         Top             =   2880
         Visible         =   0   'False
         Width           =   870
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Προσθήκη νέου είδους τομέα κτιρίου"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         TabIndex        =   33
         Top             =   2880
         Width           =   3000
      End
      Begin BeeGridOLEDB10.SGGrid SGGrid1 
         Height          =   2055
         Left            =   480
         TabIndex        =   31
         Top             =   720
         Width           =   7335
         _cx             =   12938
         _cy             =   3625
         DataMember      =   ""
         DataMode        =   1
         AutoFields      =   -1  'True
         Enabled         =   -1  'True
         GridBorderStyle =   1
         ScrollBars      =   3
         FlatScrollBars  =   0
         ScrollBarTrack  =   0   'False
         DataRowCount    =   2
         BeginProperty HeadingFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataColCount    =   2
         HeadingRowCount =   1
         HeadingColCount =   1
         TextAlignment   =   0
         WordWrap        =   0   'False
         Ellipsis        =   1
         HeadingBackColor=   -2147483633
         HeadingForeColor=   -2147483630
         HeadingTextAlignment=   0
         HeadingWordWrap =   0   'False
         HeadingEllipsis =   1
         GridLines       =   1
         HeadingGridLines=   2
         GridLinesColor  =   -2147483633
         HeadingGridLinesColor=   -2147483632
         EvenOddStyle    =   0
         ColorEven       =   -2147483628
         ColorOdd        =   -2147483624
         UserResizeAnimate=   1
         UserResizing    =   3
         RowHeightMin    =   0
         RowHeightMax    =   0
         ColWidthMin     =   0
         ColWidthMax     =   0
         UserDragging    =   2
         UserHiding      =   2
         CellPadding     =   15
         CellBkgStyle    =   1
         CellBackColor   =   -2147483643
         CellForeColor   =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         FocusRect       =   1
         FocusRectColor  =   0
         FocusRectLineWidth=   1
         TabKeyBehavior  =   0
         EnterKeyBehavior=   0
         NavigationWrapMode=   1
         SkipReadOnly    =   0   'False
         DefaultColWidth =   1200
         DefaultRowHeight=   255
         CellsBorderColor=   0
         CellsBorderVisible=   -1  'True
         RowNumbering    =   0   'False
         EqualRowHeight  =   0   'False
         EqualColWidth   =   0   'False
         HScrollHeight   =   0
         VScrollWidth    =   0
         Format          =   "General"
         Appearance      =   2
         FitLastColumn   =   0   'False
         SelectionMode   =   0
         MultiSelect     =   0
         AllowAddNew     =   0   'False
         AllowDelete     =   0   'False
         AllowEdit       =   -1  'True
         ScrollBarTips   =   0
         CellTips        =   0
         CellTipsDelay   =   1000
         SpecialMode     =   0
         OutlineLines    =   1
         CacheAllRecords =   -1  'True
         ColumnClickSort =   0   'False
         PreviewPaneColumn=   ""
         PreviewPaneType =   0
         PreviewPanePosition=   2
         PreviewPaneSize =   2000
         GroupIndentation=   225
         InactiveSelection=   1
         AutoScroll      =   -1  'True
         AutoResize      =   1
         AutoResizeHeadings=   -1  'True
         OLEDragMode     =   0
         OLEDropMode     =   0
         Caption         =   ""
         ScrollTipColumn =   ""
         MaxRows         =   1024
         MaxColumns      =   12
         NewRowPos       =   1
         CustomBkgDraw   =   0
         AutoGroup       =   -1  'True
         GroupByBoxVisible=   -1  'True
         GroupByBoxText  =   "Drag a column header here to group by that column"
         AlphaBlendEnabled=   0   'False
         DragAlphaLevel  =   206
         AutoSearch      =   0
         AutoSearchDelay =   2000
         StylesCollection=   $"building.frx":2C8B
         ColumnsCollection=   $"building.frx":4722
         ValueItems      =   $"building.frx":54F9
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "Α.18. Κατά το προηγούμενο σχολικό έτος έγινε συντήρηση στο κτίριο;"
      Height          =   735
      Left            =   120
      TabIndex        =   18
      Top             =   2640
      Width           =   9855
      Begin MSDataListLib.DataCombo DataCombo3 
         Height          =   330
         Left            =   120
         TabIndex        =   45
         Top             =   240
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   582
         _Version        =   393216
         Style           =   2
         Text            =   "DataCombo3"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox Text1 
         DataField       =   "MANDATORY_MAINTENANCE"
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   7080
         MaxLength       =   100
         TabIndex        =   21
         Top             =   240
         Width           =   2655
      End
      Begin VB.Label Label8 
         Caption         =   "Αναφέρατε το είδος της συντήρησης που ήταν αναγκαία:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2880
         TabIndex        =   19
         Top             =   240
         Width           =   4215
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Α.16. Η απάντηση στην προηγούμενη ερώτηση δόθηκε:"
      Height          =   615
      Left            =   5040
      TabIndex        =   15
      Top             =   1920
      Width           =   4935
      Begin VB.TextBox Text4 
         BackColor       =   &H80000018&
         DataField       =   "EXACT_MEASURE"
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4080
         TabIndex        =   26
         Top             =   240
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.OptionButton Option2 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3720
         TabIndex        =   23
         Top             =   240
         Width           =   255
      End
      Begin VB.OptionButton Option1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1560
         TabIndex        =   22
         Top             =   240
         Width           =   255
      End
      Begin VB.Label Label7 
         Caption         =   "2. Με ακριβή μέτρηση"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1920
         TabIndex        =   17
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Label6 
         Caption         =   "1. Κατ' εκτίμηση"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Α.15. Πόση είναι η συνολική επιφάνεια του κτιρίου σε τ.μ.;"
      Height          =   615
      Left            =   120
      TabIndex        =   13
      Top             =   1920
      Width           =   4815
      Begin VB.TextBox text6 
         DataField       =   "SIZE_IN_SQ"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1032
            SubFormatType   =   1
         EndProperty
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   840
         TabIndex        =   27
         Top             =   210
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "τ.μ."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1560
         TabIndex        =   14
         Top             =   240
         Width           =   255
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Α.14. Πόσους ορόφους έχει το κτίριο (μαζί με το ισόγειο);"
      Height          =   615
      Left            =   5040
      TabIndex        =   10
      Top             =   1200
      Width           =   4935
      Begin VB.CheckBox check1 
         Caption         =   "Check1"
         DataField       =   "BASEMENT"
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3840
         TabIndex        =   29
         Top             =   240
         Width           =   255
      End
      Begin VB.TextBox Text7 
         DataField       =   "NUMBER_OF_FLOORS"
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   28
         Top             =   240
         Width           =   375
      End
      Begin VB.Label Label4 
         Caption         =   "2. Υπάρχει υπόγειο;"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2280
         TabIndex        =   12
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Label3 
         Caption         =   "1. Αριθμός ορόφων:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Α.13. Ποιος ήταν ο αρχικός προορισμός του κτιρίου;"
      Height          =   615
      Left            =   120
      TabIndex        =   9
      Top             =   1200
      Width           =   4815
      Begin MSDataListLib.DataCombo DataCombo4 
         Height          =   330
         Left            =   240
         TabIndex        =   47
         Top             =   240
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   582
         _Version        =   393216
         Text            =   "DataCombo4"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.CommandButton Command9 
         Caption         =   "..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3000
         TabIndex        =   46
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Α.12. Πότε κτίστηκε το κτίριο;"
      Height          =   975
      Left            =   5040
      TabIndex        =   7
      Top             =   120
      Width           =   4935
      Begin MSDataListLib.DataCombo DataCombo2 
         Height          =   330
         Left            =   120
         TabIndex        =   44
         Top             =   240
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   582
         _Version        =   393216
         Style           =   2
         Text            =   "DataCombo2"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox Text9 
         DataField       =   "YEAR_OF_BUILDING"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1032
            SubFormatType   =   1
         EndProperty
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1920
         TabIndex        =   42
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Ποιο έτος;(προαιρετικά)"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   600
         Width           =   1935
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Α.11 το κτίριο είναι:"
      Height          =   975
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   4815
      Begin MSDataListLib.DataCombo DataCombo1 
         Height          =   330
         Left            =   240
         TabIndex        =   43
         Top             =   240
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   582
         _Version        =   393216
         Style           =   2
         Text            =   "DataCombo1"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.CommandButton Command5 
         Caption         =   "..."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3000
         TabIndex        =   38
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox text8 
         DataField       =   "ALLOTMENT_BY"
         DataSource      =   "Adodc1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2880
         MaxLength       =   80
         TabIndex        =   32
         Text            =   "Text8"
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Αν είναι παραχώρηση, από ποιόν;"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   600
         Width           =   2655
      End
   End
   Begin VB.PictureBox picButtons 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   420
      Left            =   0
      ScaleHeight     =   420
      ScaleWidth      =   10215
      TabIndex        =   1
      Top             =   7065
      Width           =   10215
      Begin VB.CommandButton Command8 
         Caption         =   "Αποθήκευση νέου κτιρίου"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4560
         TabIndex        =   41
         Top             =   0
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Ακύρωση και Έξοδος"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   6720
         TabIndex        =   39
         Top             =   0
         Width           =   2295
      End
      Begin VB.CommandButton cmdClose 
         Caption         =   "Αποθήκευση και Έξοδος"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4320
         TabIndex        =   4
         Top             =   0
         Width           =   2295
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Διαγραφή κτιρίου"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   0
         Width           =   1935
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Εισαγωγή νέου κτιρίου"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   0
         Width           =   2055
      End
   End
   Begin VB.PictureBox picStatBox 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   540
      Left            =   0
      ScaleHeight     =   540
      ScaleWidth      =   10215
      TabIndex        =   0
      Top             =   7485
      Width           =   10215
      Begin MSAdodcLib.Adodc Adodc1 
         Height          =   330
         Left            =   2520
         Top             =   120
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   582
         ConnectMode     =   0
         CursorLocation  =   3
         IsolationLevel  =   -1
         ConnectionTimeout=   15
         CommandTimeout  =   30
         CursorType      =   3
         LockType        =   3
         CommandType     =   8
         CursorOptions   =   0
         CacheSize       =   50
         MaxRecords      =   0
         BOFAction       =   0
         EOFAction       =   0
         ConnectStringType=   1
         Appearance      =   1
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         Orientation     =   0
         Enabled         =   -1
         Connect         =   ""
         OLEDBString     =   ""
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   ""
         Caption         =   "Adodc1"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _Version        =   393216
      End
   End
End
Attribute VB_Name = "building"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents adoPrimaryRS As Recordset
Attribute adoPrimaryRS.VB_VarHelpID = -1
Dim mbChangedByCode As Boolean
Dim mvBookMark As Variant
Dim mbEditFlag As Boolean
Dim mbAddNewFlag As Boolean
Dim mbDataChanged As Boolean
Dim vnttemp As Variant
Dim vntid As Integer
'Dim db As Connection
Dim rsbuilding As ADODB.Recordset
Dim rsgrid1 As ADODB.Recordset
Dim rsgrid2 As ADODB.Recordset
Public rslu As ADODB.Recordset
Public rslu3 As ADODB.Recordset
Public rsupdatemaintenance As ADODB.Recordset
Public add_status As Integer
Public max_idproperty As Integer
Public max_idsectorkind As Integer
Public max_idinitialuse As Integer
Dim hopee1 As ADODB.Recordset
Dim hopee2 As ADODB.Recordset
Dim hopee3 As ADODB.Recordset
Dim hopee4 As ADODB.Recordset


Private Sub Adodc1_MoveComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
'MsgBox ("qsdasdas")
If rsbuilding.RecordCount = 0 Then
          Adodc1.Caption = "0 από 0"
          cmdDelete.Enabled = False
          Else
          cmdDelete.Enabled = True
          Adodc1.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
End If
'Adodc1.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
'response = MsgBox(insert_into_forms)
If insert_into_forms = 1 Then

If rsbuilding.EOF Or rsbuilding.BOF Then
'response = MsgBox("bla-bla")
Else
'response = MsgBox(add_status)
    If add_status = 0 Then
        Text5.Text = rsbuilding!id_building
    End If
End If

    'Retrieve schema info in order to avoid error
    'if we try to drop a temporary table that not exists
   ' Set rstemp = dbCon.OpenSchema(adSchemaTables)
    'Do Until rstemp.EOF
     '   If rstemp!TABLE_NAME = "tmp_maintenance1" Then
      '      dbCon.Execute "DROP TABLE tmp_maintenance1"
       '     Exit Do
        'End If
        'rstemp.MoveNext
    'Loop
    'rstemp.Close
    
   ' dbCon.Execute "CREATE TABLE tmp_maintenance1(id_sector integer, sector text(40)" & _
    '",out integer, check integer,id_status integer, maintenance_date date)"
    
   'rstemp.Open "insert into tmp_maintenance1(id_sector,sector,out,check) select id_building_sector,bulding_sector,out_of_list,0 from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
   'If Text5 <> "" Then
   'rstemp.Open "update tmp_maintenance1 set check=-1 where id_sector in (select id_bulding_sector from t_building_maintenance where id_building=" & Text5 & " and id_school='" & schoolId & "' and school_year=" & schoolYear & ")", dbCon, adOpenStatic, adLockOptimistic
   'rstemp.Open "update tmp_maintenance1 , t_building_maintenance set tmp_maintenance1.maintenance_date=t_building_maintenance.maintenance_date where  tmp_maintenance1.id_sector=t_building_maintenance.id_bulding_sector and t_building_maintenance.id_building=" & Text5 & " and t_building_maintenance.id_school='" & schoolId & "' and t_building_maintenance.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
 'End If
 'kostas
 SGGrid1.Update
 'Set SGGrid1.DataSource = Nothing
 'SGGrid1.Update
 'MsgBox ("Ton poulo!!!")
 'kostas
 If Text5.Text = "" Then
 Text5.Text = 1
 End If
  Set rsgrid1 = New ADODB.Recordset
'MsgBox ("ingrid")
  rsgrid1.Open "select * from tmp_maintenance1" + userkostas + " where id_building=" & Text5.Text, dbCon, adOpenStatic, adLockOptimistic
  

    SGGrid1.AutoFields = False
    SGGrid1.DataMode = sgBound
    SGGrid1.GroupByBoxVisible = False
    Set SGGrid1.DataSource = rsgrid1
    With SGGrid1
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("check1")
         .Caption = "ΝΑΙ/ΟΧΙ"
         .Control.Type = sgCellCheckBox
         .DBField = "check1"
         .Control.PopupStyle.Appearance = sg3DLight
         .Width = 800
      End With
      
      With .Columns.Add("maintenance_date")
         .DBField = "maintenance_date"
         .Caption = "Χρόνος"
         '.EditMask = "##/##/####"
         .EditMaskDataMode = sgMaskModeSaveAll
         .Width = 1200
      End With

   End With
    
    'katastasi ktiriou
   ' Set rstemp = dbCon.OpenSchema(adSchemaTables)
    'Do Until rstemp.EOF
    '    If rstemp!TABLE_NAME = "tmp_maintenance2" Then
    '        dbCon.Execute "DROP TABLE tmp_maintenance2"
    '        Exit Do
    '    End If
    '    rstemp.MoveNext
    'Loop
    'rstemp.Close
    
    'dbCon.Execute "CREATE TABLE tmp_maintenance2(id_sector integer, sector text(40)" & _
   ' ",out integer, check integer,id_status integer, maintenance_date date)"
    
   'rstemp.Open "insert into tmp_maintenance2(id_sector,sector,out,check) select id_building_sector,bulding_sector,out_of_list,0 from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
  'If Text5 <> "" Then
  ' rstemp.Open "update tmp_maintenance2,t_building_status set tmp_maintenance2.id_status =t_building_status.id_status where tmp_maintenance2.id_sector=t_building_status.id_building_sector and t_building_status.id_building=" & Text5 & " and t_building_status.id_school='" & schoolId & "' and t_building_status.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
  'End If
  
  
  'kostas
 SGGrid2.Update
 'Set SGGrid2.DataSource = Nothing
 'SGGrid2.Update
 'MsgBox ("Ton pirame!!!")
 'kostas
 Set lurs = New ADODB.Recordset
    lurs.Open " select id_status,status from l_bulding_status", dbCon, adOpenStatic, adLockOptimistic
 If Text5.Text = "" Then
 Text5.Text = 1
 End If
  Set rsgrid2 = New ADODB.Recordset
  rsgrid2.Open "select * from tmp_maintenance2" + userkostas + " where id_building=" & Text5.Text, dbCon, adOpenStatic, adLockOptimistic

    SGGrid2.AutoFields = False
    SGGrid2.DataMode = sgBound
    SGGrid2.GroupByBoxVisible = False
    Set SGGrid2.DataSource = rsgrid2
    With SGGrid2
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("id_status")
         .Caption = "Κατάσταση κτιρίου"
         .DBField = "id_status"
         .Control.Type = sgCellDropList
         .Control.PopupRows = 5
         Do While Not lurs.EOF
            .ValueItems.Add lurs!id_status, lurs!Status
            .Control.SortOrder = sgNoSorting
            lurs.MoveNext
         Loop
         .ValueItems.Translate = True
         .Width = 2000
      End With
 

   End With
   End If

End Sub


Private Sub Command1_Click()
    lookupstr = InputBox("Είδος τομέα", _
    "Προσθήκη νέου τύπου τομέα")
    lookupstr = Left(lookupstr, 40)
    If Not lookupstr = "" Then
        rsgrid1.AddNew
        rsgrid2.AddNew
        rsgrid1!sector = lookupstr
        rsgrid2!sector = lookupstr
        
  rsgrid1!id_sector = max_idsectorkind + 1
  rsgrid2!id_sector = max_idsectorkind + 1
  maxidsectorkind = max_idsectorkind + 1
  '      rsgrid1!out = -1
        rsgrid1!id_building = Text5.Text
        rsgrid1!Check1 = 0
        rsgrid1.Update
        
   '     rsgrid2!out = -1
        rsgrid2!id_building = Text5.Text
        rsgrid2!Check1 = 0
        rsgrid2.Update
        max_idsectorkind = max_idsectorkind + 1
        
 'Set rsmaintenance = New ADODB.Recordset
 'rsmaintenance.Open "insert into l_bulding_sector_kind (id_building_sector,bulding_sector,out_of_list,school_year,id_school) values (" & maxidsectorkind & ",'" & lookupstr & "',-1," & schoolYear & ",'" & schoolId & "')", dbCon, adOpenStatic, adLockOptimistic
  Set rsotherbuildings = New ADODB.Recordset
  rsotherbuildings.Open "select distinct id_building from t_building where id_building <> " & Text5.Text, dbCon, adOpenStatic, adLockOptimistic

 If rsotherbuildings.RecordCount <> 0 Then
 rsotherbuildings.MoveFirst
 Do While Not rsotherbuildings.EOF
 
  Set rsothermaintenance1 = New ADODB.Recordset
  rsothermaintenance1.Open "insert into tmp_maintenance1" + userkostas + " values(" & rsotherbuildings!id_building & "," & maxidsectorkind & ",'" & lookupstr & "',0,null,null)", dbCon, adOpenStatic, adLockOptimistic
  
  Set rsothermaintenance2 = New ADODB.Recordset
  rsothermaintenance2.Open "insert into tmp_maintenance2" + userkostas + " values(" & rsotherbuildings!id_building & "," & maxidsectorkind & ",'" & lookupstr & "',0,null,null)", dbCon, adOpenStatic, adLockOptimistic

 rsotherbuildings.MoveNext
 Loop
 End If
    End If
    Exit Sub

End Sub

Private Sub Command2_Click()
  On Error GoTo DeleteErr

  Set rsfindoutoflist = New ADODB.Recordset
  rsfindoutoflist.Open "select out,id_sector from tmp_maintenance2" + userkostas + " where id_sector=" & rsgrid2!id_sector, dbCon, adOpenStatic, adLockOptimistic
If rsfindoutoflist!out = 0 Then
response = MsgBox("Δεν μπορείτε να διαγράψετε αυτό το στοιχείο")
ElseIf rsfindoutoflist!out = -1 Then
  Set rsdeleteoutoflist = New ADODB.Recordset
     rsgrid2.Delete
     rsgrid1.Find "ID_SECTOR=" & rsfindoutoflist!id_sector
     rsgrid1.Delete

End If
Exit Sub
DeleteErr:
  MsgBox Err.Description
End Sub


Private Sub Command3_Click()
  On Error GoTo DeleteErr
  Set rsfindoutoflist = New ADODB.Recordset
  rsfindoutoflist.Open "select out,id_sector from tmp_maintenance1" + userkostas + " where id_sector=" & rsgrid1!id_sector, dbCon, adOpenStatic, adLockOptimistic
If rsfindoutoflist!out = 0 Then
response = MsgBox("Δεν μπορείτε να διαγράψετε αυτό το στοιχείο")
ElseIf rsfindoutoflist!out = -1 Then
     rsgrid1.Delete
     rsgrid2.Find "ID_SECTOR=" & rsfindoutoflist!id_sector
     rsgrid2.Delete
End If
Exit Sub

DeleteErr:
  MsgBox Err.Description
End Sub

Private Sub Command4_Click()
    lookupstr = InputBox("Είδος τομέα", _
    "Προσθήκη νέου τύπου τομέα")
    lookupstr = Left(lookupstr, 40)
    If Not lookupstr = "" Then
        rsgrid1.AddNew
        rsgrid2.AddNew
        rsgrid1!sector = lookupstr
        rsgrid2!sector = lookupstr
        
  rsgrid1!id_sector = max_idsectorkind + 1
  rsgrid2!id_sector = max_idsectorkind + 1
  maxidsectorkind = max_idsectorkind + 1
'        rsgrid1!out = -1
        rsgrid1!id_building = Text5.Text
        rsgrid1!Check1 = 0
        rsgrid1.Update
 
 '       rsgrid2!out = -1
        rsgrid2!id_building = Text5.Text
        rsgrid2!Check1 = 0
        rsgrid2.Update
        max_idsectorkind = max_idsectorkind + 1
        
 'Set rsmaintenance = New ADODB.Recordset
 'rsmaintenance.Open "insert into l_bulding_sector_kind (id_building_sector,bulding_sector,out_of_list,school_year,id_school) values (" & maxidsectorkind & ",'" & lookupstr & "',-1," & schoolYear & ",'" & schoolId & "')", dbCon, adOpenStatic, adLockOptimistic
  Set rsotherbuildings = New ADODB.Recordset
  rsotherbuildings.Open "select distinct id_building from t_building where id_building <> " & Text5.Text, dbCon, adOpenStatic, adLockOptimistic

If rsotherbuildings.RecordCount <> 0 Then
rsotherbuildings.MoveFirst
 Do While Not rsotherbuildings.EOF
 
  Set rsothermaintenance1 = New ADODB.Recordset
  rsothermaintenance1.Open "insert into tmp_maintenance1" + userkostas + " values(" & rsotherbuildings!id_building & "," & maxidsectorkind & ",'" & lookupstr & "',0,null,null)", dbCon, adOpenStatic, adLockOptimistic
  
  Set rsothermaintenance2 = New ADODB.Recordset
  rsothermaintenance2.Open "insert into tmp_maintenance2" + userkostas + " values(" & rsotherbuildings!id_building & "," & maxidsectorkind & ",'" & lookupstr & "',0,null,null)", dbCon, adOpenStatic, adLockOptimistic

 rsotherbuildings.MoveNext
 Loop
 End If
    End If
    Exit Sub
End Sub

Private Sub Command5_Click()
'insert_lvalue = 1

'property_type.Show vbModal
'Set property_type = Nothing
    lookupstr = InputBox("Είδος ιδιοκτησιακού καθεστώτος", _
    "Προσθήκη νέου ιδιοκτησιακού καθεστώτος")
        lookupstr = Left(lookupstr, 30)
       If Not lookupstr = "" Then
 
  rslu.AddNew
  rslu!lc = lookupstr
  rslu!lid = max_idproperty + 1
  'rslu!out_of_list = -1
  'rslu!id_school = schoolId
  'rslu!school_year = schoolYear
  rslu.Update
  
 
      max_idproperty = max_idproperty + 1
  End If
  
Exit Sub
End Sub

Private Sub Command6_Click()
Unload Me
End Sub

Private Sub Command7_Click()
  add_status = 0
cmdAdd.Visible = True
cmdDelete.Visible = True
Command7.Visible = False
Command8.Visible = False
Command6.Visible = True
cmdClose.Visible = True
Adodc1.Visible = True
'response = MsgBox(rsbuilding.RecordCount)

  'With rsbuilding
   ' .Delete
    '.MoveNext
    'If .EOF Then .MoveLast
  'End With
If rsbuilding.RecordCount = 1 Then
Set delbuilding = New ADODB.Recordset
delbuilding.Open "delete from t_building where school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic
 Set rsbuilding = New ADODB.Recordset
 rsbuilding.Open "select * from t_building where school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic

Set Adodc1.Recordset = rsbuilding
          If rsbuilding.RecordCount = 0 Then
          Adodc1.Caption = "0 από 0"
          cmdDelete.Enabled = False
          Else
          cmdDelete.Enabled = True
          Adodc1.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
          End If
ElseIf rsbuilding.RecordCount <> 1 Then
  With rsbuilding
    .Delete
    .MoveNext
    If .EOF Then .MoveLast
  End With
  End If
  Exit Sub
        

End Sub

Private Sub Command8_Click()
Set hopee4 = New ADODB.Recordset
hopee4.ActiveConnection = dbCon
hopee4.LockType = adLockOptimistic
hopee4.CursorLocation = adUseClient
hopee4.CursorType = adOpenDynamic
'semaphores
    hopee4.Source = "SELECT * from hope where tablename = 'apothikeusi'"
    hopee4.Open
    
    
    Dim i As Integer
    i = 0
    

    While (hopee4.RecordCount <> 0)
         
         wait
         
         hopee4.Close
         hopee4.Source = "SELECT * from hope where tablename = 'apothikeusi'"
         hopee4.Open
         
         
         If i = 8 Then
            hopee4.Close
            hopee4.Source = "DELETE from hope where tablename = 'apothikeusi'"
            hopee4.Open
            GoTo exitlabel
         End If
         i = i + 1
    Wend
      
        
    hopee4.Close
    
exitlabel:
 
    hopee4.Source = "SELECT * from hope"
    hopee4.Open
    
    hopee4.AddNew
    hopee4.Fields("tablename").Value = "apothikeusi"
    hopee4.Update
     
    hopee4.Close

'end of semaphores
   add_status = 0
cmdAdd.Visible = True
cmdDelete.Visible = True
Command7.Visible = False
Command8.Visible = False
Command6.Visible = True
cmdClose.Visible = True
cmdDelete.Enabled = True
cmdClose.Enabled = True
Adodc1.Visible = True
Adodc1.Visible = True

rsbuilding.Update
'rsgrid1.Update
'rsgrid2.Update

SGGrid1.Update
SGGrid2.Update
hopee4.Source = "DELETE from hope where tablename = 'apothikeusi'"
hopee4.Open
   
End Sub

Private Sub Command9_Click()
    lookupstr = InputBox("Αρχικός προορισμός κτιρίου", _
    "Προσθήκη νέου αρχικού προορισμού κτιρίου")
        lookupstr = Left(lookupstr, 30)
       If Not lookupstr = "" Then

  rslu3.AddNew
  rslu3!lc = lookupstr
  rslu3!lid = max_idinitialuse + 1
 ' rslu3!out_of_list = -1
  'rslu3!id_school = schoolId
  'rslu3!school_year = schoolYear
  rslu3.Update
 
      max_idinitialuse = max_idinitialuse + 1
      End If
End Sub

Private Sub DataCombo1_Click(area As Integer)
If Adodc1.Recordset.RecordCount = 0 Then
response = MsgBox("Για να εισάγετε τα στοιχεία του κτιρίου της Σχολικής Μονάδας πρέπει πρώτα να επιλέξετε ΕΙΣΑΓΩΓΗ ΚΤΙΡΙΟΥ")
DataCombo1.Text = ""
End If

End Sub

Public Sub Form_Load()
'response = MsgBox(schoolYear)
'response = MsgBox(schoolId)
    
If admin = 0 Then
    Command1.Enabled = False
    Command4.Enabled = False
    Command5.Enabled = False
    Command9.Enabled = False
Else
    Command1.Enabled = True
    Command4.Enabled = True
    Command5.Enabled = True
    Command9.Enabled = True
End If
Text2 = schoolYear
Text3 = schoolId

Me.Caption = Me.Caption & " Σχολική Μονάδα " & schoolId _
& " Έτος " & schoolYear & "-" & (schoolYear + 1)

   
'add_staus = 0
Set rsbuilding = New ADODB.Recordset
If Text3 = "" Then
    rsbuilding.Open "select * from t_building where school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
Else
    rsbuilding.Open "select * from t_building where school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic

    If rsbuilding.RecordCount <> 0 Then
         cmdAdd.Visible = True
    Else
        rsbuilding.AddNew
        rsbuilding!id_building = 1
        rsbuilding!id_school = schoolId
        rsbuilding!school_year = schoolYear
    End If
End If
rsbuilding.MoveFirst
idbuilding = rsbuilding!id_building
Set Adodc1.Recordset = rsbuilding
Adodc1.Visible = True
If rsbuilding.RecordCount = 0 Then
    cmdDelete.Enabled = False
    Adodc1.Caption = "0 από " & CStr(rsbuilding.RecordCount)
Else
    cmdDelete.Enabled = True
    Adodc1.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
End If
Set rsmaxpropertytype = New ADODB.Recordset
rsmaxpropertytype.Open "select max(id_property_type)as maxidproperty from l_property_type", dbCon, adOpenStatic, adLockOptimistic
max_idproperty = rsmaxpropertytype!maxidproperty
rsmaxpropertytype.Close

Set rsmaxsectorkind = New ADODB.Recordset
rsmaxsectorkind.Open "select max(ID_BUILDING_SECTOR) as maxidsector from L_BULDING_SECTOR_KIND", dbCon, adOpenStatic, adLockOptimistic
max_idsectorkind = rsmaxsectorkind!maxidsector
rsmaxsectorkind.Close

Set rsmaxinitialusebuilding = New ADODB.Recordset
rsmaxinitialusebuilding.Open "select max(ID_INITIAL_USE_OF_BULDING) as maxidinitialuse from L_INITIAL_USE_OF_BULDING", dbCon, adOpenStatic, adLockOptimistic
max_idinitialuse = rsmaxinitialusebuilding!maxidinitialuse
rsmaxinitialusebuilding.Close

   Set rslu = New ADODB.Recordset
   'rslu.Open "select ID_PROPERTY_TYPE AS lid,PROPERTY_TYPE AS lc,SCHOOL_YEAR,ID_SCHOOL from L_PROPERTY_TYPE where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenKeyset, adLockOptimistic, adCmdText
   rslu.Open "select ID_PROPERTY_TYPE AS lid,PROPERTY_TYPE AS lc from L_PROPERTY_TYPE", dbCon, adOpenKeyset, adLockOptimistic, adCmdText
    Set DataCombo1.RowSource = rslu
    DataCombo1.ListField = "lc"
    DataCombo1.BoundColumn = "lid"
    DataCombo1.DataField = "ID_PROPERTY_TYPE"
    DataCombo1.Enabled = True
    Set DataCombo1.DataSource = rsbuilding
    
    
   Set rslu1 = New ADODB.Recordset
   rslu1.Open "select ID_DECADE_OF_BUILDING AS lid,DECADE_OF_BUILDING AS lc from L_DECADE_OF_BUILDING ", dbCon, adOpenKeyset, adLockOptimistic, adCmdText
 
    Set DataCombo2.RowSource = rslu1
    DataCombo2.ListField = "lc"
    DataCombo2.BoundColumn = "lid"
    DataCombo2.DataField = "ID_DECADE_OF_BULIDING"
    DataCombo2.Enabled = True
    Set DataCombo2.DataSource = rsbuilding
 
   Set rslu2 = New ADODB.Recordset
   rslu2.Open "select ID_MAINTENANCE AS lid,MAINTENANCE AS lc from L_BUILDING_MAINTENANCE ", dbCon, adOpenKeyset, adLockOptimistic, adCmdText
 
    Set DataCombo3.RowSource = rslu2
    DataCombo3.ListField = "lc"
    DataCombo3.BoundColumn = "lid"
    DataCombo3.DataField = "ID_MAINTENANCE"
    DataCombo3.Enabled = True
    Set DataCombo3.DataSource = rsbuilding
     
   Set rslu3 = New ADODB.Recordset
   rslu3.Open "select ID_INITIAL_USE_OF_BULDING AS lid,INITIAL_USE_OF_BULDING AS lc from L_INITIAL_USE_OF_BULDING", dbCon, adOpenKeyset, adLockOptimistic, adCmdText
   'rslu3.Open "select ID_INITIAL_USE_OF_BULDING AS lid,INITIAL_USE_OF_BULDING AS lc,out_of_list ,id_school,school_year from L_INITIAL_USE_OF_BULDING  where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenKeyset, adLockOptimistic, adCmdText

    Set DataCombo4.RowSource = rslu3
    DataCombo4.ListField = "lc"
    DataCombo4.BoundColumn = "lid"
    DataCombo4.DataField = "ID_INITIAL_USE_OF_BULDING"
    DataCombo4.Enabled = True
    Set DataCombo4.DataSource = rsbuilding
     
  
  'dokimi
 Dim rstemp As ADODB.Recordset

     'katastasi ktiriou
    Set rstemp = dbCon.OpenSchema(adSchemaTables)
    Do Until rstemp.EOF
        If rstemp!TABLE_NAME = "tmp_maintenance2" + userkostas Then
            dbCon.Execute "DROP TABLE tmp_maintenance2" + userkostas
            Exit Do
        End If
        rstemp.MoveNext
    Loop
    rstemp.Close
    
    'dbCon.Execute "CREATE TABLE tmp_maintenance2" + userkostas + "(id_building integer,id_sector integer, sector text(40)" & _
    ",out integer, check1 integer,id_status integer, maintenance_date text(50))"
    dbCon.Execute "CREATE TABLE tmp_maintenance2" + userkostas + "(id_building integer,id_sector integer, sector text(40)" & _
    ", check1 integer,id_status integer, maintenance_date text(50))"

    Set rstemp = dbCon.OpenSchema(adSchemaTables)
    Do Until rstemp.EOF
        If rstemp!TABLE_NAME = "tmp_maintenance1" + userkostas Then
            dbCon.Execute "DROP TABLE tmp_maintenance1" + userkostas
            Exit Do
        End If
        rstemp.MoveNext
    Loop
    rstemp.Close
    
    dbCon.Execute "CREATE TABLE tmp_maintenance1" + userkostas + "(id_building integer,id_sector integer, sector text(40)" & _
    ", check1 integer,id_status integer, maintenance_date text(50))"



'MsgBox ("created2")
   rsbuilding.MoveFirst
   Do While Not rsbuilding.EOF
   'response = MsgBox(rsbuilding!id_building)
   'rstemp.Open "insert into tmp_maintenance2" + userkostas + "(id_building,id_sector,sector,out) select " & rsbuilding!id_building & ",id_building_sector,bulding_sector,out_of_list from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
 
   'rstemp.Open "update tmp_maintenance2" + userkostas + ",t_building_status set tmp_maintenance2" + userkostas + ".id_status =t_building_status.id_status where tmp_maintenance2" + userkostas + ".id_sector=t_building_status.id_building_sector" & " and tmp_maintenance2" + userkostas + ".id_building=" & rsbuilding!id_building & " and t_building_status.id_building=" & rsbuilding!id_building & " and t_building_status.id_school='" & schoolId & "' and t_building_status.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
    rstemp.Open "insert into tmp_maintenance2" + userkostas + "(id_building,id_sector,sector) select " & rsbuilding!id_building & ",id_building_sector,bulding_sector from l_bulding_sector_kind", dbCon, adOpenStatic, adLockOptimistic
 
    rstemp.Open "update tmp_maintenance2" + userkostas + ",t_building_status set tmp_maintenance2" + userkostas + ".id_status =t_building_status.id_status where tmp_maintenance2" + userkostas + ".id_sector=t_building_status.id_building_sector" & " and tmp_maintenance2" + userkostas + ".id_building=" & rsbuilding!id_building & " and t_building_status.id_building=" & rsbuilding!id_building & " and t_building_status.id_school='" & schoolId & "' and t_building_status.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic

rsbuilding.MoveNext
Loop
  
     Set lurs = New ADODB.Recordset
    lurs.Open " select id_status,status from l_bulding_status", dbCon, adOpenStatic, adLockOptimistic

  Set rsgrid2 = New ADODB.Recordset
  rsgrid2.Open "select * from tmp_maintenance2" + userkostas + " where id_building=" & idbuilding, dbCon, adOpenStatic, adLockOptimistic

    SGGrid2.AutoFields = False
    SGGrid2.DataMode = sgBound
    SGGrid2.GroupByBoxVisible = False
    Set SGGrid2.DataSource = rsgrid2
    With SGGrid2
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("id_status")
         .Caption = "Κατάσταση κτιρίου"
         .DBField = "id_status"
         .Control.Type = sgCellDropList
         .Control.PopupRows = 5
         Do While Not lurs.EOF
            .ValueItems.Add lurs!id_status, lurs!Status
            .Control.SortOrder = sgNoSorting
            lurs.MoveNext
         Loop
         .ValueItems.Translate = True
         .Width = 2000
      End With
 

   End With
    'Retrieve schema info in order to avoid error
    'if we try to drop a temporary table that not exists
    'kostas
    'Set rstemp = dbCon.OpenSchema(adSchemaTables)
    'Do Until rstemp.EOF
     '   If rstemp!TABLE_NAME = "tmp_maintenance1" + userkostas Then
     '       dbCon.Execute "DROP TABLE tmp_maintenance1" + userkostas
     '       Exit Do
     '   End If
     '   rstemp.MoveNext
    'Loop
    'rstemp.Close
   '
    'dbCon.Execute "CREATE TABLE tmp_maintenance1" + userkostas + "(id_building integer,id_sector integer, sector text(40)" & _
    ", check1 integer,id_status integer, maintenance_date text(50))"
    'kostas
   
   'MsgBox ("created!!")
    
   rsbuilding.MoveFirst
   Do While Not rsbuilding.EOF
   'rstemp.Open "insert into tmp_maintenance1" + userkostas + "(id_building,id_sector,sector,out,check1) select " & rsbuilding!id_building & ",id_building_sector,bulding_sector,out_of_list,0 from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
   rstemp.Open "insert into tmp_maintenance1" + userkostas + "(id_building,id_sector,sector,check1) select " & rsbuilding!id_building & ",id_building_sector,bulding_sector,0 from l_bulding_sector_kind", dbCon, adOpenStatic, adLockOptimistic
  If Text5 <> "" Then
   rstemp.Open "update tmp_maintenance1" + userkostas + " set check1=-1 where tmp_maintenance1" + userkostas + ".id_building=" & rsbuilding!id_building & " and id_sector in (select id_bulding_sector from t_building_maintenance where id_building=" & rsbuilding!id_building & " and id_school='" & schoolId & "' and school_year=" & schoolYear & ")", dbCon, adOpenStatic, adLockOptimistic
   rstemp.Open "update tmp_maintenance1" + userkostas + ",t_building_maintenance set tmp_maintenance1" + userkostas + ".maintenance_date=t_building_maintenance.maintenance_date where tmp_maintenance1" + userkostas + ".id_sector=t_building_maintenance.id_bulding_sector and tmp_maintenance1" + userkostas + ".id_building=" & rsbuilding!id_building & " and t_building_maintenance.id_building=" & rsbuilding!id_building & " and t_building_maintenance.id_school='" & schoolId & "' and t_building_maintenance.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
  End If
rsbuilding.MoveNext
Loop
    
    
   'rstemp.Open "insert into tmp_maintenance1(id_sector,sector,out,check) select id_building_sector,bulding_sector,out_of_list,0 from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
 
  Set rsgrid1 = New ADODB.Recordset
  rsgrid1.Open "select * from tmp_maintenance1" + userkostas + " where id_building=" & idbuilding, dbCon, adOpenStatic, adLockOptimistic

    SGGrid1.AutoFields = False
    SGGrid1.DataMode = sgBound
    SGGrid1.GroupByBoxVisible = False
    Set SGGrid1.DataSource = rsgrid1
    With SGGrid1
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
    
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("check1")
         .Caption = "ΝΑΙ/ΟΧΙ"
         .Control.Type = sgCellCheckBox
         .DBField = "check1"
         .Control.PopupStyle.Appearance = sg3DLight
         .Width = 800
      End With
      
      With .Columns.Add("maintenance_date")
         .DBField = "maintenance_date"
         .Caption = "Χρόνος"
         '.EditMask = "##/##/####"
         .EditMaskDataMode = sgMaskModeSaveAll
         .Width = 1200
      End With

   End With
      rsbuilding.MoveFirst
    Exit Sub
End Sub
Private Sub cmdAdd_Click()
Set hopee3 = New ADODB.Recordset
hopee3.ActiveConnection = dbCon
hopee3.LockType = adLockOptimistic
hopee3.CursorLocation = adUseClient
hopee3.CursorType = adOpenDynamic
'semaphores
    hopee3.Source = "SELECT * from hope where tablename = 't_building'"
    hopee3.Open
    
    
    Dim i As Integer
    i = 0
    

    While (hopee3.RecordCount <> 0)
         
         wait
         
         hopee3.Close
         hopee3.Source = "SELECT * from hope where tablename = 't_building'"
         hopee3.Open
         
         
         If i = 8 Then
            hopee3.Close
            hopee3.Source = "DELETE from hope where tablename = 't_building'"
            hopee3.Open
            GoTo exitlabel
         End If
         i = i + 1
    Wend
      
        
    hopee3.Close
    
exitlabel:
 
    hopee3.Source = "SELECT * from hope"
    hopee3.Open
    
    hopee3.AddNew
    hopee3.Fields("tablename").Value = "t_building"
    hopee3.Update
     
    hopee3.Close

'end of semaphores
add_status = 2
'response = MsgBox("add_status=" & add_status)
cmdAdd.Visible = False
cmdDelete.Visible = False
Command7.Visible = True
Command8.Visible = True
Command6.Visible = False
cmdClose.Visible = False
Adodc1.Visible = False

Adodc1.Recordset.AddNew
Text2 = schoolYear
Text3 = schoolId
Check1.Value = 0
Option1.Value = False
Option2.Value = False


Set rsfindidbuilding = New ADODB.Recordset
   rsfindidbuilding.Open "select max(id_building) as maxidbuilding from t_building where school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic
  'response = MsgBox(rsfindidbuilding!maxidbuilding)
  If rsfindidbuilding!maxidbuilding <> "" Then
  Text5 = rsfindidbuilding!maxidbuilding + 1
  Else
  Text5.Text = 1
  rsbuilding!id_building = 1
  End If

     'Retrieve schema info in order to avoid error
    'if we try to drop a temporary table that not exists
    'Set rstemp = dbCon.OpenSchema(adSchemaTables)
   ' Do Until rstemp.EOF
    '    If rstemp!TABLE_NAME = "tmp_maintenance1" Then
     '       dbCon.Execute "DROP TABLE tmp_maintenance1"
      '      Exit Do
       ' End If
       ' rstemp.MoveNext
   ' Loop
   ' rstemp.Close
    
    'dbCon.Execute "CREATE TABLE tmp_maintenance1(id_sector integer, sector text(40)" & _
    '",out integer, check integer,id_status integer, maintenance_date date)"
    'kostas
   Set rstemp = New ADODB.Recordset
   'rstemp.Open "insert into tmp_maintenance1" + userkostas + "(id_building,id_sector,sector,check1) select " & Text5.Text & ",id_building_sector,bulding_sector,0 from l_bulding_sector_kind where (id_school='" & schoolId & "' and school_year=" & schoolYear & ") OR (id_school is null and school_year is null)", dbCon, adOpenStatic, adLockOptimistic
   rstemp.Open "insert into tmp_maintenance1" + userkostas + "(id_building,id_sector,sector,check1) select " & Text5.Text & ",id_building_sector,bulding_sector,0 from l_bulding_sector_kind", dbCon, adOpenStatic, adLockOptimistic
   'kostas
   'If Text5 <> "" Then
   'rstemp.Open "update tmp_maintenance1 set check=-1 where id_sector in (select id_bulding_sector from t_building_maintenance where id_building=" & Text5 & " and id_school='" & schoolId & "' and school_year=" & schoolYear & ")", dbCon, adOpenStatic, adLockOptimistic
   'rstemp.Open "update tmp_maintenance1 , t_building_maintenance set tmp_maintenance1.maintenance_date=t_building_maintenance.maintenance_date where  tmp_maintenance1.id_sector=t_building_maintenance.id_bulding_sector and t_building_maintenance.id_building=" & Text5 & " and t_building_maintenance.id_school='" & schoolId & "' and t_building_maintenance.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
 'End If
 
  Set rsgrid1 = New ADODB.Recordset
  rsgrid1.Open "select * from tmp_maintenance1" + userkostas + " where id_building=" & Text5.Text, dbCon, adOpenStatic, adLockOptimistic

    SGGrid1.AutoFields = False
    SGGrid1.DataMode = sgBound
    SGGrid1.GroupByBoxVisible = False
    Set SGGrid1.DataSource = rsgrid1
    With SGGrid1
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("check1")
         .Caption = "ΝΑΙ/ΟΧΙ"
         .Control.Type = sgCellCheckBox
         .DBField = "check1"
         .Control.PopupStyle.Appearance = sg3DLight
         .Width = 800
      End With
      
      With .Columns.Add("maintenance_date")
         .DBField = "maintenance_date"
         .Caption = "Χρόνος"
         '.EditMask = "##/##/####"
         .EditMaskDataMode = sgMaskModeSaveAll
         .Width = 1200
      End With

   End With
    
    'katastasi ktiriou
   ' Set rstemp = dbCon.OpenSchema(adSchemaTables)
   ' Do Until rstemp.EOF
   '     If rstemp!TABLE_NAME = "tmp_maintenance2" Then
    '        dbCon.Execute "DROP TABLE tmp_maintenance2"
     '       Exit Do
      '  End If
     '   rstemp.MoveNext
    'Loop
    'rstemp.Close
    
    'dbCon.Execute "CREATE TABLE tmp_maintenance2(id_sector integer, sector text(40)" & _
    '",out integer, check integer,id_status integer, maintenance_date date)"
    
   rstemp.Open "insert into tmp_maintenance2" + userkostas + "(id_building,id_sector,sector,check1) select " & Text5.Text & ",id_building_sector,bulding_sector,0 from l_bulding_sector_kind", dbCon, adOpenStatic, adLockOptimistic
 ' If Text5 <> "" Then
  ' rstemp.Open "update tmp_maintenance2,t_building_status set tmp_maintenance2.id_status =t_building_status.id_status where tmp_maintenance2.id_sector=t_building_status.id_building_sector and t_building_status.id_building=" & Text5 & " and t_building_status.id_school='" & schoolId & "' and t_building_status.school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
  'End If
  
    Set lurs = New ADODB.Recordset
    lurs.Open " select id_status,status from l_bulding_status", dbCon, adOpenStatic, adLockOptimistic

  Set rsgrid2 = New ADODB.Recordset
  rsgrid2.Open "select * from tmp_maintenance2" + userkostas + " where id_building=" & Text5.Text, dbCon, adOpenStatic, adLockOptimistic

    SGGrid2.AutoFields = False
    SGGrid2.DataMode = sgBound
    SGGrid2.GroupByBoxVisible = False
    Set SGGrid2.DataSource = rsgrid2
    With SGGrid2
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("id_status")
         .Caption = "Κατάσταση κτιρίου"
         .DBField = "id_status"
         .Control.Type = sgCellDropList
         .Control.PopupRows = 5
         Do While Not lurs.EOF
            .ValueItems.Add lurs!id_status, lurs!Status
            .Control.SortOrder = sgNoSorting
            lurs.MoveNext
         Loop
         .ValueItems.Translate = True
         .Width = 2000
      End With
 

   End With
    hopee3.Source = "DELETE from hope where tablename = 't_building'"
    hopee3.Open
   
    
Exit Sub
End Sub

Private Sub cmdDelete_Click()
'response = MsgBox(Text5.Text)
  'On Error GoTo DeleteErr
  
 
Set delmaintenance1 = New ADODB.Recordset
delmaintenance1.Open "delete from t_building_maintenance where id_building=" & Text5 & " and school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic

Set delmaintenance2 = New ADODB.Recordset
delmaintenance2.Open "delete from t_building_status where id_building=" & Text5 & " and school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic
'response = MsgBox(rsbuilding!id_building)

Set delbuilding = New ADODB.Recordset
delbuilding.Open "delete from t_building where id_building=" & Text5 & " and school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic

Set deltmpmaintenance1 = New ADODB.Recordset
deltmpmaintenance1.Open "delete from tmp_maintenance1" + userkostas + " where id_building=" & Text5, dbCon, adOpenStatic, adLockOptimistic

Set deltmpmaintenance2 = New ADODB.Recordset
deltmpmaintenance2.Open "delete from tmp_maintenance2" + userkostas + " where id_building=" & Text5, dbCon, adOpenStatic, adLockOptimistic

Set rsbuilding = New ADODB.Recordset
rsbuilding.Open "select * from t_building where school_year=" & schoolYear & " and id_school='" & schoolId & "'", dbCon, adOpenStatic, adLockOptimistic

Set Adodc1.Recordset = rsbuilding
          If rsbuilding.RecordCount = 0 Then
          Adodc1.Caption = "0 από 0"
          cmdDelete.Enabled = False
          cmdClose.Enabled = False
          Check1.Value = 0
          Set delmaintenance1 = New ADODB.Recordset
          delmaintenance1.Open "delete from tmp_maintenance1" + userkostas, dbCon, adOpenStatic, adLockOptimistic
          Set delmaintenance2 = New ADODB.Recordset
          delmaintenance2.Open "delete from tmp_maintenance2" + userkostas, dbCon, adOpenStatic, adLockOptimistic
      
    Set rsgrid1 = New ADODB.Recordset
    rsgrid1.Open "select * from tmp_maintenance1" + userkostas, dbCon, adOpenStatic, adLockOptimistic

    SGGrid1.AutoFields = False
    SGGrid1.DataMode = sgBound
    SGGrid1.GroupByBoxVisible = False
    Set SGGrid1.DataSource = rsgrid1
    With SGGrid1
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
    
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("check1")
         .Caption = "ΝΑΙ/ΟΧΙ"
         .Control.Type = sgCellCheckBox
         .DBField = "check1"
         .Control.PopupStyle.Appearance = sg3DLight
         .Width = 800
      End With
      
      With .Columns.Add("maintenance_date")
         .DBField = "maintenance_date"
         .Caption = "Χρόνος"
         '.EditMask = "##/##/####"
         .EditMaskDataMode = sgMaskModeSaveAll
         .Width = 1200
      End With

   End With

              Set lurs = New ADODB.Recordset
    lurs.Open " select id_status,status from l_bulding_status", dbCon, adOpenStatic, adLockOptimistic

  Set rsgrid2 = New ADODB.Recordset
  rsgrid2.Open "select * from tmp_maintenance2" + userkostas, dbCon, adOpenStatic, adLockOptimistic

    SGGrid2.AutoFields = False
    SGGrid2.DataMode = sgBound
    SGGrid2.GroupByBoxVisible = False
    Set SGGrid2.DataSource = rsgrid2
    With SGGrid2
      .Columns.RemoveAll True
      .DataRowCount = 0
      .HeadingColCount = 1
      '.AllowDelete = True
     ' .AllowAddNew = True
      .AllowEdit = True
      
      With .Columns.Add("sector")
         .DBField = "sector"
         .Caption = "Τομέας"
         .Width = 4700
         .AllowFocus = False
      End With
      
      With .Columns.Add("id_status")
         .Caption = "Κατάσταση κτιρίου"
         .DBField = "id_status"
         .Control.Type = sgCellDropList
         .Control.PopupRows = 5
         Do While Not lurs.EOF
            .ValueItems.Add lurs!id_status, lurs!Status
            .Control.SortOrder = sgNoSorting
            lurs.MoveNext
         Loop
         .ValueItems.Translate = True
         .Width = 2000
      End With
 

   End With
   
          Else
          cmdDelete.Enabled = True
          cmdClose.Enabled = True
          Adodc1.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
          End If

  Exit Sub
'DeleteErr:
 ' MsgBox Err.Description
End Sub

Private Sub cmdClose_Click()
'  On Error GoTo closeErr
SGGrid2.Update
SGGrid1.Update

If Text5.Text <> "" And schoolId <> "" Then
Set rsmaintenance = New ADODB.Recordset
'insert nees times sto l_building_sector_kind
    If userkostas = "admin" Then
        rsmaintenance.Open "delete from l_bulding_sector_kind", dbCon, adOpenStatic, adLockOptimistic
        rsmaintenance.Open "insert into l_bulding_sector_kind (id_building_sector,bulding_sector) select distinct id_sector,sector from tmp_maintenance1" + userkostas, dbCon, adOpenStatic, adLockOptimistic
    End If
'insert nees times sto t_building
  
    Set hopee1 = New ADODB.Recordset
    hopee1.ActiveConnection = dbCon
    hopee1.LockType = adLockOptimistic
    hopee1.CursorLocation = adUseClient
    hopee1.CursorType = adOpenDynamic
    Set hopee2 = New ADODB.Recordset
    hopee2.ActiveConnection = dbCon
    hopee2.LockType = adLockOptimistic
    hopee2.CursorLocation = adUseClient
    hopee2.CursorType = adOpenDynamic
    
    'semaphores
    hopee1.Source = "SELECT * from hope where tablename = 't_building_maintenance'"
    hopee1.Open
    
    
    Dim i As Integer
    i = 0
    

    While (hopee1.RecordCount <> 0)
         
         wait
         
         hopee1.Close
         hopee1.Source = "SELECT * from hope where tablename = 't_building_maintenance'"
         hopee1.Open
         
         
         If i = 8 Then
            hopee1.Close
            hopee1.Source = "DELETE from hope where tablename = 't_building_maintenance'"
            hopee1.Open
            GoTo exitlabel
         End If
         i = i + 1
    Wend
      
        
    hopee1.Close
    
exitlabel:
 
    hopee1.Source = "SELECT * from hope"
    hopee1.Open
    
    hopee1.AddNew
    hopee1.Fields("tablename").Value = "t_building_maintenance"
    hopee1.Update
     
    hopee1.Close

'end of semaphores
   
   rsmaintenance.Open "delete from t_building_maintenance where id_school='" & schoolId & "' and school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
  
  Set rsmaintenance1 = New ADODB.Recordset
    rsmaintenance1.Open "select * from tmp_maintenance1" + userkostas + " order by id_building", dbCon, adOpenStatic, adLockOptimistic

rsmaintenance1.MoveFirst
    Do While Not rsmaintenance1.EOF
        If rsmaintenance1!Check1 = -1 Then
        If rsmaintenance1!maintenance_date <> "" Then
        rsmaintenance1!maintenance_date = rsmaintenance1!maintenance_date
        Else
        rsmaintenance1!maintenance_date = "1/1/1800"
        End If
          rsmaintenance.Open "insert into t_building_maintenance (id_bulding_sector,maintenance_date,id_building,id_school,school_year) values(" & rsmaintenance1!id_sector & ",'" & rsmaintenance1!maintenance_date & "'," & rsmaintenance1!id_building & ",'" & schoolId & "'," & schoolYear & ")", dbCon, adOpenStatic, adLockOptimistic

        End If
        rsmaintenance1.MoveNext
    Loop

 Set rsupdatemaintenance = New ADODB.Recordset
 rsupdatemaintenance.Open "update t_building_maintenance set maintenance_date=Null where maintenance_date=#1/1/1800# and id_school='" & schoolId & "' and school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic

    rsgrid1.Close
    Set SGGrid1.DataSource = Nothing
   hopee1.Source = "DELETE from hope where tablename = 't_building_maintenance'"
    hopee1.Open
   'semaphores
    
    hopee2.Source = "SELECT * from hope where tablename = 't_building_status'"
    hopee2.Open
    
    i = 0
    While (hopee2.RecordCount <> 0)
        wait
        hopee2.Close
        hopee2.Source = "SELECT * from hope where tablename = 't_building_status'"
        hopee2.Open
        If i = 8 Then
            hopee2.Close
            hopee2.Source = "DELETE from hope where tablename = 't_building_status'"
            hopee2.Open
            GoTo exitlabel2
        End If
         i = i + 1
    Wend
    
    hopee2.Close
exitlabel2:
    hopee2.Source = "SELECT * from hope"
    hopee2.Open
    hopee2.AddNew
    hopee2.Fields("tablename") = "t_building_status"
    hopee2.Update
    hopee2.Close
'end of semaphores
  ' rsmaintenance.Open "insert into t_building_maintenance (id_bulding_sector,maintenance_date,id_building,id_school,school_year) select id_sector,maintenance_date," & Text5.Text & "," & Y & "," & I & " from tmp_maintenance1 where check=-1", db, adOpenStatic, adLockOptimistic

Set rsstatus = New ADODB.Recordset

'insert nees times sto t_building_status
   rsstatus.Open "delete from t_building_status where id_school='" & schoolId & "' and school_year=" & schoolYear, dbCon, adOpenStatic, adLockOptimistic
   
   Set rsstatus1 = New ADODB.Recordset
   rsstatus1.Open "select * from tmp_maintenance2" + userkostas + " order by id_building", dbCon, adOpenStatic, adLockOptimistic

   rsstatus1.MoveFirst
    Do While Not rsstatus1.EOF
        If rsstatus1!id_status <> "" Then
 
       rsstatus.Open "insert into t_building_status (id_building_sector,id_status,id_building,id_school,school_year) values(" & rsstatus1!id_sector & "," & rsstatus1!id_status & "," & rsstatus1!id_building & ",'" & schoolId & "'," & schoolYear & ")", dbCon, adOpenStatic, adLockOptimistic
       End If
        rsstatus1.MoveNext
    Loop
    rsgrid2.Close
    Set SGGrid2.DataSource = Nothing
    hopee2.Source = "DELETE from hope where tablename = 't_building_status'"
    hopee2.Open
    
   'rsstatus.Open "insert into t_building_status (id_building_sector,id_status,id_building,id_school,school_year) select id_sector,id_status," & Text5.Text & ",'" & Y & "'," & I & " from tmp_maintenance2 where id_status is not null", db, adOpenStatic, adLockOptimistic
End If
   'rsmaintenance.Open "drop table tmp_maintenance1", db, adOpenStatic, adLockOptimistic
   'rsstatus.Open "drop table tmp_maintenance2", db, adOpenStatic, adLockOptimistic


If schoolId = "" Or Text5 = "" Then
Unload Me
Else
Adodc1.Recordset.Move 0
Unload Me
End If
Exit Sub

'closeErr:
'  MsgBox Err.Description
End Sub


Private Sub Option1_Click()
Text4 = 0
Exit Sub
End Sub

Private Sub Option2_Click()
Text4 = -1
Exit Sub
End Sub

Private Sub Text4_Change()
If Text4 = "" Then
    Option2 = True
ElseIf Text4 = -1 Then
    Option2 = True
    Else
    Option1 = True
End If
Exit Sub
End Sub


Private Sub Text6_Validate(Cancel As Boolean)
If IsNumeric(Text6.Text) = False Then
response = MsgBox("Το εμβαδόν πρέπει να είναι αριθμός.Παρακαλώ συμπληρώστε ξανά. ")
Text6.Text = ""
End If
End Sub


Private Sub Text7_Validate(Cancel As Boolean)
If IsNumeric(Text7.Text) = False Then
response = MsgBox("Ο αριθμός ορόφων πρέπει να είναι αριθμός.Παρακαλώ συμπληρώστε ξανά. ")
Text7.Text = ""
End If
End Sub

Private Sub Text9_Validate(Cancel As Boolean)
If IsNumeric(Text9.Text) = False Then
response = MsgBox("Το έτος πρέπει να είναι αριθμός.Παρακαλώ συμπληρώστε ξανά. ")
Text9.Text = ""
End If
End Sub
Private Sub wait()

Dim curr As Integer
Dim curr2 As Integer

curr = Second(Time)

If curr > 55 Then
curr2 = curr + 4 - 60 + 1
Else
curr2 = curr + 4
End If
While (Second(Time) <> curr2)
Wend

 
End Sub
