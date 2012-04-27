USE [semplest]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
PRIMARY KEY CLUSTERED 
(
	[ConfigurationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillType]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[BidType]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BidType](
	[BidTypePK] [int] IDENTITY(1,1) NOT NULL,
	[BidType] [varchar](25) NOT NULL,
 CONSTRAINT [PK__BidType__EF3F259D1CF15040] PRIMARY KEY CLUSTERED 
(
	[BidTypePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exact;Broad;Phrase;Negative;BroadWithModifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidType'
GO
/****** Object:  Table [dbo].[AdvertisingEngine]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[AddressType]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Keyword]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[HelpDefinition]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetNextScheduleTime]    Script Date: 04/25/2012 09:58:25 ******/
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
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Frequency]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[ProductGroupCycleType]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[PhoneType]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[SEMCustomerDetails]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[StateCode]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Rights]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rights](
	[RightsPK] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [nvarchar](40) NOT NULL,
	[Label] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RightsPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[SchedulePK] [int] IDENTITY(1,1) NOT NULL,
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
	[ScheduleName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchedulePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesRightsAssociation]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Phone]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  StoredProcedure [dbo].[AddAddTask]    Script Date: 04/25/2012 09:58:22 ******/
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

CREATE PROCEDURE [dbo].[AddAddTask]
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
/****** Object:  Table [dbo].[CustomerStyle]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[CustomerPhoneAssociation]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[CustomerNotes]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerNotes](
	[CustomerFK] [int] NOT NULL,
	[NotePK] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[EditedDate] [datetime] NULL,
	[Note] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerFK] ASC,
	[NotePK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerHierarchy]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerHierarchy](
	[CustomerHierarchyPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerFK] [int] NOT NULL,
	[CustomerParentFK] [int] NOT NULL,
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
/****** Object:  Table [dbo].[CustomerAddressAssociation]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[AdvertisingEngineAccount]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvertisingEngineAccount](
	[AdvertisingEngineAccountPK] [varchar](30) NOT NULL,
	[AdvertisingEngineFK] [int] NOT NULL,
	[CustomerFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineAccountPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The PK comes from Google/MSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEngineAccount'
GO
/****** Object:  StoredProcedure [dbo].[AddSchedule]    Script Date: 04/25/2012 09:58:22 ******/
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
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRigtsRolesInteraction]    Script Date: 04/25/2012 09:58:22 ******/
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
/****** Object:  Table [dbo].[ScheduleJob]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[ScheduleTaskAssociation]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[UserRolesAssociation]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesAssociation](
	[UserRolesAssociationPK] [int] IDENTITY(1,1) NOT NULL,
	[RolesFK] [int] NOT NULL,
	[UsersFK] [int] NOT NULL,
 CONSTRAINT [PK__UserRole__C4B597C51AD3FDA4] PRIMARY KEY CLUSTERED 
(
	[UserRolesAssociationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[ScheduleLog]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  StoredProcedure [dbo].[SetNextJobToRun]    Script Date: 04/25/2012 09:58:22 ******/
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
/****** Object:  Table [dbo].[Promotion]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductGroupFK] [int] NOT NULL,
	[LandingPageURL] [nvarchar](35) NOT NULL,
	[CycleBudgetAmount] [money] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[IsPaused] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EditedDate] [datetime2](7) NULL,
	[IsSearchNetwoirk] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[ErrorPK] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[ErrorID] [int] NULL,
	[UsersFK] [int] NOT NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__Error__35F112FA03F0984C] PRIMARY KEY CLUSTERED 
(
	[ErrorPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeePK] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeFK] [int] NOT NULL,
	[UsersFK] [int] NOT NULL,
	[ReportingTo] [int] NULL,
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
/****** Object:  StoredProcedure [dbo].[GetNextJobToRun]    Script Date: 04/25/2012 09:58:22 ******/
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
/****** Object:  Table [dbo].[Credential]    Script Date: 04/25/2012 09:58:24 ******/
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
 CONSTRAINT [PK__Credenti__2C59BE80628FA481] PRIMARY KEY CLUSTERED 
(
	[CredentialPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddScheduleJob]    Script Date: 04/25/2012 09:58:22 ******/
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
/****** Object:  StoredProcedure [dbo].[AddAdvertisingEngineAccount]    Script Date: 04/25/2012 09:58:22 ******/
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
	@AdvertisingEngineAccountID INT,
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
/****** Object:  Table [dbo].[AdvertisingEnginePromotion]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvertisingEnginePromotion](
	[AdvertisingEngineCampaignPK] [int] NOT NULL,
	[PromotionFK] [int] NOT NULL,
	[AdvertisingEngineAccountFK] [varchar](30) NOT NULL,
	[IsSearchNetwork] [bit] NOT NULL,
	[IsDisplayNetwork] [bit] NOT NULL,
	[AdvertisingEngineBudget] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineCampaignPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The PK comes from Google/MSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingEnginePromotion'
GO
/****** Object:  Table [dbo].[GeoTargeting]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[EmployeeCustomerAssociation]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeCustomerAssociation](
	[EmployeeCustomerAssociationPK] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeFK] [int] NOT NULL,
	[CustomerFK] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeCustomerAssociation] PRIMARY KEY CLUSTERED 
(
	[EmployeeCustomerAssociationPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeywordCategory]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[PromotionKeywordAssociation]    Script Date: 04/25/2012 09:58:24 ******/
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
PRIMARY KEY CLUSTERED 
(
	[KeywordFK] ASC,
	[PromotionFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionAds]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionAds](
	[PromotionAdsPK] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PromotionFK] [int] NULL,
	[AdText] [nvarchar](4000) NOT NULL,
	[AdTitle] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionAdsPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Each AdGroup has 1 or more Ads' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionAds'
GO
/****** Object:  StoredProcedure [dbo].[SetScheduleJobComplete]    Script Date: 04/25/2012 09:58:22 ******/
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
			
			DECLARE @NextTimeToRun DATETIME;
			SELECT @NextTimeToRun = dbo.GetNextScheduleTime(@StartDateTime, @Frequency);
															
			--Add next job to run
			INSERT INTO ScheduleJob(ScheduleFK,IsComplete,IsSuccessful,ExecutionStartTime)
			SELECT sj.ScheduleFK,0,0,@NextTimeToRun FROM ScheduleJob sj 
				inner join Schedule s on s.SchedulePK = sj.ScheduleFK 
			where sj.ScheduleJobPK = @ScheduleJobID and @NextTimeToRun <= ISNULL(s.EndDate, '2050-01-01')	
			
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
/****** Object:  StoredProcedure [dbo].[SetScheduleComplete]    Script Date: 04/25/2012 09:58:22 ******/
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

CREATE PROCEDURE [dbo].[SetScheduleComplete]
(
	@ScheduleID			INT,
	@IsSucceed			BIT
)
AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @ErrMsg VARCHAR(250)
	-- put result in log
    insert into dbo.ScheduleLog(ScheduleFK,IsSuccessful,DateCreated) 
		values (@ScheduleID,@IsSucceed,CURRENT_TIMESTAMP) 

	--Get the schedule parameters
	DECLARE @StartDateTime				DATETIME, 
			@Frequency					VARCHAR(15),
	        @IsEveryWeekday				BIT, 
	        @EveryNWeekdays				INT, 
	        @RecurEveryNWeeks			INT, 
	        @WeekDays					VARCHAR(75),
	        @DayofWeek					VARCHAR(20),
	        @DayN						INT, 
	        @OfEveryNMonthsDayN			INT, 
	        @WeekNum					INT, 
	        @OfEveryNMonthsWeekNum		INT,
	        @IsSemiMonthly				BIT;
	
	SELECT @StartDateTime = s.StartTime
	FROM dbo.Schedule s
	WHERE s.SchedulePK = @ScheduleID
		AND s.StartTime IS NOT NULL;
	
	--get Frequency of schedule
	SELECT @Frequency = f.Frequency
	FROM dbo.Schedule s
	INNER JOIN dbo.Frequency f on f.FrequencyPK = s.FrequencyFK
	WHERE s.SchedulePK = @ScheduleID;
	
	
	IF @Frequency IS NOT NULL
	BEGIN
		IF @Frequency NOT IN ('Once', 'Now')
		BEGIN
			IF @StartDateTime IS NULL OR @StartDateTime = 0
			BEGIN
				SET @StartDateTime = CURRENT_TIMESTAMP;
			END
			DECLARE @NextTimeToRun DATETIME;
			SELECT @NextTimeToRun = dbo.GetNextScheduleTime(@StartDateTime, 
															@Frequency,0,null,null,null,null,null,null,null,0,null);
															
			UPDATE Schedule
			SET	StartTime = @NextTimeToRun,
				EditedDate = CURRENT_TIMESTAMP
			WHERE SchedulePK = @ScheduleID;
		END
	END	
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage	nvarchar(4000),
          @ErrorSeverity	int,
          @ErrorState		int;
	SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
GO
/****** Object:  Table [dbo].[SiteLinks]    Script Date: 04/25/2012 09:58:24 ******/
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
/****** Object:  Table [dbo].[KeywordBid]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[KeywordAdEngineID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordBidPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains keyword Bids over time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KeywordBid'
GO
/****** Object:  Table [dbo].[KeywordInitialBidData]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KeywordInitialBidData](
	[KeywordInitialBidDataPK] [int] IDENTITY(1,1) NOT NULL,
	[KeywordBidFK] [int] NOT NULL,
	[QualityScore] [int] NULL,
	[ApprovalStatus] [varchar](30) NULL,
	[FirstPageMicroCPC] [int] NULL,
	[IsEligibleForShowing] [bit] NOT NULL,
	[SemplestProbability] [float] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordInitialBidDataPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvertisingEngineBidData]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingEngineBidData](
	[AdvertisingEngineBidPK] [int] NOT NULL,
	[KeywordBidFK] [int] NULL,
	[MicroBidAmount] [int] NOT NULL,
	[NumberImpressions] [int] NOT NULL,
	[NumberClick] [int] NOT NULL,
	[AveragePosition] [int] NOT NULL,
	[AverageCPC] [money] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisingEngineBidPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrafficEstimator]    Script Date: 04/25/2012 09:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafficEstimator](
	[TrafficEstimatorPK] [int] IDENTITY(1,1) NOT NULL,
	[KeywordBidFK] [int] NULL,
	[MicroCost] [int] NOT NULL,
	[NumberClicks] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrafficEstimatorPK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SetBidObject]    Script Date: 04/25/2012 09:58:22 ******/
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

	@ProductGroupPK			INT,
	@PromotionPK            INT,
	@KeywordAdEngineID      INT,
	@Keyword				NVARCHAR(250),
	@MicroBidAmount			INT,
	@ApprovalStatus			VARCHAR(30) = null,
	@BidType				VARCHAR(25),
	@FirstPageMicroCpc      INT = null,
	@QualityScore           INT = null,
	@IsEligibleForShowing	BIT = 1,
	@IsBidActive			BIT = 1,
	@IsNegative				BIT = 0,
	@AdvertisingEngine		VARCHAR(50),
	@SemplestProbability    float = null,
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
	select @AdEngineID = a.AdvertisingEnginePK from AdvertisingEngine a where a.AdvertisingEngine = @AdvertisingEngine
	select @BidTypeID = bt.BidTypePK from BidType bt where bt.BidType = @BidType
	SET @currentTime = CURRENT_TIMESTAMP
	
	BEGIN TRANSACTION
	--Check to see if this keyword is already bid on for the AdEngine and BidType	
	if exists (select * from PromotionKeywordAssociation pka
				inner join Keyword k on k.KeywordPK = pka.KeywordFK
				inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
				inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK
				where pka.PromotionFK = @PromotionPK and a.AdvertisingEnginePK = @AdEngineID --and pka.IsActive = 1 
					 and kb.KeywordBidPK = @BidTypeID
					 and (k.Keyword = @Keyword or kb.KeywordAdEngineID = @KeywordAdEngineID))
	BEGIN
		
		select @currentMicroBidAmt = kb.MicroBidAmount, @keywordBidPK = kb.KeywordBidPK , @keywordPK = kb.KeywordFK
			from PromotionKeywordAssociation pka
					inner join Keyword k on k.KeywordPK = pka.KeywordFK
					inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
					inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK
					where pka.PromotionFK = @PromotionPK and pka.IsActive = 1 and a.AdvertisingEnginePK = @AdEngineID
						 and kb.KeywordBidPK = @BidTypeID
						 and (k.Keyword = @Keyword or kb.KeywordAdEngineID = @KeywordAdEngineID)
		--Check to see if setting inactive				 
		if (@IsBidActive = 0)
		BEGIN
			update KeywordBid set EndDate = @currentTime, IsActive = 0
			from PromotionKeywordAssociation pka
				inner join Keyword k on k.KeywordPK = pka.KeywordFK
				inner join KeywordBid kb on kb.KeywordFK = k.KeywordPK
				inner join AdvertisingEngine a on a.AdvertisingEnginePK = kb.AdvertisingEngineFK
				where pka.PromotionFK = @PromotionPK and a.AdvertisingEnginePK = @AdEngineID --and pka.IsActive = 1 
					 and kb.KeywordBidPK = @BidTypeID
					 and (k.Keyword = @Keyword or kb.KeywordAdEngineID = @KeywordAdEngineID)		 		 
		END
		ELSE  --update the Bid if MicroBidAmount if different
		BEGIN
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
	END	
	
	ELSE --Association DOES NOT EXIST ADD
	  BEGIN
			IF NOT EXISTS (Select * from Keyword k where k.Keyword = @Keyword)
			BEGIN
				INSERT into Keyword(Keyword,CreatedDate) values (@Keyword,@currentTime)
				SET @keywordPK = @@IDENTITY
			END 
			ELSE
			BEGIN
				Select @keywordPK = k.KeywordPK from Keyword k where k.Keyword = @Keyword
			END
			insert into PromotionKeywordAssociation(KeywordFK,PromotionFK,CreatedDate,IsActive,IsDeleted,IsNegative)
			values (@keywordPK,@PromotionPK,@currentTime,1,0,@IsNegative)
			--create the keyword bid
			insert into KeywordBid(KeywordFK,AdvertisingEngineFK,PromotionFK,StartDate,EndDate,IsActive,BidTypeFK,MicroBidAmount,KeywordAdEngineID)
				VALUES (@keywordPK,@AdEngineID,@PromotionPK,@currentTime,null,@IsBidActive,@BidTypeID,@MicroBidAmount,@KeywordAdEngineID)
			SET @keywordBidPK = @@IDENTITY	
	  END
	if (@QualityScore is not null or @ApprovalStatus is not null or @FirstPageMicroCpc is not null or @IsEligibleForShowing is not null)
	BEGIN
		INSERT INTO KeywordInitialBidData(KeywordBidFK,QualityScore,ApprovalStatus,FirstPageMicroCPC,IsEligibleForShowing,SemplestProbability,CreatedDate)
		values (@keywordBidPK, @QualityScore,@ApprovalStatus,@FirstPageMicroCpc,@IsEligibleForShowing,@SemplestProbability,@currentTime)
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
/****** Object:  Default [DF__Address__Created__2B3F6F97]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Advertisi__Creat__0B3292B8]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEngineBidData] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Advertisi__IsSea__587208C1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((1)) FOR [IsSearchNetwork]
GO
/****** Object:  Default [DF__Advertisi__IsDis__59662CFA]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((0)) FOR [IsDisplayNetwork]
GO
/****** Object:  Default [DF__Advertisi__Adver__5A5A5133]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion] ADD  DEFAULT ((0)) FOR [AdvertisingEngineBudget]
GO
/****** Object:  Default [DF__Credentia__Remem__6477ECF3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Credential] ADD  CONSTRAINT [DF__Credentia__Remem__6477ECF3]  DEFAULT ('0') FOR [RememberMe]
GO
/****** Object:  Default [DF__Customer__TotalT__03317E3D]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0.0)) FOR [TotalTargetCycleBudget]
GO
/****** Object:  Default [Default_Create_Constraint]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Default_Create_Constraint]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__CustomerA__Creat__68487DD7]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__CustomerH__Creat__6EF57B66]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerHierarchy] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__CustomerP__Creat__7A672E12]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Error_TimeStamp]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Error] ADD  CONSTRAINT [DF_Error_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
GO
/****** Object:  Default [DF__Keyword__Created__5F54107A]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Keyword] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__KeywordBi__IsAct__7ECCBBD3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF__KeywordBi__Micro__7FC0E00C]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordBid] ADD  CONSTRAINT [DF__KeywordBi__Micro__7FC0E00C]  DEFAULT ((0)) FOR [MicroBidAmount]
GO
/****** Object:  Default [DF__KeywordIn__IsEli__324C5FD9]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordInitialBidData] ADD  DEFAULT ((1)) FOR [IsEligibleForShowing]
GO
/****** Object:  Default [DF__KeywordIn__Creat__3AE1A5DA]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordInitialBidData] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Phone__CreatedDa__3E52440B]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Phone] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [Isactive_default]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [Isactive_default]  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF__ProductGr__Creat__09DE7BCC]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF__Promotion__IsPau__164452B1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ('0') FOR [IsPaused]
GO
/****** Object:  Default [DF__Promotion__Creat__173876EA]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [CreatedDate]
GO
/****** Object:  Default [DF__Promotion__Creat__707E9C7C]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__Promotion__IsAct__7172C0B5]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__Promotion__IsDel__7266E4EE]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF__Promotion__IsNeg__735B0927]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation] ADD  DEFAULT ((0)) FOR [IsNegative]
GO
/****** Object:  Default [DF__RolesRigh__IsVis__41EDCAC5]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[RolesRightsAssociation] ADD  DEFAULT ('1') FOR [IsVisible]
GO
/****** Object:  Default [DF__RolesRigh__IsRea__42E1EEFE]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[RolesRightsAssociation] ADD  DEFAULT ('1') FOR [IsReadonly]
GO
/****** Object:  Default [DF__Schedule__IsEnab__04BA9F53]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ('0') FOR [IsEnabled]
GO
/****** Object:  Default [DF__Schedule__IsInac__05AEC38C]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ('0') FOR [IsInactive]
GO
/****** Object:  Default [DF__Schedule__Create__06A2E7C5]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
/****** Object:  Default [DF__Schedule__Edited__07970BFE]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ((0)) FOR [EditedBy]
GO
/****** Object:  Default [DF__ScheduleJ__IsSuc__0D4FE554]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT ((0)) FOR [IsSuccessful]
GO
/****** Object:  Default [DF__ScheduleJ__IsCom__0E44098D]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT ((0)) FOR [IsComplete]
GO
/****** Object:  Default [DF__ScheduleJ__Creat__2156DE01]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleJob] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF__ScheduleL__DateC__13FCE2E3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [DateCreated]
GO
/****** Object:  Default [DF__ScheduleL__IsSuc__14F1071C]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ('0') FOR [IsSuccessful]
GO
/****** Object:  Default [DF__ScheduleL__IsCom__15E52B55]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleLog] ADD  DEFAULT ((0)) FOR [IsComplete]
GO
/****** Object:  Default [DF__SEMCustom__CallM__30CE2BBB]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('0') FOR [CallMe]
GO
/****** Object:  Default [DF__SEMCustom__Email__31C24FF4]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('1') FOR [EmailMe]
GO
/****** Object:  Default [DF__SEMCustom__Creat__32B6742D]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[SEMCustomerDetails] ADD  DEFAULT ('CURRENT_TIMESTAMP') FOR [CreatedDate]
GO
/****** Object:  Default [DF__Transacti__Trans__2DE6D218]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[TransactionHistory] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
/****** Object:  Default [DF__Users__CreatedDa__4E88ABD4]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [Default_IsActive]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Default_IsActive]  DEFAULT ('1') FOR [IsActive]
GO
/****** Object:  Default [DF_Users_IsRegistered]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsRegistered]  DEFAULT ((0)) FOR [IsRegistered]
GO
/****** Object:  ForeignKey [Address_StateCode]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [Address_StateCode] FOREIGN KEY([StateAbbrFK])
REFERENCES [dbo].[StateCode] ([StateAbbrPK])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [Address_StateCode]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_AdvertisingEngineAccount_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEngineAccount]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAccount_2] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAccount] CHECK CONSTRAINT [REL_AdvertisingEngine_AdvertisingEngineAccount_2]
GO
/****** Object:  ForeignKey [REL_Customer_AdvertisingEngineAccount_3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEngineAccount]  WITH CHECK ADD  CONSTRAINT [REL_Customer_AdvertisingEngineAccount_3] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[AdvertisingEngineAccount] CHECK CONSTRAINT [REL_Customer_AdvertisingEngineAccount_3]
GO
/****** Object:  ForeignKey [REL_KeywordBid_AdvertisingEngineBidData_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEngineBidData]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_AdvertisingEngineBidData_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[AdvertisingEngineBidData] CHECK CONSTRAINT [REL_KeywordBid_AdvertisingEngineBidData_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3] FOREIGN KEY([AdvertisingEngineAccountFK])
REFERENCES [dbo].[AdvertisingEngineAccount] ([AdvertisingEngineAccountPK])
GO
ALTER TABLE [dbo].[AdvertisingEnginePromotion] CHECK CONSTRAINT [REL_AdvertisingEngineAccount_AdvertisingEnginePromotion_3]
GO
/****** Object:  ForeignKey [REL_Promotion_AdvertisingEnginePromotion_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[AdvertisingEnginePromotion]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_AdvertisingEnginePromotion_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[AdvertisingEnginePromotion] CHECK CONSTRAINT [REL_Promotion_AdvertisingEnginePromotion_1]
GO
/****** Object:  ForeignKey [REL_Users_Credential_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [REL_Users_Credential_1] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [REL_Users_Credential_1]
GO
/****** Object:  ForeignKey [cycType_Relation]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [cycType_Relation] FOREIGN KEY([ProductGroupCycleTypeFK])
REFERENCES [dbo].[ProductGroupCycleType] ([ProductGroupCycleTypePK])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [cycType_Relation]
GO
/****** Object:  ForeignKey [REL_BillType_Customer_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [REL_BillType_Customer_1] FOREIGN KEY([BillTypeFK])
REFERENCES [dbo].[BillType] ([BillTypePK])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [REL_BillType_Customer_1]
GO
/****** Object:  ForeignKey [Address_Rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [Address_Rel] FOREIGN KEY([AddressFK])
REFERENCES [dbo].[Address] ([AddressPK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [Address_Rel]
GO
/****** Object:  ForeignKey [AddressType_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [AddressType_rel] FOREIGN KEY([AddressTypeFK])
REFERENCES [dbo].[AddressType] ([AddressTypePK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [AddressType_rel]
GO
/****** Object:  ForeignKey [Customer_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerAddressAssociation]  WITH CHECK ADD  CONSTRAINT [Customer_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerAddressAssociation] CHECK CONSTRAINT [Customer_rel]
GO
/****** Object:  ForeignKey [Child_Rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerHierarchy]  WITH CHECK ADD  CONSTRAINT [Child_Rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerHierarchy] CHECK CONSTRAINT [Child_Rel]
GO
/****** Object:  ForeignKey [Paraent_Rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerHierarchy]  WITH CHECK ADD  CONSTRAINT [Paraent_Rel] FOREIGN KEY([CustomerParentFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerHierarchy] CHECK CONSTRAINT [Paraent_Rel]
GO
/****** Object:  ForeignKey [REL_Customer_CustomerNotes_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerNotes]  WITH CHECK ADD  CONSTRAINT [REL_Customer_CustomerNotes_1] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerNotes] CHECK CONSTRAINT [REL_Customer_CustomerNotes_1]
GO
/****** Object:  ForeignKey [custPhone_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation]  WITH CHECK ADD  CONSTRAINT [custPhone_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerPhoneAssociation] CHECK CONSTRAINT [custPhone_rel]
GO
/****** Object:  ForeignKey [PhoneCust_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerPhoneAssociation]  WITH CHECK ADD  CONSTRAINT [PhoneCust_rel] FOREIGN KEY([PhoneFK])
REFERENCES [dbo].[Phone] ([PhonePK])
GO
ALTER TABLE [dbo].[CustomerPhoneAssociation] CHECK CONSTRAINT [PhoneCust_rel]
GO
/****** Object:  ForeignKey [REL_Customer_CustomerStyle_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[CustomerStyle]  WITH CHECK ADD  CONSTRAINT [REL_Customer_CustomerStyle_1] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[CustomerStyle] CHECK CONSTRAINT [REL_Customer_CustomerStyle_1]
GO
/****** Object:  ForeignKey [REL_EmployeeType_Employee_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [REL_EmployeeType_Employee_1] FOREIGN KEY([EmployeeTypeFK])
REFERENCES [dbo].[EmployeeType] ([EmployeeTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [REL_EmployeeType_Employee_1]
GO
/****** Object:  ForeignKey [REL_Users_Employee_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [REL_Users_Employee_2] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [REL_Users_Employee_2]
GO
/****** Object:  ForeignKey [REL_Customer_EmployeeCustomerAssociation_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[EmployeeCustomerAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Customer_EmployeeCustomerAssociation_2] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[EmployeeCustomerAssociation] CHECK CONSTRAINT [REL_Customer_EmployeeCustomerAssociation_2]
GO
/****** Object:  ForeignKey [REL_Employee_EmployeeCustomerAssociation_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[EmployeeCustomerAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Employee_EmployeeCustomerAssociation_1] FOREIGN KEY([EmployeeFK])
REFERENCES [dbo].[Employee] ([EmployeePK])
GO
ALTER TABLE [dbo].[EmployeeCustomerAssociation] CHECK CONSTRAINT [REL_Employee_EmployeeCustomerAssociation_1]
GO
/****** Object:  ForeignKey [FK_Error_Users]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [FK_Error_Users] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [FK_Error_Users]
GO
/****** Object:  ForeignKey [REL_Promotion_GeoTargeting_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[GeoTargeting]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_GeoTargeting_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[GeoTargeting] CHECK CONSTRAINT [REL_Promotion_GeoTargeting_1]
GO
/****** Object:  ForeignKey [REL_AdvertisingEngine_KeywordBid_3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_AdvertisingEngine_KeywordBid_3] FOREIGN KEY([AdvertisingEngineFK])
REFERENCES [dbo].[AdvertisingEngine] ([AdvertisingEnginePK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_AdvertisingEngine_KeywordBid_3]
GO
/****** Object:  ForeignKey [REL_BidType_KeywordBid_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_BidType_KeywordBid_2] FOREIGN KEY([BidTypeFK])
REFERENCES [dbo].[BidType] ([BidTypePK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_BidType_KeywordBid_2]
GO
/****** Object:  ForeignKey [REL_PromotionKeywordAssociation_KeywordBid_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordBid]  WITH CHECK ADD  CONSTRAINT [REL_PromotionKeywordAssociation_KeywordBid_1] FOREIGN KEY([KeywordFK], [PromotionFK])
REFERENCES [dbo].[PromotionKeywordAssociation] ([KeywordFK], [PromotionFK])
GO
ALTER TABLE [dbo].[KeywordBid] CHECK CONSTRAINT [REL_PromotionKeywordAssociation_KeywordBid_1]
GO
/****** Object:  ForeignKey [REL_Promotion_KeywordCategory_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordCategory]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_KeywordCategory_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[KeywordCategory] CHECK CONSTRAINT [REL_Promotion_KeywordCategory_1]
GO
/****** Object:  ForeignKey [REL_KeywordBid_KeywordInitialBidData_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[KeywordInitialBidData]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_KeywordInitialBidData_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[KeywordInitialBidData] CHECK CONSTRAINT [REL_KeywordBid_KeywordInitialBidData_1]
GO
/****** Object:  ForeignKey [PhoneType_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [PhoneType_rel] FOREIGN KEY([PhoneTypeFK])
REFERENCES [dbo].[PhoneType] ([PhoneTypePK])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [PhoneType_rel]
GO
/****** Object:  ForeignKey [Cust_Camp_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [Cust_Camp_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [Cust_Camp_rel]
GO
/****** Object:  ForeignKey [REL_ProductGroup_Promotion_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [REL_ProductGroup_Promotion_1] FOREIGN KEY([ProductGroupFK])
REFERENCES [dbo].[ProductGroup] ([ProductGroupPK])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [REL_ProductGroup_Promotion_1]
GO
/****** Object:  ForeignKey [REL_Promotion_PromotionAds_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionAds]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_PromotionAds_1] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[PromotionAds] CHECK CONSTRAINT [REL_Promotion_PromotionAds_1]
GO
/****** Object:  ForeignKey [REL_Keyword_PromotionKeywordAssociation_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Keyword_PromotionKeywordAssociation_2] FOREIGN KEY([KeywordFK])
REFERENCES [dbo].[Keyword] ([KeywordPK])
GO
ALTER TABLE [dbo].[PromotionKeywordAssociation] CHECK CONSTRAINT [REL_Keyword_PromotionKeywordAssociation_2]
GO
/****** Object:  ForeignKey [REL_Promotion_PromotionKeywordAssociation_3]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[PromotionKeywordAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Promotion_PromotionKeywordAssociation_3] FOREIGN KEY([PromotionFK])
REFERENCES [dbo].[Promotion] ([PromotionPK])
GO
ALTER TABLE [dbo].[PromotionKeywordAssociation] CHECK CONSTRAINT [REL_Promotion_PromotionKeywordAssociation_3]
GO
/****** Object:  ForeignKey [REL_Rights_RolesRightsAssociation_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[RolesRightsAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Rights_RolesRightsAssociation_2] FOREIGN KEY([RightsFK])
REFERENCES [dbo].[Rights] ([RightsPK])
GO
ALTER TABLE [dbo].[RolesRightsAssociation] CHECK CONSTRAINT [REL_Rights_RolesRightsAssociation_2]
GO
/****** Object:  ForeignKey [REL_Roles_RolesRightsAssociation_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[RolesRightsAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Roles_RolesRightsAssociation_1] FOREIGN KEY([RolesFK])
REFERENCES [dbo].[Roles] ([RolePK])
GO
ALTER TABLE [dbo].[RolesRightsAssociation] CHECK CONSTRAINT [REL_Roles_RolesRightsAssociation_1]
GO
/****** Object:  ForeignKey [REL_Frequency_Schedule_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [REL_Frequency_Schedule_1] FOREIGN KEY([FrequencyFK])
REFERENCES [dbo].[Frequency] ([FrequencyPK])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [REL_Frequency_Schedule_1]
GO
/****** Object:  ForeignKey [REL_Schedule_ScheduleJob_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleJob]  WITH CHECK ADD  CONSTRAINT [REL_Schedule_ScheduleJob_1] FOREIGN KEY([ScheduleFK])
REFERENCES [dbo].[Schedule] ([SchedulePK])
GO
ALTER TABLE [dbo].[ScheduleJob] CHECK CONSTRAINT [REL_Schedule_ScheduleJob_1]
GO
/****** Object:  ForeignKey [REL_ScheduleJob_ScheduleLog_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleLog]  WITH CHECK ADD  CONSTRAINT [REL_ScheduleJob_ScheduleLog_1] FOREIGN KEY([ScheduleJobFK])
REFERENCES [dbo].[ScheduleJob] ([ScheduleJobPK])
GO
ALTER TABLE [dbo].[ScheduleLog] CHECK CONSTRAINT [REL_ScheduleJob_ScheduleLog_1]
GO
/****** Object:  ForeignKey [REL_Schedule_ScheduleTaskAssociation_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[ScheduleTaskAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Schedule_ScheduleTaskAssociation_1] FOREIGN KEY([ScheduleFK])
REFERENCES [dbo].[Schedule] ([SchedulePK])
GO
ALTER TABLE [dbo].[ScheduleTaskAssociation] CHECK CONSTRAINT [REL_Schedule_ScheduleTaskAssociation_1]
GO
/****** Object:  ForeignKey [REL_PromotionAds_SiteLinks_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[SiteLinks]  WITH CHECK ADD  CONSTRAINT [REL_PromotionAds_SiteLinks_1] FOREIGN KEY([PromotionAdsFK])
REFERENCES [dbo].[PromotionAds] ([PromotionAdsPK])
GO
ALTER TABLE [dbo].[SiteLinks] CHECK CONSTRAINT [REL_PromotionAds_SiteLinks_1]
GO
/****** Object:  ForeignKey [REL_KeywordBid_TrafficEstimator_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[TrafficEstimator]  WITH CHECK ADD  CONSTRAINT [REL_KeywordBid_TrafficEstimator_1] FOREIGN KEY([KeywordBidFK])
REFERENCES [dbo].[KeywordBid] ([KeywordBidPK])
GO
ALTER TABLE [dbo].[TrafficEstimator] CHECK CONSTRAINT [REL_KeywordBid_TrafficEstimator_1]
GO
/****** Object:  ForeignKey [REL_Users_TransactionHistory_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [REL_Users_TransactionHistory_1] FOREIGN KEY([UserFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [REL_Users_TransactionHistory_1]
GO
/****** Object:  ForeignKey [REL_Roles_UserRolesAssociation_2]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[UserRolesAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Roles_UserRolesAssociation_2] FOREIGN KEY([RolesFK])
REFERENCES [dbo].[Roles] ([RolePK])
GO
ALTER TABLE [dbo].[UserRolesAssociation] CHECK CONSTRAINT [REL_Roles_UserRolesAssociation_2]
GO
/****** Object:  ForeignKey [REL_Users_UserRolesAssociation_1]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[UserRolesAssociation]  WITH CHECK ADD  CONSTRAINT [REL_Users_UserRolesAssociation_1] FOREIGN KEY([UsersFK])
REFERENCES [dbo].[Users] ([UserPK])
GO
ALTER TABLE [dbo].[UserRolesAssociation] CHECK CONSTRAINT [REL_Users_UserRolesAssociation_1]
GO
/****** Object:  ForeignKey [UserCustomer_rel]    Script Date: 04/25/2012 09:58:24 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserCustomer_rel] FOREIGN KEY([CustomerFK])
REFERENCES [dbo].[Customer] ([CustomerPK])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserCustomer_rel]
GO
