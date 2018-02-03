<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- 
 Filename: listComponentsWithMaxLength
 Description: lists all form components that have a non-empty "MaxLength" property
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
    <xsl:apply-templates select="COMPONENT"/> <!-- handle all components -->
   </body>

  </html>
 </xsl:template>

 <!-- Component -->

 <xsl:template match="COMPONENT">

  <!-- if has a non-empty MaxLength property show it -->
  <xsl:if test="string-length(PROPERTY[NAME='MaxLength']/VALUE)!=0">
   <hr/>
   Name=<xsl:value-of select="NAME"/><br/>
   Class=<xsl:value-of select="CLASS"/><br/>
   MaxLength=<xsl:value-of select="PROPERTY[NAME='MaxLength']/VALUE"/><br/>
   Parent=<xsl:value-of select="../NAME"/><br/>
  </xsl:if>

  <!-- process its subcomponents anyway-->
  <xsl:apply-templates select="COMPONENT"/>

 </xsl:template>

</xsl:stylesheet>
