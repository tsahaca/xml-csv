<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="xs math"
                version="2.0">


    <xsl:output method="text"/>

    <xsl:variable name="columns" as="xs:string*" select="distinct-values(//itemA/@*/name())"/>

    <xsl:template match="/">
        <xsl:value-of select="$columns" separator=","/>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="//itemA"/>
    </xsl:template>

    <xsl:template match="itemA">

        <xsl:value-of select="for $col in $columns return (@*[name() = $col], '')[1]" separator=","/>


        <xsl:text>&#10;</xsl:text>
    </xsl:template>

<!--
    <xsl:template match="itemA">
        <xsl:value-of select="for $col in $columns return @*[name() = $col] || ''" separator=","/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

-->

</xsl:stylesheet>