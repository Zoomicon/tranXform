<?xml version="1.0" encoding="UTF-8"?>

<!-- 
 Filename: SortTabOrder.xsl
 Description: Sorts COMPONENT nodes of a VB form design XML document according to their TabIndex property (ascending)
 Author: George Birbilis (http://zoomicon.com)
 Version: 20151016 (Updated from 18Aug2004)
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

 <xsl:template match="VBFORM">
  <xsl:copy>
   <xsl:apply-templates select="COMPONENT">
    <xsl:sort select="PROPERTY[NAME='TabIndex']/VALUE" data-type="number"/>
    <!-- can add order="descending" above if don't want "ascending" sort order -->
   </xsl:apply-templates>
  </xsl:copy>
 </xsl:template>

 <xsl:template match="COMPONENT">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()">
    <xsl:sort select="PROPERTY[NAME='TabIndex']/VALUE" data-type="number"/>
   </xsl:apply-templates>
  </xsl:copy>
 </xsl:template>

 <xsl:template match="@*|*">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 </xsl:template>

</xsl:stylesheet>
