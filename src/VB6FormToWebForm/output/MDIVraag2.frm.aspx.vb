Public Class WebMDIVraag
  Inherits MyBaseWebForm

  Protected WithEvents lblFormTitle As System.Web.UI.WebControls.Label
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  Protected WithEvents Picture2 As System.Web.UI.WebControls.Image
  Protected WithEvents PicVraagEdit As System.Web.UI.WebControls.Image
  Protected WithEvents Frame10 As System.Web.UI.WebControls.Panel
  
  Protected WithEvents SScmdGotoVraag As System.Web.UI.WebControls.Button
  Protected WithEvents SScmdGotoVraag As System.Web.UI.WebControls.Button
  Protected WithEvents SSOK As System.Web.UI.WebControls.Button
  Protected WithEvents SSCancel As System.Web.UI.WebControls.Button
  Protected WithEvents Frame9 As System.Web.UI.WebControls.Panel
  
  Protected WithEvents SSNew As System.Web.UI.WebControls.Button
  Protected WithEvents CText As System.Web.UI.WebControls.Button
  Protected WithEvents CPic1 As System.Web.UI.WebControls.Button
  Protected WithEvents CPic2 As System.Web.UI.WebControls.Button
  Protected WithEvents CSound As System.Web.UI.WebControls.Button
  Protected WithEvents CMovie As System.Web.UI.WebControls.Button
  Protected WithEvents Frame11 As System.Web.UI.WebControls.Panel
  
  Protected WithEvents cmdCasus As System.Web.UI.WebControls.Button
  Protected WithEvents lblCasusvraag As System.Web.UI.WebControls.Label
  Protected WithEvents Frame4 As System.Web.UI.WebControls.Panel
  Protected WithEvents SSExit As System.Web.UI.WebControls.Button
  Protected WithEvents PictureVraagTemplate As System.Web.UI.WebControls.Image
  
  Protected WithEvents OptionVraagTemplate As System.Web.UI.WebControls.RadioButton
  Protected WithEvents OptionVraagTemplate As System.Web.UI.WebControls.RadioButton
  Protected WithEvents OptionVraagTemplate As System.Web.UI.WebControls.RadioButton
  
  Protected WithEvents chkVoice As System.Web.UI.WebControls.CheckBox
  Protected WithEvents OptionVraagTemplate As System.Web.UI.WebControls.RadioButton
  Protected WithEvents OptionVraagTemplate As System.Web.UI.WebControls.RadioButton
  Protected WithEvents chkMinScore As System.Web.UI.WebControls.CheckBox
  Protected WithEvents picGenereer As System.Web.UI.WebControls.Image
  
  
  Protected WithEvents SSGenereerTentamen As System.Web.UI.WebControls.Button
  Protected WithEvents SSDelete As System.Web.UI.WebControls.Button
  Protected WithEvents SSAdd As System.Web.UI.WebControls.Button
  Protected WithEvents SSEdit As System.Web.UI.WebControls.Button
  Protected WithEvents SSCopy As System.Web.UI.WebControls.Button
  Protected WithEvents cmdCasusOverzicht As System.Web.UI.WebControls.Button
  Protected WithEvents Frame2 As System.Web.UI.WebControls.Panel
  Protected WithEvents Frame1 As System.Web.UI.WebControls.Panel
  Protected WithEvents cmbStem As System.Web.UI.WebControls.DropDownList
  Protected WithEvents lblTaal As System.Web.UI.WebControls.Label
  Protected WithEvents lblSpraak1 As System.Web.UI.WebControls.Label
  Protected WithEvents Label4 As System.Web.UI.WebControls.Label
  Protected WithEvents chkHide As System.Web.UI.WebControls.CheckBox
  Protected WithEvents chkSpraak As System.Web.UI.WebControls.CheckBox
  Protected WithEvents Frame7 As System.Web.UI.WebControls.Panel
  Protected WithEvents TextPGem As System.Web.UI.WebControls.TextBox
  Protected WithEvents TextRitGem As System.Web.UI.WebControls.TextBox
  Protected WithEvents TextPLaatst As System.Web.UI.WebControls.TextBox
  Protected WithEvents TextRitLaatst As System.Web.UI.WebControls.TextBox
  Protected WithEvents txtAantal As System.Web.UI.WebControls.TextBox
  Protected WithEvents TextStatus As System.Web.UI.WebControls.TextBox
  
  Protected WithEvents LabelScore As System.Web.UI.WebControls.Label
  Protected WithEvents LabelPwaardeLaatst As System.Web.UI.WebControls.Label
  Protected WithEvents LabelRitwaardeLaatst As System.Web.UI.WebControls.Label
  Protected WithEvents lblScore As System.Web.UI.WebControls.Label
  Protected WithEvents lblLGesteld As System.Web.UI.WebControls.Label
  Protected WithEvents Label18 As System.Web.UI.WebControls.Label
  Protected WithEvents Label3 As System.Web.UI.WebControls.Label
  Protected WithEvents lblAantalLaatst As System.Web.UI.WebControls.Label
  Protected WithEvents LabelStatus As System.Web.UI.WebControls.Label
  Protected WithEvents Label7 As System.Web.UI.WebControls.Label
  Protected WithEvents Label8 As System.Web.UI.WebControls.Label
  Protected WithEvents Label21 As System.Web.UI.WebControls.Label
  Protected WithEvents Label9 As System.Web.UI.WebControls.Label
  Protected WithEvents Label6 As System.Web.UI.WebControls.Label
  Protected WithEvents Label12 As System.Web.UI.WebControls.Label
  Protected WithEvents Frame99 As System.Web.UI.WebControls.Panel
  Protected WithEvents cmbOnderwerpVraag As System.Web.UI.WebControls.DropDownList
  Protected WithEvents TextAuteur As System.Web.UI.WebControls.TextBox
  Protected WithEvents cmbEigenaar As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbKennisTest As System.Web.UI.WebControls.DropDownList
  Protected WithEvents SScmdBlokkade As System.Web.UI.WebControls.Button
  Protected WithEvents sscmdAuthorisatie As System.Web.UI.WebControls.Button
  Protected WithEvents chkKernvraag As System.Web.UI.WebControls.CheckBox
  Protected WithEvents chkVrijgegeven As System.Web.UI.WebControls.CheckBox
  Protected WithEvents lblBlok As System.Web.UI.WebControls.Label
  Protected WithEvents lblAuth As System.Web.UI.WebControls.Label
  Protected WithEvents LabelVrijgegeven As System.Web.UI.WebControls.Label
  Protected WithEvents LabelKernvraag As System.Web.UI.WebControls.Label
  Protected WithEvents Label10 As System.Web.UI.WebControls.Label
  Protected WithEvents Label15 As System.Web.UI.WebControls.Label
  Protected WithEvents Label16 As System.Web.UI.WebControls.Label
  Protected WithEvents Label17 As System.Web.UI.WebControls.Label
  Protected WithEvents Label19 As System.Web.UI.WebControls.Label
  Protected WithEvents Label11 As System.Web.UI.WebControls.Label
  Protected WithEvents picLijstCriteria As System.Web.UI.WebControls.Image
  Protected WithEvents Frame5 As System.Web.UI.WebControls.Panel
Protected WithEvents lblFrame5 As System.Web.UI.WebControls.Label
  Protected WithEvents CTentamenDelete As System.Web.UI.WebControls.Button
  Protected WithEvents ListTentamen As System.Web.UI.WebControls.DataList
  Protected WithEvents CTentamenSave As System.Web.UI.WebControls.Button
  Protected WithEvents Label5 As System.Web.UI.WebControls.Label
  Protected WithEvents Frame6 As System.Web.UI.WebControls.Panel
  Protected WithEvents TextReferentie As System.Web.UI.WebControls.TextBox
  Protected WithEvents TextOpmerking As System.Web.UI.WebControls.TextBox
  Protected WithEvents ListInsluiting As System.Web.UI.WebControls.DataList
  Protected WithEvents ListUitsluiting As System.Web.UI.WebControls.DataList
  Protected WithEvents lblInvoerdatum As System.Web.UI.WebControls.Label
  Protected WithEvents lblVraagNummer As System.Web.UI.WebControls.Label
  Protected WithEvents LabelReferentie As System.Web.UI.WebControls.Label
  Protected WithEvents LabelOpmerking As System.Web.UI.WebControls.Label
  Protected WithEvents Label14 As System.Web.UI.WebControls.Label
  Protected WithEvents Label13 As System.Web.UI.WebControls.Label
  Protected WithEvents Frame3 As System.Web.UI.WebControls.Panel
Protected WithEvents lblFrame3 As System.Web.UI.WebControls.Label
  Protected WithEvents cmbOndInVerz As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbVerzameling As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbOnderwerp As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbBlok As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbStudie As System.Web.UI.WebControls.DropDownList
  Protected WithEvents RadioVerzOnd As System.Web.UI.WebControls.RadioButton
  Protected WithEvents RadioVerzameling As System.Web.UI.WebControls.RadioButton
  Protected WithEvents RadioOnderwerp As System.Web.UI.WebControls.RadioButton
  Protected WithEvents RadioBlok As System.Web.UI.WebControls.RadioButton
  Protected WithEvents Label20 As System.Web.UI.WebControls.Label
  Protected WithEvents Label20 As System.Web.UI.WebControls.Label
  Protected WithEvents Label20 As System.Web.UI.WebControls.Label
  Protected WithEvents Label20 As System.Web.UI.WebControls.Label
  Protected WithEvents Frame12 As System.Web.UI.WebControls.Panel
  
  Protected WithEvents CheckExtraCriteria As System.Web.UI.WebControls.CheckBox
  Protected WithEvents SSSelectCriteria As System.Web.UI.WebControls.Button
  Protected WithEvents Picture1 As System.Web.UI.WebControls.Image
  Protected WithEvents Picture3 As System.Web.UI.WebControls.Image
  Protected WithEvents PictureList As System.Web.UI.WebControls.Image
  Protected WithEvents SSSwitch As System.Web.UI.WebControls.Button
  Protected WithEvents cmdDown As System.Web.UI.WebControls.Button
  Protected WithEvents cmdUp As System.Web.UI.WebControls.Button
  Protected WithEvents cmdToko As System.Web.UI.WebControls.Button
  Protected WithEvents cmbFSNieuw As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmbFSOud As System.Web.UI.WebControls.DropDownList
  Protected WithEvents cmdKlaar As System.Web.UI.WebControls.Button
  Protected WithEvents ListVraag As System.Web.UI.WebControls.DataList
  Protected WithEvents cmbTentamens As System.Web.UI.WebControls.DropDownList
  
  Protected WithEvents LabelAV As System.Web.UI.WebControls.Label
  Protected WithEvents LabelTitle As System.Web.UI.WebControls.Label
  Protected WithEvents lblMoveVraag As System.Web.UI.WebControls.Label
  Protected WithEvents lblFO As System.Web.UI.WebControls.Label
  Protected WithEvents lblFN As System.Web.UI.WebControls.Label
  Protected WithEvents LabelOnderwerp As System.Web.UI.WebControls.Label
  

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
   <System.Diagnostics.DebuggerStepThrough()> _
   Private Sub InitializeComponent()

   End Sub

   Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
    'CODEGEN: This method call is required by the Web Form Designer
    'Do not modify it using the code editor.
    InitializeComponent()
   End Sub

 #End Region

   Private Sub Page_FirstLoad()
    'Put user code here to initialize the page only at its first loading (not at every HTTP postback)
   End Sub

   Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    'Put user code here to (re)initialize the page at every HTTP postback
    If Not isPostBack
     Page_FirstLoad()
    End If
   End Sub  
  
   Private Sub SScmdGotoVraag_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SScmdGotoVraag.Click
    '!!! add code here
   End Sub
 
   Private Sub SScmdGotoVraag_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SScmdGotoVraag.Click
    '!!! add code here
   End Sub
 
   Private Sub SSOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSOK.Click
    '!!! add code here
   End Sub
 
   Private Sub SSCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSCancel.Click
    '!!! add code here
   End Sub
 
   Private Sub SSNew_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSNew.Click
    '!!! add code here
   End Sub
 
   Private Sub CText_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CText.Click
    '!!! add code here
   End Sub
 
   Private Sub CPic1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CPic1.Click
    '!!! add code here
   End Sub
 
   Private Sub CPic2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CPic2.Click
    '!!! add code here
   End Sub
 
   Private Sub CSound_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CSound.Click
    '!!! add code here
   End Sub
 
   Private Sub CMovie_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CMovie.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdCasus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCasus.Click
    '!!! add code here
   End Sub
 
   Private Sub SSExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSExit.Click
    '!!! add code here
   End Sub
 
   Private Sub SSGenereerTentamen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSGenereerTentamen.Click
    '!!! add code here
   End Sub
 
   Private Sub SSDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSDelete.Click
    '!!! add code here
   End Sub
 
   Private Sub SSAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSAdd.Click
    '!!! add code here
   End Sub
 
   Private Sub SSEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSEdit.Click
    '!!! add code here
   End Sub
 
   Private Sub SSCopy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSCopy.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdCasusOverzicht_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCasusOverzicht.Click
    '!!! add code here
   End Sub
 
   Private Sub SScmdBlokkade_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SScmdBlokkade.Click
    '!!! add code here
   End Sub
 
   Private Sub sscmdAuthorisatie_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles sscmdAuthorisatie.Click
    '!!! add code here
   End Sub
 
   Private Sub CTentamenDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CTentamenDelete.Click
    '!!! add code here
   End Sub
 
   Private Sub CTentamenSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CTentamenSave.Click
    '!!! add code here
   End Sub
 
   Private Sub SSSelectCriteria_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSSelectCriteria.Click
    '!!! add code here
   End Sub
 
   Private Sub SSSwitch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SSSwitch.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdDown_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDown.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdUp.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdToko_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdToko.Click
    '!!! add code here
   End Sub
 
   Private Sub cmdKlaar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdKlaar.Click
    '!!! add code here
   End Sub
 
End Class
