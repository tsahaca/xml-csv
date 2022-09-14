<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="xs math"
                version="2.0">

    <xsl:output method="text"/>

    <!-- Select the distinct attributes from all order elements in a order xml -->
    <xsl:variable name="columns" as="xs:string*" select="distinct-values(//order/@*/name())"/>

    <!-- Select the Ticket Type from the first order element -->
    <xsl:template match="/">
        <xsl:value-of select="$columns" separator=","/>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="//order[1]"/>
    </xsl:template>

    <xsl:template match="order">
        <xsl:value-of select="@order_type"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="for $col in $columns return ('X')" separator=","/>

        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>