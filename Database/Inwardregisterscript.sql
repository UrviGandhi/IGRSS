USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[InwardRegister]    Script Date: 10/17/2012 13:22:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[InwardRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[InwardNo] [varchar](50) NOT NULL,
	[InwardDate] [datetime] NULL,
	[Description] [nvarchar](300) NULL,
	[ApplicantName] [varchar](100) NULL,
	[ApplicationDate] [datetime] NULL,
	[SentTo] [uniqueidentifier] NULL,
	[Remarks] [nvarchar](500) NULL,
	[ApplicantAddress] [nvarchar](500) NULL,
	[Document_Upload_Id] [int] NULL,
 CONSTRAINT [PK_InwardRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


