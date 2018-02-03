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
  <xsl:call-template name=CLASS/>
 </xsl:template>

 <!-- VB.Label -->

 <xsl:template name="VB.Label">
  <hr/>
  Label:<br/>
  caption=<xsl:value-of select="PROPERTY[NAME='Caption']/VALUE"/><br/>
  <!-- <xsl:apply-templates select="COMPONENT"/> *** Don't need this one since a Label doesn't have children *** -->
 </xsl:template>

 <xsl:template name="VB.TextBox">
  TextBox:<br/>
  name=<xsl:value-of select="PROPERTY[NAME='Name']/VALUE"/><br/>
  text=<xsl:value-of select="PROPERTY[NAME='Text']/VALUE"/><br/>
  <!-- <xsl:apply-templates select="COMPONENT"/> *** Don't need this one since a TextBox doesn't have children *** -->
 </xsl:template>

</xsl:stylesheet>
