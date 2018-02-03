<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- 
 Filename: sortTabOrder.xsl
 Description: sorts a VB form design XML document according to taborder
 Author: George Birbilis (birbilis@kagi.com)
 Version: 18Aug2004
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>

 <xsl:template match="@*|*">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 </xsl:template>

</xsl:stylesheet>
