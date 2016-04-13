<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   xmlns:myNS="http://devedge.netscape.com/2002/de">

  <xsl:output method="html" />
  <xsl:param name="numTimes"></xsl:param>
  <xsl:template match="/">
    <H1>
      <xsl:value-of select="weatherdata/location/name"/>
    </H1>
    <xsl:apply-templates select="weatherdata/forecast/tabular" />
  </xsl:template>
  <xsl:template match="time[position() &lt; $numTimes]">
    <div>
      <xsl:attribute name="class">symbol-<xsl:value-of select="symbol/@number" /> period</xsl:attribute>
      <span class="periodName">
        <xsl:choose>
          <xsl:when test="@period = 0">
            Nuit
          </xsl:when>
          <xsl:when test="@period = 1">
            Matinée
          </xsl:when>
          <xsl:when test="@period = 2">
            Après-midi
          </xsl:when>
          <xsl:when test="@period = 3">
            Soirée  
          </xsl:when>
        </xsl:choose>
         du <xsl:value-of select="substring(@from,9,2)" />
    </span>
      <span class="temperature"><xsl:value-of select="temperature/@value" />°C</span>
      <div class="icon"></div>
      <span class="wind">
        <div class="arrow"><xsl:attribute name="style">transform:rotate(<xsl:value-of select="windDirection/@deg" />deg)</xsl:attribute></div>
        <div><xsl:value-of select="round(1.6*windSpeed/@mps)" /> km/h</div>
      </span>
    </div>
  </xsl:template>

</xsl:stylesheet>