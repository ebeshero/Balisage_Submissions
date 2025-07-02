&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0"&gt;
    &lt;xsl:mode on-no-match="shallow-copy"/&gt;
    &lt;xsl:output method="xml" indent="yes"/&gt;    
    &lt;xsl:template match="/"&gt;
        &lt;xsl:apply-templates/&gt;
    &lt;/xsl:template&gt;
    
    &lt;xsl:template match="mdiv"&gt;
        &lt;xsl:analyze-string select="." regex="\n(\s*([A-Z][#ba-z/0-9]*) *([A-Z][#ba-z/0-9]*)?)*\n"&gt;
            &lt;xsl:matching-substring&gt;
                &lt;chordLine&gt;
                    &lt;xsl:for-each select="tokenize(., '\s+')"&gt;
                        &lt;xsl:if test="current() ! matches(., '\S')"&gt;
                            &lt;chord&gt;&lt;xsl:value-of select="current()"/&gt;&lt;/chord&gt;
                        &lt;/xsl:if&gt;
                    &lt;/xsl:for-each&gt;
                &lt;/chordLine&gt;
            &lt;/xsl:matching-substring&gt;
            &lt;xsl:non-matching-substring&gt;
                &lt;lyrics&gt;
                    &lt;xsl:value-of select=". ! normalize-space()"/&gt;                
                &lt;/lyrics&gt;
            &lt;/xsl:non-matching-substring&gt;
            
        &lt;/xsl:analyze-string&gt;
        
        
        
    &lt;/xsl:template&gt;
    
&lt;/xsl:stylesheet&gt;