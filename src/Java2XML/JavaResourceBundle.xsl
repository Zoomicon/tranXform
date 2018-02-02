<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- XSL style sheet for transforming JavaResourceBundle.DTD compliant XML data to HTML -->
<!-- Written by George Birbilis, 22Nov2001 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- *********************************************************************************** -->

<xsl:output method="html" encoding="ISO-8859-7"/>

<xsl:template match="RESOURCEBUNDLE">

<html>

<head>
 <title>ResourceBundle</title>
</head>

<body>
 <xsl:apply-templates>
  <xsl:sort select="KEY"/>
 </xsl:apply-templates>
</body>

</html>

</xsl:template>


<!-- *********************************************************************************** -->

<xsl:template match="ENTRY">
 <xsl:choose>

  <xsl:when test="not(substring(KEY,string-length(KEY)-2,3)='Tip')">
   <HR/>
   <!-- <B><xsl:value-of select="KEY"/></B><xsl:text> - </xsl:text> -->
   <B><xsl:value-of select="VALUE"/></B><BR/>
  </xsl:when>

  <xsl:otherwise>
   <xsl:value-of select="VALUE"/><BR/>
  </xsl:otherwise> 

 </xsl:choose>
</xsl:template>

<!-- *********************************************************************************** -->

</xsl:stylesheet>
