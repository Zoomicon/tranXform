<?xml version="1.0" encoding="UTF-8"?>

<!--
Filename: ResX_WordCount.xsl
Version: 20141006
-->

<xsl:stylesheet 
  version="1.0"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >

  <xsl:output method="text" indent="yes"/>

  <xsl:template match="/root">
    <!-- see http://www.xml.com/pub/a/2003/07/16/nodeset.html -->
    <xsl:variable name="WordCounts">
      <xsl:for-each select="data/value">
        <!-- see http://stackoverflow.com/questions/6188189/count-the-number-of-words-in-a-xml-node-using-xsl/ -->
        <count>
          <xsl:value-of select="string-length(normalize-space(text())) - string-length(translate(normalize-space(text()),' ','')) + 1"/>
        </count>
      </xsl:for-each>
    </xsl:variable>

    <xsl:value-of select="sum(msxsl:node-set($WordCounts)/count)"/>
  </xsl:template>
</xsl:stylesheet>
