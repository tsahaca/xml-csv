<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="xs math"
                version="2.0">

    <xsl:output method="xml" omit-xml-declaration="yes" />


  <!-- Select the distinct attributes from all order elements in a order xml -->
    <xsl:variable name="columns" as="xs:string*" select="distinct-values(//order/@*/name())"/>

    <!-- Select the Ticket Type from the first order element -->
    <xsl:template match="/">
        <xsl:apply-templates select="//order[1]"/>
    </xsl:template>

    <xsl:template match="order">

        <xsl:element name="itemA">
        <xsl:attribute name="id">
            <xsl:value-of select="@order_type"/> - <xsl:if test="not(@order_subtype/@xs:nil=true())"><xsl:value-of select="@order_subtype"/></xsl:if>
        </xsl:attribute>
        <!--
            Iterate over each unique attribute collected from all order elements in a order xml
            create a new attribute in the resulting xml and set the attribute value to x
        -->
        <xsl:for-each select="$columns" >
            <xsl:variable name="attributeName" select="."/>
            <xsl:attribute name="{$attributeName}">x</xsl:attribute>
        </xsl:for-each>
        </xsl:element>
        <xsl:text>&#10;</xsl:text>


    </xsl:template>

</xsl:stylesheet>