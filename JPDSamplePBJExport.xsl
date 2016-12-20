<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" exclude-result-prefixes="office table text">

 <xsl:template match="/">
  <nursingHomeData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="nhpbj_2_00_0.xsd">
   <xsl:apply-templates select="/*/office:body" />
</nursingHomeData> 
 </xsl:template>

 <xsl:template match="office:body">
   <xsl:apply-templates select="office:spreadsheet/table:table[*]"/>
 </xsl:template>

 <xsl:template match="office:spreadsheet">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="office:spreadsheet/table">
 <xsl:apply-templates  />
 </xsl:template>
 
  <xsl:template match="office:spreadsheet/table:table[1]">
 
 <xsl:for-each  select="table:table-row[3]">
 
 	  <header  fileSpecVersion="2.00.0">
		  <facilityId><xsl:value-of select="table:table-cell[2]/text:p"/></facilityId>
      <stateCode><xsl:value-of select="table:table-cell[3]/text:p"/></stateCode>
		  <reportQuarter><xsl:value-of select="table:table-cell[4]/text:p"/></reportQuarter>
		  <federalFiscalYear><xsl:value-of select="table:table-cell[5]/text:p"/></federalFiscalYear>
		  <softwareVendorName><xsl:value-of select="table:table-cell[6]/text:p"/></softwareVendorName>
		  <softwareVendorEmail><xsl:value-of select="table:table-cell[7]/text:p"/></softwareVendorEmail>
		  <softwareProductName><xsl:value-of select="table:table-cell[8]/text:p"/></softwareProductName>
		  <softwareProductVersion><xsl:value-of select="table:table-cell[9]/text:p"/></softwareProductVersion>
    </header>		

</xsl:for-each>
</xsl:template>

 <xsl:template match="office:spreadsheet/table:table[2]">
 <employees>
 <xsl:for-each select="table:table-row[position() &gt; 2]">
     <employee>   
    <employeeId><xsl:value-of select="table:table-cell[1]/text:p" /></employeeId>
      <hireDate><xsl:value-of select="table:table-cell[2]/text:p" /></hireDate>
      <!--xsl:if ><xsl:value-of select="table:table-cell[3]/text:p"/> != "">
      <terminationDate><xsl:value-of select="table:table-cell[3]/text:p"/></terminationDate>
      </xsl:if-->
      </employee>
</xsl:for-each>
</employees>
</xsl:template>


  
 <xsl:template match="office:spreadsheet/table:table[3]">
 
<staffingHours processType="merge"> 

<xsl:for-each select="table:table-row[position() &gt;4]">
<staffHours>
<employeeId><xsl:value-of select="table:table-cell[1]/text:p" /></employeeId>
<workDays>
<workDay>
<date><xsl:value-of select="table:table-cell[2]/text:p" /></date>
<hourEntries>
<hourEntry>
<hours><xsl:value-of select="table:table-cell[3]/text:p" /></hours>
<jobTitleCode><xsl:value-of select="table:table-cell[4]/text:p" /></jobTitleCode>
<!--payTypeCode><xsl:value-of select="table:table-cell[5]/text:p" /></payTypeCode-->
<payTypeCode>2</payTypeCode>
</hourEntry>
</hourEntries>
</workDay>
</workDays>
</staffHours>

</xsl:for-each>
</staffingHours>


</xsl:template>

</xsl:stylesheet>
