<?xml version="1.0" encoding="UTF-8"?>

<!-- 
 Filename: WebForm_vb.xsl
 Description: converts a VB form design XML document to ASP.net WebForm codebehind VB.net class
 Author: George Birbilis (http://zoomicon.com)
 Version: 20151016 (updated from 18Aug2004)
-->

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >

 <xsl:output method="text" encoding="UTF-8"/>

<!-- **************************************************** -->
<!-- Form document -->
<!-- **************************************************** -->

 <xsl:template match="/VBFORM">
  <xsl:apply-templates select="COMPONENT"/>
 </xsl:template>

<!-- **************************************************** -->
<!-- Components -->
<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.Form']">
  <xsl:call-template name="COMPONENT_AnyVBForm"/>
 </xsl:template>   
 
 <xsl:template match="COMPONENT[CLASS='VB.MDIForm']">
  <xsl:call-template name="COMPONENT_AnyVBForm"/>
 </xsl:template>   

 <xsl:template name="COMPONENT_AnyVBForm">Public Class Web<xsl:value-of select="NAME"/>
  Inherits #Baseclass#

  <xsl:call-template name="declareComponent"/>

  <xsl:text disable-output-escaping="yes">

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
   <![CDATA[<System.Diagnostics.DebuggerStepThrough()> _]]>
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
  </xsl:text>

  <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
End Class
</xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.CommandButton']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">Click</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.Label']">
  <xsl:if test="EVENTS/EVENT[NAME='Click']/NAME!=''">
   <xsl:call-template name="event">
    <xsl:with-param name="eventName">Click</xsl:with-param>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-VB.TextBox']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">TextChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-MSDataListLib.DataCombo']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">SelectedIndexChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-VB.ComboBox']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">SelectedIndexChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-VB.CheckBox']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">CheckedChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-VB.OptionButton']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">CheckedChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-BeeGridOLEDB10.SGGrid']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">SelectedIndexChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-MSDataGridLib.DataGrid']">
  <xsl:call-template name="event">
   <xsl:with-param name="eventName">SelectedIndexChanged</xsl:with-param>
  </xsl:call-template>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='-MSAdodcLib.Adodc']">
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.PictureBox']">
  <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='TabDlg.SSTab']">
  <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.Frame']">
  <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
 </xsl:template>

<!-- **************************************************** -->
<!-- Ignored stuff -->
<!-- **************************************************** -->

 <xsl:template match="comment()"/> <!-- strip any XML comments from output -->

 <xsl:template match="processing-instruction()"/> <!-- strip any XML processing instructions from output -->

 <xsl:template match="*" /> <!-- do nothing for unknown nodes -->
 
<!-- **************************************************** -->
<!-- Utilities -->
<!-- **************************************************** -->

 <xsl:template name="event">
  <xsl:param name="objectName"><xsl:value-of select="NAME"/></xsl:param> <!-- if name isn't given search ourselves -->
  <xsl:param name="eventName"/>
   Private Sub <xsl:value-of select="$objectName"/>_<xsl:value-of select="$eventName"/>(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles <xsl:value-of select="$objectName"/>.<xsl:value-of select="$eventName"/>
    '!!! add code here
   End Sub
 </xsl:template> 

 <xsl:template name="declareComponent">
   <xsl:choose>
    <xsl:when test="CLASS='VB.Label'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.<xsl:choose><xsl:when test="EVENTS/EVENT[NAME='Click']!=''">LinkButton</xsl:when><xsl:otherwise>Label</xsl:otherwise></xsl:choose></xsl:when>
    <xsl:when test="CLASS='VB.CommandButton'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.Button</xsl:when>
    <xsl:when test="CLASS='VB.TextBox'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.TextBox</xsl:when>
    <xsl:when test="CLASS='VB.CheckBox'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.CheckBox</xsl:when>
    <xsl:when test="CLASS='VB.OptionButton'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.RadioButton</xsl:when>
    <xsl:when test="CLASS='MSDataListLib.DataCombo'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.DropDownList</xsl:when>
    <xsl:when test="CLASS='MSDataListLib.DataList'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.DataList</xsl:when>
    <xsl:when test="CLASS='VB.ListBox'">Protected WithEvents <xsl:value-of select="NAME"/> As <xsl:choose><xsl:when test="(PROPERTY[NAME='MultiSelect']/VALUE=1) or (PROPERTY[NAME='Style']/VALUE=1)">System.Web.UI.WebControls.CheckBoxList</xsl:when><xsl:otherwise>System.Web.UI.WebControls.DataList</xsl:otherwise></xsl:choose></xsl:when>
    <xsl:when test="CLASS='VB.ComboBox'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.DropDownList</xsl:when>
    <xsl:when test="CLASS='BeeGridOLEDB10.SGGrid'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.DataGrid</xsl:when>
    <xsl:when test="CLASS='VB.PictureBox'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.Image</xsl:when>
    <xsl:when test="CLASS='VB.Frame'">Protected WithEvents <xsl:value-of select="NAME"/> As System.Web.UI.WebControls.Panel<xsl:if test="string-length(PROPERTY[NAME='Caption']/VALUE)!=0">
Protected WithEvents lbl<xsl:value-of select="NAME"/> As System.Web.UI.WebControls.Label</xsl:if></xsl:when>
    <xsl:when test="CLASS='VB.Form'">Protected WithEvents lblFormTitle As System.Web.UI.WebControls.Label</xsl:when>
    <xsl:when test="CLASS='VB.MDIForm'">Protected WithEvents lblFormTitle As System.Web.UI.WebControls.Label</xsl:when>
    <!-- not declaring tabs, maybe not declare other not needed to handle at the server side controls (anyway Visual Studio.net seems to be automatically adding these declarations if missing -->
   </xsl:choose>
   
  <xsl:text>
  </xsl:text>

  <xsl:for-each select="COMPONENT">
   <xsl:call-template name="declareComponent"/> <!-- process children -->
  </xsl:for-each>

 </xsl:template>

</xsl:stylesheet>
