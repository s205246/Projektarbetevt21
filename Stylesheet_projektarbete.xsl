<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei" 
    version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />
  
    <xsl:template match="/">
        <html>
            <head>
                <title> <xsl:value-of select="//tei:titleStmt/tei:title"/> / 
                    <xsl:value-of select="//tei:publicationStmt"/>
                </title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <style type="text/css">
                    body { margin : 10%; width : 600px }
                    
              
                    
                </style>
            </head>
            <body>

                <div> 
                    <xsl:apply-templates select="//tei:text"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        <p class="dateline" style="text-align : right"><xsl:apply-templates/></p>    
    </xsl:template>
    
    <xsl:template match="tei:byline">
        
        <xsl:choose>
            <xsl:when test="@n='1'"><p class="byline" style="text-align : center"><xsl:apply-templates/></p></xsl:when>
            <xsl:when test="@n='2'"><p class="byline" style="text-align : left"><xsl:apply-templates/></p></xsl:when>
            <xsl:when test="@n='3'"><p class="byline" style="text-align : right"><xsl:apply-templates/></p></xsl:when>
            <xsl:otherwise><p class="byline"><xsl:apply-templates/></p></xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="tei:row"><tr><xsl:apply-templates/></tr></xsl:template>
    <xsl:template match="tei:cell"><td><xsl:apply-templates/></td></xsl:template>
    <xsl:template match="tei:salute"><p class="salute" style="text-align : right">
        <xsl:apply-templates/></p></xsl:template>
    <xsl:template match="tei:name|tei:label|tei:val|tei:num">
        <xsl:choose>
            <xsl:when test="@rend='ul'"><span style="text-decoration : underline"><xsl:apply-templates/></span></xsl:when>
            <xsl:when test="@rend='center'"><span style="text-align : center"><xsl:apply-templates/></span></xsl:when>
        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>    
        </xsl:choose>
        
        </xsl:template>
    
    
       
    <xsl:template match="tei:closer"><p class="closer" style="text-align : right"><xsl:apply-templates></xsl:apply-templates></p></xsl:template>
    <xsl:template match="tei:head">
        <xsl:choose>
            <xsl:when test="@rend='ul'"><h1 style="text-decoration : underline"><xsl:apply-templates/></h1></xsl:when>
            <xsl:when test="@type='sub'"><h2><xsl:apply-templates/></h2></xsl:when>
        <xsl:otherwise><h1><xsl:apply-templates/></h1></xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
<xsl:template match="tei:del"> <xsl:choose>
    <xsl:when test="@reason='overstrike'"><span style="text-decoration : overstrike"><xsl:apply-templates/></span></xsl:when>
</xsl:choose></xsl:template>
    
    <xsl:template match="tei:lb|tei:l">
        <xsl:apply-templates/> <br/>   
    </xsl:template>
    
  
    
</xsl:stylesheet>