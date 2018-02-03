VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{97BD7A06-77E0-11D2-8EAE-008048E27A77}#1.0#0"; "beegdo10.ocx"
Begin VB.Form building 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Κτίρια (Α.11 - Α.19)"
   ClientHeight    =   8028
   ClientLeft      =   600
   ClientTop       =   468
   ClientWidth     =   10212
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.4
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
   ScaleHeight     =   8028
   ScaleWidth      =   10212
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnCancel 
      Caption         =   "Ακύρωση και επιστροφή"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.4
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5160
      TabIndex        =   34
      Top             =   7560
      Width           =   2295
   End
   Begin VB.CommandButton btnSubmit 
      Caption         =   "Καταχώρηση και επιστροφή"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   33
      Top             =   7560
      Width           =   2295
   End
   Begin VB.CommandButton btnDelete 
      Caption         =   "Διαγραφή κτιρίου"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6360
      TabIndex        =   32
      Top             =   7080
      Width           =   1935
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "Εισαγωγή νέου κτιρίου"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   31
      Top             =   7080
      Width           =   2055
   End
   Begin TabDlg.SSTab tabA17A19 
      Height          =   3492
      Left            =   120
      TabIndex        =   26
      Top             =   3480
      Width           =   9972
      _ExtentX        =   17590
      _ExtentY        =   6160
      _Version        =   393216
      Tabs            =   2
      TabHeight       =   882
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.4
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Α.17. Ποιά είναι η κατάσταση του κτιρίου;"
      TabPicture(0)   =   "building.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "dgA17"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "btnA17a"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "Α.19. Πότε προβλέπεται συντήρηση του κτιρίου και σε ποιόν τομέα;"
      TabPicture(1)   =   "building.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "btnA19a"
      Tab(1).Control(1)=   "dgA19"
      Tab(1).ControlCount=   2
      Begin VB.CommandButton btnA17a 
         Caption         =   "Προσθήκη νέου τύπου τομέα κτιρίου"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         TabIndex        =   28
         Top             =   2880
         Width           =   3000
      End
      Begin BeeGridOLEDB10.SGGrid dgA17 
         Height          =   2055
         Left            =   480
         TabIndex        =   27
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
            Size            =   7.8
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
            Size            =   7.8
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
      Begin VB.CommandButton btnA19a 
         Caption         =   "Προσθήκη νέου τύπου τομέα κτιρίου"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -72480
         TabIndex        =   30
         Top             =   2880
         Width           =   3000
      End
      Begin BeeGridOLEDB10.SGGrid dgA19 
         Height          =   2055
         Left            =   -74520
         TabIndex        =   29
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
            Size            =   7.8
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
            Size            =   7.8
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
   Begin VB.Frame frmA18 
      Caption         =   "Α.18. Κατά το προηγούμενο σχολικό έτος έγινε συντήρηση στο κτίριο;"
      Height          =   735
      Left            =   120
      TabIndex        =   22
      Top             =   2640
      Width           =   9972
      Begin MSDataListLib.DataCombo dcA18a 
         Height          =   330
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   2655
         _ExtentX        =   4678
         _ExtentY        =   508
         _Version        =   393216
         Style           =   2
         Text            =   ""
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox txtA18b 
         DataField       =   "MANDATORY_MAINTENANCE"
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   7200
         MaxLength       =   100
         TabIndex        =   25
         Top             =   240
         Width           =   2655
      End
      Begin VB.Label lblA18b 
         Caption         =   "Αναφέρατε το είδος της συντήρησης που ήταν αναγκαία:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   3120
         TabIndex        =   24
         Top             =   240
         Width           =   3972
      End
   End
   Begin VB.Frame frmA16 
      Caption         =   "Α.16. Η απάντηση στην προηγούμενη ερώτηση δόθηκε:"
      Height          =   615
      Left            =   5160
      TabIndex        =   19
      Top             =   1920
      Width           =   4935
      Begin VB.OptionButton rbA16b 
         Caption         =   "2. Με ακριβή μέτρηση"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Left            =   2160
         TabIndex        =   21
         Top             =   240
         Width           =   2292
      End
      Begin VB.OptionButton rbA16a 
         Caption         =   "1. Κατ' εκτίμηση"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   1812
      End
   End
   Begin VB.Frame frmA15 
      Caption         =   "Α.15. Πόση είναι η συνολική επιφάνεια του κτιρίου σε τ.μ.;"
      Height          =   615
      Left            =   120
      TabIndex        =   16
      Top             =   1920
      Width           =   4932
      Begin VB.TextBox txtA15 
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
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   840
         TabIndex        =   17
         Top             =   210
         Width           =   615
      End
      Begin VB.Label lblA15 
         Caption         =   "τ.μ."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1560
         TabIndex        =   18
         Top             =   240
         Width           =   255
      End
   End
   Begin VB.Frame frmA14 
      Caption         =   "Α.14. Πόσους ορόφους έχει το κτίριο (μαζί με το ισόγειο);"
      Height          =   615
      Left            =   5160
      TabIndex        =   12
      Top             =   1200
      Width           =   4935
      Begin VB.CheckBox cbA14b 
         Alignment       =   1  'Right Justify
         Caption         =   "2. Υπάρχει υπόγειο;"
         DataField       =   "BASEMENT"
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2520
         TabIndex        =   15
         Top             =   240
         Width           =   1812
      End
      Begin VB.TextBox txtA14a 
         DataField       =   "NUMBER_OF_FLOORS"
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   14
         Top             =   240
         Width           =   372
      End
      Begin VB.Label lblA14a 
         Caption         =   "1. Αριθμός ορόφων:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Frame frmA13 
      Caption         =   "Α.13. Ποιος ήταν ο αρχικός προορισμός του κτιρίου;"
      Height          =   615
      Left            =   120
      TabIndex        =   9
      Top             =   1200
      Width           =   4932
      Begin MSDataListLib.DataCombo dcA13 
         Height          =   330
         Left            =   240
         TabIndex        =   10
         Top             =   240
         Width           =   2775
         _ExtentX        =   4890
         _ExtentY        =   508
         _Version        =   393216
         Text            =   ""
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.CommandButton btnA13 
         Caption         =   "..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   7.8
            Charset         =   161
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3120
         TabIndex        =   11
         ToolTipText     =   "Προσθήκη νέου αρχικού προορισμού κτιρίου"
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame frmA12 
      Caption         =   "Α.12. Πότε κτίστηκε το κτίριο;"
      Height          =   975
      Left            =   5160
      TabIndex        =   5
      Top             =   120
      Width           =   4935
      Begin MSDataListLib.DataCombo dcA12a 
         Height          =   330
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   3015
         _ExtentX        =   5313
         _ExtentY        =   508
         _Version        =   393216
         Style           =   2
         Text            =   ""
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox txtA12b 
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
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2160
         TabIndex        =   8
         Top             =   600
         Width           =   975
      End
      Begin VB.Label lblA12b 
         Caption         =   "Ποιο έτος; (προαιρετικά)"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   1935
      End
   End
   Begin VB.Frame frmA11 
      Caption         =   "Α.11 το κτίριο είναι:"
      Height          =   975
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4932
      Begin MSDataListLib.DataCombo dcA11a 
         Height          =   330
         Left            =   240
         TabIndex        =   1
         Top             =   240
         Width           =   2775
         _ExtentX        =   4890
         _ExtentY        =   508
         _Version        =   393216
         Style           =   2
         Text            =   ""
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.CommandButton btnA11a 
         Caption         =   "..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   7.8
            Charset         =   161
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3120
         TabIndex        =   2
         ToolTipText     =   "Προσθήκη νέου τύπου θέρμανσης"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox txtA11b 
         DataField       =   "ALLOTMENT_BY"
         DataSource      =   "recordNavigator"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3000
         MaxLength       =   80
         TabIndex        =   4
         Top             =   600
         Width           =   1692
      End
      Begin VB.Label lblA11b 
         Caption         =   "Αν είναι παραχώρηση, από ποιόν;"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.4
            Charset         =   161
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Left            =   240
         TabIndex        =   3
         Top             =   600
         Width           =   2652
      End
   End
   Begin MSAdodcLib.Adodc recordNavigator 
      Height          =   336
      Left            =   120
      Top             =   7080
      Width           =   3732
      _ExtentX        =   6583
      _ExtentY        =   572
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
      Caption         =   ""
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   161
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
End
Attribute VB_Name = "building"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-- Version: 25Oct2002
'-- Last editor: George Birbilis (birbilis@kagi.com)

Option Explicit

Dim rsbuilding As ADODB.Recordset

Dim max_idsectorkind As Integer


Private Sub Form_Load()
 Me.Caption = makeTitle(Me.Caption, schoolId, schoolYear)
 
 If Not isUserAdmin(currentUser) Then
  btnA19a.Enabled = False
  btnA17a.Enabled = False
  btnA11a.Enabled = False
  btnA13.Enabled = False
 Else
  btnA19a.Enabled = True
  btnA17a.Enabled = True
  btnA11a.Enabled = True
  btnA13.Enabled = True
 End If
 
 Set rsbuilding = getBuildingData(adoConnection, schoolId, schoolYear)
 With rsbuilding

  If .RecordCount <> 0 Then
   btnAdd.Visible = True
  Else
   .AddNew
   .Fields!ID_BUILDING.value = 1
   .Fields!id_school.value = schoolId
   .Fields!school_year.value = schoolYear
  End If

  .MoveFirst
  
  If .RecordCount = 0 Then
   btnDelete.Enabled = False
  Else
   btnDelete.Enabled = True
  End If
  
 End With
 
 max_idsectorkind = getMaxNumber(adoConnection, "ID_BUILDING_SECTOR", "L_BULDING_SECTOR_KIND")
 
 '---------------------------
 
 With dcA11a
  Set .RowSource = getA11lookup(adoConnection)
  .ListField = "lc"
  .BoundColumn = "lid"
  .DataField = "ID_PROPERTY_TYPE"
  .Enabled = True
  Set .DataSource = rsbuilding
 End With
  
 '---------------------------
 
 With dcA12a
  Set .RowSource = getA12lookup(adoConnection)
  .ListField = "lc"
  .BoundColumn = "lid"
  .DataField = "ID_DECADE_OF_BULIDING"
  .Enabled = True
  Set .DataSource = rsbuilding
 End With
 
 '---------------------------
 
 With dcA18a
  Set .RowSource = getA18lookup(adoConnection)
  .ListField = "lc"
  .BoundColumn = "lid"
  .DataField = "ID_MAINTENANCE"
  .Enabled = True
  Set .DataSource = rsbuilding
 End With
     
 '---------------------------
     
 With dcA13
  Set .RowSource = getA13lookup(adoConnection)
  .ListField = "lc"
  .BoundColumn = "lid"
  .DataField = "ID_INITIAL_USE_OF_BULDING"
  .Enabled = True
  Set .DataSource = rsbuilding
 End With
  
 '-------------------------------------
  
 'dokimi    '???
 
 buildTmpMaintenanceTables adoConnection, rsbuilding, currentUser, schoolId, schoolYear
 
 'Birb: commented the following, cause they will be done at the "recordNavigator_MoveComplete" anyway
 'rebindDgA17 getTmpMaintenance2DataForBuilding(adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value)  'Birb: not using form-scope "rsgrid2" variable anymore
 'rebindDgA19 getTmpMaintenance1DataForBuilding(adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value)  'Birb: not using form-scope "rsgrid1" variable anymore
 
 Set recordNavigator.Recordset = rsbuilding  'Birb: doing last cause else at every navigation in the "rsbuilding" recordset, the "recordNavigator_MoveComplete" subroutine gets called (which is also causing side-effects)
 rsbuilding.MoveFirst  'this will also cause an update to the navigator's caption (this is done at the "recordNavigator_MoveComplete" subroutine)
 
End Sub

Private Sub Form_Unload(Cancel As Integer)  'Birb: added
 safeCloseDataSourceRecordset dgA17  'Birb: not using form-scope "rsgrid2" variable anymore
 safeCloseDataSourceRecordset dgA19  'Birb: not using form-scope "rsgrid1" variable anymore
 
 'rsbuilding.Close  '??? can't close this if we've pressed submit (?)
 
 'drop temporary tables
 dropTable adoConnection, "tmp_maintenance1" & currentUser
 dropTable adoConnection, "tmp_maintenance2" & currentUser
End Sub

Private Sub btnSubmit_Click()
 dgA17.Update
 dgA19.Update
 
 If (rsbuilding.Fields!ID_BUILDING.value <> "") Then  'Birb: removed schoolId<>"" check, it's always true
  submitBuildingSectorKindLookup adoConnection, currentUser
  submitBuildingMaintenanceData adoConnection, getOrderedTmpMaintenance1Data(adoConnection, currentUser), currentUser, schoolId, schoolYear  '??? why ordered?
  submitBuildingStatusData adoConnection, getOrderedTmpMaintenance2Data(adoConnection, currentUser), currentUser, schoolId, schoolYear  '??? why ordered?
 End If

 If rsbuilding.Fields!ID_BUILDING.value <> "" Then  'Birb: removed check for schoolId="", it is always false
  rsbuilding.Move 0
 End If
 
 Unload Me
End Sub

Private Sub btnCancel_Click()
 Unload Me
End Sub

Private Sub recordNavigator_MoveComplete( _
 ByVal adReason As ADODB.EventReasonEnum, _
 ByVal pError As ADODB.Error, _
 adStatus As ADODB.EventStatusEnum, _
 ByVal pRecordset As ADODB.Recordset)
 
 With rsbuilding
  
  If .RecordCount = 0 Then
   recordNavigator.Caption = "0 από 0"
   btnDelete.Enabled = False
  Else
   btnDelete.Enabled = True
   recordNavigator.Caption = CStr(.AbsolutePosition) & " από " & CStr(.RecordCount)
  End If
 
  If (Not .EOF) And (Not .BOF) Then
   
   'If (add_status = 0) Then  'Birb: removed
    .Fields!ID_BUILDING.value = .Fields!ID_BUILDING.value  '???
   
   'Birb: not using hidden databound control "Text4" anymore
   If .Fields!EXACT_MEASURE.value = "" Then
    rbA16b.value = True
   ElseIf .Fields!EXACT_MEASURE.value Then
    rbA16b.value = True
   Else
    rbA16a.value = True
   End If
   
  End If
  
 End With

 'start-kostas
 dgA19.Update
 dgA17.Update
 'end-kostas
 
 '-----------------------------------------------
 
 Dim buildingId As Integer
 With rsbuilding
  If .BOF Or .EOF Then
   buildingId = 1
  Else
   If (.Fields!ID_BUILDING.value <> "") Then  'using <>"" instead of =""
    buildingId = .Fields!ID_BUILDING.value
   Else
    .Fields!ID_BUILDING.value = 1
    buildingId = 1
   End If
  End If
 End With
  
 rebindDgA19 getTmpMaintenance1DataForBuilding(adoConnection, currentUser, buildingId)  'Birb: not using form-scope "rsgrid1" variable anymore
 rebindDgA17 getTmpMaintenance2DataForBuilding(adoConnection, currentUser, buildingId)  'Birb: not using form-scope "rsgrid2" variable anymore
End Sub

Private Sub btnA19a_Click()
 addNewSectorType
End Sub

Private Sub btnA17a_Click()
 addNewSectorType
End Sub

Private Sub btnA11a_Click()
 Dim lookupstr As String
 lookupstr = InputNewOwnershipState
 
 If lookupstr <> "" Then
  With CRecordset(dcA11a.RowSource)
   .AddNew
   .Fields!lc.value = Left$(lookupstr, 30)
   .Fields!lid.value = getMaxIdProperty(adoConnection) + 1
   .Update
  End With
 End If
End Sub

Private Sub btnA13_Click()
 Dim lookupstr As String
 lookupstr = InputNewBuildingInitialPurpose
 
 If lookupstr <> "" Then
  With CRecordset(dcA13.RowSource)
   .AddNew
   .Fields!lc.value = Left$(lookupstr, 30)
   .Fields!lid.value = getMaxIdInitialUse(adoConnection) + 1
   .Update
  End With
 End If
End Sub

Private Sub dcA11a_Click(area As Integer)
 If rsbuilding.RecordCount = 0 Then
  MsgBuildingElementsRequireNewBuilding
  dcA11a.Text = ""
 End If
End Sub

Private Sub btnAdd_Click()
 lockTable adoConnection, TABLE_BUILDING

 btnAdd.Visible = False
 btnDelete.Visible = False
 btnCancel.Visible = False
 btnSubmit.Visible = False

 With rsbuilding
  .AddNew
  .Fields!school_year.value = schoolYear
  .Fields!id_school.value = schoolId
 End With
 
 cbA14b.value = vbUnchecked
 rbA16a.value = False
 rbA16b.value = False

 rsbuilding.Fields!ID_BUILDING.value = getMaxIdBuilding(adoConnection, schoolId, schoolYear)

 insertBuildingIntoTmpMaintenance1Table adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value
 rebindDgA19 getTmpMaintenance1DataForBuilding(adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value)  'Birb: not using form-scope "rsgrid1" variable anymore
 
 insertBuildingIntoTmpMaintenance2Table adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value
 rebindDgA17 getTmpMaintenance2DataForBuilding(adoConnection, currentUser, rsbuilding.Fields!ID_BUILDING.value)  'Birb: not using form-scope "rsgrid2" variable anymore
    
 unlockTable adoConnection, TABLE_BUILDING
 
 'Birb: the following code was in "btnSubmitBuilding_Click", the "btnSubmitBuilding" button has been removed
 btnDelete.Enabled = True
 btnSubmit.Enabled = True

 '??? are the following needed at all?
 lockTable adoConnection, TABLE_APOTHIKEUSI
 rsbuilding.Update
 dgA19.Update
 dgA17.Update
 unlockTable adoConnection, TABLE_APOTHIKEUSI
End Sub

Private Sub btnDelete_Click()
 deleteBuilding adoConnection, rsbuilding.Fields!ID_BUILDING.value, currentUser, schoolId, schoolYear

 Set rsbuilding = getBuildingData(adoConnection, schoolId, schoolYear)
 Set recordNavigator.Recordset = rsbuilding
 
 If rsbuilding.RecordCount = 0 Then
  recordNavigator.Caption = "0 από 0"
  btnDelete.Enabled = False
  btnSubmit.Enabled = False
  cbA14b.value = vbUnchecked
  
  emptyTmpMaintenance1Table adoConnection, currentUser
  emptyTmpMaintenance2Table adoConnection, currentUser

  rebindDgA19 getTmpMaintenance1Data(adoConnection, currentUser)  'Birb: not using form-scope "rsgrid1" variable anymore
  rebindDgA17 getTmpMaintenance2Data(adoConnection, currentUser)   'Birb: not using form-scope "rsgrid2" variable anymore
   
 Else
  btnDelete.Enabled = True
  btnSubmit.Enabled = True
  recordNavigator.Caption = CStr(rsbuilding.AbsolutePosition) & " από " & CStr(rsbuilding.RecordCount)
 End If

End Sub

Private Sub rbA16a_Click()
 rsbuilding.Fields!EXACT_MEASURE.value = False  'Birb: not using hidden databound control "Text4" anymore
End Sub

Private Sub rbA16b_Click()
 rsbuilding.Fields!EXACT_MEASURE.value = True  'Birb: not using hidden databound control "Text4" anymore
End Sub

Private Sub txtA15_Validate(Cancel As Boolean)
 If Not IsNumeric(txtA15.Text) Then
  MsgAreaMustBeNumeric
  txtA15.Text = ""
 End If
End Sub

Private Sub txtA14a_Validate(Cancel As Boolean)
 If Not IsNumeric(txtA14a.Text) Then
  MsgFloorsCountMustBeNumeric
  txtA14a.Text = ""
 End If
End Sub

Private Sub txtA12b_Validate(Cancel As Boolean)
 If Not isValidYear(txtA12b.Text) Then
  MsgInvalidYear
  txtA12b.Text = ""
 End If
End Sub

'-- Utils --

Private Sub addNewSectorType()
 Dim lookupstr As String
 lookupstr = Left$(InputNewSectorType, 40)

 If lookupstr = "" Then Exit Sub
  
 max_idsectorkind = max_idsectorkind + 1
 
 With CRecordset(dgA19.DataSource)  'Birb: not using form-scope "rsgrid1" variable anymore
  .AddNew
  .Fields!sector.value = lookupstr
  .Fields!id_sector.value = max_idsectorkind
  .Fields!ID_BUILDING.value = rsbuilding.Fields!ID_BUILDING.value
  .Fields!cbA14b.value = 0
  .Update
 End With
 
 With CRecordset(dgA17.DataSource)  'Birb: not using form-scope "rsgrid2" variable anymore
  .AddNew
  .Fields!sector.value = lookupstr
  .Fields!id_sector.value = max_idsectorkind
  .Fields!ID_BUILDING.value = rsbuilding.Fields!ID_BUILDING.value
  .Fields!cbA14b.value = 0
  .Update
 End With

 Dim rsotherbuildings As ADODB.Recordset
 Set rsotherbuildings = getOtherBuildings(adoConnection, rsbuilding.Fields!ID_BUILDING.value)
 
 With rsotherbuildings
  If .RecordCount <> 0 Then
   .MoveFirst

   Do While Not .EOF

    insertIntoTmpMaintenance1Table _
     adoConnection, _
     currentUser, _
     .Fields!ID_BUILDING.value, _
     max_idsectorkind, _
     lookupstr

    insertIntoTmpMaintenance2Table _
     adoConnection, _
     currentUser, _
     .Fields!ID_BUILDING.value, _
     max_idsectorkind, _
     lookupstr

    .MoveNext
   Loop

  End If
 End With
End Sub

Private Sub rebindDgA17(ByRef data As ADODB.Recordset)
 With dgA17
  .AutoFields = False
  .DataMode = sgBound
  .GroupByBoxVisible = False
  Set .DataSource = data
  .Columns.RemoveAll True
  .DataRowCount = 0
  .HeadingColCount = 1
  '.AllowDelete = True
  '.AllowAddNew = True
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
   .Control.type = sgCellDropList
   .Control.PopupRows = 5
   
   Dim lurs As ADODB.Recordset
   Set lurs = getBuildingStatusLookup(adoConnection)
   Do While Not lurs.EOF
    .ValueItems.Add lurs.Fields!id_status.value, lurs.Fields!Status.value
    .Control.SortOrder = sgNoSorting
    lurs.MoveNext
   Loop
   lurs.Close  'Birb: added code to close the recordset when finished using it
   
   .ValueItems.Translate = True
   .Width = 2000
  End With
 
 End With
End Sub

Private Sub rebindDgA19(ByRef data As ADODB.Recordset)
 With dgA19
  .AutoFields = False
  .DataMode = sgBound
  .GroupByBoxVisible = False
  Set .DataSource = data
  .Columns.RemoveAll True
  .DataRowCount = 0
  .HeadingColCount = 1
  '.AllowDelete = True
  '.AllowAddNew = True
  .AllowEdit = True
    
  With .Columns.Add("sector")
   .DBField = "sector"
   .Caption = "Τομέας"
   .Width = 4700
   .AllowFocus = False
  End With

  With .Columns.Add("cbA14b")
   .Caption = "ΝΑΙ/ΟΧΙ"
   .Control.type = sgCellCheckBox
   .DBField = "cbA14b"
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
End Sub
