<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- 
 Filename: toHtml.xsl
 Description: converts a VB form design XML document to HTML
 Author: George Birbilis (birbilis@kagi.com)
 Version: 18Aug2004
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="html" encoding="ISO-8859-1"/>

 <!-- Form document -->

 <xsl:template match="/VBFORM">
  <html>
   <head></head>

   <body>
    <xsl:apply-templates select="COMPONENT"/>
   </body>

  </html>
 </xsl:template>

 <!-- Component -->

 <xsl:template match="COMPONENT">
  <hr/>
  <b>Component:</b><br/>
  Name=<xsl:value-of select="NAME"/><br/>
  Class=<xsl:value-of select="CLASS"/><br/>
  TabIndex=<xsl:value-of select="PROPERTY[NAME='TabIndex']/VALUE"/><br/>
  Parent=<xsl:value-of select="../NAME"/><br/>

  <xsl:choose>

   <xsl:when test="CLASS='VB.Label'">
    <xsl:call-template name="VB.Label"/>
   </xsl:when>

   <xsl:when test="CLASS='VB.CommandButton'">
    <xsl:call-template name="VB.CommandButton"/>
   </xsl:when>

   <xsl:when test="CLASS='VB.TextBox'">
    <xsl:call-template name="VB.TextBox"/>
   </xsl:when>

   <xsl:otherwise>
    Uknown component class: <xsl:value-of select="CLASS"/><br/>
   </xsl:otherwise>

  </xsl:choose>

  <!-- process subcomponents -->
  <xsl:apply-templates select="COMPONENT"/>
 </xsl:template>

 <xsl:template name="_Caption">
  Caption=<xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/><br/>
 </xsl:template>

 <xsl:template name="VB.Label">
  <xsl:call-template name="_Caption"/>
  <!-- ... -->
 </xsl:template>

 <xsl:template name="VB.CommandButton">
  <xsl:call-template name="_Caption"/>
  <!-- ... -->
 </xsl:template>

 <xsl:template name="VB.TextBox">
  Text=<xsl:value-of select="PROPERTY[NAME='Text']/VALUE"/><br/>
  <!-- ... -->
 </xsl:template>

</xsl:stylesheet>
