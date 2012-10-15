<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<span style="font-size: 12pt; color: coral; text-decoration: underline">
					<strong>Bugs Fixed : </strong>
					<br />
					<ol>
						<xsl:for-each select="Changes/BugFix/Fix">
							<a href="http://www.google.com">Google</a>
							<li>
								<xsl:value-of select="@Id"/> : 
								<xsl:value-of select="."/>
							</li>
						</xsl:for-each>
					</ol>
					<strong>New Features : </strong>
					<br />
				</span>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>

