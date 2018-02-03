<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MDIVraag2.frm.aspx.vb" Inherits="MyNamespace.WebMDIVraag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <html xmlns:asp="http://ASPnet">
  <head>
    <META http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="GENERATOR" content="VBFormDesignFilter + VBFormDesignToXML + WebForm.xsl">
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
    <title id="PageTitle" runat="server">Egel Docent 5.0</title>
  </head>
  <body>
    <form method="post" runat="server" id="MDIVraag">
      <asp:Label Font-Bold="True" Font-Size="Larger" runat="server" id="lblFormTitle">Egel Docent 5.0</asp:Label><br><br><hr>
      <hr>
      <hr>
      <asp:Panel runat="server" id="Frame10">&nbsp;<asp:Button runat="server" id="SScmdGotoVraag" Text="" /><br><br><asp:Button runat="server" id="SScmdGotoVraag" Text="" />&nbsp;<asp:Button id="SSOK" Font-Bold="True" runat="server" Text="Opslaan" />&nbsp;<asp:Button runat="server" id="SSCancel" Text="Annuleer" /><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame9">&nbsp;<asp:Button runat="server" id="SSNew" Text="Nieuw alternatief" /><br><br><asp:Button runat="server" id="CText" Text="" />&nbsp;<asp:Button runat="server" id="CPic1" Text="" />&nbsp;<asp:Button runat="server" id="CPic2" Text="" />&nbsp;<asp:Button runat="server" id="CSound" Text="" />&nbsp;<asp:Button runat="server" id="CMovie" Text="" /><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame11">&nbsp;<asp:Button id="cmdCasus" Font-Bold="True" runat="server" Text="Stel casus samen" /><br><asp:Label runat="server" id="lblCasusvraag">CasusVraag</asp:Label><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame4">
        <asp:Button id="SSExit" Font-Bold="True" runat="server" Text="" />
        <hr>&nbsp;<asp:RadioButton runat="server" id="OptionVraagTemplate" Text="Long-Menuvraag" GroupName="PictureVraagTemplate" />&nbsp;<asp:RadioButton runat="server" id="OptionVraagTemplate" Text="Open vraag" GroupName="PictureVraagTemplate" />&nbsp;<asp:RadioButton runat="server" id="OptionVraagTemplate" Text="Aantal alternatieven: 4" GroupName="PictureVraagTemplate" /><br><asp:CheckBox runat="server" id="chkVoice" Text="Spraakin-/uitvoer" /><br><asp:RadioButton runat="server" id="OptionVraagTemplate" Text="Instructie" GroupName="PictureVraagTemplate" /><br><asp:RadioButton runat="server" id="OptionVraagTemplate" Text="Meerdere alternatieven goed" GroupName="PictureVraagTemplate" />&nbsp;<asp:CheckBox runat="server" id="chkMinScore" Text="Min. Score &gt;= 0" />
        <hr>&nbsp;<asp:Button id="SSGenereerTentamen" Font-Bold="True" runat="server" Text="Genereer Tentamen" /><br><br><asp:Button runat="server" id="SSDelete" Text="Verwijder vraag" />&nbsp;<asp:Button runat="server" id="SSAdd" Text="Nieuwe vraag" />&nbsp;<asp:Button runat="server" id="SSEdit" Text="Bewerk vraag" /><br><br><asp:Button runat="server" id="SSCopy" Text="Kopieer vraag" />&nbsp;<asp:Button id="cmdCasusOverzicht" Font-Bold="True" runat="server" Text="Casus overzicht" /><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame2" Visible="false">
        <hr>
        <asp:Panel runat="server" id="Frame1">
          <asp:DropDownList runat="server" id="cmbStem" />&nbsp;<asp:Label runat="server" id="lblTaal">Stem</asp:Label>&nbsp;<asp:Label runat="server" id="lblSpraak1">Text-to-Speech</asp:Label>&nbsp;<asp:Label runat="server" id="Label4">Tekst niet tonen</asp:Label>&nbsp;<asp:CheckBox runat="server" id="chkHide" Text="" />&nbsp;<asp:CheckBox runat="server" id="chkSpraak" Text="" /><br><br></asp:Panel>
        <hr>
        <asp:Panel runat="server" id="Frame7">
          <asp:TextBox runat="server" id="TextPGem" Width="44" Height="25" MaxLength="4">0.00</asp:TextBox><br><asp:TextBox runat="server" id="TextRitGem" Width="44" Height="25" MaxLength="4">0.00</asp:TextBox>&nbsp;<asp:TextBox runat="server" id="TextPLaatst" Width="44" Height="25" ReadOnly="True" MaxLength="4">0.00</asp:TextBox><br><asp:TextBox runat="server" id="TextRitLaatst" Width="44" Height="25" ReadOnly="True" MaxLength="4">0.00</asp:TextBox><br><br><asp:TextBox runat="server" id="txtAantal" Width="93" Height="25" MaxLength="">9999</asp:TextBox>&nbsp;<asp:TextBox runat="server" id="TextStatus" Width="66" Height="25" MaxLength="">Text</asp:TextBox>&nbsp;<asp:Label runat="server" id="LabelScore">Score</asp:Label>&nbsp;<asp:Label runat="server" id="LabelPwaardeLaatst">P-waarde</asp:Label><br><asp:Label runat="server" id="LabelRitwaardeLaatst">Rit-waarde</asp:Label>&nbsp;<asp:Label runat="server" id="lblScore">Score</asp:Label><br><br><asp:Label runat="server" id="lblLGesteld">Laatst</asp:Label>&nbsp;<asp:Label runat="server" id="Label18">Laatst gesteld op</asp:Label><br><asp:Label runat="server" id="Label3">Totaal aantal maal gesteld</asp:Label>&nbsp;<asp:Label runat="server" id="lblAantalLaatst">9999</asp:Label>&nbsp;<asp:Label runat="server" id="LabelStatus">Status</asp:Label>&nbsp;<asp:Label runat="server" id="Label7">gem.</asp:Label>&nbsp;<asp:Label runat="server" id="Label8">laatst</asp:Label><br><br><asp:Label runat="server" id="Label21">keer</asp:Label><br><br><asp:Label runat="server" id="Label9">keer</asp:Label><br><br></asp:Panel>&nbsp;<asp:Label runat="server" id="Label6">Geblokkeerd tot</asp:Label>&nbsp;<asp:Label runat="server" id="Label12">Eigenaar</asp:Label>
        <hr>
        <asp:Panel runat="server" id="Frame99">
          <asp:DropDownList runat="server" id="cmbOnderwerpVraag" /><br><asp:TextBox runat="server" id="TextAuteur" Width="229" Height="25" MaxLength="40">TextAuteur</asp:TextBox>&nbsp;<asp:DropDownList runat="server" id="cmbEigenaar" /><br><br><asp:DropDownList runat="server" id="cmbKennisTest" />&nbsp;<asp:Button runat="server" id="SScmdBlokkade" Text="Wijzig" />&nbsp;<asp:Button runat="server" id="sscmdAuthorisatie" Text="Wijzig" /><br><br><asp:CheckBox runat="server" id="chkKernvraag" Text="Check1" />&nbsp;<asp:CheckBox runat="server" id="chkVrijgegeven" Text="Check2" />&nbsp;<asp:Label runat="server" id="lblBlok">Geblokkeerd</asp:Label>&nbsp;<asp:Label runat="server" id="lblAuth">Autho</asp:Label><br><br><asp:Label runat="server" id="LabelVrijgegeven">Vrijgegeven</asp:Label>&nbsp;<asp:Label runat="server" id="LabelKernvraag">Kernvraag</asp:Label><br><br><asp:Label runat="server" id="Label10">Eigenaar</asp:Label><br><asp:Label runat="server" id="Label15">Onderwerp</asp:Label><br><asp:Label runat="server" id="Label16">Auteur</asp:Label><br><asp:Label runat="server" id="Label17">Taxonomie</asp:Label>&nbsp;<asp:Label runat="server" id="Label19">Geblokkeerd tot</asp:Label>&nbsp;<asp:Label runat="server" id="Label11">Geautoriseerd op</asp:Label><br><br></asp:Panel><br><br></asp:Panel>
      <hr>
      <hr>
      <asp:Panel runat="server" id="Frame5" Visible="false">
        <asp:Label Font-Bold="True" runat="server" id="lblFrame5">Aangemaakte tentamens</asp:Label><br><br><asp:Button runat="server" id="CTentamenDelete" Text="Verwijder" />&nbsp;<asp:DataList runat="server" id="ListTentamen" Width="251" DataTextFormatString="{0:string}" DataValueField="" DataTextField="" /><br><br><asp:Button runat="server" id="CTentamenSave" Text="Opslaan" />&nbsp;<asp:Label runat="server" id="Label5">Tentamen</asp:Label><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame6">
        <asp:TextBox runat="server" id="TextReferentie" Width="251" Height="81" TextMode="MultiLine" MaxLength="254">MDIVraag2.frx":096</asp:TextBox>&nbsp;<asp:TextBox runat="server" id="TextOpmerking" Width="251" Height="81" TextMode="MultiLine" MaxLength="254">MDIVraag2.frx":095</asp:TextBox>&nbsp;<asp:DataList runat="server" id="ListInsluiting" Width="120" DataTextFormatString="{0:string}" DataValueField="" DataTextField="" />&nbsp;<asp:DataList runat="server" id="ListUitsluiting" Width="120" DataTextFormatString="{0:string}" DataValueField="" DataTextField="" />&nbsp;<asp:Label runat="server" id="lblInvoerdatum">
        </asp:Label><br><asp:Label id="lblVraagNummer" Font-Bold="True" runat="server">
        </asp:Label><br><br><asp:Label runat="server" id="LabelReferentie">Referentie</asp:Label>&nbsp;<asp:Label runat="server" id="LabelOpmerking">Opmerking</asp:Label>&nbsp;<asp:Label runat="server" id="Label14">Uitgesloten</asp:Label>&nbsp;<asp:Label runat="server" id="Label13">Ingesloten</asp:Label><br><br></asp:Panel>
      <hr>
      <asp:Panel runat="server" id="Frame3" Visible="false">
        <asp:Label Font-Bold="True" runat="server" id="lblFrame3">Lijstcriteria</asp:Label><br><br><asp:DropDownList runat="server" id="cmbOndInVerz" />&nbsp;<asp:DropDownList runat="server" id="cmbVerzameling" />&nbsp;<asp:DropDownList runat="server" id="cmbOnderwerp" />&nbsp;<asp:DropDownList runat="server" id="cmbBlok" />&nbsp;<asp:DropDownList runat="server" id="cmbStudie" /><br><br><asp:RadioButton runat="server" id="RadioVerzOnd" Text="" GroupName="Frame3" />&nbsp;<asp:RadioButton runat="server" id="RadioVerzameling" Text="" GroupName="Frame3" />&nbsp;<asp:RadioButton runat="server" id="RadioOnderwerp" Text="" GroupName="Frame3" />&nbsp;<asp:RadioButton runat="server" id="RadioBlok" Text="" GroupName="Frame3" /><br><br><asp:Label runat="server" id="Label20">Onderwerpen in Verzameling</asp:Label>&nbsp;<asp:Label runat="server" id="Label20">Verzamelingen</asp:Label>&nbsp;<asp:Label runat="server" id="Label20">Onderwerpen in Blok</asp:Label>&nbsp;<asp:Label runat="server" id="Label20">Blokken in Studierichting</asp:Label>
        <hr>
        <asp:Panel runat="server" id="Frame12">&nbsp;<asp:CheckBox runat="server" id="CheckExtraCriteria" Text="Extra criteria" />&nbsp;<asp:Button runat="server" id="SSSelectCriteria" Text="Selectiecriteria" /><br><br></asp:Panel><br><br></asp:Panel>
      <hr>
      <hr>
      <hr>
      <asp:Button id="SSSwitch" Font-Bold="True" runat="server" Text="Tentamens" />&nbsp;<asp:Button runat="server" id="cmdDown" Text="Neer" />&nbsp;<asp:Button runat="server" id="cmdUp" Text="Op" />&nbsp;<asp:Button runat="server" id="cmdToko" Text="Toko" /><br><br><asp:DropDownList runat="server" id="cmbFSNieuw" Visible="false" />&nbsp;<asp:DropDownList runat="server" id="cmbFSOud" Visible="false" /><br><br><asp:Button runat="server" id="cmdKlaar" Visible="false" Text="K l a a r" /><br><br><asp:DataList runat="server" id="ListVraag" Width="959" DataTextFormatString="{0:string}" DataValueField="" DataTextField="" />&nbsp;<asp:DropDownList runat="server" id="cmbTentamens" Visible="false" />&nbsp;<asp:Label id="LabelAV" Font-Bold="True" runat="server">Aantal vragen:</asp:Label>&nbsp;<asp:Label id="LabelTitle" Font-Bold="True" runat="server">Vragenlijst</asp:Label><br><br><asp:Label runat="server" id="lblMoveVraag">Verplaats vraag</asp:Label>&nbsp;<asp:Label runat="server" id="lblFO" Visible="false">Font Oud</asp:Label>&nbsp;<asp:Label runat="server" id="lblFN" Visible="false">Font Nieuw</asp:Label><br><br><asp:Label id="LabelOnderwerp" Font-Bold="True" runat="server">Onderwerp:</asp:Label>
    </form>
  </body>
</html>