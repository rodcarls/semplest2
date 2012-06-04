USE [master]
GO
/****** Object:  Database [semplest]    Script Date: 05/14/2012 14:58:42 ******/
CREATE DATABASE [semplest] ON  PRIMARY 
( NAME = N'semplest3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\semplest3.mdf' , SIZE = 61440KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'semplest3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\semplest3_log.ldf' , SIZE = 149696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [semplest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [semplest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [semplest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [semplest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [semplest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [semplest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [semplest] SET ARITHABORT OFF
GO
ALTER DATABASE [semplest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [semplest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [semplest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [semplest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [semplest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [semplest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [semplest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [semplest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [semplest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [semplest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [semplest] SET  DISABLE_BROKER
GO
ALTER DATABASE [semplest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [semplest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [semplest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [semplest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [semplest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [semplest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [semplest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [semplest] SET  READ_WRITE
GO
ALTER DATABASE [semplest] SET RECOVERY FULL
GO
ALTER DATABASE [semplest] SET  MULTI_USER
GO
ALTER DATABASE [semplest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [semplest] SET DB_CHAINING OFF
GO
USE [semplest]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/14/2012 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolePK] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rights]    Script Date: 05/14/2012 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rights](
	[RightsPK] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [nvarchar](250) NOT NULL,
	[Label] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK__Rights__91C60E5171D1E811] PRIMARY KEY CLUSTERED 
(
	[RightsPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroupCycleType]    Script Date: 05/14/2012 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroupCycleType](
	[ProductGroupCycleTypePK] [int] IDENTITY(1,1) NOT NULL,
	[ProductGroupCycleType] [nchar](30) NOT NULL,
	[CycleInDays] [int] NOT NULL,
 CONSTRAINT [PK_ProductGroupCycleType] PRIMARY KEY CLUSTERED 
(
	[ProductGroupCycleTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weekly/7,Monthly/30,Quarterly/90,SemiAnnual/162,Annual/365' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroupCycleType'
GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 05/14/2012 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[KeywordPK] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [uniqKeyword] ON [dbo].[Keyword] 
(
	[Keyword] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HelpDefinition]    Script Date: 05/14/2012 14:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpDefinition](
	[GUIWidgetID] [int] NOT NULL,
	[HelpText] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GUIWidgetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNextScheduleTime]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitch
-- Create date: 4/20/2012
-- Description:	Gets Next Time To Run
-- =============================================
CREATE FUNCTION [dbo].[GetNextScheduleTime] 
(
	-- Add the parameters for the function here
	@StartDateTime DATETIME,
	@Frequency VARCHAR(25)
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DATETIME, @currentDate DATETIME, @date DATETIME
	DECLARE @WeekDay INT,@i INT;
	DECLARE @TodaysDay INT,@numWeeks INT, @dayOfWeekToRun INT
	DECLARE @MaxDaysInCurrentMonth INT,@afterStart BIT
	
	SET @currentDate = CURRENT_TIMESTAMP
	SET @currentDate = DATEADD(s, 60, @currentDate)		--Add 60 sec to compasate for time synchronisation between 2 servers
		
	IF (@Frequency = 'Now')
	BEGIN
		SELECT @Result = @currentDate
	END
	ELSE IF (@Frequency = 'Once')
	BEGIN
		--if start date is in the future
		IF (DATEDIFF(s,@currentDate,@StartDateTime) > 0)
		BEGIN
			SELECT @Result = @StartDateTime
		END
		ELSE --run now
		BEGIN
			SELECT @Result = @currentDate
		END 
	END	
	--TEST
	ELSE IF (@Frequency = 'TenMinutes')
	BEGIN
		--if start date is in the future
		SET @result = DATEADD(mi,10,@StartDateTime);
	END
	ELSE IF (@Frequency = 'Daily')
	BEGIN
		--if start date is in the future
		SET @result = DATEADD(dd,1,@StartDateTime);
	END
	ELSE IF (@Frequency = 'Weekly')
	BEGIN
		SET @result = DATEADD(dd,7,@StartDateTime);
	END
	ELSE IF (@Frequency = 'Monthly')
	BEGIN
		SET @Result = DATEADD(mm,1,@StartDateTime)		
	END
	-- Return the result of the function
	RETURN @Result

END
GO
/****** Object:  Table [dbo].[Frequency]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequency](
	[FrequencyPK] [int] IDENTITY(1,1) NOT NULL,
	[Frequency] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FrequencyPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Now, Daily, Weekly, Monthly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequency'
GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[PhoneTypePK] [int] NOT NULL,
	[PhoneType] [nvarchar](20) NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[EmployeeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeType] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCardProfile]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditCardProfile](
	[CreditCardProfilePK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[CustomerRefNum] [varchar](22) NOT NULL,
	[AuthCode] [varchar](6) NOT NULL,
	[TxRefNum] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CreditCardProfilePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[ConfigurationPK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerMinOrderAmount] [money] NOT NULL,
	[CustomerDefaultMonthlyFlatFeeAmount] [money] NOT NULL,
	[CustomerDefaultPerCampaignFlatFeeAmount] [money] NOT NULL,
	[CustomerDefaultPerAdGroupFlatFeeAmount] [money] NOT NULL,
	[DefaultMediaComissionPercentage] [decimal](5, 4) NOT NULL,
	[DefaultSalesPersonCommissionPercentage] [decimal](5, 4) NOT NULL,
	[MinSalespersonCommissionPercentage] [decimal](5, 4) NOT NULL,
	[MaxSalespersonCommissionPercentage] [decimal](5, 4) NULL,
	[DefalutBudgetMixPercentageGoogle] [decimal](5, 4) NULL,
	[DefalutBudgetMixPercentageBing] [decimal](5, 4) NULL,
	[DefaultSemplestBannerImageUrl] [nvarchar](1024) NULL,
	[DefaultSemplestStyleSheetUrl] [nvarchar](1024) NULL,
	[MaxNumberOfSitelinks] [int] NULL,
	[LastAccountNumberUsed] [int] NULL,
	[LastSEMplestEmployeeIDused] [int] NULL,
	[DefaultEmailContactUs] [nvarchar](150) NULL,
	[DefalutEmailContactMe] [nvarchar](150) NULL,
	[DefaultProductGroupName] [nvarchar](256) NULL,
	[DefaultProductPromotionName] [nvarchar](256) NULL,
	[SamplestDevelopmentEmail] [nvarchar](150) NULL,
	[SemplestDefaultBudgetMarkUpOrDown] [nvarchar](1) NULL,
	[BillingDaysOffset] [int] NULL,
	[OnErrorEmail] [nvarchar](150) NULL,
	[MSNCampaignURL] [varchar](250) NULL,
	[MSNCampagnNamespace] [varchar](100) NULL,
	[MSNCustomerURL] [varchar](250) NULL,
	[MSNCustomerNamespace] [varchar](100) NULL,
	[MSNReportingURL] [varchar](250) NULL,
	[MSNReportingNamespace] [varchar](100) NULL,
	[MSNAdIntelligenceURL] [varchar](250) NULL,
	[MSNAdIntelligenceNamespace] [varchar](100) NULL,
	[MSNParentCustomerID] [bigint] NULL,
	[MSNApiUsername] [varchar](50) NULL,
	[MSNApiPassword] [varchar](50) NULL,
	[MSNUserAccessKey] [varchar](150) NULL,
	[AdwordsEmail] [varchar](75) NULL,
	[AdwordsPassword] [varchar](50) NULL,
	[AdwordsUserAgent] [varchar](50) NULL,
	[AdwordsDeveloperToken] [varchar](50) NULL,
	[OrbitalGatewaySalemPlatform] [varchar](10) NULL,
	[OrbitalGatewayMerchantID] [varchar](25) NULL,
	[OrbitalGatewayUsername] [varchar](25) NULL,
	[OrbitalGatewayPassword] [varchar](25) NULL,
	[SemplestClientAdwordsTimeoutMS] [int] NULL,
	[SemplestClientKeywordTimeoutMS] [int] NULL,
	[SemplestClientBiddingTimeoutMS] [int] NULL,
	[SemplestClientMailTimeoutMS] [int] NULL,
	[SemplestClientSchedulerTimeoutMS] [int] NULL,
	[SemplestClientMSNTimeoutMS] [int] NULL,
	[SemplestBiddingMaxRetry] [int] NULL,
	[SemplestBiddingSleepPeriod] [int] NULL,
	[SemplestBiddingSleepBackOffTime] [int] NULL,
	[SemplestBiddingMaxMicroBid] [bigint] NULL,
	[SemplestBiddingStepAboveFpCPC] [bigint] NULL,
	[SemplestBiddingDefaultMicroBid] [bigint] NULL,
	[SemplestBiddingMaxDefaultMicroBid] [bigint] NULL,
	[SemplestBiddingStepFirst] [bigint] NULL,
	[SemplestBiddingStepSecond] [bigint] NULL,
	[SemplestBiddingStepRest] [bigint] NULL,
	[SemplestBiddingGooglePercent] [int] NULL,
	[ESBRegServicePort] [int] NULL,
	[ESBBrokerName] [varchar](25) NULL,
	[ESBBrokerPort] [int] NULL,
	[ESBBrokerIP] [varchar](50) NULL,
	[ESBWebServerPort] [int] NULL,
	[ESBHeaderBufferSize] [int] NULL,
	[ESBAsynchServletCorePoolSize] [int] NULL,
	[ESBAsynchServletMaxPoolSize] [int] NULL,
	[ESBAsynchServletMaxWorkInQueue] [int] NULL,
	[ESBAsynchCallDefaultTimeoutMS] [int] NULL,
	[ServiceESBServerPort] [int] NULL,
	[ServiceESBServerIP] [varchar](50) NULL,
	[ServicePingFrequencyMS] [int] NULL,
	[ServiceNumberServiceThreads] [int] NULL,
	[ServiceSMTP] [varchar](50) NULL,
	[ESBWebServerURL] [varchar](100) NULL,
	[AdwordsUseSandbox] [bit] NOT NULL,
	[SemplestEncryptionkey] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfigurationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BudgetCycle]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BudgetCycle](
	[BudgetCyclePK] [int] IDENTITY(1,1) NOT NULL,
	[BudgetCycle] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BudgetCyclePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Daily;Weekly;Monthly;Yearly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BudgetCycle'
GO
/****** Object:  Table [dbo].[BillType]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillType](
	[BillTypePK] [int] IDENTITY(1,1) NOT NULL,
	[BillType] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_BillType] PRIMARY KEY CLUSTERED 
(
	[BillTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayType: NoBill, BillCredit, BillInvoice ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillType'
GO
/****** Object:  Table [dbo].[BidType]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BidType](
	[BidTypePK] [int] IDENTITY(1,1) NOT NULL,
	[BidType] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BidTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exact;Broad;Phrase;Negative;BroadWithModifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidType'
GO
/****** Object:  Table [dbo].[AdvertisingEngine]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingEngine](
	[AdvertisingEnginePK] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisingEngine] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdvertisingEngine] PRIMARY KEY CLUSTERED 
(
	[AdvertisingEnginePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressType](
	[AddressTypePK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AddressType] [nvarchar](1) NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskPK] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nchar](100) NOT NULL,
	[MethodName] [nchar](50) NOT NULL,
	[Parameters] [nchar](2500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateCode]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateCode](
	[StateAbbrPK] [int] IDENTITY(1,1) NOT NULL,
	[StateAbbr] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_StateCode] PRIMARY KEY CLUSTERED 
(
	[StateAbbrPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEMCustomerDetails]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEMCustomerDetails](
	[SEMCustomerDetailsPK] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](100) NULL,
	[email] [nvarchar](100) NOT NULL,
	[CallMe] [bit] NOT NULL,
	[EmailMe] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SEMCustomerDetailsPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesRightsAssociation]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesRightsAssociation](
	[RolesFK] [int] NOT NULL,
	[RightsFK] [int] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[IsReadonly] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolesFK] ASC,
	[RightsFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 05/14/2012 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Address1] [nvarchar](150) NOT NULL,
	[Address2] [nvarchar](150) NULL,
	[City] [nvarchar](100) NOT NULL,
	[StateAbbrFK] [int] NOT NULL,
	[ZipCode] [nvarchar](15) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddTask]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTask]
(
	@ServiceName varchar(100),
	@MethodName varchar(50),
	@Parameters varchar(2500),
	@ID int output
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	
	
	insert into Task(ServiceName,MethodName,[Parameters])
		values (@ServiceName,@MethodName,@Parameters)
	set @ID = @@IDENTITY
	return @ID
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerPK] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[TotalTargetCycleBudget] [money] NOT NULL,
	[ProductGroupCycleTypeFK] [int] NOT NULL,
	[BillTypeFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[PhonePK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Phone] [nvarchar](25) NOT NULL,
	[Extension] [nvarchar](10) NULL,
	[PhoneTypeFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhonePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[ProductGroupPK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[ProductGroupName] [nvarchar](50) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[ProductGroupPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisingEngineAccount]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingEngineAccount](
	[AdvertisingEngineAccountPK] [bigint] NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
	[CustomerFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineAccountPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The PK comes from Google/MSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEngineAccount'
GO
/****** Object:  Table [dbo].[CustomerStyle]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerStyle](
	[CustomerFK] [int] NOT NULL,
	[CustomerLogo] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPhoneAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPhoneAssociation](
	[CustomerFK] [int] NOT NULL,
	[PhoneFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerFK] ASC,
	[PhoneFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerNotes]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerNotes](
	[NotePK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFK] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditedDate] [datetime] NULL,
	[Note] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerHierarchy]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerHierarchy](
	[CustomerHierarchyPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[CustomerParentFK] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CustomerHierarchy] PRIMARY KEY CLUSTERED 
(
	[CustomerHierarchyPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UNI_CustomerHierarchy_2] UNIQUE NONCLUSTERED 
(
	[CustomerFK] ASC,
	[CustomerParentFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddressAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddressAssociation](
	[AddressFK] [int] NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[AddressTypeFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CustomerAddressAssociation] PRIMARY KEY CLUSTERED 
(
	[AddressFK] ASC,
	[CustomerFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRigtsRolesInteraction]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRigtsRolesInteraction]
	-- Add the parameters for the stored procedure here
	 @roleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
  ra.RolesFK, ri.Controller, ri.Label, ra.IsVisible, ra.IsReadonly, ri.RightsPK
FROM rights ri
left outer JOIN (select rolesfk,rightsfk, isvisible, isreadonly from RolesRightsAssociation where rolesfk=@roleId) ra ON ri.RightsPK = ra.RightsFK

END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerFK] [int] NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[MiddleInitial] [nchar](1) NULL,
	[IsRegistered] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[TransactionHistoryPK] [int] IDENTITY(1,1) NOT NULL,
	[UserFK] [int] NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[TableName] [nvarchar](40) NOT NULL,
	[Field] [nvarchar](75) NOT NULL,
	[OldValue] [nvarchar](100) NOT NULL,
	[NewValue] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionHistoryPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRolesAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesAssociation](
	[UserRolesAssociationPK] [int] IDENTITY(1,1) NOT NULL,
	[UsersFK] [int] NOT NULL,
	[RolesFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRolesAssociationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IND_UserRolesAssociation_2] ON [dbo].[UserRolesAssociation] 
(
	[UsersFK] ASC,
	[RolesFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spGetProductGroup]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProductGroup]

@CustomerId INT

AS
BEGIN
	SELECT * FROM productGroup WHERE CustomerFK = @CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[AddAdvertisingEngineAccount]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - add new AdvertisingEngineAccount					|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddAdvertisingEngineAccount]
(
	@AdvertisingEngineAccountID bigint,
	@AdvertisingEngine nvarchar(50),
	@CustomerID int
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @AdEngineID INT
	IF NOT EXISTS (select 1 from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine)
	BEGIN
		SELECT @ErrMsg = 'The Advertising Engine was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	IF NOT EXISTS (select 1 from Customer c where c.CustomerPK = @CustomerID)
	BEGIN
		SELECT @ErrMsg = 'The Customer was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	IF EXISTS (select 1 from AdvertisingEngineAccount ac where ac.AdvertisingEngineAccountPK = @AdvertisingEngineAccountID)
	BEGIN
		SELECT @ErrMsg = 'The AdvertisingEngineAccount already Exists.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--get Ad Engine ID
	select @AdEngineID = a.AdvertisingEnginePK from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine
	--Add Ad Engine's ID to Customer
	insert into AdvertisingEngineAccount(AdvertisingEngineAccountPK,AdvertisingEngineFK,CustomerFK)
		VALUES (@AdvertisingEngineAccountID,@AdEngineID,@CustomerID)
		
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeePK] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeFK] [int] NOT NULL,
	[UsersFK] [int] NOT NULL,
	[ReportingTo] [int] NULL,
	[HireDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmployeeTypeFK] ASC,
	[UsersFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[CredentialPK] [int] IDENTITY(1,1) NOT NULL,
	[UsersFK] [int] NOT NULL,
	[Username] [nvarchar](300) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RememberMe] [bit] NOT NULL,
	[SecurityQuestion] [nvarchar](500) NULL,
	[SecurityAnswer] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CredentialPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Error]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[ErrorPK] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[ErrorID] [int] NULL,
	[UsersFK] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductGroupFK] [int] NOT NULL,
	[PromotionName] [nvarchar](150) NOT NULL,
	[PromotionDescription] [nvarchar](2000) NOT NULL,
	[PromotionStartDate] [datetime2](7) NOT NULL,
	[PromotionEndDate] [datetime2](7) NULL,
	[LandingPageURL] [nvarchar](35) NOT NULL,
	[PromotionBudgetAmount] [money] NOT NULL,
	[BudgetCycleFK] [int] NOT NULL,
	[CycleStartDate] [datetime2](7) NULL,
	[CycleEndDate] [datetime2](7) NULL,
	[StartBudgetInCycle] [money] NULL,
	[RemainingBudgetInCycle] [money] NULL,
	[BudgetToAddToNextCycle] [money] NULL,
	[BudgetToAddDate] [datetime2](7) NULL,
	[IsPaused] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsLaunched] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[SchedulePK] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleName] [nvarchar](100) NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[FrequencyFK] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsInactive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedBy] [int] NOT NULL,
	[EditedDate] [datetime2](7) NULL,
	[PromotionFK] [int] NULL,
	[CustomerFK] [int] NULL,
	[ProductGroupFK] [int] NULL,
	[UsersFK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SchedulePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionKeywordAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionKeywordAssociation](
	[KeywordFK] [int] NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsNegative] [bit] NOT NULL,
	[SemplestProbability] [float] NULL,
	[IsTargetMSN] [bit] NOT NULL,
	[IsTargetGoogle] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordFK] ASC,
	[PromotionFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionAds]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionAds](
	[PromotionAdsPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[AdTitle] [nvarchar](25) NOT NULL,
	[AdTextLine1] [nvarchar](35) NOT NULL,
	[AdTextLine2] [nvarchar](35) NULL,
 CONSTRAINT [PK__Promotio__065595E46D0D32F4] PRIMARY KEY CLUSTERED 
(
	[PromotionAdsPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Each AdGroup has 1 or more Ads' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionAds'
GO
/****** Object:  Table [dbo].[PromotionAdEngineSelected]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionAdEngineSelected](
	[PromotionAdEngineSelectedPK] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
	[PromotionFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionAdEngineSelectedPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IND_PromotionAdEngineSelected_2] ON [dbo].[PromotionAdEngineSelected] 
(
	[AdvertisingEngineFK] ASC,
	[PromotionFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeywordCategory]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeywordCategory](
	[KeywordCategoryPK] [int] IDENTITY(1,1) NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[KeywordCategory] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordCategoryPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoTargeting]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoTargeting](
	[GeoTargetingPK] [int] IDENTITY(1,1) NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](100) NULL,
	[StateCodeFK] [int] NULL,
	[Zip] [nvarchar](15) NULL,
	[Longitude] [decimal](18, 5) NULL,
	[Latitude] [decimal](18, 5) NULL,
	[ProximityRadius] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[GeoTargetingPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePhoneAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePhoneAssociation](
	[PhoneFK] [int] NOT NULL,
	[EmployeeFK] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeCustomerAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeCustomerAssociation](
	[EmployeeCustomerAssociationPK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[EmployeeFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeCustomerAssociationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IND_EmployeeCustomerAssociation_2] ON [dbo].[EmployeeCustomerAssociation] 
(
	[CustomerFK] ASC,
	[EmployeeFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisingEnginePromotion]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingEnginePromotion](
	[AdvertisingEngineCampaignPK] [bigint] NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[AdvertisingEngineAccountFK] [bigint] NOT NULL,
	[IsSearchNetwork] [bit] NOT NULL,
	[IsDisplayNetwork] [bit] NOT NULL,
	[AdvertisingEngineBudget] [money] NOT NULL,
	[MicroDefaultBid] [int] NOT NULL,
	[AdvertisingEngineAdGroupID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineCampaignPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The PK comes from Google/MSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEnginePromotion'
GO
/****** Object:  Table [dbo].[TargetedDailyBudget]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TargetedDailyBudget](
	[TargetedDailyBudgetPK] [int] IDENTITY(1,1) NOT NULL,
	[TargetedDailyMicroBudget] [bigint] NOT NULL,
	[TargetedDailyClicks] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TargetedDailyBudgetPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteLinks]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteLinks](
	[SiteLInkPK] [int] IDENTITY(1,1) NOT NULL,
	[PromotionAdsFK] [int] NOT NULL,
	[LinkText] [nvarchar](35) NOT NULL,
	[LinkURL] [nvarchar](1024) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteLInkPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleJob]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleJob](
	[ScheduleJobPK] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleFK] [int] NOT NULL,
	[ExecutionStartTime] [datetime2](7) NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleJobPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleTaskAssociation]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTaskAssociation](
	[TaskFK] [int] NOT NULL,
	[ScheduleFK] [int] NOT NULL,
	[TaskExecutionOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskFK] ASC,
	[ScheduleFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddSchedule]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - add new schedule					|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddSchedule]
(
	@ScheduleName varchar(100),
	@StartTime DateTime2,
	@EndDate Datetime2 = null,
	@Frequency varchar(25),
	@IsEnabled bit,
	@IsInactive bit,
	@PromotionFK int = null,
	@CustomerFK int = null,
	@ProductGroupFK int = null,
	@UsersFK int = null,
	@ID int output
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	declare @freqID int;
	select @freqID = f.FrequencyPK from Frequency f where f.Frequency = @Frequency 
	if (@freqID is not null)
	begin
	
		insert into Schedule(ScheduleName,StartTime,EndDate,FrequencyFK,IsEnabled,IsInactive,PromotionFK,CustomerFK,ProductGroupFK,UsersFK, CreatedDate)
		values (@ScheduleName,@StartTime,@EndDate,@freqID,@IsEnabled,@IsInactive,@PromotionFK,@CustomerFK,@ProductGroupFK,@UsersFK, CURRENT_TIMESTAMP)
		set @ID = @@IDENTITY
		return @ID
	END
	
	return null;
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[AdvertisingEngineAds]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingEngineAds](
	[AdvertisingEngineAdPK] [bigint] NOT NULL,
	[PromotionAdsFK] [int] NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineAdPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AdvertisingEngineAdPK comes from Ad Engine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEngineAds'
GO
/****** Object:  StoredProcedure [dbo].[AddAdvertisingEnginePromotion]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - add new AdvertisingEnginePromotion					|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddAdvertisingEnginePromotion]
(
	@AdvertisingEngineAccountID bigint,
	@AdvertisingEngineCampaignID bigint,
	@PromotionID int,
	@IsSearchNetwork bit = 1,
	@IsDisplayNetwork bit = 0,
	@AdvertisingEngineBudget money = 0
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	IF NOT EXISTS (select 1 from AdvertisingEngineAccount a where a.AdvertisingEngineAccountPK = @AdvertisingEngineAccountID)
	BEGIN
		SELECT @ErrMsg = 'The AdvertisingEngineAccountPK was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	IF NOT EXISTS (select 1 from Promotion p where p.PromotionPK = @PromotionID)
	BEGIN
		SELECT @ErrMsg = 'The PromotionPK was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	if EXISTS (Select * from AdvertisingEnginePromotion ap where ap.AdvertisingEngineCampaignPK = @AdvertisingEngineCampaignID and ap.PromotionFK = @PromotionID)
	BEGIN
		update AdvertisingEnginePromotion set IsSearchNetwork = @IsSearchNetwork, IsDisplayNetwork = @IsDisplayNetwork,
			AdvertisingEngineBudget = @AdvertisingEngineBudget
		from AdvertisingEnginePromotion ap 
		where ap.AdvertisingEngineAccountFK = @AdvertisingEngineAccountID and ap.AdvertisingEngineCampaignPK = @AdvertisingEngineCampaignID	and ap.PromotionFK=@PromotionID
	
	END
	else --add new 
	BEGIN
		INSERT INTO AdvertisingEnginePromotion(AdvertisingEngineAccountFK,AdvertisingEngineCampaignPK,PromotionFK,IsSearchNetwork,IsDisplayNetwork,AdvertisingEngineBudget)
		VALUES (@AdvertisingEngineAccountID,@AdvertisingEngineCampaignID,@PromotionID, @IsSearchNetwork,@IsDisplayNetwork,@AdvertisingEngineBudget)
	
	END
		
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[GetKeywordForAdEngine]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[GetKeywordForAdEngine]
(
	@PromotionPK            INT,
	@IsTargetGoogle bit = 0,
	@IsTargetMSN bit = 0
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)

	--validate data
	IF NOT EXISTS (select * from Promotion p where p.PromotionPK =@PromotionPK)
	BEGIN
		SELECT @ErrMsg = 'The Promotion was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--get general info
	
	select k.Keyword, pka.IsTargetGoogle, pka.IsTargetMSN, pka.IsActive, pka.IsDeleted, pka.IsNegative, pka.SemplestProbability
	from Promotion p 
	inner join PromotionKeywordAssociation pka on pka.PromotionFK = p.PromotionPK
	inner join Keyword k on k.KeywordPK = pka.KeywordFK
	where p.PromotionPK = @PromotionPK and (pka.IsTargetGoogle = @IsTargetGoogle or pka.IsTargetMSN = @IsTargetMSN)	 
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[GetAllPromotionData]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[GetAllPromotionData]
(
	@PromotionPK            INT
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)

	--validate data
	IF NOT EXISTS (select * from Promotion p where p.PromotionPK =@PromotionPK)
	BEGIN
		SELECT @ErrMsg = 'The Promotion was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--get general info
	select p.PromotionPK,p.ProductGroupFK,p.PromotionName,p.PromotionDescription,p.LandingPageURL,
		p.PromotionBudgetAmount,p.PromotionStartDate, p.PromotionEndDate,bc.BudgetCycle,
		p.BudgetToAddToNextCycle,p.CycleStartDate,
		p.RemainingBudgetInCycle,p.StartBudgetInCycle,
		p.EditedDate, p.IsLaunched, p.IsCompleted,p.IsPaused,p.CreatedDate, aep.AdvertisingEngineCampaignPK, aep.AdvertisingEngineAdGroupID , aea.AdvertisingEngineAccountPK
		from Promotion p 
		inner join BudgetCycle bc on bc.BudgetCyclePK = p.BudgetCycleFK
		left join AdvertisingEnginePromotion aep on aep.PromotionFK = p.PromotionPK
		left join AdvertisingEngineAccount aea on aea.AdvertisingEngineAccountPK = aep.AdvertisingEngineAccountFK
		where p.PromotionPK  = @PromotionPK
		--get ADs
		select pa.PromotionAdsPK,pa.PromotionFK,  pa.AdTitle, pa.AdTextLine1, pa.AdTextLine2 from Promotion p
		inner join PromotionAds pa on pa.PromotionFK = p.PromotionPK
		where p.PromotionPK = @PromotionPK
		--get Geotargeting
		select gt.Address, gt.City,st.StateAbbr [State], gt.Zip, gt.Latitude, gt.Longitude,gt.ProximityRadius [Radius] from Promotion p 
		inner join GeoTargeting gt on gt.PromotionFK = p.PromotionPK
		inner join StateCode st on st.StateAbbrPK = gt.StateCodeFK
		where p.PromotionPK = @PromotionPK			 
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[GetAdvertisingEnginePromotion]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - add new AdvertisingEnginePromotion					|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[GetAdvertisingEnginePromotion]
(
	@AdvertisingEngineAccountID varchar(30)
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	IF NOT EXISTS (select 1 from AdvertisingEngineAccount a where a.AdvertisingEngineAccountPK = @AdvertisingEngineAccountID)
	BEGIN
		SELECT @ErrMsg = 'The AdvertisingEngineAccountPK was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	
	Select ap.AdvertisingEngineAccountFK,ap.AdvertisingEngineCampaignPK,ap.PromotionFK,
		 ap.IsSearchNetwork,ap.IsDisplayNetwork,ap.AdvertisingEngineBudget 
		 from AdvertisingEnginePromotion ap where ap.AdvertisingEngineAccountFK = @AdvertisingEngineAccountID 
		
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[KeywordBid]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KeywordBid](
	[KeywordBidPK] [int] IDENTITY(1,1) NOT NULL,
	[KeywordFK] [int] NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[BidTypeFK] [int] NOT NULL,
	[MicroBidAmount] [int] NOT NULL,
	[KeywordAdEngineID] [bigint] NULL,
	[CompetitionType] [varchar](20) NULL,
	[IsDefaultValue] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordBidPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'KeywordAdEngineID comes from Ad Engine. Contains keyword Bids over time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeywordBid'
GO
/****** Object:  Table [dbo].[KeywordBidData]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KeywordBidData](
	[KeywordBidDataPK] [int] IDENTITY(1,1) NOT NULL,
	[QualityScore] [int] NULL,
	[ApprovalStatus] [varchar](30) NULL,
	[FirstPageMicroCPC] [int] NULL,
	[IsEligibleForShowing] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[KeywordBidFK] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetNextJobToRun]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - Get Next Time to Run						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[GetNextJobToRun]

AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	--Get the next Job to run
	SELECT job.ScheduleJobPK, job.ScheduleFK, job.ExecutionStartTime from ScheduleJob job
	INNER JOIN
	 (SELECT top 1 sj.ScheduleJobPK,MIN(sj.ExecutionStartTime) [MinDate] from ScheduleJob sj where sj.IsComplete = 0
		Group by sj.ScheduleJobPK) topJob on topJob.ScheduleJobPK = job.ScheduleJobPK
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[AdvertisingEngineReportData]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvertisingEngineReportData](
	[AdvertisingEngineBidDataPK] [int] IDENTITY(1,1) NOT NULL,
	[KeywordBidFK] [int] NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[MicroBidAmount] [int] NOT NULL,
	[NumberImpressions] [int] NOT NULL,
	[NumberClick] [int] NOT NULL,
	[AveragePosition] [int] NOT NULL,
	[AverageCPC] [money] NOT NULL,
	[BidTypeFK] [int] NULL,
	[QualityScore] [int] NULL,
	[ApprovalStatus] [varchar](30) NULL,
	[FirstPageMicroCPC] [int] NULL,
	[MicroCost] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineBidDataPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique key is keyword and transactionDAte ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEngineReportData'
GO
/****** Object:  StoredProcedure [dbo].[AddScheduleJob]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - add new schedule					|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddScheduleJob]
(
	@ScheduleFK int,
	@ExecutionStartTime datetime2,
	@ID int output
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	
	
	insert into ScheduleJob(ScheduleFK,ExecutionStartTime,IsComplete,IsSuccessful,CreatedDate)
		values (@ScheduleFK,@ExecutionStartTime,0,0, CURRENT_TIMESTAMP)
	set @ID = @@IDENTITY
	return @ID
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[TrafficEstimator]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafficEstimator](
	[TrafficEstimatorPK] [int] IDENTITY(1,1) NOT NULL,
	[KeywordBidFK] [int] NULL,
	[MicroBid] [int] NOT NULL,
	[AveMicroCost] [float] NOT NULL,
	[AveNumberClicks] [float] NOT NULL,
	[AvePosition] [float] NULL,
	[AveCPC] [float] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrafficEstimatorPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleLog]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleLog](
	[ScheduleLogPK] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleJobFK] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[ErrorMessage] [nvarchar](500) NULL,
	[IsComplete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleLogPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SetNextJobToRun]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - ScheduleID																							|
-- | Purpose - Update Schedule and Get Next Time to Run						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[SetNextJobToRun]

AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	
	--Get the next Job to run
	SELECT job.ScheduleJobPK, job.ScheduleFK, job.ExecutionStartTime from ScheduleJob job
	INNER JOIN
	 (SELECT top 1 sj.ScheduleJobPK,MIN(sj.ExecutionStartTime) [MinDate] from ScheduleJob sj where sj.IsComplete = 0
		Group by sj.ScheduleJobPK) topJob on topJob.ScheduleJobPK = job.ScheduleJobPK
	
END TRY
BEGIN CATCH
 IF XACT_STATE() != 0 OR @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[SetBidObject]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[SetBidObject]
(
	@PromotionPK            INT,
	@KeywordAdEngineID      BIGINT,
	@Keyword				NVARCHAR(250),
	@MicroBidAmount			INT,
	@BidType				VARCHAR(25),
	@AdvertisingEngine		VARCHAR(50),
	@IsNegative				bit = 1,
	@ID int output
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @currentMicroBidAmt int, @keywordBidPK int, @currentTime datetime2, @BidTypeID int, 
			@AdEngineID int,@keywordPK int

	--validate data
	--AdEngine
	IF NOT EXISTS (select * from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine)
	BEGIN
		SELECT @ErrMsg = 'The Advertising Engine was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--BidType
	IF NOT EXISTS (select * from BidType bt where bt.BidType = @BidType)
	BEGIN
		SELECT @ErrMsg = 'The Bid Type was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	if not exists (select * from Keyword k where k.Keyword = @Keyword)
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword does not exist'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--check to see if keyword is active and not deleted for the promo
	if EXISTS (select * from PromotionKeywordAssociation pka
				inner join Keyword k on k.KeywordPK = pka.KeywordFK
				where k.Keyword = @Keyword and (pka.IsActive = 0 OR pka.IsDeleted = 1))
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword is either Inactive or Deleted for the Promotion'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;			
	select @AdEngineID = a.AdvertisingEnginePK from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine
	select @BidTypeID = bt.BidTypePK from BidType bt where bt.BidType = @BidType
	if (@IsNegative = 1)
	BEGIN
		SET @MicroBidAmount = 0
	END	
	SET @currentTime = CURRENT_TIMESTAMP
	
	BEGIN TRANSACTION
	--Check to see if this keyword is already bid on for the AdEngine and BidType	
	if exists (select * from PromotionKeywordAssociation pka
				inner join Keyword k on k.KeywordPK = pka.KeywordFK
				inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
				inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK
				where pka.PromotionFK = @PromotionPK and a.AdvertisingEnginePK = @AdEngineID 
					 and kb.BidTypeFK = @BidTypeID
					 and (k.Keyword = @Keyword or kb.KeywordAdEngineID = @KeywordAdEngineID))
	BEGIN
		
		select @currentMicroBidAmt = kb.MicroBidAmount, @keywordBidPK = kb.KeywordBidPK , @keywordPK = kb.KeywordFK
			from PromotionKeywordAssociation pka
					inner join Keyword k on k.KeywordPK = pka.KeywordFK
					inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
					inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK
					where pka.PromotionFK = @PromotionPK and pka.IsActive = 1 and a.AdvertisingEnginePK = @AdEngineID
						 and kb.BidTypeFK = @BidTypeID
						 and (k.Keyword = @Keyword or kb.KeywordAdEngineID = @KeywordAdEngineID)
		
			if (@MicroBidAmount != @currentMicroBidAmt)
			BEGIN
				 --update the last bid with an end Date and set inactive
				 UPDATE KeywordBid set EndDate = @currentTime, IsActive = 0 WHERE KeywordBidPK = @keywordBidPK
				 --add new active keyword bid
				 INSERT INTO KeywordBid(KeywordFK,AdvertisingEngineFK,PromotionFK,StartDate,EndDate,IsActive,BidTypeFK,MicroBidAmount,KeywordAdEngineID)
				 select kb.KeywordFK,kb.AdvertisingEngineFK,kb.PromotionFK,@currentTime,null,1,@BidTypeID,@MicroBidAmount,@KeywordAdEngineID
					from KeywordBid kb where kb.KeywordBidPK = @keywordBidPK
				SET @keywordBidPK = @@IDENTITY	 
				--make sure the associaition is active
				update PromotionKeywordAssociation set IsActive = 1 where PromotionFK = @PromotionPK and KeywordFK = @keywordPK	
			END		 
	END	
	
	ELSE --New Bid on Keyword
	  BEGIN
			--create the keyword bid
			select @keywordPK = k.KeywordPK from Keyword k where k.Keyword = @Keyword
			insert into KeywordBid(KeywordFK,AdvertisingEngineFK,PromotionFK,StartDate,EndDate,IsActive,BidTypeFK,MicroBidAmount,KeywordAdEngineID)
				VALUES (@keywordPK,@AdEngineID,@PromotionPK,@currentTime,null,1,@BidTypeID,@MicroBidAmount,@KeywordAdEngineID)
			SET @keywordBidPK = @@IDENTITY	
	  END
	   		
	COMMIT TRANSACTION	
	
	RETURN 	@keywordBidPK			 
	
END TRY
BEGIN CATCH
 IF XACT_STATE() != 0 OR @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDefaultBidForKeywords]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[UpdateDefaultBidForKeywords]
(
	@PromotionPK            INT,
	@AdvertisingEngine		VARCHAR(50)
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @MicroDefaultBid bigint

	--validate data
	--AdEngine
	IF NOT EXISTS (select * from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine)
	BEGIN
		SELECT @ErrMsg = 'The Advertising Engine was not found.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	select @MicroDefaultBid = aep.MicroDefaultBid from AdvertisingEnginePromotion aep
	inner join AdvertisingEngineAccount aea on aea.AdvertisingEngineAccountPK = aep.AdvertisingEngineAccountFK
	inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = aea.AdvertisingEngineFK
	where ae.AdvertisingEngine = @AdvertisingEngine and aep.PromotionFK = @PromotionPK
	
	update KeywordBid set MicroBidAmount = @MicroDefaultBid
	from KeywordBid kb 
	inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK
	where kb.PromotionFK = @PromotionPK and  ae.AdvertisingEngine = @AdvertisingEngine and kb.IsDefaultValue = 1 and kb.MicroBidAmount != -1
		 
	
END TRY
BEGIN CATCH
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[spBindChart]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBindChart]

AS
BEGIN


	SELECT  CONVERT(VARCHAR,TransactionDate,107) AS TransactionDate,SUM(NumberImpressions) AS NumberImpressions,SUM(NumberClick) AS NumberClick
	FROM advertisingEngineReportdata
	INNER JOIN Keywordbid ON advertisingEngineReportdata.KeywordBidFK = Keywordbid.KeywordBidPK
	WHERE AdvertisingEngineFK = 2
	GROUP BY CONVERT(VARCHAR,TransactionDate,107)

END
GO
/****** Object:  StoredProcedure [dbo].[SetScheduleJobComplete]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - ScheduleID																							|
-- | Purpose - Update Schedule and Get Next Time to Run						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[SetScheduleJobComplete]
(
	@ScheduleJobID			INT,
	@IsSuccessful			BIT,
	@ErrorMessage varchar(500)
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	BEGIN TRANSACTION
	-- put result in log
    insert into dbo.ScheduleLog(ScheduleJobFK,IsSuccessful,DateCreated,ErrorMessage,IsComplete) 
		values (@ScheduleJobID,@IsSuccessful,CURRENT_TIMESTAMP,@ErrorMessage,1) 
	--update the Job
	UPDATE ScheduleJob SET IsComplete = 1, IsSuccessful= @IsSuccessful, EditedDate = CURRENT_TIMESTAMP
		where ScheduleJobPK = @ScheduleJobID	
		


	--Get the schedule parameters
	DECLARE @StartDateTime				DATETIME, 
			@Frequency					VARCHAR(15)
	
	
	--get Frequency of schedule
	SELECT @Frequency = f.Frequency
	FROM dbo.Schedule s
	inner join ScheduleJob sj on sj.ScheduleFK = s.SchedulePK
	INNER JOIN dbo.Frequency f on f.FrequencyPK = s.FrequencyFK
	WHERE sj.ScheduleJobPK = @ScheduleJobID;
	
	--Check to see if we need to add a new Job
	IF @Frequency IS NOT NULL
	BEGIN
		IF @Frequency NOT IN ('Now')
		BEGIN
			--Get The Start of the completed job 
			SELECT @StartDateTime = s.ExecutionStartTime
			FROM dbo.ScheduleJob s
			WHERE s.ScheduleJobPK = @ScheduleJobID;
			
			DECLARE @NextTimeToRun DATETIME2;
			SELECT @NextTimeToRun = dbo.GetNextScheduleTime(@StartDateTime, @Frequency);
																			
			--Add next job to run
			INSERT INTO ScheduleJob(ScheduleFK,IsComplete,IsSuccessful,ExecutionStartTime, CreatedDate)
			SELECT sj.ScheduleFK,0,0,@NextTimeToRun, CURRENT_TIMESTAMP FROM ScheduleJob sj 
				inner join Schedule s on s.SchedulePK = sj.ScheduleFK 
			where sj.ScheduleJobPK = @ScheduleJobID and (s.EndDate is null or @NextTimeToRun <= s.EndDate)	
			
		END
	END
	--Get the next Job to run
	DECLARE @nextJobTable TABLE(ScheduleJobPK INT, ScheduleFK INT, ExecutionStartTime DATETIME2)
	insert into @nextJobTable(ScheduleJobPK,ScheduleFK,ExecutionStartTime) EXECUTE GetNextJobToRun
	select r.ScheduleJobPK, r.ScheduleFK, r.ExecutionStartTime from @nextJobTable r
	
	COMMIT TRANSACTION	
	
	
END TRY
BEGIN CATCH
 IF XACT_STATE() != 0 OR @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[SetReportObject]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[SetReportObject]
(

	@AccountID			BIGINT,
	@CampaignID        BIGINT,
	@Keyword				NVARCHAR(250),
	@TransactionDate        datetime2,
	@MicroBidAmount			INT,
	@BidMatchType				VARCHAR(25),
	@NumberImpressions		INT,
	@NumberClick			INT,
	@AveragePosition		FLOAT,
	@AverageCPC				FLOAT,
	@QualityScore           INT = null,
	@ApprovalStatus			VARCHAR(30) = null,
	@FirstPageMicroCpc      INT = null,
	@MicroCost				bigint
	
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @keywordBidPK int, @currentTime datetime2, @BidTypeID int, 
			@AdEngineID int,@keywordPK int
		 
	-- get the keyword bid PK
	select @keywordBidPK = kb.KeywordBidPK, @AdEngineID = a.AdvertisingEngineFK from AdvertisingEngineAccount a
	inner join AdvertisingEnginePromotion ap on a.AdvertisingEngineAccountPK = ap.AdvertisingEngineAccountFK
	inner join KeywordBid kb on kb.PromotionFK = ap.PromotionFK
	inner join BidType bt on bt.BidTypePK = kb.BidTypeFK
	inner join Keyword k on k.KeywordPK = kb.KeywordFK 
	where a.AdvertisingEngineAccountPK = @AccountID and ap.AdvertisingEngineCampaignPK = @CampaignID 
		and k.Keyword =@Keyword
	if (@keywordBidPK is null)
	BEGIN
		SELECT @ErrMsg = 'The Keyword Bid was not found for keyword.'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;
	--insert the report data
	INSERT INTO AdvertisingEngineReportData(KeywordBidFK,TransactionDate,MicroBidAmount, NumberImpressions,NumberClick,AveragePosition,AverageCPC,BidTypeFK,
				QualityScore,ApprovalStatus,FirstPageMicroCPC, MicroCost,CreatedDate)
		VALUES(@keywordBidPK, @TransactionDate,@MicroBidAmount,@NumberImpressions,@NumberClick,@AveragePosition,@AverageCPC,@BidTypeID,
				@QualityScore,@ApprovalStatus,@FirstPageMicroCpc,@MicroCost,CURRENT_TIMESTAMP)		
	
END TRY
BEGIN CATCH

	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddTrafficEstimator]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddTrafficEstimator]
(

	@PromotionID			INT,
	@Keyword				NVARCHAR(250),
	@AdvertisingEngine		VARCHAR(50),
	@BidType				VARCHAR(25),
	@MicroBid				INT ,
	@AveMicroCost			float,
	@AveNumberClicks		float,
	@AvePosition			float,
	@AveCPC					float
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @keywordBidPK int, @currentTime datetime2, @BidTypeID int, 
			@AdEngineID int,@keywordPK int
	-- make sure keyword is in promotion
	if not exists (select * from PromotionKeywordAssociation pka inner join Keyword k on k.KeywordPK = pka.KeywordFK
					where k.Keyword = @Keyword and pka.PromotionFK = @PromotionID)
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword does not exist for the Promotion'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;	
	set @currentTime = CURRENT_TIMESTAMP	
	BEGIN TRANSACTION		
	--check to see if the KeywordBid Exists for the MatchType
	if NOT EXISTS (select * from KeywordBid kb 
					inner join Keyword k on k.KeywordPK = kb.KeywordFK
					inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK
					inner join BidType bt on bt.BidTypePK = kb.BidTypeFK 
					where kb.PromotionFK = @PromotionID and k.Keyword = @Keyword and ae.AdvertisingEngine = @AdvertisingEngine and bt.BidType = @BidType)
	BEGIN
	--add Keyword /matchtype with -1 microbid
		
		select @BidTypeID = bt.BidTypePK from BidType bt where bt.BidType = @BidType 
		select @AdEngineID = ae.AdvertisingEnginePK from AdvertisingEngine ae where ae.AdvertisingEngine = @AdvertisingEngine  
		--
		insert into KeywordBid(KeywordFK,AdvertisingEngineFK,PromotionFK,StartDate,EndDate,IsActive, BidTypeFK, MicroBidAmount, IsDefaultValue, CreatedDate)
			select k.KeywordPK,@AdEngineID,@PromotionID,@currentTime,@currentTime,0,@BidTypeID,-1,0,@currentTime from Keyword k where k.Keyword = @Keyword
		SET @keywordBidPK = @@IDENTITY
		insert into TrafficEstimator(KeywordBidFK, MicroBid, AveMicroCost, AveNumberClicks,AvePosition, AveCPC, CreatedDate)
			VALUES (@keywordBidPK, @MicroBid, @AveMicroCost, @AveNumberClicks, @AvePosition,@AveCPC, @currentTime)
	END	
	ELSE --keywordBid already exists for match type				 
	BEGIN
		select @keywordBidPK = kb.KeywordBidPK from KeywordBid kb 
					inner join Keyword k on k.KeywordPK = kb.KeywordFK
					inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK
					inner join BidType bt on bt.BidTypePK = kb.BidTypeFK 
					where kb.PromotionFK = @PromotionID and k.Keyword = @Keyword and ae.AdvertisingEngine = @AdvertisingEngine and bt.BidType = @BidType
		insert into TrafficEstimator(KeywordBidFK, MicroBid, AveMicroCost, AveNumberClicks,AvePosition, AveCPC, CreatedDate)
			VALUES (@keywordBidPK, @MicroBid, @AveMicroCost, @AveNumberClicks, @AvePosition,@AveCPC, @currentTime)
	END
	
	COMMIT TRANSACTION	
	
END TRY
BEGIN CATCH
 IF XACT_STATE() != 0 OR @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddReportData]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddReportData]
(

	@PromotionID			INT,
	@Keyword				NVARCHAR(250),
	@AdvertisingEngine		VARCHAR(50),
	@TransactionDate		datetime2, 
	@MicroBidAmount			int, 
	@NumberImpressions		int,
	@NumberClick			int, 
	@AveragePosition		int, 
	@AverageCPC				Money, 
	@BidType				VARCHAR(25),
	@QualityScore           INT = null,
	@ApprovalStatus			VARCHAR(30) = null,
	@FirstPageMicroCpc      INT = null,
	@MicroCost				int,
	@ID int output

)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @keywordBidPK int,  @BidTypeID int, 
			@AdEngineID int
	-- make sure keyword is in promotion
	if not exists (select * from PromotionKeywordAssociation pka inner join Keyword k on k.KeywordPK = pka.KeywordFK
					where k.Keyword = @Keyword and pka.PromotionFK = @PromotionID)
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword does not exist for the Promotion'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;	
	set @ID = 0
	select @BidTypeID = bt.BidTypePK from BidType bt where bt.BidType = @BidType 
	select @AdEngineID = ae.AdvertisingEnginePK from AdvertisingEngine ae where ae.AdvertisingEngine = @AdvertisingEngine		
	--check to see if the KeywordBid Exists for the MatchType
	select @keywordBidPK = kb.KeywordBidPK from PromotionKeywordAssociation pka
		inner join Keyword k on k.KeywordPK = pka.KeywordFK
		inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
		where kb.PromotionFK = @PromotionID and kb.AdvertisingEngineFK = @AdEngineID and k.Keyword = @Keyword and kb.BidTypeFK = @BidTypeID
		
	if (@keywordBidPK is null)
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword has not been bid on for the Promotion'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;	
	--ADD ONLY IF THE TRANSACTION DOES NOT EXIST
	if not exists (select * from AdvertisingEngineReportData aerd where aerd.KeywordBidFK = @keywordBidPK and aerd.TransactionDate = @TransactionDate)
	BEGIN
		insert into AdvertisingEngineReportData(KeywordBidFK, TransactionDate, MicroBidAmount, NumberImpressions, NumberClick, 
			AveragePosition, AverageCPC, BidTypeFK, QualityScore,ApprovalStatus, FirstPageMicroCPC, MicroCost, CreatedDate)
			VALUES (@keywordBidPK, @TransactionDate, @MicroBidAmount,@NumberImpressions, @NumberClick, @AveragePosition, @AverageCPC, @BidTypeID, @QualityScore, @ApprovalStatus,
			@FirstPageMicroCpc,@MicroCost,CURRENT_TIMESTAMP)
		set @ID = @@IDENTITY		
	END		
	
		  
	
	
END TRY
BEGIN CATCH
 
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddKeywordBidData]    Script Date: 05/14/2012 14:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- +----------------------------------------------------------------------------------------------------------------+
-- | Author  - Mitch                                                                                                |
-- | Written - 4/20/2012																							|
-- | Parms   - 																							|
-- | Purpose - 						|
-- +----------------------------------------------------------------------------------------------------------------+

CREATE PROCEDURE [dbo].[AddKeywordBidData]
(

	@PromotionID			INT,
	@Keyword				NVARCHAR(250),
	@AdvertisingEngine		VARCHAR(50),
	@BidType				VARCHAR(25),
	@QualityScore           INT = null,
	@ApprovalStatus			VARCHAR(30) = null,
	@FirstPageMicroCpc      INT = null,
	@IsEligibleForShowing	BIT = 1,
	@ID int output
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250), @keywordBidPK int, @currentTime datetime2, @BidTypeID int, 
			@AdEngineID int,@keywordPK int
	-- make sure keyword is in promotion
	if not exists (select * from PromotionKeywordAssociation pka inner join Keyword k on k.KeywordPK = pka.KeywordFK
					where k.Keyword = @Keyword and pka.PromotionFK = @PromotionID)
	BEGIN
		SELECT @ErrMsg = 'The Selected keyword does not exist for the Promotion'; 
		RAISERROR (@ErrMsg, 16, 1);
	END;	
	set @currentTime = CURRENT_TIMESTAMP
	SET @ID = 0	
	BEGIN TRANSACTION		
	--check to see if the KeywordBid Exists for the MatchType
	if NOT EXISTS (select * from KeywordBid kb 
					inner join Keyword k on k.KeywordPK = kb.KeywordFK
					inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK
					inner join BidType bt on bt.BidTypePK = kb.BidTypeFK 
					where kb.PromotionFK = @PromotionID and k.Keyword = @Keyword and ae.AdvertisingEngine = @AdvertisingEngine and bt.BidType = @BidType)
	BEGIN
	--add Keyword /matchtype with -1 microbid
		
		select @BidTypeID = bt.BidTypePK from BidType bt where bt.BidType = @BidType 
		select @AdEngineID = ae.AdvertisingEnginePK from AdvertisingEngine ae where ae.AdvertisingEngine = @AdvertisingEngine  
		--
		insert into KeywordBid(KeywordFK,AdvertisingEngineFK,PromotionFK,StartDate,EndDate,IsActive, BidTypeFK, MicroBidAmount, IsDefaultValue, CreatedDate)
			select k.KeywordPK,@AdEngineID,@PromotionID,@currentTime,@currentTime,0,@BidTypeID,-1,0,@currentTime from Keyword k where k.Keyword = @Keyword
		SET @keywordBidPK = @@IDENTITY
		insert into KeywordBidData(KeywordBidFK,QualityScore,ApprovalStatus,FirstPageMicroCPC,IsEligibleForShowing,CreatedDate)
			VALUES (@keywordBidPK, @QualityScore, @ApprovalStatus, @FirstPageMicroCpc, @IsEligibleForShowing, @currentTime)
		SET @ID = @@IDENTITY	
	END	
	ELSE --keywordBid already exists for match type				 
	BEGIN
		select @keywordBidPK = kb.KeywordBidPK from KeywordBid kb 
					inner join Keyword k on k.KeywordPK = kb.KeywordFK
					inner join AdvertisingEngine ae on ae.AdvertisingEnginePK = kb.AdvertisingEngineFK
					inner join BidType bt on bt.BidTypePK = kb.BidTypeFK 
					where kb.PromotionFK = @PromotionID and k.Keyword = @Keyword and ae.AdvertisingEngine = @AdvertisingEngine and bt.BidType = @BidType
		insert into KeywordBidData(KeywordBidFK,QualityScore,ApprovalStatus,FirstPageMicroCPC,IsEligibleForShowing,CreatedDate)
			VALUES (@keywordBidPK, @QualityScore, @ApprovalStatus, @FirstPageMicroCpc, @IsEligibleForShowing, @currentTime)
		SET @ID = @@IDENTITY	
	END
	
	COMMIT TRANSACTION	
	return @ID
	
END TRY
BEGIN CATCH
 IF XACT_STATE() != 0 OR @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	DECLARE @ErrMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Default [DF__Keyword__Created__173876EA]    Script Date: 05/14/2012 14:58:42 ******/
ALTER TABLE [dbo].[Keyword] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Configura__Adwor__2B947552]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [AdwordsUseSandbox]
GO
/****** Object:  Default [DF__SEMCustom__CallM__7EF6D905]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('0') FOR [CallMe]
GO
/****** Object:  Default [DF__SEMCustom__Email__7FEAFD3E]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('1') FOR [EmailMe]
GO
/****** Object:  Default [DF__SEMCustom__Creat__00DF2177]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [CreatedDate]
GO
/****** Object:  Default [DF__RolesRigh__IsVis__69FBBC1F]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[RolesRightsAssociation] ADD  DEFAULT ('1') FOR [IsVisible]
GO
/****** Object:  Default [DF__RolesRigh__IsRea__6AEFE058]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[RolesRightsAssociation] ADD  DEFAULT ('1') FOR [IsReadonly]
GO
/****** Object:  Default [DF__Address__Created__4CA06362]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Customer__TotalT__03317E3D]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0.0)) FOR [TotalTargetCycleBudget]
GO
/****** Object:  Default [Default_Create_Constraint]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Default_Create_Constraint]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Phone__CreatedDa__693CA210]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Phone] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [Isactive_default]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [Isactive_default]  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF__ProductGr__Creat__0DAF0CB0]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF__CustomerP__Creat__3493CFA7]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__CustomerH__Creat__1CBC4616]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerHierarchy] ADD  CONSTRAINT [DF__CustomerH__Creat__1CBC4616]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__CustomerA__Creat__22751F6C]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Users__CreatedDa__239E4DCF]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [Default_IsActive]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Default_IsActive]  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF__Users__IsRegiste__25869641]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsRegistered]
GO
/****** Object:  Default [DF__Transacti__Trans__13F1F5EB]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TransactionHistory] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
/****** Object:  Default [DF__Credentia__Remem__19DFD96B]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Credential] ADD  DEFAULT ('0') FOR [RememberMe]
GO
/****** Object:  Default [DF__Error__CreatedDa__498EEC8D]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Error] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Promotion__IsPau__1BFD2C07]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ('0') FOR [IsPaused]
GO
/****** Object:  Default [DF__Promotion__IsCom__1CF15040]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
/****** Object:  Default [DF__Promotion__IsLau__1DE57479]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ((0)) FOR [IsLaunched]
GO
/****** Object:  Default [DF__Promotion__Creat__1ED998B2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [CreatedDate]
GO
/****** Object:  Default [DF__Schedule__IsEnab__403A8C7D]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ('0') FOR [IsEnabled]
GO
/****** Object:  Default [DF__Schedule__IsInac__412EB0B6]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ('0') FOR [IsInactive]
GO
/****** Object:  Default [DF__Schedule__Create__4222D4EF]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
/****** Object:  Default [DF__Schedule__Edited__4316F928]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [EditedBy]
GO
/****** Object:  Default [DF__Promotion__Creat__36B12243]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Promotion__IsAct__37A5467C]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__Promotion__IsDel__38996AB5]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF__Promotion__IsNeg__398D8EEE]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((0)) FOR [IsNegative]
GO
/****** Object:  Default [DF__Promotion__sTarg__67DE6983]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((1)) FOR [IsTargetMSN]
GO
/****** Object:  Default [DF__Promotion__IsTar__68D28DBC]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((1)) FOR [IsTargetGoogle]
GO
/****** Object:  Default [DF__Promotion__AdTex__0FEC5ADD]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionAds] ADD  CONSTRAINT [DF__Promotion__AdTex__0FEC5ADD]  DEFAULT ('') FOR [AdTextLine1]
GO
/****** Object:  Default [DF__EmployeeP__Creat__42E1EEFE]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[EmployeePhoneAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Advertisi__IsSea__753864A1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((1)) FOR [IsSearchNetwork]
GO
/****** Object:  Default [DF__Advertisi__IsDis__762C88DA]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((0)) FOR [IsDisplayNetwork]
GO
/****** Object:  Default [DF__Advertisi__Adver__7720AD13]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((0)) FOR [AdvertisingEngineBudget]
GO
/****** Object:  Default [DF__Advertisi__Micro__7814D14C]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((1000000)) FOR [MicroDefaultBid]
GO
/****** Object:  Default [DF__TargetedD__Targe__5B78929E]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TargetedDailyBudget] ADD  DEFAULT ((0)) FOR [TargetedDailyClicks]
GO
/****** Object:  Default [DF__TargetedD__Creat__5C6CB6D7]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TargetedDailyBudget] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__ScheduleJ__IsSuc__7B5B524B]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT ((0)) FOR [IsSuccessful]
GO
/****** Object:  Default [DF__ScheduleJ__IsCom__7C4F7684]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT ((0)) FOR [IsComplete]
GO
/****** Object:  Default [DF__ScheduleJ__Creat__7D439ABD]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [CreatedDate]
GO
/****** Object:  Default [DF__KeywordBi__IsAct__628FA481]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF__KeywordBi__Micro__6383C8BA]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  DEFAULT ('0.0') FOR [MicroBidAmount]
GO
/****** Object:  Default [DF__KeywordBi__IsDef__27F8EE98]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  DEFAULT ((0)) FOR [IsDefaultValue]
GO
/****** Object:  Default [DF__KeywordBi__Creat__28ED12D1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__KeywordBi__IsEli__2F9A1060]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBidData] ADD  DEFAULT ((1)) FOR [IsEligibleForShowing]
GO
/****** Object:  Default [DF__KeywordBi__Creat__308E3499]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBidData] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Advertisi__Creat__6319B466]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineReportData] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__ScheduleL__DateC__719CDDE7]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [DateCreated]
GO
/****** Object:  Default [DF__ScheduleL__IsSuc__72910220]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ('0') FOR [IsSuccessful]
GO
/****** Object:  Default [DF__ScheduleL__IsCom__73852659]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ((0)) FOR [IsComplete]
GO
/****** Object:  ForeignKey [REL_Rights_RolesRightsAssociation_2]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[RolesRightsAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Rights_RolesRightsAssociation_2] FOREIGN KEY([RightsFK])
REFERENCES [dbo].[Rights] ([RightsPK])
GO
ALTER TABLE [dbo].[RolesRightsAssociation] CHECK CONSTRAINT [REL_Rights_RolesRightsAssociation_2]
GO
/****** Object:  ForeignKey [REL_Roles_RolesRightsAssociation_1]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[RolesRightsAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Roles_RolesRightsAssociation_1] FOREIGN KEY([RolesFK])
REFERENCES [dbo].[Roles] ([RolePK])
GO
ALTER TABLE [dbo].[RolesRightsAssociation] CHECK CONSTRAINT [REL_Roles_RolesRightsAssociation_1]
GO
/****** Object:  ForeignKey [Address_StateCode]    Script Date: 05/14/2012 14:58:43 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [Address_StateCode] FOREIGN KEY([StateAbbrFK])
REFERENCES [dbo].[StateCode] ([StateAbbrPK])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [Address_StateCode]
GO
/****** Object:  ForeignKey [cycType_Relation]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [cycType_Relation] FOREIGN KEY([ProductGroupCycleTypeFK])
REFERENCES [dbo].[ProductGroupCycleType] ([ProductGroupCycleTypePK])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [cycType_Relation]
GO
/****** Object:  ForeignKey [REL_BillType_Customer_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [REL_BillType_Customer_1] FOREIGN KEY([BillTypeFK])
REFERENCES [dbo].[BillType] ([BillTypePK])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [REL_BillType_Customer_1]
GO
/****** Object:  ForeignKey [PhoneType_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [PhoneType_rel] FOREIGN KEY([PhoneTypeFK])
REFERENCES [dbo].[PhoneType] ([PhoneTypePK])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [PhoneType_rel]
GO
/****** Object:  ForeignKey [Cust_Camp_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [Cust_Camp_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [Cust_Camp_rel]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_AdvertisingEngineAccount_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineAccount]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAccount_2] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAccount] CHECK CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAccount_2]
GO
/****** Object:  ForeignKey [REL_Customer_AdvertisingEngineAccount_3]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineAccount]  WITH CHECK ADD  CONSTRAINT [REL_Customer_AdvertisingEngineAccount_3] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAccount] CHECK CONSTRAINT [REL_Customer_AdvertisingEngineAccount_3]
GO
/****** Object:  ForeignKey [REL_Customer_CustomerStyle_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerStyle]  WITH CHECK ADD  CONSTRAINT [REL_Customer_CustomerStyle_1] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerStyle] CHECK CONSTRAINT [REL_Customer_CustomerStyle_1]
GO
/****** Object:  ForeignKey [custPhone_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation]  WITH CHECK ADD  CONSTRAINT [custPhone_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerPhoneAssociation] CHECK CONSTRAINT [custPhone_rel]
GO
/****** Object:  ForeignKey [PhoneCust_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation]  WITH CHECK ADD  CONSTRAINT [PhoneCust_rel] FOREIGN KEY([PhoneFK])
REFERENCES [dbo].[Phone] ([PhonePK])
GO
ALTER TABLE [dbo].[CustomerPhoneAssociation] CHECK CONSTRAINT [PhoneCust_rel]
GO
/****** Object:  ForeignKey [REL_Customer_CustomerNotes_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerNotes]  WITH CHECK ADD  CONSTRAINT [REL_Customer_CustomerNotes_1] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerNotes] CHECK CONSTRAINT [REL_Customer_CustomerNotes_1]
GO
/****** Object:  ForeignKey [Child_Rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerHierarchy]  WITH CHECK ADD  CONSTRAINT [Child_Rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerHierarchy] CHECK CONSTRAINT [Child_Rel]
GO
/****** Object:  ForeignKey [Paraent_Rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerHierarchy]  WITH CHECK ADD  CONSTRAINT [Paraent_Rel] FOREIGN KEY([CustomerParentFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerHierarchy] CHECK CONSTRAINT [Paraent_Rel]
GO
/****** Object:  ForeignKey [Address_Rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [Address_Rel] FOREIGN KEY([AddressFK])
REFERENCES [dbo].[Address] ([AddressPK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [Address_Rel]
GO
/****** Object:  ForeignKey [AddressType_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [AddressType_rel] FOREIGN KEY([AddressTypeFK])
REFERENCES [dbo].[AddressType] ([AddressTypePK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [AddressType_rel]
GO
/****** Object:  ForeignKey [Customer_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [Customer_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [Customer_rel]
GO
/****** Object:  ForeignKey [UserCustomer_rel]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserCustomer_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserCustomer_rel]
GO
/****** Object:  ForeignKey [REL_Users_TransactionHistory_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [REL_Users_TransactionHistory_1] FOREIGN KEY([UserFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [REL_Users_TransactionHistory_1]
GO
/****** Object:  ForeignKey [REL_Roles_UserRolesAssociation_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[UserRolesAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Roles_UserRolesAssociation_2] FOREIGN KEY([RolesFK])
REFERENCES [dbo].[Roles] ([RolePK])
GO
ALTER TABLE [dbo].[UserRolesAssociation] CHECK CONSTRAINT [REL_Roles_UserRolesAssociation_2]
GO
/****** Object:  ForeignKey [REL_Users_UserRolesAssociation_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[UserRolesAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Users_UserRolesAssociation_1] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[UserRolesAssociation] CHECK CONSTRAINT [REL_Users_UserRolesAssociation_1]
GO
/****** Object:  ForeignKey [REL_EmployeeType_Employee_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [REL_EmployeeType_Employee_1] FOREIGN KEY([EmployeeTypeFK])
REFERENCES [dbo].[EmployeeType] ([EmployeeTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [REL_EmployeeType_Employee_1]
GO
/****** Object:  ForeignKey [REL_Users_Employee_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [REL_Users_Employee_2] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [REL_Users_Employee_2]
GO
/****** Object:  ForeignKey [REL_Users_Credential_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [REL_Users_Credential_1] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [REL_Users_Credential_1]
GO
/****** Object:  ForeignKey [REL_Users_Error_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [REL_Users_Error_1] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [REL_Users_Error_1]
GO
/****** Object:  ForeignKey [REL_BudgetCycle_Promotion_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [REL_BudgetCycle_Promotion_2] FOREIGN KEY([BudgetCycleFK])
REFERENCES [dbo].[BudgetCycle] ([BudgetCyclePK])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [REL_BudgetCycle_Promotion_2]
GO
/****** Object:  ForeignKey [REL_ProductGroup_Promotion_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [REL_ProductGroup_Promotion_1] FOREIGN KEY([ProductGroupFK])
REFERENCES [dbo].[ProductGroup] ([ProductGroupPK])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [REL_ProductGroup_Promotion_1]
GO
/****** Object:  ForeignKey [REL_Customer_Schedule_3]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_Customer_Schedule_3] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_Customer_Schedule_3]
GO
/****** Object:  ForeignKey [REL_Frequency_Schedule_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_Frequency_Schedule_1] FOREIGN KEY([FrequencyFK])
REFERENCES [dbo].[Frequency] ([FrequencyPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_Frequency_Schedule_1]
GO
/****** Object:  ForeignKey [REL_ProductGroup_Schedule_4]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_ProductGroup_Schedule_4] FOREIGN KEY([ProductGroupFK])
REFERENCES [dbo].[ProductGroup] ([ProductGroupPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_ProductGroup_Schedule_4]
GO
/****** Object:  ForeignKey [REL_Promotion_Schedule_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_Schedule_2] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_Promotion_Schedule_2]
GO
/****** Object:  ForeignKey [REL_Users_Schedule_5]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_Users_Schedule_5] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_Users_Schedule_5]
GO
/****** Object:  ForeignKey [REL_Keyword_PromotionKeywordAssociation_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Keyword_PromotionKeywordAssociation_2] FOREIGN KEY([KeywordFK])
REFERENCES [dbo].[Keyword] ([KeywordPK])
GO
ALTER TABLE [dbo].[PromotionKeywordAssociation] CHECK CONSTRAINT [REL_Keyword_PromotionKeywordAssociation_2]
GO
/****** Object:  ForeignKey [REL_Promotion_PromotionKeywordAssociation_3]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_PromotionKeywordAssociation_3] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[PromotionKeywordAssociation] CHECK CONSTRAINT [REL_Promotion_PromotionKeywordAssociation_3]
GO
/****** Object:  ForeignKey [REL_Promotion_PromotionAds_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionAds]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_PromotionAds_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[PromotionAds] CHECK CONSTRAINT [REL_Promotion_PromotionAds_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_PromotionAdEngineSelected_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionAdEngineSelected]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_PromotionAdEngineSelected_2] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[PromotionAdEngineSelected] CHECK CONSTRAINT [REL_AdvertisingEngine_PromotionAdEngineSelected_2]
GO
/****** Object:  ForeignKey [REL_Promotion_PromotionAdEngineSelected_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[PromotionAdEngineSelected]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_PromotionAdEngineSelected_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[PromotionAdEngineSelected] CHECK CONSTRAINT [REL_Promotion_PromotionAdEngineSelected_1]
GO
/****** Object:  ForeignKey [REL_Promotion_KeywordCategory_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordCategory]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_KeywordCategory_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[KeywordCategory] CHECK CONSTRAINT [REL_Promotion_KeywordCategory_1]
GO
/****** Object:  ForeignKey [REL_Promotion_GeoTargeting_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[GeoTargeting]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_GeoTargeting_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[GeoTargeting] CHECK CONSTRAINT [REL_Promotion_GeoTargeting_1]
GO
/****** Object:  ForeignKey [REL_StateCode_GeoTargeting_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[GeoTargeting]  WITH CHECK ADD  CONSTRAINT [REL_StateCode_GeoTargeting_2] FOREIGN KEY([StateCodeFK])
REFERENCES [dbo].[StateCode] ([StateAbbrPK])
GO
ALTER TABLE [dbo].[GeoTargeting] CHECK CONSTRAINT [REL_StateCode_GeoTargeting_2]
GO
/****** Object:  ForeignKey [REL_Employee_EmployeePhoneAssociation_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[EmployeePhoneAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Employee_EmployeePhoneAssociation_2] FOREIGN KEY([EmployeeFK])
REFERENCES [dbo].[Employee] ([EmployeePK])
GO
ALTER TABLE [dbo].[EmployeePhoneAssociation] CHECK CONSTRAINT [REL_Employee_EmployeePhoneAssociation_2]
GO
/****** Object:  ForeignKey [REL_Phone_EmployeePhoneAssociation_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[EmployeePhoneAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Phone_EmployeePhoneAssociation_1] FOREIGN KEY([PhoneFK])
REFERENCES [dbo].[Phone] ([PhonePK])
GO
ALTER TABLE [dbo].[EmployeePhoneAssociation] CHECK CONSTRAINT [REL_Phone_EmployeePhoneAssociation_1]
GO
/****** Object:  ForeignKey [REL_Customer_EmployeeCustomerAssociation_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[EmployeeCustomerAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Customer_EmployeeCustomerAssociation_2] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[EmployeeCustomerAssociation] CHECK CONSTRAINT [REL_Customer_EmployeeCustomerAssociation_2]
GO
/****** Object:  ForeignKey [REL_Employee_EmployeeCustomerAssociation_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[EmployeeCustomerAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Employee_EmployeeCustomerAssociation_1] FOREIGN KEY([EmployeeFK])
REFERENCES [dbo].[Employee] ([EmployeePK])
GO
ALTER TABLE [dbo].[EmployeeCustomerAssociation] CHECK CONSTRAINT [REL_Employee_EmployeeCustomerAssociation_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3] FOREIGN KEY([AdvertisingEngineAccountFK])
REFERENCES [dbo].[AdvertisingEngineAccount] ([AdvertisingEngineAccountPK])
GO
ALTER TABLE [dbo].[AdvertisingEnginePromotion] CHECK CONSTRAINT [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3]
GO
/****** Object:  ForeignKey [REL_Promotion_AdvertisingEnginePromotion_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_AdvertisingEnginePromotion_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[AdvertisingEnginePromotion] CHECK CONSTRAINT [REL_Promotion_AdvertisingEnginePromotion_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_TargetedDailyBudget_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TargetedDailyBudget]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_TargetedDailyBudget_2] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[TargetedDailyBudget] CHECK CONSTRAINT [REL_AdvertisingEngine_TargetedDailyBudget_2]
GO
/****** Object:  ForeignKey [REL_Promotion_TargetedDailyBudget_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TargetedDailyBudget]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_TargetedDailyBudget_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[TargetedDailyBudget] CHECK CONSTRAINT [REL_Promotion_TargetedDailyBudget_1]
GO
/****** Object:  ForeignKey [REL_PromotionAds_SiteLinks_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[SiteLinks]  WITH CHECK ADD  CONSTRAINT [REL_PromotionAds_SiteLinks_1] FOREIGN KEY([PromotionAdsFK])
REFERENCES [dbo].[PromotionAds] ([PromotionAdsPK])
GO
ALTER TABLE [dbo].[SiteLinks] CHECK CONSTRAINT [REL_PromotionAds_SiteLinks_1]
GO
/****** Object:  ForeignKey [REL_Schedule_ScheduleJob_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleJob]  WITH CHECK ADD  CONSTRAINT [REL_Schedule_ScheduleJob_1] FOREIGN KEY([ScheduleFK])
REFERENCES [dbo].[Schedule] ([SchedulePK])
GO
ALTER TABLE [dbo].[ScheduleJob] CHECK CONSTRAINT [REL_Schedule_ScheduleJob_1]
GO
/****** Object:  ForeignKey [REL_Schedule_ScheduleTaskAssociation_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleTaskAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Schedule_ScheduleTaskAssociation_1] FOREIGN KEY([ScheduleFK])
REFERENCES [dbo].[Schedule] ([SchedulePK])
GO
ALTER TABLE [dbo].[ScheduleTaskAssociation] CHECK CONSTRAINT [REL_Schedule_ScheduleTaskAssociation_1]
GO
/****** Object:  ForeignKey [REL_Task_ScheduleTaskAssociation_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleTaskAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Task_ScheduleTaskAssociation_2] FOREIGN KEY([TaskFK])
REFERENCES [dbo].[Task] ([TaskPK])
GO
ALTER TABLE [dbo].[ScheduleTaskAssociation] CHECK CONSTRAINT [REL_Task_ScheduleTaskAssociation_2]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_AdvertisingEngineAds_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineAds]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAds_2] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAds] CHECK CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAds_2]
GO
/****** Object:  ForeignKey [REL_PromotionAds_AdvertisingEngineAds_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineAds]  WITH CHECK ADD  CONSTRAINT [REL_PromotionAds_AdvertisingEngineAds_1] FOREIGN KEY([PromotionAdsFK])
REFERENCES [dbo].[PromotionAds] ([PromotionAdsPK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAds] CHECK CONSTRAINT [REL_PromotionAds_AdvertisingEngineAds_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_KeywordBid_3]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_KeywordBid_3] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_AdvertisingEngine_KeywordBid_3]
GO
/****** Object:  ForeignKey [REL_BidType_KeywordBid_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_BidType_KeywordBid_2] FOREIGN KEY([BidTypeFK])
REFERENCES [dbo].[BidType] ([BidTypePK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_BidType_KeywordBid_2]
GO
/****** Object:  ForeignKey [REL_PromotionKeywordAssociation_KeywordBid_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_PromotionKeywordAssociation_KeywordBid_1] FOREIGN KEY([KeywordFK], [PromotionFK])
REFERENCES [dbo].[PromotionKeywordAssociation] ([KeywordFK], [PromotionFK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_PromotionKeywordAssociation_KeywordBid_1]
GO
/****** Object:  ForeignKey [REL_KeywordBid_KeywordBidData_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[KeywordBidData]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_KeywordBidData_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[KeywordBidData] CHECK CONSTRAINT [REL_KeywordBid_KeywordBidData_1]
GO
/****** Object:  ForeignKey [REL_BidType_AdvertisingEngineReportData_2]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineReportData]  WITH CHECK ADD  CONSTRAINT [REL_BidType_AdvertisingEngineReportData_2] FOREIGN KEY([BidTypeFK])
REFERENCES [dbo].[BidType] ([BidTypePK])
GO
ALTER TABLE [dbo].[AdvertisingEngineReportData] CHECK CONSTRAINT [REL_BidType_AdvertisingEngineReportData_2]
GO
/****** Object:  ForeignKey [REL_KeywordBid_AdvertisingEngineReportData_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[AdvertisingEngineReportData]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_AdvertisingEngineReportData_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[AdvertisingEngineReportData] CHECK CONSTRAINT [REL_KeywordBid_AdvertisingEngineReportData_1]
GO
/****** Object:  ForeignKey [REL_KeywordBid_TrafficEstimator_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[TrafficEstimator]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_TrafficEstimator_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[TrafficEstimator] CHECK CONSTRAINT [REL_KeywordBid_TrafficEstimator_1]
GO
/****** Object:  ForeignKey [REL_ScheduleJob_ScheduleLog_1]    Script Date: 05/14/2012 14:58:44 ******/
ALTER TABLE [dbo].[ScheduleLog]  WITH CHECK ADD  CONSTRAINT [REL_ScheduleJob_ScheduleLog_1] FOREIGN KEY([ScheduleJobFK])
REFERENCES [dbo].[ScheduleJob] ([ScheduleJobPK])
GO
ALTER TABLE [dbo].[ScheduleLog] CHECK CONSTRAINT [REL_ScheduleJob_ScheduleLog_1]
GO
