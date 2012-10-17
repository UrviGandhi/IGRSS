USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[FileRegister]    Script Date: 10/17/2012 13:25:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FileRegister](
	[SrNo] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[FileName] [nchar](10) NULL,
	[FileNo] [int] NULL,
	[StartingDate] [datetime] NULL,
	[EndingDate] [datetime] NULL,
	[ClassOfFile] [nchar](10) NULL,
	[DisposalDateOfFile] [datetime] NULL,
	[DisposalDateOn] [datetime] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


