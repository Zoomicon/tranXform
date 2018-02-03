<?xml version="1.0" encoding="UTF-8"?>

<!-- 
 Filename: WebForm.xsl
 Description: converts a VB form design XML document to ASP.net HTML markup
 Author: George Birbilis (http://zoomicon.com)
 Version: 20151016 (updated from 19Aug2004)
-->

<!-- add: convert property ToolTipText (if exists) to ToolTip -->
<!-- add: convert RecordNavigator to a set of navigation buttons and a readonly textbox, placed in a panel -->


<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:asp="http://ASPnet"
  >

 <xsl:output
   method="html"
   version="4.0"
   encoding="UTF-8"
   indent="yes"
   />

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

 <xsl:template name="COMPONENT_AnyVBForm">
  <xsl:text disable-output-escaping="yes"><![CDATA[<%@ Page Language="vb" AutoEventWireup="false" Codebehind="#CodebehindFile#" Inherits="#Namespace#.Web]]></xsl:text>
  <xsl:value-of select="NAME"/>
  <xsl:text disable-output-escaping="yes"><![CDATA["%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">]]>
  </xsl:text>
  <html>
   <head>
    <meta name="GENERATOR" content="VBFormDesignFilter + VBFormDesignToXML + WebForm.xsl"/>
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0"/>
    <title id="PageTitle" runat="server"><xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/></title>
   </head>

   <body>
    <form method="post" runat="server"> 
     <xsl:call-template name="Id"/>
     <asp:Label Font-Bold="True" Font-Size="Larger" runat="server">
      <xsl:attribute name="id">lblFormTitle</xsl:attribute>
      <xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/>
     </asp:Label>
     <br/>
     <br/>
     <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
    </form>
   </body>

  </html>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.Label']">
  <xsl:call-template name="Separate"/>

  <xsl:choose>
   
   <xsl:when test="EVENTS/EVENT[NAME='Click']/NAME!=''">
    <asp:LinkButton runat="server">
     <xsl:call-template name="Component"/>
     <xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/>
    </asp:LinkButton>
   </xsl:when>

   <xsl:otherwise>
    <asp:Label runat="server">
     <xsl:call-template name="Component"/>
     <xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/>
    </asp:Label>
   </xsl:otherwise>

  </xsl:choose>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.CommandButton']">
  <xsl:call-template name="Separate"/>
  <asp:Button runat="server">
   <xsl:call-template name="Component"/>
   <!-- 
    <xsl:call-template name="Width"/>
    <xsl:call-template name="Height"/>
   -->
   <xsl:attribute name="Text"><xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/></xsl:attribute>
  </asp:Button>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.TextBox']">
  <xsl:call-template name="Separate"/>
  <asp:TextBox runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="Width"/>
   <xsl:call-template name="Height"/>
   <xsl:call-template name="TextMode"/>
   <xsl:call-template name="ReadOnly"/>
   <xsl:call-template name="MaxLength"/>
   <xsl:value-of select="PROPERTY[NAME='Text']/VALUE"/>
  </asp:TextBox>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='MSDataListLib.DataList']">
  <xsl:call-template name="Separate"/>
  <asp:DataList runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="Width"/>
   <xsl:call-template name="Enabled"/>
   <xsl:attribute name="DataTextFormatString"><xsl:text>{0:string}</xsl:text></xsl:attribute>
   <xsl:attribute name="DataValueField"><xsl:value-of select="PROPERTY[NAME='BoundColumn']/VALUE"/></xsl:attribute>
   <xsl:attribute name="DataTextField"><xsl:value-of select="PROPERTY[NAME='ListField']/VALUE"/></xsl:attribute>
  </asp:DataList>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.ListBox']">
  <xsl:call-template name="Separate"/>
  <xsl:choose>
   <xsl:when test="(PROPERTY[NAME='MultiSelect']/VALUE=1) or (PROPERTY[NAME='Style']/VALUE=1)"> <!-- 0=Standard, 1=CheckBox -->
    <asp:CheckBoxList runat="server">
     <xsl:call-template name="Component"/>
     <xsl:call-template name="Width"/>
     <xsl:call-template name="Enabled"/>
     <xsl:attribute name="DataTextFormatString"><xsl:text>{0:string}</xsl:text></xsl:attribute>
     <xsl:attribute name="DataValueField"><xsl:value-of select="PROPERTY[NAME='BoundColumn']/VALUE"/></xsl:attribute>
     <xsl:attribute name="DataTextField"><xsl:value-of select="PROPERTY[NAME='ListField']/VALUE"/></xsl:attribute>
    </asp:CheckBoxList>
   </xsl:when>
   <xsl:otherwise>
    <asp:DataList runat="server">
     <xsl:call-template name="Component"/>
     <xsl:call-template name="Width"/>
     <xsl:call-template name="Enabled"/>
     <xsl:attribute name="DataTextFormatString"><xsl:text>{0:string}</xsl:text></xsl:attribute>
     <xsl:attribute name="DataValueField"><xsl:value-of select="PROPERTY[NAME='BoundColumn']/VALUE"/></xsl:attribute>
     <xsl:attribute name="DataTextField"><xsl:value-of select="PROPERTY[NAME='ListField']/VALUE"/></xsl:attribute>
    </asp:DataList>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='MSDataListLib.DataCombo']">
  <xsl:call-template name="Separate"/>
  <asp:DropDownList runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="Enabled"/>
   <xsl:attribute name="DataTextFormatString"><xsl:text>{0:string}</xsl:text></xsl:attribute>
   <xsl:attribute name="DataValueField"><xsl:value-of select="PROPERTY[NAME='BoundColumn']/VALUE"/></xsl:attribute>
   <xsl:attribute name="DataTextField"><xsl:value-of select="PROPERTY[NAME='ListField']/VALUE"/></xsl:attribute>
  </asp:DropDownList>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.ComboBox']">
  <xsl:call-template name="Separate"/>
  <asp:DropDownList runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="Enabled"/>
  </asp:DropDownList>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.CheckBox']">
  <xsl:call-template name="Separate"/>
  <asp:CheckBox runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="TextAlign"/>
   <xsl:attribute name="Text"><xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/></xsl:attribute>
   <xsl:call-template name="Enabled"/>
  </asp:CheckBox>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.OptionButton']">
  <xsl:call-template name="Separate"/>
  <asp:RadioButton runat="server">
   <xsl:call-template name="Component"/>
   <xsl:call-template name="TextAlign"/>
   <xsl:attribute name="Text"><xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/></xsl:attribute>
   <xsl:attribute name="GroupName"><xsl:value-of select="../NAME"/></xsl:attribute>
   <xsl:call-template name="Enabled"/>
  </asp:RadioButton>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='BeeGridOLEDB10.SGGrid']">
  <xsl:call-template name="Separate"/>
  <asp:DataGrid runat="server" AutoGenerateColumns="True">
   <xsl:call-template name="Component"/>
  </asp:DataGrid>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='MSDataGridLib.DataGrid']">
  <xsl:call-template name="Separate"/>
  <asp:DataGrid runat="server" AutoGenerateColumns="True">
   <xsl:call-template name="Component"/>
  </asp:DataGrid>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='MSAdodcLib.Adodc']">
  <xsl:call-template name="Separate"/>
   <asp:Panel runat="server">
    <xsl:call-template name="Id"/>
    <xsl:variable name="theName" select="NAME"/>
    <asp:Button Text="&lt;&lt;" runat="server" Font-Bold="True">
     <xsl:attribute name="id"><xsl:value-of select="concat('btnFirst',$theName)"/></xsl:attribute>
    </asp:Button>
    <asp:Button Text="&lt;" runat="server" Font-Bold="True">
     <xsl:attribute name="id"><xsl:value-of select="concat('btnPrevious',$theName)"/></xsl:attribute>
    </asp:Button>
    <asp:TextBox runat="server" Width="125px">
     <xsl:attribute name="id"><xsl:value-of select="concat('txtLabel',$theName)"/></xsl:attribute>
    </asp:TextBox>
    <asp:Button Text="&gt;" runat="server" Font-Bold="True">
     <xsl:attribute name="id"><xsl:value-of select="concat('btnNext',$theName)"/></xsl:attribute>
    </asp:Button>
    <asp:Button Text="&gt;&gt;" runat="server" Font-Bold="True">
     <xsl:attribute name="id"><xsl:value-of select="concat('btnLast',$theName)"/></xsl:attribute>
    </asp:Button>
   </asp:Panel>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.PictureBox']">
  <xsl:choose>
   
   <xsl:when test="string-length(PROPERTY[NAME='Picture']/VALUE)!=0">
    <xsl:call-template name="Separate"/>
    <asp:Image runat="server" ImageUrl="">
     <xsl:call-template name="Component"/>
     <xsl:call-template name="Width"/>
     <xsl:call-template name="Height"/>
    </asp:Image>
   </xsl:when>
   
   <xsl:otherwise>
    <hr/>
   </xsl:otherwise>
   
  </xsl:choose>
  
  <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='TabDlg.SSTab']">
  <xsl:call-template name="ProcessTab">
   <xsl:with-param name="tabNumber" select="0"/>
   <xsl:with-param name="fromIndex" select="1"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="ProcessTab">
  <xsl:param name="tabNumber">0</xsl:param>
  <xsl:param name="fromIndex">1</xsl:param>

  <xsl:variable 
   name="controlCount"
   select="PROPERTY[NAME=concat(concat('Tab(',$tabNumber),').ControlCount')]/VALUE"
  />

  <xsl:if test="$controlCount!=0">
   <hr/>

   <xsl:variable name="toIndex" select="$fromIndex + $controlCount -1"/>

   <asp:Panel runat="server">
    <xsl:attribute name="id"><xsl:value-of select="NAME"/>page<xsl:value-of select="$tabNumber"/></xsl:attribute>

    <asp:Label Font-Bold="True" runat="server">
     <xsl:attribute name="id">lbl<xsl:value-of select="NAME"/>page<xsl:value-of select="$tabNumber"/></xsl:attribute>
     <xsl:value-of select="PROPERTY[NAME=concat(concat('TabCaption(',$tabNumber),')')]/VALUE"/>
    </asp:Label>
    <br/>
    <br/>

    <xsl:apply-templates select="COMPONENT[(position()&gt;=$fromIndex) and (position()&lt;=$toIndex)]"/>    <!-- process subcomponents -->
    <br/>
    <br/>
   </asp:Panel>
 
   <!-- recurse for the next tabs -->
   <xsl:call-template name="ProcessTab">
    <xsl:with-param name="tabNumber" select="$tabNumber + 1"/>
    <xsl:with-param name="fromIndex" select="$toIndex + 1"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>

<!-- **************************************************** -->

 <xsl:template match="COMPONENT[CLASS='VB.Frame']">
  <hr/>

  <asp:Panel runat="server">
   <xsl:call-template name="Id"/>
   <xsl:call-template name="Visible"/>

   <xsl:if test="string-length(PROPERTY[NAME='Caption']/VALUE)!=0">
    <asp:Label Font-Bold="True" runat="server">
     <xsl:attribute name="id">lbl<xsl:value-of select="NAME"/></xsl:attribute>
     <xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/>
    </asp:Label>
    <br/>
    <br/>
   </xsl:if>

   <xsl:apply-templates select="COMPONENT"/>    <!-- process subcomponents -->

   <br/>
   <br/>

  </asp:Panel>

 </xsl:template>

<!-- **************************************************** -->
<!-- Ignored stuff -->
<!-- **************************************************** -->

 <xsl:template match="comment()"/> <!-- strip any XML comments from output -->

 <xsl:template match="processing-instruction()"/> <!-- strip any XML processing instructions from output -->

 <xsl:template match="*" /> <!-- do nothing for unknown nodes -->

<!-- **************************************************** -->
<!-- Utils -->
<!-- **************************************************** -->

 <xsl:template name="Component">
  <xsl:call-template name="Id"/>
  <xsl:call-template name="Visible"/>
  <xsl:call-template name="Font-Bold"/>
 </xsl:template>

 <xsl:template name="Id">
  <xsl:attribute name="id"><xsl:value-of select="NAME"/></xsl:attribute>
 </xsl:template>

 <xsl:template name="Visible">
  <xsl:if test="PROPERTY[NAME='Visible']/VALUE=0">
   <xsl:attribute name="Visible">false</xsl:attribute>
  </xsl:if>
 </xsl:template>

 <xsl:template name="Width">
  <xsl:attribute name="Width"><xsl:value-of select="round(PROPERTY[NAME='Width']/VALUE div 12)"/></xsl:attribute>
 </xsl:template>

 <xsl:template name="Height">
  <xsl:attribute name="Height"><xsl:value-of select="round(PROPERTY[NAME='Height']/VALUE div 12)"/></xsl:attribute>
 </xsl:template>

 <xsl:template name="MaxLength">
  <xsl:attribute name="MaxLength"><xsl:value-of select="PROPERTY[NAME='MaxLength']/VALUE"/></xsl:attribute>
 </xsl:template>

 <xsl:template name="Font-Bold">
  <xsl:if test="PROPERTY[NAME='Font']/PROPERTY[NAME='Weight']/VALUE=700">
   <xsl:attribute name="Font-Bold">True</xsl:attribute>
   <xsl:attribute name="runat">server</xsl:attribute> <!-- for some strange reason, must have this for "Font-Bold" to work -->
  </xsl:if>
 </xsl:template>

 <xsl:template name="Enabled">
  <xsl:if test="(PROPERTY[NAME='Locked']/VALUE=-1) or (PROPERTY[NAME='Enabled']/VALUE=0)">
   <xsl:attribute name="Enabled">False</xsl:attribute>
  </xsl:if>
 </xsl:template>

 <xsl:template name="ReadOnly">
  <xsl:if test="PROPERTY[NAME='Locked']/VALUE=-1">
   <xsl:attribute name="ReadOnly">True</xsl:attribute>
  </xsl:if>
 </xsl:template>

 <xsl:template name="TextMode">
  <xsl:choose>
   <xsl:when test="PROPERTY[NAME='MultiLine']/VALUE=-1">
    <xsl:attribute name="TextMode">MultiLine</xsl:attribute>    
   </xsl:when>
   <xsl:otherwise>
    <xsl:if test="string-length(PROPERTY[NAME='PasswordChar']/VALUE)!=0">
     <xsl:attribute name="TextMode">Password</xsl:attribute>    
    </xsl:if>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="TextAlign">
  <xsl:variable name="Alignment" select="PROPERTY[NAME='Alignment']/VALUE"/>
  <xsl:choose>
   <xsl:when test="$Alignment=0"><xsl:attribute name="TextAlign">Left</xsl:attribute></xsl:when>
   <xsl:when test="$Alignment=1"><xsl:attribute name="TextAlign">Right</xsl:attribute></xsl:when>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="Separate">
  <xsl:variable name="pos" select="position()-1"/>
  <xsl:if test="string-length(../COMPONENT[position()=$pos])!=0">
   <xsl:variable name="myBottom" select="PROPERTY[NAME='Top']/VALUE + PROPERTY[NAME='Height']/VALUE"/>
   <xsl:variable name="previousBottom" select="../COMPONENT[position()=$pos]/PROPERTY[NAME='Top']/VALUE + ../COMPONENT[position()=$pos]/PROPERTY[NAME='Height']/VALUE"/>
   <xsl:variable name="bottomsDistance" select="$myBottom - $previousBottom"/>
   <!-- [<xsl:value-of select="$bottomsDistance"/> from <xsl:value-of select="../COMPONENT[position()=$pos]/NAME"/>] -->
   <xsl:choose>
    <xsl:when test="$bottomsDistance &gt; 100">
     <br/>
     <xsl:if test="$bottomsDistance &gt;= 360">
      <br/>
     </xsl:if>
    </xsl:when>
    <xsl:otherwise>
     <xsl:call-template name="space"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:if>
 </xsl:template>

 <xsl:template name="space">
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
 </xsl:template>

</xsl:stylesheet>
