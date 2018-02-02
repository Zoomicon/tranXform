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
 <xsl:apply-templates/>
</body>

</html>

</xsl:template>


<!-- *********************************************************************************** -->

<xsl:template match="ENTRY">
 <HR/>
 <xsl:value-of select="KEY"/><BR/>
 <xsl:value-of select="VALUE"/>
</xsl:template>

<!-- *********************************************************************************** -->

</xsl:stylesheet>
