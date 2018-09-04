USE [master]
GO
/****** Object:  Database [swlor]    Script Date: 9/4/2018 3:59:57 PM ******/
CREATE DATABASE [swlor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'swlor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\swlor.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'swlor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\swlor.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [swlor] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [swlor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [swlor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [swlor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [swlor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [swlor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [swlor] SET ARITHABORT OFF 
GO
ALTER DATABASE [swlor] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [swlor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [swlor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [swlor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [swlor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [swlor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [swlor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [swlor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [swlor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [swlor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [swlor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [swlor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [swlor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [swlor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [swlor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [swlor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [swlor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [swlor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [swlor] SET  MULTI_USER 
GO
ALTER DATABASE [swlor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [swlor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [swlor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [swlor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [swlor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [swlor] SET QUERY_STORE = OFF
GO
USE [swlor]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [swlor]
GO
/****** Object:  Table [dbo].[PCPerks]    Script Date: 9/4/2018 3:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCPerks](
	[PCPerkID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[AcquiredDate] [datetime2](7) NOT NULL,
	[PerkID] [int] NOT NULL,
	[PerkLevel] [int] NOT NULL,
 CONSTRAINT [PK__PCPerks__0BA6BCB6B49FBD5D] PRIMARY KEY CLUSTERED 
(
	[PCPerkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerkLevels]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerkLevels](
	[PerkLevelID] [int] IDENTITY(1,1) NOT NULL,
	[PerkID] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK__PerkLeve__A934EB471F92073F] PRIMARY KEY CLUSTERED 
(
	[PerkLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSkills]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSkills](
	[PCSkillID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SkillID] [int] NOT NULL,
	[XP] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
 CONSTRAINT [PK__PCSkills__F00838A44ECEB5BD] PRIMARY KEY CLUSTERED 
(
	[PCSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerkLevelSkillRequirements]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerkLevelSkillRequirements](
	[PerkLevelSkillRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[PerkLevelID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[RequiredRank] [int] NOT NULL,
 CONSTRAINT [PK_PerkLevelSkillRequirements_PerkLevelSkillRequirementID] PRIMARY KEY CLUSTERED 
(
	[PerkLevelSkillRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPlayerEffectivePerkLevel]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetPlayerEffectivePerkLevel]
(	
	@PlayerID NVARCHAR(60),
	@PerkID INT,
	@SkillLevel INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT pl.PerkLevelID ,
		   pl.PerkID ,
		   pl.Level ,
		   pl.Price ,
		   pl.Description
	FROM dbo.PerkLevels pl
	WHERE pl.PerkLevelID = (
		SELECT TOP(1) pl2.PerkLevelID
		FROM dbo.PerkLevels pl2
		LEFT JOIN dbo.PerkLevelSkillRequirements pr ON pr.PerkLevelID = pl2.PerkLevelID
		JOIN dbo.PCPerks pcp ON pcp.PerkID = pl2.PerkID
			AND pcp.PlayerID = @PlayerID
			AND pcp.PerkLevel >= pl2.Level
		JOIN dbo.PCSkills pcs ON pcs.PlayerID = pcp.PlayerID
			AND pcs.SkillID = ISNULL(pr.SkillID, pcs.SkillID)
		WHERE pcp.PerkID = @PerkID
			AND ISNULL(@SkillLevel, pcs.Rank) >= ISNULL(pr.RequiredRank, 0)
		ORDER BY pl2.Level DESC

	)
)


GO
/****** Object:  Table [dbo].[Areas]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[AreaID] [nvarchar](60) NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Tag] [nvarchar](32) NOT NULL,
	[ResourceQuality] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[IsBuildable] [bit] NOT NULL,
	[NorthwestOwner] [nvarchar](60) NULL,
	[NortheastOwner] [nvarchar](60) NULL,
	[SouthwestOwner] [nvarchar](60) NULL,
	[SoutheastOwner] [nvarchar](60) NULL,
	[IsActive] [bit] NOT NULL,
	[PurchasePrice] [int] NOT NULL,
	[DailyUpkeep] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeID] [int] NOT NULL,
	[NWNValue] [int] NOT NULL,
	[Name] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK__Attribut__C189298A024C3D44] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorizedDMs]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizedDMs](
	[AuthorizedDMID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CDKey] [nvarchar](20) NOT NULL,
	[DMRole] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Authoriz__D233D9E915E4120B] PRIMARY KEY CLUSTERED 
(
	[AuthorizedDMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Backgrounds]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Backgrounds](
	[BackgroundID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Bonuses] [nvarchar](512) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BackgroundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseItemTypes]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseItemTypes](
	[BaseItemTypeID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK__BaseItem__1AC990A1E6B56350] PRIMARY KEY CLUSTERED 
(
	[BaseItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseStructures]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseStructures](
	[BaseStructureID] [int] NOT NULL,
	[BaseStructureTypeID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[PlaceableResref] [nvarchar](16) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Power] [float] NOT NULL,
	[CPU] [float] NOT NULL,
	[HitPoints] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BaseStructureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseStructureType]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseStructureType](
	[BaseStructureTypeID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BaseStructureTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatChannelsDomain]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatChannelsDomain](
	[ChatChannelID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK__ChatChan__7153E07326A4B168] PRIMARY KEY CLUSTERED 
(
	[ChatChannelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatLog]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLog](
	[ChatLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[ChatChannelID] [int] NOT NULL,
	[SenderPlayerID] [nvarchar](60) NULL,
	[SenderAccountName] [nvarchar](1024) NOT NULL,
	[SenderCDKey] [nvarchar](20) NOT NULL,
	[ReceiverPlayerID] [nvarchar](60) NULL,
	[ReceiverAccountName] [nvarchar](1024) NULL,
	[ReceiverCDKey] [nvarchar](20) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[DateSent] [datetime2](7) NOT NULL,
	[SenderDMName] [nvarchar](60) NULL,
	[ReceiverDMName] [nvarchar](60) NULL,
 CONSTRAINT [PK__ChatLog__454604C4BBAF0C10] PRIMARY KEY CLUSTERED 
(
	[ChatLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLogEvents]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLogEvents](
	[ClientLogEventID] [int] IDENTITY(1,1) NOT NULL,
	[ClientLogEventTypeID] [int] NOT NULL,
	[PlayerID] [nvarchar](60) NULL,
	[CDKey] [nvarchar](20) NOT NULL,
	[AccountName] [nvarchar](1024) NOT NULL,
	[DateOfEvent] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClientLogEvents_ClientLogEventID] PRIMARY KEY CLUSTERED 
(
	[ClientLogEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLogEventTypesDomain]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLogEventTypesDomain](
	[ClientLogEventTypeID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ClientLogEventTypesDomain_ClientLogEventTypeID] PRIMARY KEY CLUSTERED 
(
	[ClientLogEventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentTypes]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentTypes](
	[ComponentTypeID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComponentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CooldownCategories]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CooldownCategories](
	[CooldownCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[BaseCooldownTime] [float] NOT NULL,
 CONSTRAINT [PK__Cooldown__049008DC1A120AC0] PRIMARY KEY CLUSTERED 
(
	[CooldownCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftBlueprintCategories]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftBlueprintCategories](
	[CraftBlueprintCategoryID] [bigint] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__CraftBlu__0EB197640EC6A590] PRIMARY KEY CLUSTERED 
(
	[CraftBlueprintCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftBlueprints]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftBlueprints](
	[CraftBlueprintID] [bigint] NOT NULL,
	[CraftCategoryID] [bigint] NOT NULL,
	[BaseLevel] [int] NOT NULL,
	[ItemName] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[CraftDeviceID] [int] NOT NULL,
	[PerkID] [int] NULL,
	[RequiredPerkLevel] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MainComponentTypeID] [int] NOT NULL,
	[MainMinimum] [int] NOT NULL,
	[SecondaryComponentTypeID] [int] NOT NULL,
	[SecondaryMinimum] [int] NOT NULL,
	[TertiaryComponentTypeID] [int] NOT NULL,
	[TertiaryMinimum] [int] NOT NULL,
	[EnhancementSlots] [int] NOT NULL,
	[MainMaximum] [int] NOT NULL,
	[SecondaryMaximum] [int] NOT NULL,
	[TertiaryMaximum] [int] NOT NULL,
 CONSTRAINT [PK__CraftBlu__DE6FED170EBF2383] PRIMARY KEY CLUSTERED 
(
	[CraftBlueprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftDevices]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftDevices](
	[CraftDeviceID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK__CraftDev__5CCBD473CCCE6D67] PRIMARY KEY CLUSTERED 
(
	[CraftDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomEffects]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomEffects](
	[CustomEffectID] [bigint] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IconID] [int] NOT NULL,
	[ScriptHandler] [nvarchar](64) NOT NULL,
	[StartMessage] [nvarchar](64) NOT NULL,
	[ContinueMessage] [nvarchar](64) NOT NULL,
	[WornOffMessage] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK__CustomEf__18502FBA6D986D4A] PRIMARY KEY CLUSTERED 
(
	[CustomEffectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMRoleDomain]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMRoleDomain](
	[DMRoleDomainID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__DMRoleDo__1EB081302A5E9C2F] PRIMARY KEY CLUSTERED 
(
	[DMRoleDomainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[DownloadID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Downloads_DownloadID] PRIMARY KEY CLUSTERED 
(
	[DownloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnmityAdjustmentRule]    Script Date: 9/4/2018 3:59:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnmityAdjustmentRule](
	[EnmityAdjustmentRuleID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnmityAdjustmentRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FameRegions]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FameRegions](
	[FameRegionID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [QuestFameRegions_FameRegionID] PRIMARY KEY CLUSTERED 
(
	[FameRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameTopicCategories]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTopicCategories](
	[GameTopicCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameTopicCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameTopics]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTopics](
	[GameTopicID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[GameTopicCategoryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Icon] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameTopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrowingPlants]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrowingPlants](
	[GrowingPlantID] [int] IDENTITY(1,1) NOT NULL,
	[PlantID] [int] NOT NULL,
	[RemainingTicks] [int] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TotalTicks] [int] NOT NULL,
	[WaterStatus] [int] NOT NULL,
	[LongevityBonus] [int] NOT NULL,
 CONSTRAINT [PK__GrowingP__807B119175152584] PRIMARY KEY CLUSTERED 
(
	[GrowingPlantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTypes](
	[ItemTypeID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK__ItemType__F51540DB3DC6DAE5] PRIMARY KEY CLUSTERED 
(
	[ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyItemCategories]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyItemCategories](
	[KeyItemCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__KeyItemC__CD3A52E2821EBDCD] PRIMARY KEY CLUSTERED 
(
	[KeyItemCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyItems](
	[KeyItemID] [int] NOT NULL,
	[KeyItemCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__KeyItems__95F54E1C55214D3E] PRIMARY KEY CLUSTERED 
(
	[KeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LootTableItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootTableItems](
	[LootTableItemID] [int] IDENTITY(1,1) NOT NULL,
	[LootTableID] [int] NOT NULL,
	[Resref] [varchar](16) NOT NULL,
	[MaxQuantity] [int] NOT NULL,
	[Weight] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__LootTabl__E0F42FED5CB8C330] PRIMARY KEY CLUSTERED 
(
	[LootTableItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LootTables]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootTables](
	[LootTableID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK__LootTabl__0DD0313424EBFFBF] PRIMARY KEY CLUSTERED 
(
	[LootTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mods]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mods](
	[ModID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Script] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPCGroups]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPCGroups](
	[NPCGroupID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_NPCGroups_NPCGroupID] PRIMARY KEY CLUSTERED 
(
	[NPCGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBases]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBases](
	[PCBaseID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[AreaResref] [nvarchar](16) NOT NULL,
	[Sector] [char](2) NOT NULL,
	[DateInitialPurchase] [datetime2](7) NOT NULL,
	[DateRentDue] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCBaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCooldowns]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCooldowns](
	[PCCooldownID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[CooldownCategoryID] [int] NOT NULL,
	[DateUnlocked] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__PCCooldo__61BCE64547547BE9] PRIMARY KEY CLUSTERED 
(
	[PCCooldownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCorpseItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCorpseItems](
	[PCCorpseItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PCCorpseID] [bigint] NOT NULL,
	[NWItemObject] [varchar](max) NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](32) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[GlobalID] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK__PCCorpse__8A489A237518523A] PRIMARY KEY CLUSTERED 
(
	[PCCorpseItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCorpses]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCorpses](
	[PCCorpseID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PositionX] [float] NOT NULL,
	[PositionY] [float] NOT NULL,
	[PositionZ] [float] NOT NULL,
	[Orientation] [float] NOT NULL,
	[AreaTag] [nvarchar](32) NULL,
 CONSTRAINT [PK__PCCorpse__32233C81B3715F4C] PRIMARY KEY CLUSTERED 
(
	[PCCorpseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCustomEffects]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCustomEffects](
	[PCCustomEffectID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[CustomEffectID] [bigint] NOT NULL,
	[Ticks] [int] NOT NULL,
 CONSTRAINT [PK__PCCustom__40F2132E1A5F30A2] PRIMARY KEY CLUSTERED 
(
	[PCCustomEffectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCKeyItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCKeyItems](
	[PCKeyItemID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[KeyItemID] [int] NOT NULL,
	[AcquiredDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK__PCKeyIte__36A246562715831F] PRIMARY KEY CLUSTERED 
(
	[PCKeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCMapPins]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCMapPins](
	[PCMapPinID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[AreaTag] [nvarchar](32) NOT NULL,
	[PositionX] [float] NOT NULL,
	[PositionY] [float] NOT NULL,
	[NoteText] [nvarchar](1024) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCMapPinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCMigrationItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCMigrationItems](
	[PCMigrationItemID] [int] NOT NULL,
	[PCMigrationID] [int] NOT NULL,
	[CurrentResref] [nvarchar](16) NOT NULL,
	[NewResref] [nvarchar](16) NOT NULL,
	[StripItemProperties] [bit] NOT NULL,
	[BaseItemTypeID] [int] NOT NULL,
 CONSTRAINT [PK__PCMigrat__853DDE73AB544BB1] PRIMARY KEY CLUSTERED 
(
	[PCMigrationItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCMigrations]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCMigrations](
	[PCMigrationID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK__PCMigrat__3A08DA1F3966E5FE] PRIMARY KEY CLUSTERED 
(
	[PCMigrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCOutfits]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCOutfits](
	[PlayerID] [nvarchar](60) NOT NULL,
	[Outfit1] [varchar](max) NULL,
	[Outfit2] [varchar](max) NULL,
	[Outfit3] [varchar](max) NULL,
	[Outfit4] [varchar](max) NULL,
	[Outfit5] [varchar](max) NULL,
	[Outfit6] [varchar](max) NULL,
	[Outfit7] [varchar](max) NULL,
	[Outfit8] [varchar](max) NULL,
	[Outfit9] [varchar](max) NULL,
	[Outfit10] [varchar](max) NULL,
 CONSTRAINT [PK__PCOutfit__4A4E74A8B41DD37A] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCOverflowItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCOverflowItems](
	[PCOverflowItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[ItemObject] [varchar](max) NULL,
 CONSTRAINT [PK__PCOverfl__F923885539F635E2] PRIMARY KEY CLUSTERED 
(
	[PCOverflowItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCQuestKillTargetProgress]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCQuestKillTargetProgress](
	[PCQuestKillTargetProgressID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[PCQuestStatusID] [int] NOT NULL,
	[NPCGroupID] [int] NOT NULL,
	[RemainingToKill] [int] NOT NULL,
 CONSTRAINT [PK_PCQuestKillTargetProgress_PCQuestKillTargetProgressID] PRIMARY KEY CLUSTERED 
(
	[PCQuestKillTargetProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCQuestStatus]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCQuestStatus](
	[PCQuestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[QuestID] [int] NOT NULL,
	[CurrentQuestStateID] [int] NOT NULL,
	[CompletionDate] [datetime2](7) NULL,
	[SelectedItemRewardID] [int] NULL,
 CONSTRAINT [PK_PCQuestStatus_PCQuestStatusID] PRIMARY KEY CLUSTERED 
(
	[PCQuestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCRegionalFame]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCRegionalFame](
	[PCRegionalFameID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[FameRegionID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_PCRegionalFame_PCRegionalFameID] PRIMARY KEY CLUSTERED 
(
	[PCRegionalFameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSearchSiteItems]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSearchSiteItems](
	[PCSearchSiteItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SearchSiteID] [int] NOT NULL,
	[SearchItem] [varchar](max) NULL,
 CONSTRAINT [PK__PCSearch__001EF3E36436B4F3] PRIMARY KEY CLUSTERED 
(
	[PCSearchSiteItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSearchSites]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSearchSites](
	[PCSearchSiteID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SearchSiteID] [int] NOT NULL,
	[UnlockDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK__PCSearch__B988F45255B968F1] PRIMARY KEY CLUSTERED 
(
	[PCSearchSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerkCategories]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerkCategories](
	[PerkCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK__PerkCate__9777DCFC136BDCB4] PRIMARY KEY CLUSTERED 
(
	[PerkCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerkExecutionTypes]    Script Date: 9/4/2018 3:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerkExecutionTypes](
	[PerkExecutionTypeID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK__PerkExec__8133420289767A5A] PRIMARY KEY CLUSTERED 
(
	[PerkExecutionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perks]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perks](
	[PerkID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[FeatID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[JavaScriptName] [varchar](64) NOT NULL,
	[BaseFPCost] [int] NOT NULL,
	[BaseCastingTime] [float] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[PerkCategoryID] [int] NOT NULL,
	[CooldownCategoryID] [int] NULL,
	[ExecutionTypeID] [int] NOT NULL,
	[ItemResref] [nvarchar](16) NULL,
	[IsTargetSelfOnly] [bit] NOT NULL,
	[Enmity] [int] NOT NULL,
	[EnmityAdjustmentRuleID] [int] NOT NULL,
 CONSTRAINT [PK__Perks__2432566E1A11FD39] PRIMARY KEY CLUSTERED 
(
	[PerkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PlantID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[BaseTicks] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[WaterTicks] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[SeedResref] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK__Plants__98FE46BC83E7C439] PRIMARY KEY CLUSTERED 
(
	[PlantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCharacters]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCharacters](
	[PlayerID] [nvarchar](60) NOT NULL,
	[CharacterName] [nvarchar](max) NULL,
	[HitPoints] [int] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
	[CreateTimestamp] [datetime2](0) NOT NULL,
	[MaxHunger] [int] NOT NULL,
	[CurrentHunger] [int] NOT NULL,
	[CurrentHungerTick] [int] NOT NULL,
	[UnallocatedSP] [int] NOT NULL,
	[NextSPResetDate] [datetime2](0) NULL,
	[NumberOfSPResets] [int] NOT NULL,
	[ResetTokens] [int] NOT NULL,
	[NextResetTokenReceiveDate] [datetime2](0) NULL,
	[HPRegenerationAmount] [int] NOT NULL,
	[RegenerationTick] [int] NOT NULL,
	[RegenerationRate] [int] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[MaxFP] [int] NOT NULL,
	[CurrentFP] [int] NOT NULL,
	[CurrentFPTick] [int] NOT NULL,
	[RevivalStoneCount] [int] NOT NULL,
	[RespawnAreaTag] [nvarchar](64) NOT NULL,
	[RespawnLocationX] [float] NOT NULL,
	[RespawnLocationY] [float] NOT NULL,
	[RespawnLocationZ] [float] NOT NULL,
	[RespawnLocationOrientation] [float] NOT NULL,
	[DateLastForcedSPReset] [datetime2](7) NULL,
	[DateSanctuaryEnds] [datetime2](7) NOT NULL,
	[IsSanctuaryOverrideEnabled] [bit] NOT NULL,
	[STRBase] [int] NOT NULL,
	[DEXBase] [int] NOT NULL,
	[CONBase] [int] NOT NULL,
	[INTBase] [int] NOT NULL,
	[WISBase] [int] NOT NULL,
	[CHABase] [int] NOT NULL,
	[TotalSPAcquired] [int] NOT NULL,
	[DisplayHelmet] [bit] NOT NULL,
	[BackgroundID] [int] NOT NULL,
 CONSTRAINT [PK__PlayerCh__4A4E74A8046BDEBE] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestKillTargetList]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestKillTargetList](
	[QuestKillTargetListID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[NPCGroupID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestKillTargetList_QuestKillTargetListID] PRIMARY KEY CLUSTERED 
(
	[QuestKillTargetListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestPrerequisites]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestPrerequisites](
	[QuestPrerequisiteID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[RequiredQuestID] [int] NOT NULL,
 CONSTRAINT [PK_QuestPreqrequisites_QuestPrerequisiteID] PRIMARY KEY CLUSTERED 
(
	[QuestPrerequisiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRequiredItemList]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRequiredItemList](
	[QuestRequiredItemListID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestRequiredItemList_QuestRequiredItemListID] PRIMARY KEY CLUSTERED 
(
	[QuestRequiredItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRequiredKeyItemList]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRequiredKeyItemList](
	[QuestRequiredKeyItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[KeyItemID] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestRequiredKeyItemList_QuestRequiredKeyItemID] PRIMARY KEY CLUSTERED 
(
	[QuestRequiredKeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRewardItems]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRewardItems](
	[QuestRewardItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_QuestRewards_QuestRewardID] PRIMARY KEY CLUSTERED 
(
	[QuestRewardItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quests]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quests](
	[QuestID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[JournalTag] [nvarchar](32) NOT NULL,
	[FameRegionID] [int] NOT NULL,
	[RequiredFameAmount] [int] NOT NULL,
	[AllowRewardSelection] [bit] NOT NULL,
	[RewardGold] [int] NOT NULL,
	[RewardXP] [int] NOT NULL,
	[RewardKeyItemID] [int] NULL,
	[RewardFame] [int] NOT NULL,
	[IsRepeatable] [bit] NOT NULL,
	[MapNoteTag] [nvarchar](32) NOT NULL,
	[StartKeyItemID] [int] NULL,
	[RemoveStartKeyItemAfterCompletion] [bit] NOT NULL,
 CONSTRAINT [PK_Quests_QuestID] PRIMARY KEY CLUSTERED 
(
	[QuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestStates]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestStates](
	[QuestStateID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[QuestTypeID] [int] NOT NULL,
	[JournalStateID] [int] NOT NULL,
	[IsFinalState] [bit] NOT NULL,
 CONSTRAINT [PK_QuestStates_QuestStateID] PRIMARY KEY CLUSTERED 
(
	[QuestStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestTypeDomain]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestTypeDomain](
	[QuestTypeID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_QuestTypeDomain_QuestTypeID] PRIMARY KEY CLUSTERED 
(
	[QuestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerConfiguration]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerConfiguration](
	[ServerConfigurationID] [int] NOT NULL,
	[ServerName] [varchar](50) NOT NULL,
	[MessageOfTheDay] [varchar](1024) NOT NULL,
 CONSTRAINT [PK__ServerCo__90C495B665B9B563] PRIMARY KEY CLUSTERED 
(
	[ServerConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillCategories]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillCategories](
	[SkillCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK__SkillCat__D2A5F8BCCC134052] PRIMARY KEY CLUSTERED 
(
	[SkillCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] NOT NULL,
	[SkillCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[MaxRank] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Primary] [int] NOT NULL,
	[Secondary] [int] NOT NULL,
	[Tertiary] [int] NOT NULL,
 CONSTRAINT [PK__Skills__DFA091E736021CE5] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillXPRequirement]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillXPRequirement](
	[SkillXPRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[XP] [int] NOT NULL,
 CONSTRAINT [PK__SkillXPR__A06512642D848122] PRIMARY KEY CLUSTERED 
(
	[SkillXPRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageContainers]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageContainers](
	[StorageContainerID] [int] NOT NULL,
	[AreaName] [nvarchar](255) NOT NULL,
	[AreaTag] [nvarchar](64) NOT NULL,
	[AreaResref] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK__StorageC__B6DA251F27DF370F] PRIMARY KEY CLUSTERED 
(
	[StorageContainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageItems]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageItems](
	[StorageItemID] [int] IDENTITY(1,1) NOT NULL,
	[StorageContainerID] [int] NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[ItemObject] [varchar](max) NULL,
	[GlobalID] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK__StorageI__AFD917B2F084A45A] PRIMARY KEY CLUSTERED 
(
	[StorageItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[DiscordUserID] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](32) NOT NULL,
	[AvatarHash] [nvarchar](max) NOT NULL,
	[Discriminator] [nvarchar](4) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[RoleID] [int] NOT NULL,
	[DateRegistered] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Users__1788CCAC642F36E9] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'08ac0e44dba84a2fb770001655796e7d', N'house_int_13', N'Large Player Building - Style 3', N'house_int_13', 0, 8, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'0e9a94936c534bf986e346f6f38172b9', N'no_access', N'*No Access', N'no_access', 0, 2, 2, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'0edd54dda32a458d883bfb53e9dd61c7', N'house_int_15', N'Large Player Building - Style 5', N'house_int_15', 0, 8, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'1729bbf181644e50848bafb80db2255a', N'house_int_7', N'Medium Player Building - Style 2', N'house_int_7', 0, 6, 6, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'2fc2b01a718b4198a58baa31b1f11dd0', N'house_int_4', N'Small Player Building - Style 4', N'house_int_4', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'304040a3d5104235a92701d18e4114e3', N'house_int_12', N'Large Player Building - Style 2', N'house_int_12', 0, 8, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'3b074e2e569f43efb6d083d69dde9354', N'tutorial001', N'Tutorial', N'tutorial', 0, 5, 5, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'46e983a7cc8c48e9ac049f0836e469f4', N'house_int_9', N'Medium Player Building - Style 4', N'house_int_9', 0, 6, 6, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'6a4312c73c88440a9339f2686105c39d', N'druz_wpnarm', N'(Druzer IX) General Store', N'druz_wpnarm', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'751ef052865f46279556f8e35a79ee68', N'house_int_11', N'Large Player Building - Style 1', N'house_int_11', 0, 8, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'8a800a3894d7430b88d61e40d52923da', N'house_int_1', N'Small Player Building - Style 1', N'house_int_1', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'9eb0f1b937c44854b14ddf7ea62bfd4c', N'house_int_14', N'Large Player Building - Style 4', N'house_int_14', 0, 8, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'a8ed975aa1ab4dfaa1b71e32013a48fa', N'house_int_2', N'Small Player Building - Style 2', N'house_int_2', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'b6fc48524856402e820ff03b2093dd9f', N'house_int_10', N'Medium Player Building - Style 5', N'house_int_10', 0, 6, 6, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'c74189e364a340a197740f07aa7d03f2', N'house_int_5', N'Small Player Building - Style 5', N'house_int_5', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'd93334268d244e9188e204ace1e448c5', N'house_int_8', N'Medium Player Building - Style 3', N'house_int_8', 0, 6, 6, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'da1aff95077c49d7a62ce6b02d8b3093', N'druz_shalim', N'(Druzer IX) Shalim Landing', N'druz_shalim', 0, 32, 32, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'da5a763389a543fea06e7755925fc8a4', N'house_int_3', N'Small Player Building - Style 3', N'house_int_3', 0, 4, 4, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Areas] ([AreaID], [Resref], [Name], [Tag], [ResourceQuality], [Width], [Height], [IsBuildable], [NorthwestOwner], [NortheastOwner], [SouthwestOwner], [SoutheastOwner], [IsActive], [PurchasePrice], [DailyUpkeep]) VALUES (N'ddf18cd0d7024f05a7562ce898753e99', N'house_int_6', N'Medium Player Building - Style 1', N'house_int_6', 0, 6, 6, 1, NULL, NULL, NULL, NULL, 1, 0, 500)
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (0, -1, N'N/A')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (1, 0, N'STR')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (2, 1, N'DEX')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (3, 2, N'CON')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (4, 3, N'INT')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (5, 4, N'WIS')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (6, 5, N'CHA')
SET IDENTITY_INSERT [dbo].[AuthorizedDMs] ON 

INSERT [dbo].[AuthorizedDMs] ([AuthorizedDMID], [Name], [CDKey], [DMRole], [IsActive]) VALUES (1, N'zunath', N'UPWVMPKM', 2, 1)
SET IDENTITY_INSERT [dbo].[AuthorizedDMs] OFF
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (0, N'Not Selected', N'N/A', N'N/A', 0)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (1, N'Weaponsmith', N'You are a weaponsmith.', N'+1 upgrade to Weapon Blueprints perk.
+1 level to all weaponsmith crafting checks.', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (2, N'Armorsmith', N'You are an armorsmith.', N'+1 upgrade to Light Armor Blueprints perk.
+1 level to all armorsmith crafting checks.', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (3, N'Knight', N'You are a knight.', N'Knight''s Armor
+10 HP', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (4, N'Wizard', N'You are a wizard.', N'+1 to Fire Blast perk.
+10 Mana', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (5, N'Cleric', N'You are a cleric.', N'+1 to Recover perk.
+10 Mana', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (6, N'Gunslinger', N'You are a gunslinger.', N'Blaster & Ammo.
+1 DEX
+1 WIS', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (7, N'Rifleman', N'You are a rifleman.', N'Rifle & Ammo
+1 DEX
+1 WIS', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (8, N'Chef', N'You are a chef.', N'+1 upgrade to Food Recipes perk.
+1 level to all cooking crafting checks.', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (10, N'Engineer', N'You are an engineer.', N'+1 upgrade to Firearm Blueprints perk.
+1 level to all engineering crafting checks.', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (11, N'Vagabond', N'You are a jack-of-all-trades.', N'+3 SP', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (12, N'Guard', N'You are a city guard.', N'Guard Longsword & Small Shield
+1 STR+1 CON', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (13, N'Berserker', N'You are a berserker in a military.', N'Berserker Greatsword
+1 STR
+1 CON', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (14, N'Twin Blade Specialist', N'You are a twin blade specialist in a military.', N'Specialist Twin Blade
+1 DEX
+1 CON', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (15, N'Martial Artist', N'You are a martial artist.', N'Martial Artist Glove
Martial Artist Shuriken x50
+1 STR
+1 DEX', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (16, N'Miner', N'You are a miner.', N'+2 Miner perk ranks
+10% chance to receive haste while mining', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (17, N'Lumberjack', N'You are a lumberjack.', N'+2 Lumberjack perk ranks
+10% chance to receive haste while logging', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (19, N'Medic', N'You are a medic.', N'+1 Healing Kit Expert perk rank
+1 Immediate Improvement perk rank
+5% chance to use a healing kit without consuming a charge.', 1)
INSERT [dbo].[Backgrounds] ([BackgroundID], [Name], [Description], [Bonuses], [IsActive]) VALUES (20, N'Farmer', N'You are a farmer.', N'+1 Expert Farmer perk rank
+5% chance to not consume a charge when using a water jug
+5% chance to not consume a charge when using a shovel', 1)
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (-1, N'Invalid')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (0, N'shortsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (1, N'longsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (2, N'battleaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (3, N'bastardsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (4, N'lightflail')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (5, N'warhammer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (6, N'heavycrossbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (7, N'lightcrossbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (8, N'longbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (9, N'lightmace')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (10, N'halberd')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (11, N'shortbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (12, N'twobladedsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (13, N'greatsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (14, N'smallshield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (15, N'torch')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (16, N'armor')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (17, N'helmet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (18, N'greataxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (19, N'amulet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (20, N'arrow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (21, N'belt')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (22, N'dagger')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (23, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (24, N'miscsmall')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (25, N'bolt')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (26, N'boots')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (27, N'bullet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (28, N'club')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (29, N'miscmedium')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (30, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (31, N'dart')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (32, N'diremace')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (33, N'doubleaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (34, N'misclarge')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (35, N'heavyflail')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (36, N'gloves')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (37, N'lighthammer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (38, N'handaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (39, N'healerskit')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (40, N'kama')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (41, N'katana')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (42, N'kukri')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (43, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (44, N'magicrod')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (45, N'magicstaff')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (46, N'magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (47, N'morningstar')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (48, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (49, N'potions')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (50, N'quarterstaff')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (51, N'rapier')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (52, N'ring')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (53, N'scimitar')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (54, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (55, N'scythe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (56, N'largeshield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (57, N'towershield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (58, N'shortspear')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (59, N'shuriken')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (60, N'sickle')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (61, N'sling')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (62, N'thievestools')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (63, N'throwingaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (64, N'trapkit')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (65, N'key')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (66, N'largebox')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (67, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (68, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (69, N'cslashweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (70, N'cpiercweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (71, N'cbludgweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (72, N'cslshprcweap')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (73, N'creatureitem')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (74, N'book')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (75, N'spellscroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (76, N'gold')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (77, N'gem')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (78, N'bracer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (79, N'miscthin')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (80, N'cloak')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (81, N'grenade')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (82, N'Encampment')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (83, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (84, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (85, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (86, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (87, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (88, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (89, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (90, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (91, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (92, N'Lance')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (93, N'Trumpet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (94, N'MoonOnAStick')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (95, N'trident')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (96, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (97, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (98, N'XP2SpecReq')
GO
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (99, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (100, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (101, N'empty_potion')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (102, N'blank_scroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (103, N'blank_magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (104, N'crafted_potion')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (105, N'crafted_scroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (106, N'crafted_magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (107, N'XP2SpecialRequest')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (108, N'dwarvenwaraxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (109, N'craftcompbase')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (110, N'craftcompsmall')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (111, N'Whip')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (112, N'craftbase')
INSERT [dbo].[BaseStructures] ([BaseStructureID], [BaseStructureTypeID], [Name], [PlaceableResref], [ItemResref], [IsActive], [Power], [CPU], [HitPoints]) VALUES (1, 1, N'Small Control Tower', N'c_tower_small', N'control_tower', 1, 50, 20, 0)
INSERT [dbo].[BaseStructures] ([BaseStructureID], [BaseStructureTypeID], [Name], [PlaceableResref], [ItemResref], [IsActive], [Power], [CPU], [HitPoints]) VALUES (2, 1, N'Medium Control Tower', N'c_tower_medium', N'control_tower', 1, 125, 50, 0)
INSERT [dbo].[BaseStructures] ([BaseStructureID], [BaseStructureTypeID], [Name], [PlaceableResref], [ItemResref], [IsActive], [Power], [CPU], [HitPoints]) VALUES (3, 1, N'Large Control Tower', N'c_tower_large', N'control_tower', 1, 265, 120, 0)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (1, N'Control Tower', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (2, N'Drill', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (3, N'Silo', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (4, N'Turret', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (5, N'Building', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (6, N'Mass Production', 1)
INSERT [dbo].[BaseStructureType] ([BaseStructureTypeID], [Name], [IsActive]) VALUES (7, N'Starship Production', 1)
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (1, N'Shout')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (2, N'Whisper')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (3, N'Talk')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (4, N'Party')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (5, N'DM')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (6, N'Tell')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (7, N'Server')
SET IDENTITY_INSERT [dbo].[ChatLog] ON 

INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2449, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2450, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2451, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2452, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2453, 3, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem lite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2454, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2455, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2456, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2457, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2458, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2459, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2460, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2461, 1, N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', N'UPWVMPKM', NULL, NULL, NULL, N'/spawnitem ref_veldite', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2462, 3, N'2b384b2d598c43c3b45cb7185dd67e4c', N'Dent Wetteel', N'UPWVMPKM', NULL, NULL, NULL, N'/sit', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChatLog] OFF
SET IDENTITY_INSERT [dbo].[ClientLogEvents] ON 

INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2621, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T08:22:10.7285500' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2622, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T08:26:31.8420730' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2623, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T08:35:05.3060920' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2624, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T08:37:49.4976100' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2625, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:02:03.6123690' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2626, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:18:24.8014970' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2627, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:28:02.7892030' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2628, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:41:56.1864090' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2629, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:43:49.5096690' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2630, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T09:54:26.2296830' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2631, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T10:09:46.3860250' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2632, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T10:12:06.5663710' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2633, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T10:14:07.1957890' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2634, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T10:44:08.3177230' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2635, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-01T10:45:51.5869540' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2636, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:04:14.9312890' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2637, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:04:39.7386970' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2638, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:05:35.2109260' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2639, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:05:56.1156500' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2640, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:08:38.7863480' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2641, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:08:57.0562040' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2642, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:14:57.1627860' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2643, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:15:19.3875360' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2644, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:25:27.3682340' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2645, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:30:08.1466240' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2646, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:30:14.8630180' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2647, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:50:52.0637190' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2648, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T06:53:56.7892650' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2649, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:02:00.1471990' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2650, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:07:09.6806010' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2651, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:10:20.6806450' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2652, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:12:22.9192090' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2653, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:12:39.8035190' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2654, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:29:03.2335370' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2655, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T07:29:23.1127290' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2656, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T13:23:33.9337440' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2657, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T13:29:55.6232760' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2658, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-02T13:33:17.5752550' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2659, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T08:35:04.8377850' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2660, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T08:46:18.1873300' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2661, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T08:54:39.6959810' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2662, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T14:17:41.6573740' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2663, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T14:18:30.8756430' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2664, 1, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T14:53:04.5534090' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2665, 2, N'eb075df7c81c4935abf41e4ff9309288', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T14:54:03.6163100' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2666, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T14:54:27.0169040' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2667, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T15:30:54.8893370' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2668, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T16:34:11.0568470' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2669, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T16:36:57.8331370' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2670, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T16:39:44.9315050' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2671, 2, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-03T16:40:57.0804330' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2672, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:08:13.8487610' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2673, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:11:20.2523280' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2674, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:12:58.6024770' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2675, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:18:29.6307880' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2676, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:29:12.0556520' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2677, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T05:30:30.6694870' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2678, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T06:43:29.8083140' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2679, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T06:46:34.8203070' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2680, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T06:51:32.7605750' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2681, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:03:21.7409910' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2682, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:10:17.3403570' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2683, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:39:40.6728660' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2684, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:45:49.6835550' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2685, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:47:27.2515630' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2686, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:50:13.7176460' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2687, 1, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:52:50.8725130' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2688, 2, N'2b384b2d598c43c3b45cb7185dd67e4c', N'UPWVMPKM', N'zunath', CAST(N'2018-09-04T07:59:07.8347670' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ClientLogEvents] OFF
INSERT [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID], [Name]) VALUES (1, N'Log In')
INSERT [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID], [Name]) VALUES (2, N'Log Out')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (0, N'Invalid')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (1, N'Raw Ore')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (2, N'Metal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (3, N'Wood')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (4, N'Small Blade')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (5, N'Medium Blade')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (6, N'Large Blade')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (7, N'Shaft')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (8, N'Small Handle')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (9, N'Medium Handle')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (10, N'Large Handle')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (11, N'Enhancement')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (12, N'Fiberplast')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (13, N'Leather')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (14, N'Padding')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (15, N'Electronics')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (16, N'Wood Baton Frame')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (17, N'Metal Baton Frame')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (18, N'Ranged Weapon Core')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (19, N'Rifle Barrel')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (20, N'Pistol Barrel')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (21, N'Power Crystal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (22, N'Saber Hilt')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (23, N'Seeds')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (24, N'Blue Crystal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (25, N'Red Crystal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (26, N'Green Crystal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (27, N'Yellow Crystal')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (28, N'Blue Crystal Cluster')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (29, N'Red Crystal Cluster')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (30, N'Green Crystal Cluster')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (31, N'Yellow Crystal Cluster')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (32, N'Power Crystal Cluster')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (33, N'Heavy Armor Core')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (34, N'Light Armor Core')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (35, N'Force Armor Core')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (36, N'Heavy Armor Segment')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (37, N'Light Armor Segment')
INSERT [dbo].[ComponentTypes] ([ComponentTypeID], [Name]) VALUES (38, N'Force Armor Segment')
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (1, N'Evasiveness', 60)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (2, N'Deflect Damage', 60)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (3, N'Knockdown', 60)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (4, N'Crushing Earth', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (5, N'Lightning Bolt', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (6, N'Grasping Ice', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (7, N'Fire Blast', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (8, N'Gate', 600)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (9, N'Purify', 12)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (10, N'Aegis', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (11, N'Recover', 1.5)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (12, N'Holy Shot', 6)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (13, N'Meditate', 300)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (14, N'Provoke', 30)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (15, N'Sneak Attack', 300)
INSERT [dbo].[CooldownCategories] ([CooldownCategoryID], [Name], [BaseCooldownTime]) VALUES (16, N'Chainspell', 600)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (0, N'Unknown', 0)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (1, N'Vibroblades', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (2, N'Finesse Vibroblades', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (3, N'Batons', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (4, N'Lightsabers', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (5, N'Heavy Vibroblades', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (6, N'Polearms', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (7, N'Twin Vibroblades', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (8, N'Saberstaffs', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (9, N'Martial Arts', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (10, N'Blaster Pistols', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (11, N'Blaster Rifles', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (12, N'Throwing', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (13, N'Components', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (14, N'Red Mods', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (15, N'Blue Mods', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (16, N'Green Mods', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (17, N'Yellow Mods', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (18, N'Light Armor', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (19, N'Force Armor', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (20, N'Heavy Armor', 1)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (1, 5, 7, N'Basic Heavy Vibroblade GA', N'greataxe_b', 1, 12, 2, 84, 1, 1, 6, 1, 10, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (2, 5, 17, N'Heavy Vibroblade GA1', N'greataxe_1', 1, 12, 2, 84, 3, 1, 6, 1, 10, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (3, 5, 27, N'Heavy Vibroblade GA2', N'greataxe_2', 1, 12, 2, 84, 5, 1, 6, 1, 10, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (4, 5, 37, N'Heavy Vibroblade GA3', N'greataxe_3', 1, 12, 2, 84, 7, 1, 6, 1, 10, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (5, 5, 47, N'Heavy Vibroblade GA4', N'greataxe_4', 1, 12, 2, 84, 9, 1, 6, 1, 10, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (6, 1, 8, N'Basic Vibroblade BA', N'battleaxe_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (7, 1, 18, N'Vibroblade BA1', N'battleaxe_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (8, 1, 28, N'Vibroblade BA2', N'battleaxe_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (9, 1, 38, N'Vibroblade BA3', N'battleaxe_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (10, 1, 48, N'Vibroblade BA4', N'battleaxe_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (11, 1, 7, N'Basic Vibroblade BS', N'bst_sword_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (12, 1, 17, N'Vibroblade BS1', N'bst_sword_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (13, 1, 27, N'Vibroblade BS2', N'bst_sword_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (14, 1, 37, N'Vibroblade BS3', N'bst_sword_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (15, 1, 47, N'Vibroblade BS4', N'bst_sword_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (16, 2, 2, N'Basic Finesse Vibroblade D', N'dagger_b', 1, 12, 2, 84, 1, 1, 4, 1, 8, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (17, 2, 12, N'Finesse Vibroblade D1', N'dagger_1', 1, 12, 2, 84, 3, 1, 4, 1, 8, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (18, 2, 22, N'Finesse Vibroblade D2', N'dagger_2', 1, 12, 2, 84, 5, 1, 4, 1, 8, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (19, 2, 32, N'Finesse Vibroblade D3', N'dagger_3', 1, 12, 2, 84, 7, 1, 4, 1, 8, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (20, 2, 42, N'Finesse Vibroblade D4', N'dagger_4', 1, 12, 2, 84, 9, 1, 4, 1, 8, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (21, 5, 9, N'Basic Heavy Vibroblade GS', N'greatsword_b', 1, 12, 2, 84, 1, 1, 6, 1, 10, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (22, 5, 19, N'Heavy Vibroblade GS1', N'greatsword_1', 1, 12, 2, 84, 3, 1, 6, 1, 10, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (23, 5, 29, N'Heavy Vibroblade GS2', N'greatsword_2', 1, 12, 2, 84, 5, 1, 6, 1, 10, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (24, 5, 39, N'Heavy Vibroblade GS3', N'greatsword_3', 1, 12, 2, 84, 7, 1, 6, 1, 10, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (25, 5, 49, N'Heavy Vibroblade GS4', N'greatsword_4', 1, 12, 2, 84, 9, 1, 6, 1, 10, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (26, 1, 4, N'Basic Vibroblade LS', N'longsword_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (27, 1, 14, N'Vibroblade LS1', N'longsword_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (28, 1, 24, N'Vibroblade LS2', N'longsword_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (29, 1, 34, N'Vibroblade LS3', N'longsword_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (30, 1, 44, N'Vibroblade LS4', N'longsword_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (31, 2, 8, N'Basic Finesse Vibroblade R', N'rapier_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (32, 2, 18, N'Finesse Vibroblade R1', N'rapier_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (33, 2, 28, N'Finesse Vibroblade R2', N'rapier_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (34, 2, 38, N'Finesse Vibroblade R3', N'rapier_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (35, 2, 48, N'Finesse Vibroblade R4', N'rapier_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (36, 1, 6, N'Basic Vibroblade K', N'katana_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (37, 1, 16, N'Vibroblade K1', N'katana_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (38, 1, 26, N'Vibroblade K2', N'katana_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (39, 1, 36, N'Vibroblade K3', N'katana_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (40, 1, 46, N'Vibroblade K4', N'katana_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (41, 2, 6, N'Basic Finesse Vibroblade SS', N'shortsword_b', 1, 12, 2, 84, 1, 1, 4, 1, 8, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (42, 2, 16, N'Finesse Vibroblade SS1', N'shortsword_1', 1, 12, 2, 84, 3, 1, 4, 1, 8, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (43, 2, 26, N'Finesse Vibroblade SS2', N'shortsword_2', 1, 12, 2, 84, 5, 1, 4, 1, 8, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (44, 2, 36, N'Finesse Vibroblade SS3', N'shortsword_3', 1, 12, 2, 84, 7, 1, 4, 1, 8, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (45, 2, 46, N'Finesse Vibroblade SS4', N'shortsword_4', 1, 12, 2, 84, 9, 1, 4, 1, 8, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (46, 3, 1, N'Basic Baton C', N'club_b', 1, 12, 2, 84, 1, 1, 16, 1, 8, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (47, 3, 11, N'Baton C1', N'club_1', 1, 12, 2, 84, 3, 1, 16, 1, 8, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (48, 3, 21, N'Baton C2', N'club_2', 1, 12, 2, 84, 5, 1, 16, 1, 8, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (49, 3, 31, N'Baton C3', N'club_3', 1, 12, 2, 84, 7, 1, 16, 1, 8, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (50, 3, 41, N'Baton C4', N'club_4', 1, 12, 2, 84, 9, 1, 16, 1, 8, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (51, 3, 3, N'Basic Baton M', N'mace_b', 1, 12, 2, 84, 1, 1, 17, 1, 8, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (52, 3, 13, N'Baton M1', N'mace_1', 1, 12, 2, 84, 3, 1, 17, 1, 8, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (53, 3, 23, N'Baton M2', N'mace_2', 1, 12, 2, 84, 5, 1, 17, 1, 8, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (54, 3, 33, N'Baton M3', N'mace_3', 1, 12, 2, 84, 7, 1, 17, 1, 8, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (55, 3, 43, N'Baton M4', N'mace_4', 1, 12, 2, 84, 9, 1, 17, 1, 8, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (56, 3, 5, N'Basic Baton MS', N'morningstar_b', 1, 12, 2, 84, 1, 1, 17, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (57, 3, 15, N'Baton MS1', N'morningstar_1', 1, 12, 2, 84, 3, 1, 17, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (58, 3, 25, N'Baton MS2', N'morningstar_2', 1, 12, 2, 84, 5, 1, 17, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (59, 3, 35, N'Baton MS3', N'morningstar_3', 1, 12, 2, 84, 7, 1, 17, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (60, 3, 45, N'Baton MS4', N'morningstar_4', 1, 12, 2, 84, 9, 1, 17, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (61, 9, 2, N'Basic Quarterstaff', N'quarterstaff_b', 1, 12, 2, 84, 1, 1, 7, 1, 10, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (62, 9, 12, N'Quarterstaff I', N'quarterstaff_1', 1, 12, 2, 84, 3, 1, 7, 1, 10, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (63, 9, 22, N'Quarterstaff II', N'quarterstaff_2', 1, 12, 2, 84, 5, 1, 7, 1, 10, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (64, 9, 32, N'Quarterstaff III', N'quarterstaff_3', 1, 12, 2, 84, 7, 1, 7, 1, 10, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (65, 9, 42, N'Quarterstaff IV', N'quarterstaff_4', 1, 12, 2, 84, 9, 1, 7, 1, 10, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (66, 7, 9, N'Basic Twin Vibroblade DA', N'doubleaxe_b', 1, 12, 2, 84, 1, 1, 6, 2, 10, 1, 0, 0, 2, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (67, 7, 19, N'Twin Vibroblade DA1', N'doubleaxe_1', 1, 12, 2, 84, 3, 1, 6, 2, 10, 1, 0, 0, 3, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (68, 7, 29, N'Twin Vibroblade DA2', N'doubleaxe_2', 1, 12, 2, 84, 5, 1, 6, 2, 10, 1, 0, 0, 4, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (69, 7, 39, N'Twin Vibroblade DA3', N'doubleaxe_3', 1, 12, 2, 84, 7, 1, 6, 2, 10, 1, 0, 0, 5, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (70, 7, 49, N'Twin Vibroblade DA4', N'doubleaxe_4', 1, 12, 2, 84, 9, 1, 6, 2, 10, 1, 0, 0, 6, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (71, 7, 7, N'Basic Twin Vibroblade TS', N'twinblade_b', 1, 12, 2, 84, 1, 1, 6, 2, 10, 1, 0, 0, 2, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (72, 7, 17, N'Twin Vibroblade TS1', N'twinblade_1', 1, 12, 2, 84, 3, 1, 6, 2, 10, 1, 0, 0, 3, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (73, 7, 27, N'Twin Vibroblade TS2', N'twinblade_2', 1, 12, 2, 84, 5, 1, 6, 2, 10, 1, 0, 0, 4, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (74, 7, 37, N'Twin Vibroblade TS3', N'twinblade_3', 1, 12, 2, 84, 7, 1, 6, 2, 10, 1, 0, 0, 5, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (75, 7, 47, N'Twin Vibroblade TS4', N'twinblade_4', 1, 12, 2, 84, 9, 1, 6, 2, 10, 1, 0, 0, 6, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (76, 2, 4, N'Basic Finesse Vibroblade K', N'kukri_b', 1, 12, 2, 84, 1, 1, 5, 1, 9, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (77, 2, 14, N'Finesse Vibroblade K1', N'kukri_1', 1, 12, 2, 84, 3, 1, 5, 1, 9, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (78, 2, 24, N'Finesse Vibroblade K2', N'kukri_2', 1, 12, 2, 84, 5, 1, 5, 1, 9, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (79, 2, 34, N'Finesse Vibroblade K3', N'kukri_3', 1, 12, 2, 84, 7, 1, 5, 1, 9, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (80, 2, 44, N'Finesse Vibroblade K4', N'kukri_4', 1, 12, 2, 84, 9, 1, 5, 1, 9, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (81, 6, 9, N'Basic Polearm H', N'halberd_b', 1, 12, 2, 84, 1, 1, 6, 1, 10, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (82, 6, 19, N'Polearm H1', N'halberd_1', 1, 12, 2, 84, 3, 1, 6, 1, 10, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (83, 6, 29, N'Polearm H2', N'halberd_2', 1, 12, 2, 84, 5, 1, 6, 1, 10, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (84, 6, 39, N'Polearm H3', N'halberd_3', 1, 12, 2, 84, 7, 1, 6, 1, 10, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (85, 6, 49, N'Polearm H4', N'halberd_4', 1, 12, 2, 84, 9, 1, 6, 1, 10, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (86, 6, 7, N'Basic Polearm S', N'spear_b', 1, 12, 2, 84, 1, 1, 6, 1, 10, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (87, 6, 17, N'Polearm S1', N'spear_1', 1, 12, 2, 84, 3, 1, 6, 1, 10, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (88, 6, 27, N'Polearm S2', N'spear_2', 1, 12, 2, 84, 5, 1, 6, 1, 10, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (89, 6, 37, N'Polearm S3', N'spear_3', 1, 12, 2, 84, 7, 1, 6, 1, 10, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (90, 6, 47, N'Polearm S4', N'spear_4', 1, 12, 2, 84, 9, 1, 6, 1, 10, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (91, 13, 1, N'Small Blade', N'small_blade', 1, 12, 2, 84, 1, 1, 2, 1, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (92, 13, 3, N'Medium Blade', N'medium_blade', 1, 12, 2, 84, 1, 1, 2, 2, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (93, 13, 5, N'Large Blade', N'large_blade', 1, 12, 2, 84, 1, 1, 2, 3, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (94, 13, 2, N'Wood Baton Frame', N'w_baton_frame', 1, 12, 2, 84, 1, 1, 3, 2, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (95, 13, 4, N'Metal Baton Frame', N'm_baton_frame', 1, 12, 2, 84, 1, 1, 2, 2, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (96, 13, 4, N'Shaft', N'shaft', 1, 12, 2, 84, 1, 1, 3, 3, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (97, 13, 1, N'Small Handle', N'small_handle', 1, 12, 2, 84, 1, 1, 3, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (98, 13, 3, N'Medium Handle', N'medium_handle', 1, 12, 2, 84, 1, 1, 3, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (99, 13, 5, N'Large Handle', N'large_handle', 1, 12, 2, 84, 1, 1, 3, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (100, 13, 5, N'Ranged Weapon Core', N'r_weapon_core', 1, 22, 4, 96, 1, 1, 2, 3, 0, 0, 0, 0, 0, 6, 0, 0)
GO
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (101, 13, 4, N'Rifle Barrel', N'rifle_barrel', 1, 22, 4, 96, 1, 1, 2, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (102, 13, 3, N'Pistol Barrel', N'pistol_barrel', 1, 22, 4, 96, 1, 1, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (103, 11, 5, N'Basic Blaster Rifle', N'rifle_b', 1, 22, 4, 96, 1, 1, 18, 1, 19, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (104, 11, 15, N'Blaster Rifle I', N'rifle_1', 1, 22, 4, 96, 3, 1, 18, 1, 19, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (105, 11, 25, N'Blaster Rifle II', N'rifle_2', 1, 22, 4, 96, 5, 1, 18, 1, 19, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (106, 11, 35, N'Blaster Rifle III', N'rifle_3', 1, 22, 4, 96, 7, 1, 18, 1, 19, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (107, 11, 45, N'Blaster Rifle IV', N'rifle_4', 1, 22, 4, 96, 9, 1, 18, 1, 19, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (108, 10, 3, N'Basic Blaster Pistol', N'blaster_b', 1, 22, 4, 96, 1, 1, 18, 1, 20, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (109, 10, 13, N'Blaster Pistol I', N'blaster_1', 1, 22, 4, 96, 3, 1, 18, 1, 20, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (110, 10, 23, N'Blaster Pistol II', N'blaster_2', 1, 22, 4, 96, 5, 1, 18, 1, 20, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (111, 10, 33, N'Blaster Pistol III', N'blaster_3', 1, 22, 4, 96, 7, 1, 18, 1, 20, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (112, 10, 43, N'Blaster Pistol IV', N'blaster_4', 1, 22, 4, 96, 9, 1, 18, 1, 20, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (113, 13, 6, N'Green Crystal Cluster', N'c_cluster_green', 1, 22, 4, 96, 1, 1, 26, 6, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (114, 13, 7, N'Blue Crystal Cluster', N'c_cluster_blue', 1, 22, 4, 96, 1, 1, 24, 6, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (115, 13, 8, N'Red Crystal Cluster', N'c_cluster_red', 1, 22, 4, 96, 1, 1, 25, 6, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (116, 13, 9, N'Yellow Crystal Cluster', N'c_cluster_yellow', 1, 22, 4, 96, 1, 1, 27, 6, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (117, 14, 11, N'Attack Bonus I', N'rune_ab1', 1, 22, 4, 96, 1, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (118, 14, 10, N'Constitution I', N'rune_con1', 1, 22, 4, 96, 1, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (119, 14, 11, N'Dexterity I', N'rune_dex1', 1, 22, 4, 96, 1, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (120, 14, 12, N'Strength I', N'rune_str1', 1, 22, 4, 96, 1, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (121, 15, 13, N'Activation Speed I', N'rune_cstspd1', 1, 22, 4, 96, 1, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (122, 15, 10, N'Charisma I', N'rune_cha1', 1, 22, 4, 96, 1, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (123, 15, 11, N'Intelligence I', N'rune_int1', 1, 22, 4, 96, 1, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (124, 15, 12, N'Wisdom I', N'rune_wis1', 1, 22, 4, 96, 1, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (125, 14, 17, N'Damage I', N'rune_dmg1', 1, 22, 4, 96, 3, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (126, 14, 16, N'Hit Points I', N'rune_hp1', 1, 22, 4, 96, 3, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (127, 14, 18, N'Armor Class I', N'rune_ac1', 1, 22, 4, 96, 3, 1, 29, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (128, 15, 17, N'Light Ability I', N'rune_alt1', 1, 22, 4, 96, 3, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (129, 15, 17, N'Dark Ability I', N'rune_evo1', 1, 22, 4, 96, 3, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (130, 15, 16, N'FP I', N'rune_mana1', 1, 22, 4, 96, 3, 1, 28, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (131, 16, 16, N'Cooking I', N'rune_cooking1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (132, 16, 17, N'Logging I', N'rune_logging1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (133, 16, 18, N'Mining I', N'rune_mining1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (134, 16, 19, N'Armorsmith I', N'rune_armsmth1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (135, 16, 19, N'Weaponsmith I', N'rune_wpnsmth1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (136, 16, 20, N'Engineering I', N'rune_engin1', 1, 22, 4, 96, 3, 1, 30, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (137, 17, 18, N'First Aid I', N'rune_faid1', 1, 22, 4, 96, 3, 1, 31, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (138, 17, 19, N'Improved Enmity', N'rune_enmup1', 1, 22, 4, 96, 3, 1, 31, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (139, 17, 20, N'Sneak Attack I', N'rune_snkatk1', 1, 22, 4, 96, 3, 1, 31, 2, 0, 0, 0, 0, 0, 2, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (140, 14, 24, N'Enhancement Bonus I', N'rune_eb1', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (141, 14, 22, N'HP Regen', N'rune_hpregen1', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (142, 14, 24, N'Base Attack Bonus I', N'rune_bab1', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (143, 15, 23, N'FP Regen', N'rune_manaregen1', 1, 22, 4, 96, 5, 1, 28, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (144, 17, 21, N'Durability I', N'rune_dur1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (145, 17, 23, N'Reduced Enmity I', N'rune_enmdown1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (146, 17, 21, N'Level Increase I', N'rune_lvlup1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (147, 17, 24, N'Level Decrease I', N'rune_lvldown1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (148, 14, 26, N'Attack Bonus II', N'rune_ab2', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (149, 14, 25, N'Constitution II', N'rune_con2', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (150, 14, 26, N'Dexterity II', N'rune_dex2', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (151, 14, 27, N'Strength II', N'rune_str2', 1, 22, 4, 96, 5, 1, 29, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (152, 15, 28, N'Activation Speed II', N'rune_cstspd2', 1, 22, 4, 96, 5, 1, 28, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (153, 15, 25, N'Charisma II', N'rune_cha2', 1, 22, 4, 96, 5, 1, 28, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (154, 15, 26, N'Intelligence II', N'rune_int2', 1, 22, 4, 96, 5, 1, 28, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (155, 15, 27, N'Wisdom II', N'rune_wis2', 1, 22, 4, 96, 5, 1, 28, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (156, 17, 29, N'Luck I', N'rune_luck1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (157, 17, 29, N'Meditate I', N'rune_med1', 1, 22, 4, 96, 5, 1, 31, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (158, 14, 32, N'Damage II', N'rune_dmg2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (159, 14, 31, N'Hit Points II', N'rune_hp2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (160, 14, 33, N'Armor Class II', N'rune_ac2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (161, 15, 32, N'Light Ability II', N'rune_alt2', 1, 22, 4, 96, 7, 1, 28, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (162, 15, 32, N'Dark Ability II', N'rune_evo2', 1, 22, 4, 96, 7, 1, 28, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (163, 15, 31, N'FP II', N'rune_mana2', 1, 22, 4, 96, 7, 1, 28, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (164, 16, 31, N'Cooking II', N'rune_cooking2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (165, 16, 32, N'Logging II', N'rune_logging2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (166, 16, 33, N'Mining II', N'rune_mining2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (167, 16, 34, N'Armorsmith II', N'rune_armsmth2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (168, 16, 34, N'Weaponsmith II', N'rune_wpnsmth2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (169, 16, 35, N'Engineering II', N'rune_engin2', 1, 22, 4, 96, 7, 1, 30, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (170, 17, 33, N'First Aid II', N'rune_faid2', 1, 22, 4, 96, 7, 1, 31, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (171, 17, 34, N'Improved Enmity II', N'rune_enmup2', 1, 22, 4, 96, 7, 1, 31, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (172, 17, 34, N'Sneak Attack II', N'rune_snkatk2', 1, 22, 4, 96, 7, 1, 31, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (173, 14, 39, N'Enhancement Bonus II', N'rune_eb2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (174, 14, 37, N'HP Regen II', N'rune_hpregen2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (175, 14, 39, N'Base Attack Bonus II', N'rune_bab2', 1, 22, 4, 96, 7, 1, 29, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (176, 15, 37, N'FP Regen II', N'rune_manaregen2', 1, 22, 4, 96, 7, 1, 28, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (177, 17, 36, N'Durability II', N'rune_dur2', 1, 22, 4, 96, 7, 1, 31, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (178, 17, 38, N'Reduced Enmity II', N'rune_enmdown2', 1, 22, 4, 96, 7, 1, 31, 4, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (179, 14, 41, N'Attack Bonus III', N'rune_ab3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (181, 14, 40, N'Constitution III', N'rune_con3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (182, 14, 41, N'Dexterity III', N'rune_dex3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (183, 14, 42, N'Strength III', N'rune_str3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (184, 15, 43, N'Activation Speed III', N'rune_cstspd3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (185, 15, 40, N'Charisma III', N'rune_cha3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (186, 15, 41, N'Intelligence III', N'rune_int3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (187, 15, 42, N'Wisdom III', N'rune_wis3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (188, 14, 47, N'Damage III', N'rune_dmg3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (189, 14, 46, N'Hit Points III', N'rune_hp3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (190, 14, 48, N'Armor Class III', N'rune_ac3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (191, 15, 47, N'Light Ability III', N'rune_alt3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (192, 15, 47, N'Dark Ability III', N'rune_evo3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (193, 15, 46, N'FP III', N'rune_mana3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (194, 16, 46, N'Cooking III', N'rune_cooking3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (195, 16, 47, N'Logging III', N'rune_logging3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (196, 16, 48, N'Mining III', N'rune_mining3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (197, 16, 49, N'Armorsmith III', N'rune_armsmth3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (198, 16, 49, N'Weaponsmith III', N'rune_wpnsmth3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (199, 16, 50, N'Engineering III', N'rune_engin3', 1, 22, 4, 96, 9, 1, 30, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (200, 17, 48, N'First Aid III', N'rune_faid3', 1, 22, 4, 96, 9, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (201, 17, 49, N'Improved Enmity III', N'rune_enmup3', 1, 22, 4, 96, 9, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
GO
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (202, 17, 49, N'Sneak Attack III', N'rune_snkatk3', 1, 22, 4, 96, 9, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (203, 14, 54, N'Enhancement Bonus III', N'rune_eb3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (204, 14, 52, N'HP Regen III', N'rune_hpregen3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (205, 14, 54, N'Base Attack Bonus III', N'rune_bab3', 1, 22, 4, 96, 9, 1, 29, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (206, 15, 52, N'FP Regen III', N'rune_manaregen3', 1, 22, 4, 96, 9, 1, 28, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (207, 17, 51, N'Durability III', N'rune_dur3', 1, 22, 4, 96, 9, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (208, 17, 53, N'Reduced Enmity III', N'rune_enmdown3', 1, 22, 4, 96, 9, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (209, 17, 44, N'Luck II', N'rune_luck2', 1, 22, 4, 96, 5, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (210, 17, 44, N'Meditate II', N'rune_med2', 1, 22, 4, 96, 5, 1, 31, 5, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (211, 4, 7, N'Basic Lightsaber', N'lightsaber_b', 1, 22, 4, 96, 1, 1, 32, 1, 22, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (212, 4, 17, N'Lightsaber I', N'lightsaber_1', 1, 22, 4, 96, 3, 1, 32, 1, 22, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (213, 4, 27, N'Lightsaber II', N'lightsaber_2', 1, 22, 4, 96, 5, 1, 32, 1, 22, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (214, 4, 37, N'Lightsaber III', N'lightsaber_3', 1, 22, 4, 96, 7, 1, 32, 1, 22, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (215, 4, 47, N'Lightsaber IV', N'lightsaber_4', 1, 22, 4, 96, 9, 1, 32, 1, 22, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (216, 8, 9, N'Basic Saberstaff', N'saberstaff_b', 1, 22, 4, 96, 1, 1, 32, 2, 22, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (217, 8, 19, N'Saberstaff I', N'saberstaff_1', 1, 22, 4, 96, 3, 1, 32, 2, 22, 1, 0, 0, 3, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (218, 8, 29, N'Saberstaff II', N'saberstaff_2', 1, 22, 4, 96, 5, 1, 32, 2, 22, 1, 0, 0, 4, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (219, 8, 39, N'Saberstaff III', N'saberstaff_3', 1, 22, 4, 96, 7, 1, 32, 2, 22, 1, 0, 0, 5, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (220, 8, 49, N'Saberstaff IV', N'saberstaff_4', 1, 22, 4, 96, 9, 1, 32, 2, 22, 1, 0, 0, 6, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (221, 13, 6, N'Saber Hilt', N'saber_hilt', 1, 22, 4, 96, 1, 1, 2, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (222, 13, 8, N'Power Crystal Cluster', N'c_cluster_power', 1, 22, 4, 96, 1, 1, 21, 2, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (223, 13, 3, N'Light Armor Segment', N'l_armor_segment', 1, 13, 1, 124, 1, 1, 13, 2, 0, 0, 0, 0, 0, 4, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (224, 13, 4, N'Force Armor Segment', N'f_armor_segment', 1, 13, 1, 124, 1, 1, 13, 3, 0, 0, 0, 0, 0, 5, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (225, 13, 5, N'Heavy Armor Segment', N'h_armor_segment', 1, 13, 1, 124, 1, 1, 13, 4, 0, 0, 0, 0, 0, 6, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (226, 13, 2, N'Fiberplast Padding', N'padding_fiber', 1, 13, 1, 124, 1, 1, 12, 3, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (227, 13, 5, N'Light Armor Core', N'core_l_armor', 1, 13, 1, 124, 1, 1, 14, 1, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (228, 13, 6, N'Force Armor Core', N'core_f_armor', 1, 13, 1, 124, 1, 1, 14, 1, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (229, 13, 7, N'Heavy Armor Core', N'core_h_armor', 1, 13, 1, 124, 1, 1, 14, 1, 0, 0, 0, 0, 0, 3, 0, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (230, 13, 2, N'Metal Reinforcement', N'padding_metal', 1, 13, 1, 124, 1, 1, 2, 2, 12, 1, 0, 0, 0, 4, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (231, 20, 8, N'Basic Breastplate', N'breastplate_b', 1, 13, 1, 124, 1, 1, 33, 1, 36, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (232, 20, 18, N'Breastplate I', N'breastplate_1', 1, 13, 1, 124, 3, 1, 33, 1, 36, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (233, 20, 28, N'Breastplate II', N'breastplate_2', 1, 13, 1, 124, 5, 1, 33, 1, 36, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (234, 20, 38, N'Breastplate III', N'breastplate_3', 1, 13, 1, 124, 7, 1, 33, 1, 36, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (235, 20, 48, N'Breastplate IV', N'breastplate_4', 1, 13, 1, 124, 9, 1, 33, 1, 36, 1, 0, 0, 7, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (236, 19, 7, N'Basic Force Robes', N'force_robe_b', 1, 13, 1, 124, 1, 1, 35, 1, 38, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (237, 19, 17, N'Force Robes I', N'force_robe_1', 1, 13, 1, 124, 3, 1, 35, 1, 38, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (238, 19, 27, N'Force Robes II', N'force_robe_2', 1, 13, 1, 124, 5, 1, 35, 1, 38, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (239, 19, 37, N'Force Robes III', N'force_robe_3', 1, 13, 1, 124, 7, 1, 35, 1, 38, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (240, 19, 47, N'Force Robes IV', N'force_robe_4', 1, 13, 1, 124, 9, 1, 35, 1, 38, 1, 0, 0, 7, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (241, 18, 6, N'Basic Leather Tunic', N'leather_tunic_b', 1, 13, 1, 124, 1, 1, 34, 1, 37, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (242, 18, 16, N'Leather Tunic I', N'leather_tunic_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (243, 18, 26, N'Leather Tunic II', N'leather_tunic_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (244, 18, 36, N'Leather Tunic III', N'leather_tunic_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (245, 18, 46, N'Leather Tunic IV', N'leather_tunic_4', 1, 13, 1, 124, 9, 1, 34, 1, 37, 1, 0, 0, 7, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (246, 18, 5, N'Basic Small Shield', N'small_shield_b', 1, 13, 1, 124, 1, 1, 34, 1, 37, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (247, 18, 15, N'Small Shield I', N'small_shield_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (248, 18, 25, N'Small Shield II', N'small_shield_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (249, 18, 35, N'Small Shield III', N'small_shield_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (250, 18, 45, N'Small Shield IV', N'small_shield_4', 1, 13, 1, 124, 9, 1, 34, 1, 37, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (251, 20, 6, N'Basic Large Shield', N'large_shield_b', 1, 13, 1, 124, 1, 1, 33, 1, 36, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (252, 20, 16, N'Large Shield I', N'large_shield_1', 1, 13, 1, 124, 3, 1, 33, 1, 36, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (253, 20, 26, N'Large Shield II', N'large_shield_2', 1, 13, 1, 124, 5, 1, 33, 1, 36, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (254, 20, 36, N'Large Shield III', N'large_shield_3', 1, 13, 1, 124, 7, 1, 33, 1, 36, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (255, 20, 46, N'Large Shield IV', N'large_shield_4', 1, 13, 1, 124, 9, 1, 33, 1, 36, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (256, 20, 7, N'Basic Tower Shield', N'tower_shield_b', 1, 13, 1, 124, 1, 1, 33, 2, 36, 2, 0, 0, 1, 4, 4, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (257, 20, 17, N'Tower Shield I', N'tower_shield_1', 1, 13, 1, 124, 3, 1, 33, 2, 36, 2, 0, 0, 1, 4, 4, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (258, 20, 27, N'Tower Shield II', N'tower_shield_2', 1, 13, 1, 124, 5, 1, 33, 2, 36, 2, 0, 0, 2, 4, 4, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (259, 20, 37, N'Tower Shield III', N'tower_shield_3', 1, 13, 1, 124, 7, 1, 33, 2, 36, 2, 0, 0, 2, 4, 4, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (260, 20, 47, N'Tower Shield IV', N'tower_shield_4', 1, 13, 1, 124, 9, 1, 33, 2, 36, 2, 0, 0, 3, 4, 4, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (261, 9, 5, N'Basic Power Glove', N'powerglove_b', 1, 13, 1, 124, 1, 1, 34, 1, 37, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (262, 9, 15, N'Power Glove I', N'powerglove_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (263, 9, 25, N'Power Glove II', N'powerglove_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (264, 9, 35, N'Power Glove III', N'powerglove_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 5, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (265, 9, 45, N'Power Glove IV', N'powerglove_4', 1, 13, 1, 124, 9, 1, 34, 1, 37, 1, 0, 0, 6, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (266, 18, 16, N'Light Belt I', N'light_belt_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (267, 18, 31, N'Light Belt II', N'light_belt_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (268, 18, 46, N'Light Belt III', N'light_belt_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (269, 19, 17, N'Force Belt I', N'force_belt_1', 1, 13, 1, 124, 3, 1, 35, 1, 38, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (270, 19, 32, N'Force Belt II', N'force_belt_2', 1, 13, 1, 124, 5, 1, 35, 1, 38, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (271, 19, 47, N'Force Belt III', N'force_belt_3', 1, 13, 1, 124, 7, 1, 35, 1, 38, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (272, 20, 18, N'Heavy Belt I', N'heavy_belt_1', 1, 13, 1, 124, 3, 1, 33, 1, 36, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (273, 20, 18, N'Heavy Belt II', N'heavy_belt_2', 1, 13, 1, 124, 5, 1, 33, 1, 36, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (274, 20, 18, N'Heavy Belt III', N'heavy_belt_3', 1, 13, 1, 124, 7, 1, 33, 1, 36, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (275, 20, 50, N'Prismatic Force Belt', N'prism_belt_f', 1, 13, 1, 124, 9, 1, 32, 1, 34, 1, 37, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (276, 20, 50, N'Prismatic Light Belt', N'prism_belt_l', 1, 13, 1, 124, 9, 1, 32, 1, 35, 1, 38, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (277, 20, 50, N'Prismatic Heavy Belt', N'prism_belt_h', 1, 13, 1, 124, 9, 1, 32, 1, 33, 1, 36, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (278, 19, 5, N'Basic Force Boots', N'force_boots_b', 1, 13, 1, 124, 1, 1, 35, 1, 38, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (279, 19, 15, N'Force Boots I', N'force_boots_1', 1, 13, 1, 124, 3, 1, 35, 1, 38, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (280, 19, 25, N'Force Boots II', N'force_boots_2', 1, 13, 1, 124, 5, 1, 35, 1, 38, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (281, 19, 35, N'Force Boots III', N'force_boots_3', 1, 13, 1, 124, 7, 1, 35, 1, 38, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (282, 19, 45, N'Force Boots IV', N'force_boots_4', 1, 13, 1, 124, 9, 1, 35, 1, 38, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (283, 18, 4, N'Basic Light Boots', N'light_boots_b', 1, 13, 1, 124, 1, 1, 34, 1, 37, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (284, 18, 14, N'Light Boots I', N'light_boots_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (285, 18, 24, N'Light Boots II', N'light_boots_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (286, 18, 34, N'Light Boots III', N'light_boots_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (287, 18, 44, N'Light Boots IV', N'light_boots_4', 1, 13, 1, 124, 9, 1, 34, 1, 37, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (288, 20, 6, N'Basic Heavy Boots', N'heavy_boots_b', 1, 13, 1, 124, 1, 1, 33, 1, 36, 1, 0, 0, 0, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (289, 20, 16, N'Heavy Boots I', N'heavy_boots_1', 1, 13, 1, 124, 3, 1, 33, 1, 36, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (290, 20, 26, N'Heavy Boots II', N'heavy_boots_2', 1, 13, 1, 124, 5, 1, 33, 1, 36, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (291, 20, 36, N'Heavy Boots III', N'heavy_boots_3', 1, 13, 1, 124, 7, 1, 33, 1, 36, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (292, 20, 46, N'Heavy Boots IV', N'heavy_boots_4', 1, 13, 1, 124, 9, 1, 33, 1, 36, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (293, 19, 12, N'Force Necklace I', N'force_neck_1', 1, 13, 1, 124, 3, 1, 35, 1, 38, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (294, 19, 22, N'Force Necklace II', N'force_neck_2', 1, 13, 1, 124, 5, 1, 35, 1, 38, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (295, 19, 32, N'Force Necklace III', N'force_neck_3', 1, 13, 1, 124, 7, 1, 35, 1, 38, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (296, 19, 42, N'Force Necklace IV', N'force_neck_4', 1, 13, 1, 124, 9, 1, 35, 1, 38, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (297, 20, 13, N'Heavy Crest I', N'h_crest_1', 1, 13, 1, 124, 3, 1, 33, 1, 36, 1, 0, 0, 1, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (298, 20, 23, N'Heavy Crest II', N'h_crest_2', 1, 13, 1, 124, 5, 1, 33, 1, 36, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (299, 20, 33, N'Heavy Crest III', N'h_crest_3', 1, 13, 1, 124, 7, 1, 33, 1, 36, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (300, 20, 43, N'Heavy Crest IV', N'h_crest_4', 1, 13, 1, 124, 9, 1, 33, 1, 36, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (301, 18, 11, N'Light Choker I', N'lt_choker_1', 1, 13, 1, 124, 3, 1, 34, 1, 37, 1, 0, 0, 1, 2, 2, 0)
GO
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (302, 18, 21, N'Light Choker II', N'lt_choker_2', 1, 13, 1, 124, 5, 1, 34, 1, 37, 1, 0, 0, 2, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (303, 18, 31, N'Light Choker III', N'lt_choker_3', 1, 13, 1, 124, 7, 1, 34, 1, 37, 1, 0, 0, 3, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (304, 18, 41, N'Light Choker IV', N'lt_choker_4', 1, 13, 1, 124, 9, 1, 34, 1, 37, 1, 0, 0, 4, 2, 2, 0)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (305, 19, 50, N'Prism Force Necklace', N'prism_neck_f', 1, 13, 1, 124, 9, 1, 32, 1, 35, 1, 38, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (306, 18, 50, N'Prism Light Necklace', N'prism_neck_l', 1, 13, 1, 124, 9, 1, 32, 1, 35, 1, 38, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftBlueprints] ([CraftBlueprintID], [CraftCategoryID], [BaseLevel], [ItemName], [ItemResref], [Quantity], [SkillID], [CraftDeviceID], [PerkID], [RequiredPerkLevel], [IsActive], [MainComponentTypeID], [MainMinimum], [SecondaryComponentTypeID], [SecondaryMinimum], [TertiaryComponentTypeID], [TertiaryMinimum], [EnhancementSlots], [MainMaximum], [SecondaryMaximum], [TertiaryMaximum]) VALUES (307, 20, 50, N'Prism Heavy Necklace', N'prism_neck_h', 1, 13, 1, 124, 9, 1, 32, 1, 35, 1, 38, 1, 2, 2, 2, 2)
INSERT [dbo].[CraftDevices] ([CraftDeviceID], [Name]) VALUES (1, N'Armorsmith Bench')
INSERT [dbo].[CraftDevices] ([CraftDeviceID], [Name]) VALUES (2, N'Weaponsmith Bench')
INSERT [dbo].[CraftDevices] ([CraftDeviceID], [Name]) VALUES (3, N'Cookpot')
INSERT [dbo].[CraftDevices] ([CraftDeviceID], [Name]) VALUES (4, N'Engineering Bench')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (1, N'Bleeding', 129, N'BleedingEffect', N'You start bleeding.', N'You continue to bleed...', N'You have stopped bleeding.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (2, N'Burning', 0, N'BurningEffect', N'You are on fire.', N'You continue to burn...', N'You are no longer on fire.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (3, N'Poison', 0, N'PoisonEffect', N'You are poisoned.', N'Poison continues to course through your body.', N'You are no longer poisoned.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (4, N'Aegis', 0, N'AegisEffect', N'You receive the effect of Aegis.', N'', N'You no longer have the effect of Aegis.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (5, N'Food Disease', 0, N'FoodDiseaseEffect', N'You feel sick to your stomach.', N'', N'You no longer feel sick to your stomach.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (6, N'Chainspell', 0, N'ChainspellEffect', N'You receive the effect of chainspell.', N'', N'You no longer have the effect of chainspell.')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (1, N'DM')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (2, N'Admin')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (3, N'Player')
INSERT [dbo].[EnmityAdjustmentRule] ([EnmityAdjustmentRuleID], [Name]) VALUES (0, N'None')
INSERT [dbo].[EnmityAdjustmentRule] ([EnmityAdjustmentRuleID], [Name]) VALUES (1, N'Target Only')
INSERT [dbo].[EnmityAdjustmentRule] ([EnmityAdjustmentRuleID], [Name]) VALUES (2, N'All Tagged Targets')
INSERT [dbo].[EnmityAdjustmentRule] ([EnmityAdjustmentRuleID], [Name]) VALUES (3, N'Custom')
INSERT [dbo].[FameRegions] ([FameRegionID], [Name]) VALUES (1, N'Global')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (1, N'Light Armor')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (2, N'Heavy Armor')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (3, N'First Aid Supplies')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (4, N'Vibroblade')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (5, N'Finesse Vibroblade')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (6, N'Baton')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (7, N'Heavy Vibroblade')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (8, N'Saberstaff')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (9, N'Polearm')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (10, N'Twin Blade')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (11, N'Martial Art Weapon')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (12, N'Blaster Pistol')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (13, N'Blaster Rifle')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (14, N'Throwing')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (15, N'Shield')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (16, N'Ammunition')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (17, N'Crafting Tool')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (18, N'Component')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (19, N'Jewelry')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (20, N'Force Armor')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (21, N'Lightsaber')
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (0, N'Unknown', 0)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (1, N'Maps', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (2, N'Quest Items', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (3, N'Documents', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (4, N'Blueprints', 1)
SET IDENTITY_INSERT [dbo].[LootTableItems] ON 

INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (408, 1, N'blackberry', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (409, 2, N'blueberry', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (410, 3, N'grain_wheat', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (412, 5, N'grain_rice', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (413, 6, N'mineral_clay', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (414, 7, N'mushroom', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (415, 8, N'grain_rye', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (416, 9, N'meat_clam', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (417, 10, N'cotton', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (418, 11, N'flax', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (419, 12, N'jute', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (420, 13, N'sisal', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (421, 14, N'kapok', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (422, 15, N'abaca', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (423, 16, N'pina', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (424, 17, N'rayon', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (425, 18, N'lyocell', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (426, 19, N'hemp', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (431, 21, N'veg_onion', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (432, 22, N'aloe_vera', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (433, 23, N'mineral_sand', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (434, 24, N'grain_barley', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (435, 25, N'grain_corn', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (436, 26, N'sage_leaf', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (437, 27, N'stone', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (438, 28, N'elm_wood', 1, 3, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (439, 28, N'ash_wood', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (441, 30, N'mineral_salt', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (442, 31, N'encina_root', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (443, 32, N'garlic', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (444, 33, N'catnip_leaf', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (445, 34, N'clover_leaf', 1, 49, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (446, 34, N'lucky_clover', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (447, 35, N'ginger_root', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (448, 36, N'nettle_leaf', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (449, 37, N'hazle_leaf', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (450, 37, N'hazle_nut', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (451, 38, N'thistle_leaf', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (452, 4, N'raspberry', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (455, 39, N'pumpkin', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (460, 29, N'magicite_raw', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (461, 40, N'magicite_red', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (532, 41, N'iro_longsword', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (533, 41, N'splint_mail_p1', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (534, 41, N'leather_armor_p1', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (535, 41, N'iro_greataxe', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (536, 41, N'chain_shirt_p1', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (537, 41, N'arr_arrow', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (538, 41, N'iro_bolt', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (539, 41, N'iro_bullet', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (540, 41, N'iro_greatsword', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (541, 41, N'padded_armor_p1', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (542, 41, N'breastplate_p1', 1, 1, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (544, 42, N'sugar', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (546, 43, N'potato', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (547, 44, N'leek', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (554, 45, N'badger_hide', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (555, 45, N'meat_raw', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (556, 46, N'badger_hide', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (557, 47, N'meat_raw', 2, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (558, 48, N'wolf_hide', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (559, 49, N'rat_hide', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (560, 50, N'coconut', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (561, 51, N'grapes', 1, 10, 1)
INSERT [dbo].[LootTableItems] ([LootTableItemID], [LootTableID], [Resref], [MaxQuantity], [Weight], [IsActive]) VALUES (562, 52, N'bell_pepper', 1, 10, 1)
SET IDENTITY_INSERT [dbo].[LootTableItems] OFF
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (1, N'Forage - Blackberry Bush')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (2, N'Forage - Blueberry Bush')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (3, N'Forage - Wheat')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (4, N'Forage - Raspberry Bush')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (5, N'Forage - Rice')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (6, N'Forage - Clay')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (7, N'Forage - Mushroom')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (8, N'Forage - Rye')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (9, N'Forage - Clam')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (10, N'Forage - Cotton Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (11, N'Forage - Flax Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (12, N'Forage - Jute Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (13, N'Forage - Sisal Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (14, N'Forage - Kapok Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (15, N'Forage - Abaca Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (16, N'Forage - Pina Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (17, N'Forage - Rayon Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (18, N'Forage - Lyocell Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (19, N'Forage - Hemp Shrub')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (21, N'Forage - Onion')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (22, N'Forage - Aloe Vera')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (23, N'Forage - Sand')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (24, N'Forage - Barley')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (25, N'Forage - Corn')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (26, N'Forage - Sage')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (27, N'Forage - Stone')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (28, N'Forage - Drift Wood')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (29, N'Forage - Magicite')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (30, N'Forage - Salt')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (31, N'Forage - Encina Root')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (32, N'Forage - Garlic')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (33, N'Forage - Catnip Leaf')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (34, N'Forage - Clover Leaf')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (35, N'Forage - Ginger Root')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (36, N'Forage - Nettle Leaf')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (37, N'Forage - Hazle')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (38, N'Forage - Thistle Leaf')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (39, N'Forage - Pumpkin Patch')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (40, N'Forage - Red Magicite')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (41, N'Forage - Skeleton')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (42, N'Forage - Sugary Crystal')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (43, N'Forage - Potato')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (44, N'Forage - Leek')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (45, N'Forage - Badger Corpse')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (46, N'Forage - Badger hide')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (47, N'Forage - Wolf meat')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (48, N'Forage - wolf hide')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (49, N'Forage - Rat Hide')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (50, N'Coconut Tree')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (51, N'Forage - Grapes')
INSERT [dbo].[LootTables] ([LootTableID], [Name]) VALUES (52, N'Forage - Bell Pepper')
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (1, N'Ability Score', N'AbilityScoreRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (2, N'Armor Class', N'ArmorClassRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (3, N'Attack Bonus', N'AttackBonusRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (4, N'Base Attack Bonus', N'BaseAttackBonusRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (5, N'HP Bonus', N'HPRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (6, N'HP Regen Bonus', N'HPRegenRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (7, N'Light Ability', N'LightAbilityMod', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (8, N'Dark Ability', N'DarkAbilityMod', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (9, N'Summoning Magic', N'SummoningMagicRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (10, N'Casting Speed', N'CastingSpeedRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (11, N'FP', N'FPRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (12, N'FP Regen', N'FPRegenRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (13, N'Armorsmith', N'ArmorsmithRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (14, N'Cooking', N'CookingRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (15, N'Logging', N'LoggingRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (16, N'Mining', N'MiningRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (17, N'Engineering', N'EngineeringRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (18, N'Weaponsmith', N'WeaponsmithRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (19, N'Durability', N'DurabilityRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (20, N'Enmity', N'EnmityRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (21, N'Luck', N'LuckRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (22, N'Meditate', N'MeditateRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (23, N'First Aid', N'FirstAidRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (24, N'Enhancement Bonus', N'EnhancementBonusRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (25, N'Damage', N'DamageRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (26, N'Sneak Attack', N'SneakAttackRune', 1)
INSERT [dbo].[Mods] ([ModID], [Name], [Script], [IsActive]) VALUES (27, N'Adjusted Level', N'LevelRune', 1)
SET IDENTITY_INSERT [dbo].[PCPerks] ON 

INSERT [dbo].[PCPerks] ([PCPerkID], [PlayerID], [AcquiredDate], [PerkID], [PerkLevel]) VALUES (1365, N'eb075df7c81c4935abf41e4ff9309288', CAST(N'2018-09-01T08:23:15.1045700' AS DateTime2), 84, 1)
SET IDENTITY_INSERT [dbo].[PCPerks] OFF
SET IDENTITY_INSERT [dbo].[PCSkills] ON 

INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1718, N'eb075df7c81c4935abf41e4ff9309288', 0, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1719, N'eb075df7c81c4935abf41e4ff9309288', 1, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1720, N'eb075df7c81c4935abf41e4ff9309288', 2, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1721, N'eb075df7c81c4935abf41e4ff9309288', 3, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1722, N'eb075df7c81c4935abf41e4ff9309288', 4, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1723, N'eb075df7c81c4935abf41e4ff9309288', 5, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1724, N'eb075df7c81c4935abf41e4ff9309288', 6, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1725, N'eb075df7c81c4935abf41e4ff9309288', 7, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1726, N'eb075df7c81c4935abf41e4ff9309288', 8, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1727, N'eb075df7c81c4935abf41e4ff9309288', 9, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1728, N'eb075df7c81c4935abf41e4ff9309288', 10, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1729, N'eb075df7c81c4935abf41e4ff9309288', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1730, N'eb075df7c81c4935abf41e4ff9309288', 12, 582, 3, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1731, N'eb075df7c81c4935abf41e4ff9309288', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1732, N'eb075df7c81c4935abf41e4ff9309288', 14, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1733, N'eb075df7c81c4935abf41e4ff9309288', 15, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1734, N'eb075df7c81c4935abf41e4ff9309288', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1735, N'eb075df7c81c4935abf41e4ff9309288', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1736, N'eb075df7c81c4935abf41e4ff9309288', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1737, N'eb075df7c81c4935abf41e4ff9309288', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1738, N'eb075df7c81c4935abf41e4ff9309288', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1739, N'eb075df7c81c4935abf41e4ff9309288', 22, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1740, N'eb075df7c81c4935abf41e4ff9309288', 23, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1741, N'eb075df7c81c4935abf41e4ff9309288', 24, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1743, N'2b384b2d598c43c3b45cb7185dd67e4c', 0, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1744, N'2b384b2d598c43c3b45cb7185dd67e4c', 1, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1745, N'2b384b2d598c43c3b45cb7185dd67e4c', 2, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1746, N'2b384b2d598c43c3b45cb7185dd67e4c', 3, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1747, N'2b384b2d598c43c3b45cb7185dd67e4c', 4, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1748, N'2b384b2d598c43c3b45cb7185dd67e4c', 5, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1749, N'2b384b2d598c43c3b45cb7185dd67e4c', 6, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1750, N'2b384b2d598c43c3b45cb7185dd67e4c', 7, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1751, N'2b384b2d598c43c3b45cb7185dd67e4c', 8, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1752, N'2b384b2d598c43c3b45cb7185dd67e4c', 9, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1753, N'2b384b2d598c43c3b45cb7185dd67e4c', 10, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1754, N'2b384b2d598c43c3b45cb7185dd67e4c', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1755, N'2b384b2d598c43c3b45cb7185dd67e4c', 12, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1756, N'2b384b2d598c43c3b45cb7185dd67e4c', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1757, N'2b384b2d598c43c3b45cb7185dd67e4c', 14, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1758, N'2b384b2d598c43c3b45cb7185dd67e4c', 15, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1759, N'2b384b2d598c43c3b45cb7185dd67e4c', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1760, N'2b384b2d598c43c3b45cb7185dd67e4c', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1761, N'2b384b2d598c43c3b45cb7185dd67e4c', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1762, N'2b384b2d598c43c3b45cb7185dd67e4c', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1763, N'2b384b2d598c43c3b45cb7185dd67e4c', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1764, N'2b384b2d598c43c3b45cb7185dd67e4c', 22, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1765, N'2b384b2d598c43c3b45cb7185dd67e4c', 23, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (1766, N'2b384b2d598c43c3b45cb7185dd67e4c', 24, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[PCSkills] OFF
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (3, N'Gathering', 1, 25)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (4, N'General', 1, 1)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (5, N'Utility', 1, 24)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (6, N'Shields', 1, 3)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (7, N'Armor', 1, 2)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (8, N'Firearms - General', 1, 13)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (9, N'One-Handed - General', 1, 4)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (10, N'One-Handed - Vibroblades', 1, 5)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (11, N'One-Handed - Finesse Vibroblades', 1, 6)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (12, N'One-Handed - Batons', 1, 7)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (13, N'Two-Handed - Heavy Vibroblades', 1, 8)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (14, N'Two-Handed - Saberstaffs', 1, 9)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (15, N'Two-Handed - Polearms', 1, 10)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (16, N'Twin Blades - Twin Vibroblades', 1, 11)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (17, N'Martial Arts', 1, 12)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (18, N'Blasters - Blaster Pistols', 1, 14)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (19, N'Blasters - Blaster Rifles', 1, 15)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (20, N'Throwing', 1, 16)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (21, N'Metalworking', 1, 19)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (23, N'Weaponsmith', 1, 20)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (25, N'Armorsmith', 1, 21)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (27, N'Cooking', 1, 23)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (29, N'Dark Side Abilities', 1, 28)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (30, N'Light Side Abilities', 1, 29)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (31, N'Summoning Magic', 1, 30)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (32, N'Survival', 1, 27)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (33, N'Engineering', 1, 22)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (34, N'Harvesting', 1, 26)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (35, N'Twin Blades - Saberstaffs', 1, 31)
INSERT [dbo].[PerkCategories] ([PerkCategoryID], [Name], [IsActive], [Sequence]) VALUES (36, N'One-Handed - Lightsabers', 1, 32)
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (0, N'N/A')
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (1, N'Shield On-Hit')
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (2, N'Queued Weapon Skill')
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (3, N'Spell')
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (4, N'Combat Ability')
INSERT [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID], [Name]) VALUES (5, N'Equipment-Based')
SET IDENTITY_INSERT [dbo].[PerkLevels] ON 

INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (37, 9, 1, 2, N'+5% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (38, 9, 2, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (39, 9, 3, 2, N'+15% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (40, 9, 4, 3, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (41, 9, 5, 3, N'+25% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (42, 9, 6, 4, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (43, 10, 1, 2, N'+5% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (44, 10, 2, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (45, 10, 3, 2, N'+15% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (46, 10, 4, 3, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (47, 10, 5, 3, N'+25% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (48, 10, 6, 4, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (49, 11, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (50, 11, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (51, 11, 3, 3, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (52, 11, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (53, 11, 5, 4, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (54, 11, 6, 4, N'+60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (55, 12, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (56, 12, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (57, 12, 3, 3, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (58, 12, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (59, 12, 5, 4, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (60, 12, 6, 4, N'+60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (61, 13, 1, 2, N'+5% chance to break off ore. -10% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (62, 13, 2, 2, N'+10% chance to break off ore. -20% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (63, 13, 3, 3, N'+15% chance to break off ore. -30% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (64, 13, 4, 3, N'+20% chance to break off ore. -40% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (65, 13, 5, 4, N'+25% chance to break off ore. -50% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (66, 13, 6, 4, N'+30% chance to break off ore. -60% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (67, 14, 1, 2, N'+5% chance to break off wood. -10% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (68, 14, 2, 2, N'+10% chance to break off wood. -20% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (69, 14, 3, 3, N'+15% chance to break off wood. -30% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (70, 14, 4, 3, N'+20% chance to break off wood. -40% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (71, 14, 5, 4, N'+25% chance to break off wood. -50% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (72, 14, 6, 4, N'+30% chance to break off wood. -60% chance to lose durability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (73, 15, 1, 6, N'+1 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (74, 15, 2, 6, N'+2 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (75, 15, 3, 11, N'+3 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (76, 15, 4, 11, N'+4 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (77, 15, 5, 16, N'+5 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (78, 15, 6, 16, N'+6 Luck')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (79, 16, 1, 2, N'+5 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (80, 16, 2, 2, N'+10 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (81, 16, 3, 3, N'+15 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (82, 16, 4, 3, N'+20 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (83, 16, 5, 3, N'+25 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (84, 16, 6, 4, N'+30 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (85, 16, 7, 4, N'+35 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (86, 16, 8, 5, N'+40 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (87, 16, 9, 5, N'+45 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (88, 16, 10, 6, N'+50 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (89, 17, 1, 2, N'+5 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (90, 17, 2, 2, N'+10 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (91, 17, 3, 3, N'+15 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (92, 17, 4, 3, N'+20 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (93, 17, 5, 3, N'+25 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (94, 17, 6, 4, N'+30 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (95, 17, 7, 4, N'+35 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (96, 17, 8, 5, N'+40 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (97, 17, 9, 5, N'+45 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (98, 17, 10, 6, N'+50 FP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (99, 18, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (100, 18, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (101, 18, 3, 3, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (102, 18, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (103, 18, 5, 4, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (104, 19, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (105, 19, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (106, 19, 3, 3, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (107, 19, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (108, 19, 5, 4, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (109, 20, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (110, 20, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (111, 20, 3, 3, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (112, 20, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (113, 20, 5, 4, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (114, 20, 6, 4, N'60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (115, 21, 1, 2, N'+6 Seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (116, 21, 2, 2, N'+12 Seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (117, 21, 3, 3, N'+18 Seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (118, 21, 4, 3, N'+24 Seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (119, 21, 5, 4, N'+30 Seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (120, 22, 1, 2, N'1x Healing Kit Effectiveness')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (121, 22, 2, 2, N'2x Healing Kit Effectiveness')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (122, 22, 3, 3, N'3x Healing Kit Effectiveness')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (123, 22, 4, 3, N'4x Healing Kit Effectiveness')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (124, 23, 1, 2, N'10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (125, 23, 2, 2, N'20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (126, 23, 3, 3, N'30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (127, 23, 4, 3, N'40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (128, 23, 5, 4, N'50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (129, 24, 1, 2, N'+1 AB for 12 seconds with a 10% of occurring')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (130, 24, 2, 2, N'+1 AB for 12 seconds with a 20% of occurring')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (131, 24, 3, 3, N'+2 AB for 12 seconds with a 20% of occurring')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (132, 24, 4, 3, N'+2 AB for 12 seconds with a 30% of occurring')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (133, 24, 5, 4, N'+3 AB for 12 seconds with a 30% of occurring')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (134, 25, 1, 2, N'50% chance to recover 1 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (135, 25, 2, 2, N'50% chance to recover 2 HP')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (136, 25, 3, 3, N'50% chance to recover 3 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (137, 25, 4, 3, N'75% chance to recover 3 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (138, 25, 5, 4, N'75% chance to recover 4 HP')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (139, 26, 1, 2, N'+10% Concealment for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (140, 26, 2, 2, N'+15% Concealment for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (141, 26, 3, 3, N'+20% Concealment for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (142, 26, 4, 3, N'+25% Concealment for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (143, 26, 5, 4, N'+30% Concealment for 18 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (144, 27, 1, 2, N'Damage shield damage: 1 + 1d4 for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (145, 27, 2, 2, N'Damage shield damage: 1 + 1d8 for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (146, 27, 3, 3, N'Damage shield damage: 2 + 2d6 for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (147, 27, 4, 3, N'Damage shield damage: 2 + 2d8 for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (148, 27, 5, 4, N'Damage shield damage: 3 + 2d12 for 12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1144, 28, 1, 2, N'')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1145, 29, 1, 3, N'Grants Two-weapon Fighting feat which reduces attack penalty from -6/-10 to -4/-8 when fighting with two weapons. Must be equipped with a one-handed weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1146, 29, 2, 4, N'Grants Ambidexterity feat which reduces the attack penalty of your off-hand weapon by 4. Must be equipped with a one-handed weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1147, 29, 3, 6, N'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a one-handed weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1148, 30, 1, 2, N'Grants the Power Attack feat which grants a +5 bonus to damage roll at the cost of -5 to attack roll. Only available when equipped with a Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1149, 30, 2, 3, N'Grants the Improved Power Attack feat which grants a +10 bonus to damage roll at the cost of -10 to attack roll. Does not replace Power Attack. Only available when equipped with a Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1150, 31, 1, 2, N'Grants the Power Attack feat which grants a +5 bonus to damage roll at the cost of -5 to attack roll. Only available when equipped with a baton.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1151, 31, 2, 3, N'Grants the Improved Power Attack feat which grants a +10 bonus to damage roll at the cost of -10 to attack roll. Does not replace Power Attack. Only available when equipped with a baton.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1152, 32, 1, 2, N'Grants the Called Shot feat which have a chance to reduce a target''s movement rate by 20% and inflicts a penalty to DEX. This feat is only available when equipped with a Finesse Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1153, 33, 1, 2, N'Grants the Circle Kick feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1154, 34, 1, 2, N'Grants the Cleave feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1155, 35, 1, 2, N'Grants the Deflect Arrows feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1156, 36, 1, 2, N'Grants the Dodge feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1157, 37, 1, 2, N'Grants the Expertise feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1158, 38, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1159, 38, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1160, 38, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1161, 38, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1162, 38, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1163, 39, 1, 3, N'Grants the Improved Critical feat when equipped with a blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1164, 40, 1, 3, N'Grants the Improved Critical feat when equipped with a finesse blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1165, 41, 1, 3, N'Grants the Improved Critical feat when equipped with a baton weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1166, 42, 1, 3, N'Grants the Improved Critical feat when equipped with a heavy blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1167, 43, 1, 3, N'Grants the Improved Critical feat when equipped with a saberstaff weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1168, 44, 1, 3, N'Grants the Improved Critical feat when equipped with a polearm.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1169, 45, 1, 3, N'Grants the Improved Critical feat when equipped with twin vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1170, 46, 1, 3, N'Grants the Improved Critical feat when equipped with martial arts weapons.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1171, 47, 1, 3, N'Grants the Improved Critical feat when equipped with bows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1172, 48, 1, 3, N'Grants the Improved Critical feat when equipped with crossbows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1173, 49, 1, 3, N'Grants the Improved Critical feat when equipped with throwing weapons.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1174, 50, 1, 2, N'+10% Chance, effect lasts 3 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1175, 50, 2, 2, N'+20% Chance, effect lasts 3 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1176, 50, 3, 3, N'+20% Chance, effect lasts 6 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1177, 50, 4, 4, N'+30% Chance, effect lasts 6 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1178, 50, 5, 4, N'+40% Chance, effect lasts 6 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1179, 50, 6, 5, N'+50% Chance, effect lasts 6 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1180, 51, 1, 4, N'+4 Dodge AC')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1181, 52, 1, 4, N'You gain the Opportunist feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1182, 53, 1, 4, N'You gain the Rapid Reload feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1183, 54, 1, 4, N'You gain the Rapid Shot feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1184, 55, 1, 4, N'You gain the Rapid Shot feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1185, 56, 1, 3, N'You gain the Weapon Finesse feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1186, 57, 1, 3, N'You gain the Zen Archery feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1187, 58, 1, 3, N'You gain the Zen Archery feat.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1188, 59, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1189, 59, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1190, 60, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with finesse vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1191, 60, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with finesse vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1192, 61, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a baton weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1193, 61, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a baton weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1194, 62, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a heavy blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1195, 62, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a heavy blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1196, 63, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a saberstaff weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1197, 63, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a saberstaff weapon.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1198, 64, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a polearm.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1199, 64, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a polearm.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1200, 65, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with twin vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1201, 65, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with twin vibroblades.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1202, 66, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with martial arts weapons or unarmed.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1203, 66, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with martial arts weapons or unarmed.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1204, 67, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with bows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1205, 67, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with bows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1206, 68, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with crossbows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1207, 68, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with crossbows.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1208, 69, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with throwing weapons.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1209, 69, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with throwing weapons.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1210, 70, 1, 2, N'Deals 1d6 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1211, 70, 2, 2, N'Deals 1d6 damage and inflicts stun for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1212, 70, 3, 3, N'Deals 2d6 damage and inflicts stun for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1213, 70, 4, 3, N'Deals 4d4 damage and inflicts stun for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1214, 70, 5, 4, N'Deals 3d8 damage and inflicts stun for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1215, 71, 1, 2, N'Deals 1d8 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1216, 71, 2, 2, N'Deals 2d6 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1217, 71, 3, 3, N'Deals 4d4 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1218, 71, 4, 4, N'Deals 5d4 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1219, 71, 5, 5, N'Deals 4d8 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1220, 72, 1, 2, N'Deals 1d6 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1221, 72, 2, 2, N'Deals 1d6 damage and inflicts slow for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1222, 72, 3, 3, N'Deals 2d6 damage and inflicts slow for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1223, 72, 4, 3, N'Deals 4d4 damage and inflicts slow for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1224, 72, 5, 4, N'Deals 3d8 damage and inflicts slow for 3 seconds to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1225, 73, 1, 2, N'Deals 1d6 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1226, 73, 2, 2, N'Deals 1d6 damage and inflicts burn for 3 ticks to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1227, 73, 3, 3, N'Deals 2d6 damage and inflicts burn for 4 ticks to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1228, 73, 4, 3, N'Deals 4d4 damage and inflicts burn for 4 ticks to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1229, 73, 5, 4, N'Deals 3d8 damage and inflicts burn for 5 ticks to single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1230, 74, 1, 6, N'Targets self only.')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1231, 74, 2, 6, N'Targets single party member.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1232, 75, 1, 2, N'Remove bleeding effect.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1233, 75, 2, 2, N'Remove bleeding and poison.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1234, 75, 3, 2, N'Remove bleeding, poison and burn.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1235, 76, 1, 2, N'AC +1 for a base of 1 minute')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1236, 76, 2, 2, N'AC +2 for a base of 1 minute')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1237, 76, 3, 3, N'AC +2 for a base of 5 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1238, 76, 4, 3, N'AC +3 for a base of 5 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1239, 76, 5, 4, N'AC +4 for a base of 5 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1240, 77, 1, 2, N'Restores 3-5 HP and grants +1 regen every 6 seconds for 18 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1241, 77, 2, 2, N'Restores 3-5 HP and grants +1 regen every 6 seconds for 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1242, 77, 3, 2, N'Restores 7-10 HP and grants +1 regen every 6 seconds for 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1243, 77, 4, 3, N'Restores 7-10 HP and grants +2 regen every 6 seconds for 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1244, 77, 5, 3, N'Restores 10-13 HP and grants +2 regen every 6 seconds for 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1245, 77, 6, 4, N'Restores 10-13 HP and grants +3 regen every 6 seconds for 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1246, 78, 1, 2, N'Deals 1d8 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1247, 78, 2, 2, N'Deals 2d6 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1248, 78, 3, 3, N'Deals 4d4 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1249, 78, 4, 4, N'Deals 5d4 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1250, 78, 5, 5, N'Deals 4d8 damage to a single target.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1251, 79, 1, 2, N'-10% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1252, 79, 2, 2, N'-20% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1253, 79, 3, 2, N'-30% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1254, 79, 4, 2, N'-40% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1255, 79, 5, 2, N'-50% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1256, 79, 6, 2, N'-60% Delay')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1257, 80, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1258, 80, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1259, 80, 3, 2, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1260, 80, 4, 2, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1261, 80, 5, 2, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1262, 80, 6, 2, N'+60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1263, 81, 1, 2, N'+12 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1264, 81, 2, 2, N'+18 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1265, 81, 3, 2, N'+24 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1266, 81, 4, 2, N'+30 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1267, 81, 5, 3, N'+48 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1268, 81, 6, 3, N'+60 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1269, 82, 1, 2, N'You can refine Veldite.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1270, 82, 2, 2, N'You can refine Veldite and Scordspar.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1271, 82, 3, 2, N'You can refine Veldite, Scordspar, and Plagionite.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1272, 82, 4, 2, N'You can refine Veldite, Scordspar, Plagionite, and Keromber.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1273, 82, 5, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, and Jasioclase.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1274, 82, 6, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, and Hemorgite.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1275, 82, 7, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, and Ochne.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1276, 82, 8, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, and Croknor.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1277, 82, 9, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, Croknor, and Arkoxit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1278, 82, 10, 2, N'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, Croknor, Arkoxit, and Bisteiss.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1289, 84, 1, 2, N'Tier 1 weaponsmith blueprints.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1290, 84, 2, 2, N'Tier 1 weaponsmith blueprints. +1 enhancement slot')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1291, 84, 3, 3, N'Tier 2 weaponsmith blueprints. +1 enhancement slot')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1292, 84, 4, 4, N'Tier 2 weaponsmith blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1293, 84, 5, 5, N'Tier 3 weaponsmith blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1294, 84, 6, 5, N'Tier 3 weaponsmith blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1295, 84, 7, 5, N'Tier 4 weaponsmith blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1296, 84, 8, 6, N'Tier 4 weaponsmith blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1297, 84, 9, 6, N'Tier 5 weaponsmith blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1298, 84, 10, 7, N'Tier 5 weaponsmith blueprints. +5 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1299, 85, 1, 2, N'10% chance to search one more time')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1300, 85, 2, 2, N'20% chance to search one more time')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1301, 85, 3, 3, N'30% chance to search one more time')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1302, 85, 4, 3, N'40% chance to search one more time')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1303, 85, 5, 4, N'50% chance to search one more time')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1304, 85, 6, 4, N'50% chance to search one more time. 10% chance to search a second time.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1305, 85, 7, 5, N'50% chance to search one more time. 20% chance to search a second time.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1306, 85, 8, 5, N'50% chance to search one more time. 30% chance to search a second time.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1307, 85, 9, 6, N'50% chance to search one more time. 40% chance to search a second time.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1308, 85, 10, 7, N'50% chance to search one more time. 50% chance to search a second time.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1330, 89, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1331, 89, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1332, 89, 3, 2, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1333, 89, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1334, 89, 5, 3, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1335, 89, 6, 4, N'+60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1336, 89, 7, 4, N'+70% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1337, 89, 8, 4, N'+80% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1338, 89, 9, 5, N'+90% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1339, 89, 10, 5, N'+100% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1340, 90, 1, 2, N'-5% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1341, 90, 2, 2, N'-10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1342, 90, 3, 3, N'-15% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1343, 90, 4, 4, N'-20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1344, 90, 5, 5, N'-25% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1345, 90, 6, 5, N'-30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1346, 91, 1, 2, N'-2% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1347, 91, 2, 2, N'-4% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1348, 91, 3, 3, N'-6% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1349, 91, 4, 3, N'-8% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1350, 91, 5, 4, N'-10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1351, 91, 6, 5, N'-30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1352, 92, 1, 2, N'+5% Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1353, 92, 2, 2, N'+10% Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1354, 92, 3, 3, N'+15% Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1355, 92, 4, 4, N'+20% Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1356, 92, 5, 5, N'+25% Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1357, 93, 1, 2, N'All ore will go into your inventory automatically on harvest.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1358, 94, 1, 2, N'All wood will go into your inventory automatically on harvest.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1360, 96, 1, 2, N'Tier 1 engineering blueprints.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1361, 96, 2, 3, N'Tier 1 engineering blueprints. +1 enhancement slot')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1362, 96, 3, 4, N'Tier 2 engineering blueprints. +1 enhancement slot')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1363, 96, 4, 5, N'Tier 2 engineering blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1364, 96, 5, 6, N'Tier 3 engineering blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1365, 96, 6, 7, N'Tier 3 engineering blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1366, 96, 7, 8, N'Tier 4 engineering blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1367, 96, 8, 9, N'Tier 4 engineering blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1368, 96, 9, 10, N'Tier 5 engineering blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1369, 96, 10, 11, N'Tier 5 engineering blueprints. +5 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1380, 98, 1, 2, N'+10% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1381, 98, 2, 2, N'+20% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1382, 98, 3, 3, N'+30% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1383, 98, 4, 3, N'+40% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1384, 98, 5, 3, N'+50% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1385, 98, 6, 4, N'+60% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1386, 98, 7, 4, N'+70% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1387, 98, 8, 4, N'+80% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1388, 98, 9, 5, N'+90% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1389, 98, 10, 6, N'+99% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1390, 99, 1, 2, N'+10% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1391, 99, 2, 2, N'+20% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1392, 99, 3, 3, N'+30% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1393, 99, 4, 3, N'+40% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1394, 99, 5, 3, N'+50% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1395, 99, 6, 4, N'+60% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1396, 99, 7, 4, N'+70% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1397, 99, 8, 4, N'+80% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1398, 99, 9, 5, N'+90% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1399, 99, 10, 6, N'+99% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1400, 100, 1, 2, N'+10% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1401, 100, 2, 2, N'+20% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1402, 100, 3, 3, N'+30% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1403, 100, 4, 3, N'+40% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1404, 100, 5, 3, N'+50% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1405, 100, 6, 4, N'+60% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1406, 100, 7, 4, N'+70% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1407, 100, 8, 4, N'+80% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1408, 100, 9, 5, N'+90% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1409, 100, 10, 6, N'+99% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1410, 101, 1, 2, N'+10% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1411, 101, 2, 2, N'+20% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1412, 101, 3, 3, N'+30% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1413, 101, 4, 3, N'+40% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1414, 101, 5, 3, N'+50% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1415, 101, 6, 4, N'+60% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1416, 101, 7, 4, N'+70% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1417, 101, 8, 4, N'+80% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1418, 101, 9, 5, N'+90% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1419, 101, 10, 6, N'+99% Crafting Speed')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1420, 102, 1, 2, N'Unlocks tier 1 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1421, 102, 2, 2, N'Unlocks tier 2 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1422, 102, 3, 3, N'Unlocks tier 3 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1423, 102, 4, 4, N'Unlocks tier 4 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1424, 102, 5, 5, N'Unlocks tier 5 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1425, 102, 6, 5, N'Unlocks tier 6 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1426, 102, 7, 5, N'Unlocks tier 7 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1427, 102, 8, 6, N'Unlocks tier 8 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1428, 102, 9, 6, N'Unlocks tier 9 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1429, 102, 10, 7, N'Unlocks tier 10 cooking recipes.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1430, 103, 1, 2, N'Restores 1 FP every 6 seconds. Recast time: 5 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1431, 103, 2, 3, N'Restores 1 FP every 6 seconds. Recast time: 4 minutes, 30 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1432, 103, 3, 4, N'Restores 1 FP every 6 seconds. Recast time: 4 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1433, 103, 4, 5, N'Restores 2 FP every 6 seconds. Recast time: 4 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1434, 103, 5, 6, N'Restores 2 FP every 6 seconds. Recast time: 3 minutes, 30 seconds')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1435, 103, 6, 7, N'Restores 2 FP every 6 seconds. Recast time: 3 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1436, 103, 7, 8, N'Restores 3 FP every 6 seconds. Recast time: 3 minutes')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1457, 106, 1, 2, N'+10% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1458, 106, 2, 2, N'+20% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1459, 106, 3, 2, N'+30% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1460, 106, 4, 3, N'+40% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1461, 106, 5, 3, N'+50% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1462, 106, 6, 4, N'+60% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1463, 106, 7, 4, N'+70% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1464, 106, 8, 4, N'+80% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1465, 106, 9, 5, N'+90% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1466, 106, 10, 5, N'+100% Chance')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1467, 107, 1, 3, N'Grants two-weapon fighting feat which reduces attack penalty from -6/-10 to -2/-6. Must be equipped with a Twin Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1468, 107, 2, 4, N'Grants Ambidexterity feat which reduces the attack penatly fo your off-hand weapon by 4. Must be equipped with a Twin Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1469, 107, 3, 6, N'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a Twin Blade.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1482, 104, 1, 3, N'Grants the Provoke ability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1483, 104, 2, 2, N'Reduces cooldown by 5 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1484, 104, 3, 4, N'Reduces cooldown by 10 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1485, 104, 4, 4, N'Reduces cooldown by 15 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1486, 83, 1, 2, N'Install red runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1487, 83, 2, 2, N'Install red runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1488, 83, 3, 2, N'Install red runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1489, 83, 4, 3, N'Install red runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1490, 83, 5, 3, N'Install red runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1491, 83, 6, 4, N'Install red runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1492, 83, 7, 4, N'Install red runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1493, 83, 8, 5, N'Install red runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1494, 83, 9, 5, N'Install red runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1495, 83, 10, 5, N'Install red runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1496, 86, 1, 2, N'Install blue runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1497, 86, 2, 2, N'Install blue runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1498, 86, 3, 2, N'Install blue runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1499, 86, 4, 3, N'Install blue runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1500, 86, 5, 3, N'Install blue runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1501, 86, 6, 4, N'Install blue runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1502, 86, 7, 4, N'Install blue runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1503, 86, 8, 5, N'Install blue runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1504, 86, 9, 5, N'Install blue runes up to level 45 on items up to level 90.')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1505, 86, 10, 5, N'Install blue runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1506, 88, 1, 2, N'Install green runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1507, 88, 2, 2, N'Install green runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1508, 88, 3, 2, N'Install green runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1509, 88, 4, 3, N'Install green runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1510, 88, 5, 3, N'Install green runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1511, 88, 6, 4, N'Install green runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1512, 88, 7, 4, N'Install green runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1513, 88, 8, 5, N'Install green runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1514, 88, 9, 5, N'Install green runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1515, 88, 10, 5, N'Install green runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1516, 97, 1, 2, N'Install yellow runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1517, 97, 2, 2, N'Install yellow runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1518, 97, 3, 2, N'Install yellow runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1519, 97, 4, 3, N'Install yellow runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1520, 97, 5, 3, N'Install yellow runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1521, 97, 6, 4, N'Install yellow runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1522, 97, 7, 4, N'Install yellow runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1523, 97, 8, 5, N'Install yellow runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1524, 97, 9, 5, N'Install yellow runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1525, 97, 10, 5, N'Install yellow runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1536, 109, 1, 2, N'Install red runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1537, 109, 2, 2, N'Install red runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1538, 109, 3, 2, N'Install red runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1539, 109, 4, 3, N'Install red runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1540, 109, 5, 3, N'Install red runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1541, 109, 6, 4, N'Install red runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1542, 109, 7, 4, N'Install red runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1543, 109, 8, 5, N'Install red runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1544, 109, 9, 5, N'Install red runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1545, 109, 10, 5, N'Install red runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1546, 110, 1, 2, N'Install blue runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1547, 110, 2, 2, N'Install blue runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1548, 110, 3, 2, N'Install blue runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1549, 110, 4, 3, N'Install blue runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1550, 110, 5, 3, N'Install blue runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1551, 110, 6, 4, N'Install blue runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1552, 110, 7, 4, N'Install blue runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1553, 110, 8, 5, N'Install blue runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1554, 110, 9, 5, N'Install blue runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1555, 110, 10, 5, N'Install blue runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1556, 111, 1, 2, N'Install green runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1557, 111, 2, 2, N'Install green runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1558, 111, 3, 2, N'Install green runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1559, 111, 4, 3, N'Install green runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1560, 111, 5, 3, N'Install green runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1561, 111, 6, 4, N'Install green runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1562, 111, 7, 4, N'Install green runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1563, 111, 8, 5, N'Install green runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1564, 111, 9, 5, N'Install green runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1565, 111, 10, 5, N'Install green runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1566, 112, 1, 2, N'Install yellow runes up to level 5 on items up to level 10.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1567, 112, 2, 2, N'Install yellow runes up to level 10 on items up to level 20.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1568, 112, 3, 2, N'Install yellow runes up to level 15 on items up to level 30.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1569, 112, 4, 3, N'Install yellow runes up to level 20 on items up to level 40.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1570, 112, 5, 3, N'Install yellow runes up to level 25 on items up to level 50.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1571, 112, 6, 4, N'Install yellow runes up to level 30 on items up to level 60.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1572, 112, 7, 4, N'Install yellow runes up to level 35 on items up to level 70.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1573, 112, 8, 5, N'Install yellow runes up to level 40 on items up to level 80.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1574, 112, 9, 5, N'Install yellow runes up to level 45 on items up to level 90.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1575, 112, 10, 5, N'Install yellow runes up to level 50 on items up to level 100.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1576, 113, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1577, 113, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1578, 113, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1579, 113, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1580, 113, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1581, 113, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1582, 113, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1583, 113, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1584, 113, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1585, 113, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1586, 38, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1587, 38, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1588, 38, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1589, 38, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1590, 38, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1591, 114, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1592, 114, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1593, 114, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1594, 114, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1595, 114, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1596, 114, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1597, 114, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1598, 114, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1599, 114, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1600, 114, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1601, 115, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1602, 115, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1603, 115, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1604, 115, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1605, 115, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1606, 115, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1607, 115, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1608, 115, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1609, 115, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1610, 115, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1611, 116, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1612, 116, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1613, 116, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1614, 116, 4, 4, N'+4 BAB')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1615, 116, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1616, 116, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1617, 116, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1618, 116, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1619, 116, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1620, 116, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1621, 117, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1622, 117, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1623, 117, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1624, 117, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1625, 117, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1626, 117, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1627, 117, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1628, 117, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1629, 117, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1630, 117, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1631, 118, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1632, 118, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1633, 118, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1634, 118, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1635, 118, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1636, 118, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1637, 118, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1638, 118, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1639, 118, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1640, 118, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1641, 119, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1642, 119, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1643, 119, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1644, 119, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1645, 119, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1646, 119, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1647, 119, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1648, 119, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1649, 119, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1650, 119, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1651, 120, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1652, 120, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1653, 120, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1654, 120, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1655, 120, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1656, 120, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1657, 120, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1658, 120, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1659, 120, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1660, 120, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1661, 121, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1662, 121, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1663, 121, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1664, 121, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1665, 121, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1666, 121, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1667, 121, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1668, 121, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1669, 121, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1670, 121, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1671, 122, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1672, 122, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1673, 122, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1674, 122, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1675, 122, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1676, 122, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1677, 122, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1678, 122, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1679, 122, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1680, 122, 10, 6, N'+10 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1681, 123, 1, 4, N'Deals 2x damage from behind, 1.5x damage from any other direction.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1682, 123, 5, 6, N'Deals 2x damage from behind, 1.5x damage from any other direction. Reduces cooldown by 1 minute.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1683, 123, 3, 4, N'Deals 2x damage from behind, 1.5x damage from any other direction. Reduces cooldown by 30 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1684, 123, 4, 5, N'Deals 2x damage from behind, 1.5x damage from any other direction. Reduces cooldown by 1 minute.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1685, 124, 1, 2, N'Tier 1 armorsmith blueprints.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1686, 124, 2, 2, N'Tier 1 amorsmith blueprints. +1 enhancement slot')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1687, 124, 3, 3, N'Tier 2 armorsmith blueprints. +1 enhancement slot')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1688, 124, 4, 3, N'Tier 2 armorsmith blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1689, 124, 5, 4, N'Tier 3 armorsmith blueprints. +2 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1690, 124, 6, 4, N'Tier 3 armorsmith blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1691, 124, 7, 5, N'Tier 4 armorsmith blueprints. +3 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1692, 124, 8, 5, N'Tier 4 armorsmith blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1693, 124, 9, 6, N'Tier 5 armorsmith blueprints. +4 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1694, 124, 10, 6, N'Tier 5 armorsmith blueprints. +5 enhancement slots')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1695, 125, 1, 2, N'50% chance to recover 1 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1696, 125, 2, 2, N'100% chance to recover 1 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1697, 125, 3, 3, N'100% chance to recover 1 FP each hit. 50% chance to recover an additional 1 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1698, 125, 4, 4, N'100% chance to recover 2 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1699, 125, 5, 4, N'100% chance to recover 2 FP each hit. 50% chance to recover an additional 1 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1700, 125, 6, 5, N'100% chance to recover 3 FP each hit.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1701, 126, 1, 5, N'Grants the Chainspell ability.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1702, 126, 2, 5, N'Increases length of effect by 24 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1703, 126, 3, 6, N'Increases length of effect by 48 seconds.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1704, 127, 1, 2, N'+2 to natural FP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1705, 127, 2, 3, N'+3 to natural FP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1706, 127, 3, 4, N'+4 to natural FP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1707, 127, 4, 5, N'+5 to natural FP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1708, 127, 5, 6, N'+6 to natural FP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1709, 128, 1, 2, N'+2 to natural HP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1710, 128, 2, 3, N'+3 to natural HP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1711, 128, 3, 4, N'+4 to natural HP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1712, 128, 4, 5, N'+5 to natural HP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1713, 128, 5, 6, N'+6 to natural HP regen')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1714, 87, 1, 3, N'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with lightsabers.')
GO
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1715, 87, 2, 4, N'You gain the Weapon Specialization feat which grants a +2 damage when equipped with lightsabers.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1716, 105, 1, 3, N'Grants the Improved Critical feat when equipped with a lightsaber.')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1727, 129, 1, 3, N'+1 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1728, 129, 2, 3, N'+2 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1729, 129, 3, 3, N'+3 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1730, 129, 4, 4, N'+4 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1731, 129, 5, 4, N'+5 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1732, 129, 6, 4, N'+6 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1733, 129, 7, 5, N'+7 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1734, 129, 8, 5, N'+8 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1735, 129, 9, 5, N'+9 BAB')
INSERT [dbo].[PerkLevels] ([PerkLevelID], [PerkID], [Level], [Price], [Description]) VALUES (1736, 129, 10, 6, N'+10 BAB')
SET IDENTITY_INSERT [dbo].[PerkLevels] OFF
SET IDENTITY_INSERT [dbo].[PerkLevelSkillRequirements] ON 

INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (38, 38, 10, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (39, 39, 10, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (40, 40, 10, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (41, 41, 10, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (42, 42, 10, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (44, 44, 14, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (45, 45, 14, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (46, 46, 14, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (47, 47, 14, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (48, 48, 14, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (49, 49, 10, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (50, 50, 10, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (51, 51, 10, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (52, 52, 10, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (53, 53, 10, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (54, 54, 10, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (55, 55, 14, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (56, 56, 14, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (57, 57, 14, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (58, 58, 14, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (59, 59, 14, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (60, 60, 14, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (61, 61, 10, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (62, 62, 10, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (63, 63, 10, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (64, 64, 10, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (65, 65, 10, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (66, 66, 10, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (67, 67, 10, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (68, 68, 10, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (69, 69, 10, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (70, 70, 10, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (71, 71, 10, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (72, 72, 10, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (73, 99, 10, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (74, 100, 10, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (75, 101, 10, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (76, 102, 10, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (77, 103, 10, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (78, 104, 14, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (79, 105, 14, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (80, 106, 14, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (81, 107, 14, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (82, 108, 14, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (83, 109, 17, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (84, 110, 17, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (85, 111, 17, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (86, 112, 17, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (87, 113, 17, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (88, 114, 17, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (89, 115, 17, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (90, 116, 17, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (91, 117, 17, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (92, 118, 17, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (93, 119, 17, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (94, 120, 17, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (95, 121, 17, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (96, 122, 17, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (97, 123, 17, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (98, 124, 17, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (99, 125, 17, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (100, 126, 17, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (101, 127, 17, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (102, 128, 17, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (103, 129, 9, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (104, 130, 9, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (105, 131, 9, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (106, 132, 9, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (107, 133, 9, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (108, 134, 9, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (109, 135, 9, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (110, 136, 9, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (111, 137, 9, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (112, 138, 9, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (113, 139, 7, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (114, 140, 7, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (115, 141, 7, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (116, 142, 7, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (117, 143, 7, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (118, 144, 8, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (119, 145, 8, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (120, 146, 8, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (121, 147, 8, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (122, 148, 8, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1118, 1144, 5, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1119, 1145, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1120, 1146, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1121, 1147, 1, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1122, 1148, 1, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1123, 1149, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1124, 1150, 1, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1125, 1151, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1126, 1152, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1127, 1153, 4, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1128, 1154, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1129, 1155, 4, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1130, 1156, 7, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1131, 1157, 8, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1132, 1158, 6, 10)
GO
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1133, 1159, 6, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1134, 1160, 6, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1135, 1161, 6, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1136, 1162, 6, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1137, 1163, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1138, 1164, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1139, 1165, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1140, 1166, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1141, 1167, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1142, 1168, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1143, 1169, 3, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1144, 1170, 4, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1145, 1171, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1146, 1172, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1147, 1173, 6, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1148, 1174, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1149, 1175, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1150, 1176, 2, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1151, 1177, 2, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1152, 1178, 2, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1153, 1179, 2, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1154, 1180, 7, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1155, 1181, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1156, 1182, 5, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1157, 1183, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1158, 1184, 6, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1159, 1185, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1160, 1186, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1161, 1187, 6, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1162, 1188, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1163, 1189, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1164, 1190, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1165, 1191, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1166, 1192, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1167, 1193, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1168, 1194, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1169, 1195, 2, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1170, 1196, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1171, 1197, 2, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1172, 1198, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1173, 1199, 2, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1174, 1200, 3, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1175, 1201, 3, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1176, 1202, 4, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1177, 1203, 4, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1178, 1204, 5, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1179, 1205, 5, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1180, 1206, 5, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1181, 1207, 5, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1182, 1208, 6, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1183, 1209, 6, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1185, 1211, 19, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1186, 1212, 19, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1187, 1213, 19, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1188, 1214, 19, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1190, 1216, 19, 6)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1191, 1217, 19, 16)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1192, 1218, 19, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1193, 1219, 19, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1195, 1221, 19, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1196, 1222, 19, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1197, 1223, 19, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1198, 1224, 19, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1200, 1226, 19, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1201, 1227, 19, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1202, 1228, 19, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1203, 1229, 19, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1204, 1230, 20, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1205, 1231, 20, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1207, 1233, 20, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1209, 1234, 20, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1210, 1235, 20, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1211, 1236, 20, 7)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1212, 1237, 20, 13)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1213, 1238, 20, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1214, 1239, 20, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1216, 1241, 20, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1217, 1242, 20, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1218, 1243, 20, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1219, 1244, 20, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1220, 1245, 20, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1222, 1247, 20, 6)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1223, 1248, 20, 16)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1224, 1249, 20, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1225, 1250, 20, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1226, 1251, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1227, 1252, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1228, 1253, 22, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1229, 1254, 22, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1230, 1255, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1231, 1256, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1232, 1257, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1233, 1258, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1234, 1259, 22, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1235, 1260, 22, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1236, 1261, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1237, 1262, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1238, 1263, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1239, 1264, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1240, 1265, 22, 15)
GO
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1241, 1266, 22, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1242, 1267, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1243, 1268, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1245, 1270, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1246, 1271, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1247, 1272, 22, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1248, 1273, 22, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1249, 1274, 22, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1250, 1275, 22, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1251, 1276, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1252, 1277, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1253, 1278, 22, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1265, 1290, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1266, 1291, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1267, 1292, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1268, 1293, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1269, 1294, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1270, 1295, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1271, 1296, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1272, 1297, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1273, 1298, 12, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1274, 1299, 24, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1275, 1300, 24, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1276, 1301, 24, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1277, 1302, 24, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1278, 1303, 24, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1279, 1304, 24, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1280, 1305, 24, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1281, 1306, 24, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1282, 1307, 24, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1283, 1308, 24, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1305, 1330, 14, 1)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1306, 1331, 14, 6)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1307, 1332, 14, 11)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1308, 1333, 14, 16)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1309, 1334, 14, 21)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1310, 1335, 14, 26)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1311, 1336, 14, 31)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1312, 1337, 14, 36)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1313, 1338, 14, 41)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1314, 1339, 14, 46)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1315, 1340, 24, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1316, 1341, 24, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1317, 1342, 24, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1318, 1343, 24, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1319, 1344, 24, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1320, 1345, 24, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1321, 1346, 23, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1322, 1347, 23, 6)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1323, 1348, 23, 9)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1324, 1349, 23, 12)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1325, 1350, 23, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1326, 1351, 23, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1327, 1352, 23, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1328, 1353, 23, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1329, 1354, 23, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1330, 1355, 23, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1331, 1356, 23, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1332, 1357, 10, 3)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1333, 1358, 14, 3)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1336, 1361, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1337, 1362, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1338, 1363, 22, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1339, 1364, 22, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1340, 1365, 22, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1341, 1366, 22, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1342, 1367, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1343, 1368, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1344, 1369, 22, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1356, 1381, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1357, 1382, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1358, 1383, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1359, 1384, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1360, 1385, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1361, 1386, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1362, 1387, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1363, 1388, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1364, 1389, 12, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1366, 1391, 13, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1367, 1392, 13, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1368, 1393, 13, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1369, 1394, 13, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1370, 1395, 13, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1371, 1396, 13, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1372, 1397, 13, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1373, 1398, 13, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1374, 1399, 13, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1376, 1401, 16, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1377, 1402, 16, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1378, 1403, 16, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1379, 1404, 16, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1380, 1405, 16, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1381, 1406, 16, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1382, 1407, 16, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1383, 1408, 16, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1384, 1409, 16, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1386, 1411, 22, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1387, 1412, 22, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1388, 1413, 22, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1389, 1414, 22, 20)
GO
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1390, 1415, 22, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1391, 1416, 22, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1392, 1417, 22, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1393, 1418, 22, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1394, 1419, 22, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1396, 1421, 16, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1397, 1422, 16, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1398, 1423, 16, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1399, 1424, 16, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1400, 1425, 16, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1401, 1426, 16, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1402, 1427, 16, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1403, 1428, 16, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1404, 1429, 16, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1425, 1457, 24, 1)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1426, 1458, 24, 6)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1427, 1459, 24, 11)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1428, 1460, 24, 16)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1429, 1461, 24, 21)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1430, 1462, 24, 26)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1431, 1463, 24, 31)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1432, 1464, 24, 36)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1433, 1465, 24, 41)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1434, 1466, 24, 46)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1435, 1467, 3, 1)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1436, 1468, 3, 8)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1437, 1469, 3, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1450, 1482, 8, 2)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1451, 1483, 8, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1452, 1484, 8, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1453, 1485, 8, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1454, 1486, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1455, 1487, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1456, 1488, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1457, 1489, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1458, 1490, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1459, 1491, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1460, 1492, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1461, 1493, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1462, 1494, 12, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1463, 1495, 12, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1464, 1496, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1465, 1497, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1466, 1498, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1467, 1499, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1468, 1500, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1469, 1501, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1470, 1502, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1471, 1503, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1472, 1504, 12, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1473, 1505, 12, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1474, 1506, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1475, 1507, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1476, 1508, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1477, 1509, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1478, 1510, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1479, 1511, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1480, 1512, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1481, 1513, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1482, 1514, 12, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1483, 1515, 12, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1484, 1516, 12, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1485, 1517, 12, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1486, 1518, 12, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1487, 1519, 12, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1488, 1520, 12, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1489, 1521, 12, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1490, 1522, 12, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1491, 1523, 12, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1492, 1524, 12, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1493, 1525, 12, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1504, 1536, 13, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1505, 1537, 13, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1506, 1538, 13, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1507, 1539, 13, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1508, 1540, 13, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1509, 1541, 13, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1510, 1542, 13, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1511, 1543, 13, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1512, 1544, 13, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1513, 1545, 13, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1514, 1546, 13, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1515, 1547, 13, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1516, 1548, 13, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1517, 1549, 13, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1518, 1550, 13, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1519, 1551, 13, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1520, 1552, 13, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1521, 1553, 13, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1522, 1554, 13, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1523, 1555, 13, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1524, 1556, 13, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1525, 1557, 13, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1526, 1558, 13, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1527, 1559, 13, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1528, 1560, 13, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1529, 1561, 13, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1530, 1562, 13, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1531, 1563, 13, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1532, 1564, 13, 45)
GO
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1533, 1565, 13, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1534, 1566, 13, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1535, 1567, 13, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1536, 1568, 13, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1537, 1569, 13, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1538, 1570, 13, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1539, 1571, 13, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1540, 1572, 13, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1541, 1573, 13, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1542, 1574, 13, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1543, 1575, 13, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1544, 1576, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1545, 1577, 1, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1546, 1578, 1, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1547, 1579, 1, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1548, 1580, 1, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1549, 1581, 1, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1550, 1582, 1, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1551, 1583, 1, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1552, 1584, 1, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1553, 1585, 1, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1554, 1586, 6, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1555, 1587, 6, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1556, 1588, 6, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1557, 1589, 6, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1558, 1590, 6, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1559, 1591, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1560, 1592, 1, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1561, 1593, 1, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1562, 1594, 1, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1563, 1595, 1, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1564, 1596, 1, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1565, 1597, 1, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1566, 1598, 1, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1567, 1599, 1, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1568, 1600, 1, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1569, 1601, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1570, 1602, 1, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1571, 1603, 1, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1572, 1604, 1, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1573, 1605, 1, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1574, 1606, 1, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1575, 1607, 1, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1576, 1608, 1, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1577, 1609, 1, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1578, 1610, 1, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1579, 1611, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1580, 1612, 2, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1581, 1613, 2, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1582, 1614, 2, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1583, 1615, 2, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1584, 1616, 2, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1585, 1617, 2, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1586, 1618, 2, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1587, 1619, 2, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1588, 1620, 2, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1589, 1621, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1590, 1622, 2, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1591, 1623, 2, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1592, 1624, 2, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1593, 1625, 2, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1594, 1626, 2, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1595, 1627, 2, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1596, 1628, 2, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1597, 1629, 2, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1598, 1630, 2, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1599, 1631, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1600, 1632, 2, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1601, 1633, 2, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1602, 1634, 2, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1603, 1635, 2, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1604, 1636, 2, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1605, 1637, 2, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1606, 1638, 2, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1607, 1639, 2, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1608, 1640, 2, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1609, 1641, 3, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1610, 1642, 3, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1611, 1643, 3, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1612, 1644, 3, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1613, 1645, 3, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1614, 1646, 3, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1615, 1647, 3, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1616, 1648, 3, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1617, 1649, 3, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1618, 1650, 3, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1619, 1651, 4, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1620, 1652, 4, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1621, 1653, 4, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1622, 1654, 4, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1623, 1655, 4, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1624, 1656, 4, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1625, 1657, 4, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1626, 1658, 4, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1627, 1659, 4, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1628, 1660, 4, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1629, 1661, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1630, 1662, 5, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1631, 1663, 5, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1632, 1664, 5, 40)
GO
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1633, 1665, 5, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1634, 1666, 5, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1635, 1667, 5, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1636, 1668, 5, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1637, 1669, 5, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1638, 1670, 5, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1639, 1671, 5, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1640, 1672, 5, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1641, 1673, 5, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1642, 1674, 5, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1643, 1675, 5, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1644, 1676, 5, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1645, 1677, 5, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1646, 1678, 5, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1647, 1679, 5, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1648, 1680, 5, 100)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1649, 1681, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1650, 1682, 1, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1651, 1683, 1, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1652, 1684, 1, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1653, 1685, 11, 0)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1654, 1686, 11, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1655, 1687, 11, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1656, 1688, 11, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1657, 1689, 11, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1658, 1690, 11, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1659, 1691, 11, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1660, 1692, 11, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1661, 1693, 11, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1662, 1694, 11, 45)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1663, 1695, 2, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1664, 1696, 2, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1665, 1697, 2, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1666, 1698, 2, 35)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1667, 1699, 2, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1668, 1700, 2, 75)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1669, 1701, 19, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1670, 1702, 19, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1671, 1703, 19, 75)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1672, 1704, 11, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1673, 1705, 11, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1674, 1706, 11, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1675, 1707, 11, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1676, 1708, 11, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1677, 1709, 8, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1678, 1710, 8, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1679, 1711, 8, 25)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1680, 1712, 8, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1681, 1713, 8, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1682, 1714, 1, 5)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1683, 1715, 1, 15)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1684, 1716, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1685, 1727, 1, 10)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1686, 1728, 1, 20)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1687, 1729, 1, 30)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1688, 1730, 1, 40)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1689, 1731, 1, 50)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1690, 1732, 1, 60)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1691, 1733, 1, 70)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1692, 1734, 1, 80)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1693, 1735, 1, 90)
INSERT [dbo].[PerkLevelSkillRequirements] ([PerkLevelSkillRequirementID], [PerkLevelID], [SkillID], [RequiredRank]) VALUES (1694, 1736, 1, 100)
SET IDENTITY_INSERT [dbo].[PerkLevelSkillRequirements] OFF
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (9, N'Miner', NULL, 1, N'Harvesting.Miner', 0, 0, N'Increases your chance to obtain ore while mining.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (10, N'Lumberjack', NULL, 1, N'Harvesting.Lumberjack', 0, 0, N'Increases your chance to obtain wood while logging.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (11, N'Precision Mining', NULL, 1, N'Harvesting.PrecisionMining', 0, 0, N'Occasionally break off a second resource while mining.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (12, N'Precision Logging', NULL, 1, N'Harvesting.PrecisionLogging', 0, 0, N'Occasionally break off a second resource while logging.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (13, N'Pickaxe Expert', NULL, 1, N'Harvesting.PickaxeExpert', 0, 0, N'Increases the effectiveness of pickaxes while mining.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (14, N'Logging Axe Expert', NULL, 1, N'Harvesting.LoggingAxeExpert', 0, 0, N'Increases the effectiveness of logging axes while logging.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (15, N'Lucky', NULL, 1, N'General.Lucky', 0, 0, N'Improves your luck. Luck affects many actions and activities.', 4, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (16, N'Health', NULL, 1, N'General.Health', 0, 0, N'Improves your hit points.', 4, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (17, N'FP', NULL, 1, N'General.FP', 0, 0, N'Improves your FP pool.', 4, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (18, N'Speedy Miner', NULL, 1, N'Harvesting.SpeedyMiner', 0, 0, N'You occasionally receive haste for 8 seconds while mining.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (19, N'Speedy Logger', NULL, 1, N'Harvesting.SpeedyLogger', 0, 0, N'You occasionally receive haste for 8 seconds while logging.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (20, N'Speedy Medic', NULL, 1, N'FirstAid.SpeedyMedic', 0, 0, N'Healing kits and bandages are occasionally applied instantly.', 5, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (21, N'Healing Kit Expert', NULL, 1, N'FirstAid.HealingKitExpert', 0, 0, N'Improves the duration of healing kits.', 5, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (22, N'Immediate Improvement', NULL, 1, N'FirstAid.ImmediateImprovement', 0, 0, N'Healing kits immediately recover HP in addition to their natural recovery over time.', 5, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (23, N'Frugal Medic', NULL, 1, N'FirstAid.FrugalMedic', 0, 0, N'Occasionally use a healing kit without consuming a charge.', 5, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (24, N'Expulsion Maneuver', NULL, 1, N'Shields.ExpulsionManeuver', 0, 0, N'Occasionally receive increased Attack Bonus when blocking with a shield.', 6, NULL, 1, NULL, 0, 15, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (25, N'Blocking Recovery', NULL, 1, N'Shields.BlockingRecovery', 0, 0, N'Occasionally recover hit points on a successful block with a shield.', 6, NULL, 1, NULL, 0, 10, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (26, N'Evasiveness', 1116, 1, N'Armor.Evasiveness', 0, 0, N'Grants a concealment bonus for a short period of time when equipped with light armor.', 7, 1, 4, NULL, 1, 20, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (27, N'Deflect Damage', 1117, 1, N'Armor.DeflectDamage', 0, 0, N'You are protected by a damage shield for a limited time. Must be wearing heavy armor.', 7, 1, 4, NULL, 1, 10, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (28, N'Point Blank Shot', NULL, 1, N'Firearms.PointBlankShot', 0, 0, N'Negates the -4 penalty for using missile weapons in melee and gains +1 to attack roll and damage with ranged weapons when the target is within 15 feet. Only applies when equipped with light armor.', 8, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (29, N'Dual Wielding', NULL, 1, N'OneHanded.DualWielding', 0, 0, N'Grants bonuses while wielding two weapons.', 9, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (30, N'Blade Power Attack', NULL, 1, N'OneHanded.BladePowerAttack', 0, 0, N'Increases damage at the cost of reduced attack rolls. Only available when equipped with a blade.', 10, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (31, N'Blunt Power Attack', NULL, 1, N'OneHanded.BluntPowerAttack', 0, 0, N'Increases damage at the cost of reduced attack rolls. Only available when equipped with a blunt.', 12, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (32, N'Called Shot', NULL, 1, N'OneHanded.CalledShot', 0, 0, N'Grants the ability to make a potentially disabling attack against an opponent''s arms or legs. Must be equipped with a Finesse Blade.', 11, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (33, N'Circle Kick', NULL, 1, N'MartialArts.CircleKick', 0, 0, N'Grants the Circle Kick feat. You gain an additional free attack against another, nearby enemy. There is a maximum of one free attack per round. You must be equipped with a Martial Arts weapon.', 17, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (34, N'Cleave', NULL, 1, N'TwoHanded.Cleave', 0, 0, N'Grants a free attack against any opponent who is within melee range when an enemy is killed. Must be equipped with a Two-Handed Heavy Blade weapon.', 13, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (35, N'Deflect Arrows', NULL, 1, N'MartialArts.DeflectArrows', 0, 0, N'Attempt to deflect one incoming missile attack per round. Must be equipped with a Martial Arts weapon.', 17, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (36, N'Dodge', NULL, 1, N'Armor.Dodge', 0, 0, N'You gain a dodge bonus to AC against attacks from your current target or last target. Must be equipped with light armor.', 7, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (37, N'Expertise', NULL, 1, N'Armor.Expertise', 0, 0, N'Gives you the ability to make defensive attacks, gaining +5 AC but receiving -5 penalty to attack rolls. Must be equipped with Heavy Armor.', 7, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (38, N'Throwing Proficiency', NULL, 1, N'Throwing.ThrowingProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a throwing weapon in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 20, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (39, N'Improved Critical - Vibroblades', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a vibroblade.', 10, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (40, N'Improved Critical - Finesse Vibroblades', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a finesse vibroblade.', 11, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (41, N'Improved Critical - Batons', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a baton weapon.', 12, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (42, N'Improved Critical - Heavy Vibroblades', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a heavy vibroblade.', 13, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (43, N'Improved Critical - Saberstaffs', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a saberstaff weapon.', 14, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (44, N'Improved Critical - Polearms', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a polearm.', 15, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (45, N'Improved Critical - Twin Vibroblades', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using twin vibroblades.', 16, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (46, N'Improved Critical - Martial Arts', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using martial arts.', 17, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (47, N'Improved Critical - Blasters', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using blaster pistols.', 18, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (48, N'Improved Critical - Rifles', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using blaster rifles.', 19, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (49, N'Improved Critical - Throwing', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using throwing weapons.', 20, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (50, N'Knockdown', 1118, 1, N'TwoHanded.Knockdown', 0, 0, N'Grants you the ability to knock down the target of your next attack. Must be equipped with a heavy blunt weapon.', 14, 3, 2, NULL, 1, 20, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (51, N'Mobility', NULL, 1, N'Armor.Mobility', 0, 0, N'Grants an AC bonus against attacks of opportunities. Must be equipped with light armor.', 7, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (52, N'Opportunist', NULL, 1, N'OneHanded.Opportunist', 0, 0, N'You gain a +4 bonus to attack rolls when making an attack of opportunity. Must be equipped with a Finesse Blade.', 11, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (53, N'Rapid Reload', NULL, 1, N'Firearms.RapidReload', 0, 0, N'You receive the same number of attacks with any rifle as you would if you were using a blaster. Must be equipped with light armor.', 19, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (54, N'Rapid Shot', NULL, 1, N'Firearms.RapidShot', 0, 0, N'You gain an extra attack per round while feat is active but all attacks in the round suffer a -2 penalty. Must be equipped with a blaster and light armor.', 18, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (55, N'Rapid Toss', NULL, 1, N'Throwing.RapidToss', 0, 0, N'You gain an extra attack per round while feat is active but all attacks in the round suffer a -2 penalty. Must be equipped with a throwing weapon and light armor.', 20, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (56, N'Weapon Finesse', NULL, 1, N'OneHanded.WeaponFinesse', 0, 0, N'You make melee attack rolls with your DEX if it is higher than your STR. Must be equipped with a finesse blade.', 11, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (57, N'Zen Marksmanship', NULL, 1, N'Firearms.ZenMarksmanship', 0, 0, N'Wisdom guides your ranged attacks. If your WIS modifier is higher than DEX, it will be used when firing ranged weapons. Must be equipped with a blaster or rifle.', 8, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (58, N'Zen Tossing', NULL, 1, N'Throwing.ZenTossing', 0, 0, N'Wisdom guides your ranged attacks. If your WIS modifier is higher than DEX, it will be used when firing ranged weapons. Must be equipped with a throwing weapon.', 20, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (59, N'Weapon Focus - Vibroblades', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using a vibroblade. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 10, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (60, N'Weapon Focus - Finesse Vibroblades', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using a finesse vibroblade. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 11, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (61, N'Weapon Focus - Batons', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using a baton weapon. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 12, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (62, N'Weapon Focus - Heavy Vibroblades', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using heavy vibroblades. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 13, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (63, N'Weapon Focus - Saberstaffs', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using saberstaff weapons. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 14, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (64, N'Weapon Focus - Polearms', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using polearms. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 15, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (65, N'Weapon Focus - Twin Blades', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using twin vibroblades. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 16, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (66, N'Weapon Focus - Martial Arts', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using martial arts. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 17, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (67, N'Weapon Focus - Blaster Pistols', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using blaster pistols. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 18, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (68, N'Weapon Focus - Blaster Rifles', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using blaster rifles. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 19, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (69, N'Weapon Focus - Throwing', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using throwing weapons. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.', 20, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (70, N'Crushing Earth', 1119, 1, N'DarkSide.CrushingEarth', 12, 6, N'Earth-based magic which damages and stuns a single target.', 29, 4, 3, NULL, 0, 10, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (71, N'Lightning Shock', 1120, 1, N'DarkSide.LightningShock', 8, 4, N'Lightning-based magic which damages a single target.', 29, 5, 3, NULL, 0, 10, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (72, N'Grasping Ice', 1121, 1, N'DarkSide.GraspingIce', 12, 6, N'Ice-based magic which damages and slows a single target.', 29, 6, 3, NULL, 0, 10, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (73, N'Fire Blast', 1122, 1, N'DarkSide.FireBlast', 12, 6, N'Fire-based magic which damages and burns a single target.', 29, 7, 3, NULL, 0, 10, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (74, N'Gate', 1123, 1, N'LightSide.Gate', 30, 16, N'Teleports the target to the last mysterious obelisk touched.', 30, 8, 3, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (75, N'Purify', 1124, 1, N'LightSide.Purify', 6, 4, N'Remove detrimental effects from a single target.', 30, 9, 3, NULL, 0, 5, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (76, N'Aegis', 1125, 1, N'LightSide.Aegis', 7, 6, N'Increases the AC of a single target for a limited time.', 30, 10, 3, NULL, 0, 10, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (77, N'Recover', 1126, 1, N'LightSide.Recover', 8, 3, N'Heals a single target and grants regeneration for a short period of time.', 30, 11, 3, NULL, 0, 8, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (78, N'Holy Shot', 1127, 1, N'LightSide.HolyShot', 8, 4.5, N'Shoots a beam at a target, dealing damage.', 30, 12, 3, NULL, 0, 10, 1)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (79, N'Speedy Refining', NULL, 1, N'Engineering.SpeedyRefining', 0, 0, N'Reduces the amount of time it takes to refine raw materials.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (80, N'Processing Efficiency', NULL, 1, N'Engineering.ProcessingEfficiency', 0, 0, N'Occasionally receive additional items while processing raw materials.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (81, N'Refinery Management', NULL, 1, N'Engineering.RefineryManagement', 0, 0, N'Increases the time power sources last in a refinery.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (82, N'Refining', NULL, 1, N'Engineering.Refining', 0, 0, N'Enables you to refine more difficult raw materials at a refinery.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (83, N'Combat Mod Installation - Weapons', NULL, 1, N'Weaponsmith.CombatModInstallationWeapons', 0, 0, N'Enables the installation of red combat mods into weapons.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (84, N'Weapon Blueprints', NULL, 1, N'Weaponsmith.WeaponBlueprints', 0, 0, N'Unlocks new weapon blueprints on every odd level (1, 3, 5, 7, 9) and adds an enhancement slot for every even level (2, 4, 6, 8, 10) for weaponsmithing.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (85, N'Forage Expert', NULL, 1, N'Gathering.ForageExpert', 0, 0, N'You have a chance to search multiple times while foraging.', 3, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (86, N'Magic Mod Installation - Weapons', NULL, 1, N'Weaponsmith.MagicModInstallationWeapons', 0, 0, N'Enables the installation of blue magic mods into weapons.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (87, N'Weapon Focus - Lightsabers', NULL, 1, N'Weapons.Focus', 0, 0, N'You gain a bonus to attack rolls and damage when using a lightsaber. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage. ', 35, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (88, N'Crafting Mod Installation - Weapons', NULL, 1, N'Weaponsmith.CraftingModInstallationWeapons', 0, 0, N'Enables the installation of green crafting mods into weapons.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (89, N'Seed Searcher', NULL, 1, N'Harvesting.SeedSearcher', 0, 0, N'Increases your chance to find a second set of seeds when a tree is exhausted.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (90, N'Careful Forager', NULL, 1, N'Gathering.CarefulForager', 0, 0, N'Reduces the chance of exhausting a resource while foraging.', 3, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (91, N'Farming Efficiency', NULL, 1, N'Survival.FarmingEfficiency', 0, 0, N'Crops you plant have a reduced chance to be exhausted when foraged once fully grown. This bonus affects all players who forage this crop, not just you.', 32, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (92, N'Expert Farmer', NULL, 1, N'Survival.ExpertFarmer', 0, 0, N'Reduces the amount of time it takes for a plant to fully mature.', 32, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (93, N'Ore Bagger', NULL, 1, N'Harvesting.OreBagger', 0, 0, N'Ore you harvest will automatically go into your inventory instead of dropping on the ground.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (94, N'Wood Bagger', NULL, 1, N'Harvesting.WoodBagger', 0, 0, N'Wood you harvest will automatically go into your inventory instead of dropping on the ground.', 34, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (96, N'Engineering Blueprints', NULL, 1, N'Engineering.EngineeringBlueprints', 0, 0, N'Unlocks new engineering blueprints on every odd level (1, 3, 5, 7, 9) and adds an enhancement slot for every even level (2, 4, 6, 8, 10) for engineering.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (97, N'Special Mod Installation - Weapons', NULL, 1, N'Weaponsmith.SpecialModInstallationWeapons', 0, 0, N'Enables the installation of yellow special mods into weapons.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (98, N'Speedy Weaponsmith', NULL, 1, N'Weaponsmith.SpeedyWeaponsmith', 0, 0, N'Reduces the amount of time it takes to craft weaponsmith items and install mods into weapons.', 23, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (99, N'Speedy Armorsmith', NULL, 1, N'Armorsmith.SpeedyArmorsmith', 0, 0, N'Reduces the amount of time it takes to craft armorsmith items and install mods into armors.', 25, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (100, N'Speedy Cooking', NULL, 1, N'Cooking.SpeedyCooking', 0, 0, N'Reduces the amount of time it takes to craft cooking items.', 27, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (101, N'Speedy Engineering', NULL, 1, N'Engineering.SpeedyEngineering', 0, 0, N'Reduces the amount of time it takes to craft engineering items.', 33, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (102, N'Food Recipes', NULL, 1, N'Cooking.FoodRecipes', 0, 0, N'Unlocks additional food recipes for cooking.', 27, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (103, N'Meditate', 1128, 1, N'General.Meditate', 0, 1, N'Restores FP quickly as long as you stay in one place. Must be out of combat to use. Moving or combat will interrupt the ability.', 4, 13, 4, NULL, 1, 1, 2)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (104, N'Provoke', 1129, 1, N'Armor.Provoke', 0, 0, N'Increases the enmity of a single target towards the user. Must be equipped with Heavy Armor to use.', 7, 14, 4, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (105, N'Improved Critical - Lightsabers', NULL, 1, N'Weapons.ImprovedCritical', 0, 0, N'Improves the critical hit chance when using a lightsaber.', 35, NULL, 5, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (106, N'Seed Picker', NULL, 1, N'Gathering.SeedPicker', 0, 0, N'Increases your chance to find a second set of seeds when a forage point is exhausted.', 3, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (107, N'Twin Blade Mastery', NULL, 1, N'TwinBlade.TwinBladeMastery', 0, 0, N'Grants bonuses and reduces penalties while wielding twin blades or saberstaffs.', 16, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (109, N'Combat Mod Installation - Armors', NULL, 1, N'Armorsmith.CombatModInstallationArmors', 0, 0, N'Enables the installation of red combat mods into armors.', 25, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (110, N'Magic Mod Installation - Armors', NULL, 1, N'Armorsmith.MagicModInstallationArmors', 0, 0, N'Enables the installation of blue magic mods into armors.', 25, NULL, 0, NULL, 0, 0, 0)
GO
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (111, N'Crafting Mod Installation - Armors', NULL, 1, N'Armorsmith.CraftingModInstallationArmors', 0, 0, N'Enables the installation of green crafting mods into armors.', 25, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (112, N'Special Mod Installation - Armors', NULL, 1, N'Armorsmith.SpecialModInstallationArmors', 0, 0, N'Enables the installation of yellow special mods into armors.', 25, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (113, N'Vibroblade Proficiency', NULL, 1, N'OneHanded.VibrobladeProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a vibroblade in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 10, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (114, N'Baton Proficiency', NULL, 1, N'OneHanded.BatonProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a baton in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 12, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (115, N'Finesse Vibroblade Proficiency', NULL, 1, N'OneHanded.FinesseVibrobladeProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a finesse vibroblade in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 11, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (116, N'Heavy Vibroblade Proficiency', NULL, 1, N'TwoHanded.HeavyVibrobladeProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a heavy vibroblade in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 13, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (117, N'Saberstaff Proficiency', NULL, 1, N'TwinBlade.SaberstaffProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a saberstaff in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 14, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (118, N'Polearm Proficiency', NULL, 1, N'TwoHanded.PolearmProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a polearm in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 15, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (119, N'Twin Vibroblade Proficiency', NULL, 1, N'TwinBlade.TwinVibrobladeProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a twin vibroblade in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 16, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (120, N'Martial Arts Proficiency', NULL, 1, N'MartialArts.MartialArtsProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a martial arts weapon in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 17, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (121, N'Blaster Pistol Proficiency', NULL, 1, N'Blaster.BlasterPistolProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a blaster pistol weapon in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 18, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (122, N'Blaster Rifle Proficiency', NULL, 1, N'Blaster.BlasterRifleProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a blaster rifle weapon in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 19, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (123, N'Sneak Attack', 1132, 1, N'OneHanded.SneakAttack', 0, 0, N'Deals extreme damage to a target on your next attack. Highest amount of damage is done from behind the target. Must be equipped with light armor and a finesse blade.', 11, 15, 2, NULL, 1, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (124, N'Armor Blueprints', NULL, 1, N'Armorsmith.ArmorBlueprints', 0, 0, N'Unlocks new armor blueprints on every odd level (1, 3, 5, 7, 9) and adds an enhancement slot for every even level (2, 4, 6, 8, 10) for armorsmithing.', 25, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (125, N'Battlemage', 1133, 1, N'TwoHanded.Battlemage', 0, 0, N'Replenish FP when you damage a target with a heavy blunt weapon. Must be equipped with a heavy blunt weapon and force armor.', 14, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (126, N'Chainspell', 1134, 1, N'DarkSide.Chainspell', 0, 2, N'Reduces the cooldown time of all spells to zero while effect is active. Must be equipped with force armor to activate.', 29, 16, 4, NULL, 1, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (127, N'Clarity', NULL, 1, N'Armor.Clarity', 0, 0, N'Increases natural FP regeneration. Must be equipped with force armor.', 7, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (128, N'Sturdiness', NULL, 1, N'Armor.Sturdiness', 0, 0, N'Increases natural HP regeneration. Must be equipped with heavy armor.', 7, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Perks] ([PerkID], [Name], [FeatID], [IsActive], [JavaScriptName], [BaseFPCost], [BaseCastingTime], [Description], [PerkCategoryID], [CooldownCategoryID], [ExecutionTypeID], [ItemResref], [IsTargetSelfOnly], [Enmity], [EnmityAdjustmentRuleID]) VALUES (129, N'Lightsaber Proficiency', NULL, 1, N'OneHanded.LightsaberProficiency', 0, 0, N'Increases your Base Attack Bonus when equipped with a lightsaber in your main hand. Higher BAB increases chance to hit and grants additional attacks per round at higher levels.', 36, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (2, N'Cotton', 1200, N'cotton_shrub', 600, 0, N'cot_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (3, N'Flax', 1200, N'flax_shrub', 600, 5, N'fla_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (4, N'Jute', 1200, N'jute_shrub', 600, 10, N'jut_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (5, N'Sisal', 1200, N'sisal_shrub', 600, 15, N'sis_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (6, N'Kapok', 1200, N'kapok_shrub', 600, 20, N'kap_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (7, N'Abaca', 1200, N'abaca_shrub', 600, 25, N'aba_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (8, N'Pina', 1200, N'pina_shrub', 600, 30, N'pin_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (9, N'Rayon', 1200, N'rayon_shrub', 600, 35, N'ray_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (10, N'Lyocell', 1200, N'lyocell_shrub', 600, 40, N'lyo_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (11, N'Hemp', 1200, N'hemp_shrub', 600, 45, N'hem_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (12, N'Elm Tree', 1800, N'elm_tree', 600, 2, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (13, N'Ash Tree', 1800, N'ash_tree', 600, 7, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (14, N'Walnut Tree', 1800, N'walnut_tree', 600, 12, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (15, N'Arrowwood Tree', 1800, N'arrowwood_tree', 600, 17, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (16, N'Rosewood Tree', 1800, N'rosewood_tree', 600, 22, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (17, N'Mahogany Tree', 1800, N'mahogany_tree', 600, 27, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (18, N'Maple Tree', 1800, N'maple_tree', 600, 32, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (19, N'Willow Tree', 1800, N'willow_tree', 600, 37, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (20, N'Lauan Tree', 1800, N'lauan_tree', 600, 42, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (21, N'Ebony Tree', 1800, N'ebony_tree', 600, 47, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (22, N'Aloe Vera', 1200, N'plant_aloevera', 300, 8, N'alo_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (23, N'Sage', 1200, N'plant_sage', 300, 8, N'sag_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (24, N'Barley', 600, N'crop_barley', 300, 3, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (25, N'Wheat', 600, N'crop_wheat', 300, 3, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (26, N'Rye', 600, N'crop_rye', 300, 3, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (27, N'Rice', 800, N'crop_rice', 200, 6, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (28, N'Corn', 600, N'crop_corn', 500, 1, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (29, N'Blackberry', 600, N'bush_blackberry', 400, 0, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (30, N'Blueberry', 600, N'bush_blueberry', 400, 0, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (31, N'Raspberry', 600, N'bush_raspberry', 400, 0, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (32, N'Onion', 1800, N'plant_onion', 600, 6, N'oni_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (51, N'Potato Plant', 1800, N'potato_plant', 400, 5, N'pot_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (52, N'Leek', 1800, N'plant_leek', 400, 5, N'leek_seeds')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (53, N'Grape Vine', 2400, N'plant_grape', 200, 10, N'')
INSERT [dbo].[Plants] ([PlantID], [Name], [BaseTicks], [Resref], [WaterTicks], [Level], [SeedResref]) VALUES (54, N'Bell Pepper', 1800, N'plant_bellpepper', 400, 5, N'pep_seeds')
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxFP], [CurrentFP], [CurrentFPTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired], [DisplayHelmet], [BackgroundID]) VALUES (N'2b384b2d598c43c3b45cb7185dd67e4c', N'Dent Wetteel', 29, N'druz_shalim', 191, 162, 0, 90, CAST(N'2018-09-03T14:54:27.0000000' AS DateTime2), 150, 149, 267, 5, NULL, 0, 3, NULL, 1, 2, 0, 1, 15, 15, 2, 3, N'druz_shalim', 191, 162, 0, 90, NULL, CAST(N'2018-09-06T14:54:26.8451340' AS DateTime2), 0, 16, 13, 16, 10, 10, 9, 0, 1, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxFP], [CurrentFP], [CurrentFPTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired], [DisplayHelmet], [BackgroundID]) VALUES (N'eb075df7c81c4935abf41e4ff9309288', N'Yando Fryar', 48, N'druz_shalim', 191, 162, 0, 90, CAST(N'2018-09-01T08:22:10.0000000' AS DateTime2), 150, 148, 82, 6, NULL, 0, 3, NULL, 1, 9, 0, 1, 15, 15, 9, 3, N'druz_shalim', 191, 162, 0, 90, NULL, CAST(N'2018-09-04T08:22:09.8817390' AS DateTime2), 0, 16, 13, 16, 10, 10, 9, 3, 1, 1)
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (0, N'None')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (1, N'Kill Enemies')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (2, N'Talk to NPC')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (3, N'Use Object')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (4, N'Collect Items')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (5, N'Explore Area')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (6, N'Use Item on Target')
INSERT [dbo].[ServerConfiguration] ([ServerConfigurationID], [ServerName], [MessageOfTheDay]) VALUES (1, N'Star Wars: Legends of the Old Republic', N'If you get stuck somewhere while testing, simply type /stuck into chat to return to your bind point.')
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (0, N'N/A', 0, 0)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (1, N'Melee Combat', 1, 1)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (2, N'Ranged Combat', 1, 2)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (3, N'Defense', 1, 3)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (4, N'Crafting', 1, 4)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (5, N'Utility', 1, 6)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (6, N'Force', 1, 7)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (7, N'Gathering', 1, 5)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (0, 0, N'None', 0, 0, N'Unused in-game.', 0, 0, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (1, 1, N'One-Handed', 100, 1, N'Ability to use one-handed weapons like vibroblades, batons, and lightsabers. Higher skill levels unlock more powerful one-handed weapons.', 1, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (2, 1, N'Two-Handed', 100, 1, N'Ability to use heavy weapons like heavy vibroblades and polearms in combat. Higher skill levels unlock more powerful two-handed weapons.', 1, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (3, 1, N'Twin Blades', 100, 1, N'Ability to use double edged weapons like twin vibroblades and saberstaves in combat. Higher skill levels unlock more powerful twin blade weapons.', 1, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (4, 1, N'Martial Arts', 100, 1, N'Ability to fight using power gloves and staves in combat. Higher skill levels unlock more powerful power gloves and staves.', 1, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (5, 2, N'Blasters', 100, 1, N'Ability to use blasters like pistols and rifles in combat. Higher skill levels unlock more powerful blasters.', 2, 5, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (6, 2, N'Throwing', 100, 1, N'Ability to use throwing weapons like shurikens, grenades and slings in combat. Higher skill levels unlock more powerful throwing weapons.', 2, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (7, 3, N'Light Armor', 100, 1, N'Ability to effectively defend against attacks while wearing light armor like tunics. Higher skill levels unlock more powerful light armors.', 2, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (8, 3, N'Heavy Armor', 100, 1, N'Ability to effectively defend against attacks while wearing heavy armor like plate mail. Higher skill levels unlock more powerful heavy armors.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (9, 3, N'Shields', 100, 1, N'Ability to effectively defend against attacks while using shields. Higher skill levels unlock more powerful shields.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (10, 7, N'Mining', 100, 1, N'Ability to mine raw resources from ore veins. Higher skill levels increase yield and unlock tougher types of veins.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (11, 3, N'Force Armor', 100, 1, N'Ability to effectively defend against attacks while wearing force armor like Jedi robes. Higher skill levels unlock more powerful force armors.', 6, 5, 4)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (12, 4, N'Weaponsmith', 50, 1, N'Ability to create weapons like axes and swords. Higher skill levels reduce crafting difficulty and unlock more recipes.', 2, 4, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (13, 4, N'Armorsmith', 50, 1, N'Ability to create armors like robes and plate mail. Higher skill levels reduce crafting difficulty and unlock more recipes.', 3, 4, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (14, 7, N'Logging', 100, 1, N'Ability to obtain wood from trees. Higher skill levels increase yield and unlock tougher types of trees.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (15, 4, N'Fabrication', 50, 1, N'Ability to create structures like furniture, buildings, control towers, etc. Higher skill levels reduce crafting difficulty and unlock more structures for building.', 4, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (16, 4, N'Cooking', 30, 1, N'Ability to create food items which can grant temporary stat increases. Higher skill levels reduce crafting difficulty and unlock more recipes.', 4, 6, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (17, 5, N'First Aid', 50, 1, N'Ability to treat bodily injuries in the field with healing kits. Higher skill levels increase effectiveness of healing kits.', 4, 5, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (18, 5, N'Item Repair', 100, 1, N'Ability to repair an item and increase its durability. Higher skill levels increase the effectiveness of repair kits.', 4, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (19, 6, N'Dark-Side', 100, 1, N'Ability to use dark-side abilities like force lightning and dark heal. Higher skill levels increase effectiveness of dark-side abilities.', 4, 5, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (20, 6, N'Light-Side', 100, 1, N'Ability to use light-side abilities like force push and force recovery. Higher skill levels increase effectiveness of light-side abilities.', 5, 4, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (22, 4, N'Engineering', 50, 1, N'Ability to process raw materials and create mechanical devices like firearms. Higher skill levels increase processing yield and allow more difficult ore to be smelted. Also reduces crafting difficulty and unlocks more blueprints.', 2, 5, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (23, 5, N'Farming', 50, 1, N'Ability to plant seeds, water plants, and harvest crops. Higher skill levels increase yield and unlock more crops.', 3, 6, 5)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (24, 7, N'Forage', 50, 1, N'Ability to search through plants and rubble to find supplies. Higher skill levels unlock more types of objects to forage.', 3, 5, 0)
SET IDENTITY_INSERT [dbo].[SkillXPRequirement] ON 

INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1, 1, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2, 1, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (3, 1, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (4, 1, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (5, 1, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (6, 1, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (7, 1, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (8, 1, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (9, 1, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (10, 1, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (11, 1, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (12, 1, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (13, 1, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (14, 1, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (15, 1, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (16, 1, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (17, 1, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (18, 1, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (19, 1, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (20, 1, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (21, 1, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (22, 1, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (23, 1, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (24, 1, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (25, 1, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (26, 1, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (27, 1, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (28, 1, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (29, 1, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (30, 1, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (31, 1, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (32, 1, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (33, 1, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (34, 1, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (35, 1, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (36, 1, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (37, 1, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (38, 1, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (39, 1, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (40, 1, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (41, 1, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (42, 1, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (43, 1, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (44, 1, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (45, 1, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (46, 1, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (47, 1, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (48, 1, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (49, 1, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (50, 1, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (51, 1, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (52, 1, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (53, 1, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (54, 1, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (55, 1, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (56, 1, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (57, 1, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (58, 1, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (59, 1, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (60, 1, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (61, 1, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (62, 1, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (63, 1, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (64, 1, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (65, 1, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (66, 1, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (67, 1, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (68, 1, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (69, 1, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (70, 1, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (71, 1, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (72, 1, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (73, 1, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (74, 1, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (75, 1, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (76, 1, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (77, 1, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (78, 1, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (79, 1, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (80, 1, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (81, 1, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (82, 1, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (83, 1, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (84, 1, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (85, 1, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (86, 1, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (87, 1, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (88, 1, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (89, 1, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (90, 1, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (91, 1, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (92, 1, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (93, 1, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (94, 1, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (95, 1, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (96, 1, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (97, 1, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (98, 1, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (99, 1, 98, 260000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (100, 1, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (101, 1, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (405, 2, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (406, 2, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (407, 2, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (408, 2, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (409, 2, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (410, 2, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (411, 2, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (412, 2, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (413, 2, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (414, 2, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (415, 2, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (416, 2, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (417, 2, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (418, 2, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (419, 2, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (420, 2, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (421, 2, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (422, 2, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (423, 2, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (424, 2, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (425, 2, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (426, 2, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (427, 2, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (428, 2, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (429, 2, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (430, 2, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (431, 2, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (432, 2, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (433, 2, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (434, 2, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (435, 2, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (436, 2, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (437, 2, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (438, 2, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (439, 2, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (440, 2, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (441, 2, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (442, 2, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (443, 2, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (444, 2, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (445, 2, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (446, 2, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (447, 2, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (448, 2, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (449, 2, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (450, 2, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (451, 2, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (452, 2, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (453, 2, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (454, 2, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (455, 2, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (456, 2, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (457, 2, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (458, 2, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (459, 2, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (460, 2, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (461, 2, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (462, 2, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (463, 2, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (464, 2, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (465, 2, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (466, 2, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (467, 2, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (468, 2, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (469, 2, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (470, 2, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (471, 2, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (472, 2, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (473, 2, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (474, 2, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (475, 2, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (476, 2, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (477, 2, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (478, 2, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (479, 2, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (480, 2, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (481, 2, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (482, 2, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (483, 2, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (484, 2, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (485, 2, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (486, 2, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (487, 2, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (488, 2, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (489, 2, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (490, 2, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (491, 2, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (492, 2, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (493, 2, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (494, 2, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (495, 2, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (496, 2, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (497, 2, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (498, 2, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (499, 2, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (500, 2, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (501, 2, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (502, 2, 97, 240000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (503, 2, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (504, 2, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (505, 2, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (506, 3, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (507, 3, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (508, 3, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (509, 3, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (510, 3, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (511, 3, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (512, 3, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (513, 3, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (514, 3, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (515, 3, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (516, 3, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (517, 3, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (518, 3, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (519, 3, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (520, 3, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (521, 3, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (522, 3, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (523, 3, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (524, 3, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (525, 3, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (526, 3, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (527, 3, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (528, 3, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (529, 3, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (530, 3, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (531, 3, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (532, 3, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (533, 3, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (534, 3, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (535, 3, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (536, 3, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (537, 3, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (538, 3, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (539, 3, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (540, 3, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (541, 3, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (542, 3, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (543, 3, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (544, 3, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (545, 3, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (546, 3, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (547, 3, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (548, 3, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (549, 3, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (550, 3, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (551, 3, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (552, 3, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (553, 3, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (554, 3, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (555, 3, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (556, 3, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (557, 3, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (558, 3, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (559, 3, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (560, 3, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (561, 3, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (562, 3, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (563, 3, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (564, 3, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (565, 3, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (566, 3, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (567, 3, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (568, 3, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (569, 3, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (570, 3, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (571, 3, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (572, 3, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (573, 3, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (574, 3, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (575, 3, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (576, 3, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (577, 3, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (578, 3, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (579, 3, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (580, 3, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (581, 3, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (582, 3, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (583, 3, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (584, 3, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (585, 3, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (586, 3, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (587, 3, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (588, 3, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (589, 3, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (590, 3, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (591, 3, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (592, 3, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (593, 3, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (594, 3, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (595, 3, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (596, 3, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (597, 3, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (598, 3, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (599, 3, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (600, 3, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (601, 3, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (602, 3, 96, 236000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (603, 3, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (604, 3, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (605, 3, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (606, 3, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (607, 4, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (608, 4, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (609, 4, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (610, 4, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (611, 4, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (612, 4, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (613, 4, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (614, 4, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (615, 4, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (616, 4, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (617, 4, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (618, 4, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (619, 4, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (620, 4, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (621, 4, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (622, 4, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (623, 4, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (624, 4, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (625, 4, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (626, 4, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (627, 4, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (628, 4, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (629, 4, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (630, 4, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (631, 4, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (632, 4, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (633, 4, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (634, 4, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (635, 4, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (636, 4, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (637, 4, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (638, 4, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (639, 4, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (640, 4, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (641, 4, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (642, 4, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (643, 4, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (644, 4, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (645, 4, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (646, 4, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (647, 4, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (648, 4, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (649, 4, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (650, 4, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (651, 4, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (652, 4, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (653, 4, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (654, 4, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (655, 4, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (656, 4, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (657, 4, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (658, 4, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (659, 4, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (660, 4, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (661, 4, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (662, 4, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (663, 4, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (664, 4, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (665, 4, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (666, 4, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (667, 4, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (668, 4, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (669, 4, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (670, 4, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (671, 4, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (672, 4, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (673, 4, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (674, 4, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (675, 4, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (676, 4, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (677, 4, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (678, 4, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (679, 4, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (680, 4, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (681, 4, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (682, 4, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (683, 4, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (684, 4, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (685, 4, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (686, 4, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (687, 4, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (688, 4, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (689, 4, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (690, 4, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (691, 4, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (692, 4, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (693, 4, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (694, 4, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (695, 4, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (696, 4, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (697, 4, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (698, 4, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (699, 4, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (700, 4, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (701, 4, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (702, 4, 95, 232000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (703, 4, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (704, 4, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (705, 4, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (706, 4, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (707, 4, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (708, 5, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (709, 5, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (710, 5, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (711, 5, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (712, 5, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (713, 5, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (714, 5, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (715, 5, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (716, 5, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (717, 5, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (718, 5, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (719, 5, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (720, 5, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (721, 5, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (722, 5, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (723, 5, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (724, 5, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (725, 5, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (726, 5, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (727, 5, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (728, 5, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (729, 5, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (730, 5, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (731, 5, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (732, 5, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (733, 5, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (734, 5, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (735, 5, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (736, 5, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (737, 5, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (738, 5, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (739, 5, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (740, 5, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (741, 5, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (742, 5, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (743, 5, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (744, 5, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (745, 5, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (746, 5, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (747, 5, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (748, 5, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (749, 5, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (750, 5, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (751, 5, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (752, 5, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (753, 5, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (754, 5, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (755, 5, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (756, 5, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (757, 5, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (758, 5, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (759, 5, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (760, 5, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (761, 5, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (762, 5, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (763, 5, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (764, 5, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (765, 5, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (766, 5, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (767, 5, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (768, 5, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (769, 5, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (770, 5, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (771, 5, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (772, 5, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (773, 5, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (774, 5, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (775, 5, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (776, 5, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (777, 5, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (778, 5, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (779, 5, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (780, 5, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (781, 5, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (782, 5, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (783, 5, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (784, 5, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (785, 5, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (786, 5, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (787, 5, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (788, 5, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (789, 5, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (790, 5, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (791, 5, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (792, 5, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (793, 5, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (794, 5, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (795, 5, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (796, 5, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (797, 5, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (798, 5, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (799, 5, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (800, 5, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (801, 5, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (802, 5, 94, 228000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (803, 5, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (804, 5, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (805, 5, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (806, 5, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (807, 5, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (808, 5, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (809, 6, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (810, 6, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (811, 6, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (812, 6, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (813, 6, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (814, 6, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (815, 6, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (816, 6, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (817, 6, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (818, 6, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (819, 6, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (820, 6, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (821, 6, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (822, 6, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (823, 6, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (824, 6, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (825, 6, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (826, 6, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (827, 6, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (828, 6, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (829, 6, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (830, 6, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (831, 6, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (832, 6, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (833, 6, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (834, 6, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (835, 6, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (836, 6, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (837, 6, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (838, 6, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (839, 6, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (840, 6, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (841, 6, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (842, 6, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (843, 6, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (844, 6, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (845, 6, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (846, 6, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (847, 6, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (848, 6, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (849, 6, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (850, 6, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (851, 6, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (852, 6, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (853, 6, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (854, 6, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (855, 6, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (856, 6, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (857, 6, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (858, 6, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (859, 6, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (860, 6, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (861, 6, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (862, 6, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (863, 6, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (864, 6, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (865, 6, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (866, 6, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (867, 6, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (868, 6, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (869, 6, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (870, 6, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (871, 6, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (872, 6, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (873, 6, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (874, 6, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (875, 6, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (876, 6, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (877, 6, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (878, 6, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (879, 6, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (880, 6, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (881, 6, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (882, 6, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (883, 6, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (884, 6, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (885, 6, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (886, 6, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (887, 6, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (888, 6, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (889, 6, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (890, 6, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (891, 6, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (892, 6, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (893, 6, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (894, 6, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (895, 6, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (896, 6, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (897, 6, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (898, 6, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (899, 6, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (900, 6, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (901, 6, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (902, 6, 93, 224000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (903, 6, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (904, 6, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (905, 6, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (906, 6, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (907, 6, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (908, 6, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (909, 6, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (910, 7, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (911, 7, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (912, 7, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (913, 7, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (914, 7, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (915, 7, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (916, 7, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (917, 7, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (918, 7, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (919, 7, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (920, 7, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (921, 7, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (922, 7, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (923, 7, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (924, 7, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (925, 7, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (926, 7, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (927, 7, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (928, 7, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (929, 7, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (930, 7, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (931, 7, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (932, 7, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (933, 7, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (934, 7, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (935, 7, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (936, 7, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (937, 7, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (938, 7, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (939, 7, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (940, 7, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (941, 7, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (942, 7, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (943, 7, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (944, 7, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (945, 7, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (946, 7, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (947, 7, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (948, 7, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (949, 7, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (950, 7, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (951, 7, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (952, 7, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (953, 7, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (954, 7, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (955, 7, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (956, 7, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (957, 7, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (958, 7, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (959, 7, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (960, 7, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (961, 7, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (962, 7, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (963, 7, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (964, 7, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (965, 7, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (966, 7, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (967, 7, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (968, 7, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (969, 7, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (970, 7, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (971, 7, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (972, 7, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (973, 7, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (974, 7, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (975, 7, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (976, 7, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (977, 7, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (978, 7, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (979, 7, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (980, 7, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (981, 7, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (982, 7, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (983, 7, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (984, 7, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (985, 7, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (986, 7, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (987, 7, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (988, 7, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (989, 7, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (990, 7, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (991, 7, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (992, 7, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (993, 7, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (994, 7, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (995, 7, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (996, 7, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (997, 7, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (998, 7, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (999, 7, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1000, 7, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1001, 7, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1002, 7, 92, 220000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1003, 7, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1004, 7, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1005, 7, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1006, 7, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1007, 7, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1008, 7, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1009, 7, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1010, 7, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1011, 8, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1012, 8, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1013, 8, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1014, 8, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1015, 8, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1016, 8, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1017, 8, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1018, 8, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1019, 8, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1020, 8, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1021, 8, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1022, 8, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1023, 8, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1024, 8, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1025, 8, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1026, 8, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1027, 8, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1028, 8, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1029, 8, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1030, 8, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1031, 8, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1032, 8, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1033, 8, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1034, 8, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1035, 8, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1036, 8, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1037, 8, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1038, 8, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1039, 8, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1040, 8, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1041, 8, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1042, 8, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1043, 8, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1044, 8, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1045, 8, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1046, 8, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1047, 8, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1048, 8, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1049, 8, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1050, 8, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1051, 8, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1052, 8, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1053, 8, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1054, 8, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1055, 8, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1056, 8, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1057, 8, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1058, 8, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1059, 8, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1060, 8, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1061, 8, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1062, 8, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1063, 8, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1064, 8, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1065, 8, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1066, 8, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1067, 8, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1068, 8, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1069, 8, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1070, 8, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1071, 8, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1072, 8, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1073, 8, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1074, 8, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1075, 8, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1076, 8, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1077, 8, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1078, 8, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1079, 8, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1080, 8, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1081, 8, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1082, 8, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1083, 8, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1084, 8, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1085, 8, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1086, 8, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1087, 8, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1088, 8, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1089, 8, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1090, 8, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1091, 8, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1092, 8, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1093, 8, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1094, 8, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1095, 8, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1096, 8, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1097, 8, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1098, 8, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1099, 8, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1100, 8, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1101, 8, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1102, 8, 91, 216000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1103, 8, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1104, 8, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1105, 8, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1106, 8, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1107, 8, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1108, 8, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1109, 8, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1110, 8, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1111, 8, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1112, 9, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1113, 9, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1114, 9, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1115, 9, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1116, 9, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1117, 9, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1118, 9, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1119, 9, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1120, 9, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1121, 9, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1122, 9, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1123, 9, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1124, 9, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1125, 9, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1126, 9, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1127, 9, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1128, 9, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1129, 9, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1130, 9, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1131, 9, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1132, 9, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1133, 9, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1134, 9, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1135, 9, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1136, 9, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1137, 9, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1138, 9, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1139, 9, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1140, 9, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1141, 9, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1142, 9, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1143, 9, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1144, 9, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1145, 9, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1146, 9, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1147, 9, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1148, 9, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1149, 9, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1150, 9, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1151, 9, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1152, 9, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1153, 9, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1154, 9, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1155, 9, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1156, 9, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1157, 9, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1158, 9, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1159, 9, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1160, 9, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1161, 9, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1162, 9, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1163, 9, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1164, 9, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1165, 9, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1166, 9, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1167, 9, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1168, 9, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1169, 9, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1170, 9, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1171, 9, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1172, 9, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1173, 9, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1174, 9, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1175, 9, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1176, 9, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1177, 9, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1178, 9, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1179, 9, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1180, 9, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1181, 9, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1182, 9, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1183, 9, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1184, 9, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1185, 9, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1186, 9, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1187, 9, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1188, 9, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1189, 9, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1190, 9, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1191, 9, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1192, 9, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1193, 9, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1194, 9, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1195, 9, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1196, 9, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1197, 9, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1198, 9, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1199, 9, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1200, 9, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1201, 9, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1202, 9, 90, 159000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1203, 9, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1204, 9, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1205, 9, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1206, 9, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1207, 9, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1208, 9, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1209, 9, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1210, 9, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1211, 9, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1212, 9, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1213, 10, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1214, 10, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1215, 10, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1216, 10, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1217, 10, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1218, 10, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1219, 10, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1220, 10, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1221, 10, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1222, 10, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1223, 10, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1224, 10, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1225, 10, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1226, 10, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1227, 10, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1228, 10, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1229, 10, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1230, 10, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1231, 10, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1232, 10, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1233, 10, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1234, 10, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1235, 10, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1236, 10, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1237, 10, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1238, 10, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1239, 10, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1240, 10, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1241, 10, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1242, 10, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1243, 10, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1244, 10, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1245, 10, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1246, 10, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1247, 10, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1248, 10, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1249, 10, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1250, 10, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1251, 10, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1252, 10, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1253, 10, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1254, 10, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1255, 10, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1256, 10, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1257, 10, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1258, 10, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1259, 10, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1260, 10, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1261, 10, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1262, 10, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1263, 10, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1264, 10, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1265, 10, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1266, 10, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1267, 10, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1268, 10, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1269, 10, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1270, 10, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1271, 10, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1272, 10, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1273, 10, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1274, 10, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1275, 10, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1276, 10, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1277, 10, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1278, 10, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1279, 10, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1280, 10, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1281, 10, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1282, 10, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1283, 10, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1284, 10, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1285, 10, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1286, 10, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1287, 10, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1288, 10, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1289, 10, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1290, 10, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1291, 10, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1292, 10, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1293, 10, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1294, 10, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1295, 10, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1296, 10, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1297, 10, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1298, 10, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1299, 10, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1300, 10, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1301, 10, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1302, 10, 89, 156000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1303, 10, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1304, 10, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1305, 10, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1306, 10, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1307, 10, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1308, 10, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1309, 10, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1310, 10, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1311, 10, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1312, 10, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1313, 10, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1415, 12, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1416, 12, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1417, 12, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1418, 12, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1419, 12, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1420, 12, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1421, 12, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1422, 12, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1423, 12, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1424, 12, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1425, 12, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1426, 12, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1427, 12, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1428, 12, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1429, 12, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1430, 12, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1431, 12, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1432, 12, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1433, 12, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1434, 12, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1435, 12, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1436, 12, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1437, 12, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1438, 12, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1439, 12, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1440, 12, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1441, 12, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1442, 12, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1443, 12, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1444, 12, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1445, 12, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1446, 12, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1447, 12, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1448, 12, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1449, 12, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1450, 12, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1451, 12, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1452, 12, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1453, 12, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1454, 12, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1455, 12, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1456, 12, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1457, 12, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1458, 12, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1459, 12, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1460, 12, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1461, 12, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1462, 12, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1463, 12, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1464, 12, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1465, 12, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1466, 12, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1467, 12, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1468, 12, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1469, 12, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1470, 12, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1471, 12, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1472, 12, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1473, 12, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1474, 12, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1475, 12, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1476, 12, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1477, 12, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1478, 12, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1479, 12, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1480, 12, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1481, 12, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1482, 12, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1483, 12, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1484, 12, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1485, 12, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1486, 12, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1487, 12, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1488, 12, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1489, 12, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1490, 12, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1491, 12, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1492, 12, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1493, 12, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1494, 12, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1495, 12, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1496, 12, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1497, 12, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1498, 12, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1499, 12, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1500, 12, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1501, 12, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1502, 12, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1503, 12, 88, 154500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1504, 12, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1505, 12, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1506, 12, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1507, 12, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1508, 12, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1509, 12, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1510, 12, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1511, 12, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1512, 12, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1513, 12, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1514, 12, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1515, 12, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1516, 13, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1517, 13, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1518, 13, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1519, 13, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1520, 13, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1521, 13, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1522, 13, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1523, 13, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1524, 13, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1525, 13, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1526, 13, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1527, 13, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1528, 13, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1529, 13, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1530, 13, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1531, 13, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1532, 13, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1533, 13, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1534, 13, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1535, 13, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1536, 13, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1537, 13, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1538, 13, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1539, 13, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1540, 13, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1541, 13, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1542, 13, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1543, 13, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1544, 13, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1545, 13, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1546, 13, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1547, 13, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1548, 13, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1549, 13, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1550, 13, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1551, 13, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1552, 13, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1553, 13, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1554, 13, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1555, 13, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1556, 13, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1557, 13, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1558, 13, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1559, 13, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1560, 13, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1561, 13, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1562, 13, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1563, 13, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1564, 13, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1565, 13, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1566, 13, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1567, 13, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1568, 13, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1569, 13, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1570, 13, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1571, 13, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1572, 13, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1573, 13, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1574, 13, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1575, 13, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1576, 13, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1577, 13, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1578, 13, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1579, 13, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1580, 13, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1581, 13, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1582, 13, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1583, 13, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1584, 13, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1585, 13, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1586, 13, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1587, 13, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1588, 13, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1589, 13, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1590, 13, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1591, 13, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1592, 13, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1593, 13, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1594, 13, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1595, 13, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1596, 13, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1597, 13, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1598, 13, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1599, 13, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1600, 13, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1601, 13, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1602, 13, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1603, 13, 87, 153000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1604, 13, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1605, 13, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1606, 13, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1607, 13, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1608, 13, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1609, 13, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1610, 13, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1611, 13, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1612, 13, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1613, 13, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1614, 13, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1615, 13, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1616, 13, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1617, 14, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1618, 14, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1619, 14, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1620, 14, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1621, 14, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1622, 14, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1623, 14, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1624, 14, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1625, 14, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1626, 14, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1627, 14, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1628, 14, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1629, 14, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1630, 14, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1631, 14, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1632, 14, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1633, 14, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1634, 14, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1635, 14, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1636, 14, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1637, 14, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1638, 14, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1639, 14, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1640, 14, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1641, 14, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1642, 14, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1643, 14, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1644, 14, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1645, 14, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1646, 14, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1647, 14, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1648, 14, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1649, 14, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1650, 14, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1651, 14, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1652, 14, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1653, 14, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1654, 14, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1655, 14, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1656, 14, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1657, 14, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1658, 14, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1659, 14, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1660, 14, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1661, 14, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1662, 14, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1663, 14, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1664, 14, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1665, 14, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1666, 14, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1667, 14, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1668, 14, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1669, 14, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1670, 14, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1671, 14, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1672, 14, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1673, 14, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1674, 14, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1675, 14, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1676, 14, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1677, 14, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1678, 14, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1679, 14, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1680, 14, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1681, 14, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1682, 14, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1683, 14, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1684, 14, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1685, 14, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1686, 14, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1687, 14, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1688, 14, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1689, 14, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1690, 14, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1691, 14, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1692, 14, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1693, 14, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1694, 14, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1695, 14, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1696, 14, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1697, 14, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1698, 14, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1699, 14, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1700, 14, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1701, 14, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1702, 14, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1703, 14, 86, 151500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1704, 14, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1705, 14, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1706, 14, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1707, 14, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1708, 14, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1709, 14, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1710, 14, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1711, 14, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1712, 14, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1713, 14, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1714, 14, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1715, 14, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1716, 14, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1717, 14, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1718, 15, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1719, 15, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1720, 15, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1721, 15, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1722, 15, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1723, 15, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1724, 15, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1725, 15, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1726, 15, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1727, 15, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1728, 15, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1729, 15, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1730, 15, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1731, 15, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1732, 15, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1733, 15, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1734, 15, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1735, 15, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1736, 15, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1737, 15, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1738, 15, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1739, 15, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1740, 15, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1741, 15, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1742, 15, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1743, 15, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1744, 15, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1745, 15, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1746, 15, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1747, 15, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1748, 15, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1749, 15, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1750, 15, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1751, 15, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1752, 15, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1753, 15, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1754, 15, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1755, 15, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1756, 15, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1757, 15, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1758, 15, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1759, 15, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1760, 15, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1761, 15, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1762, 15, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1763, 15, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1764, 15, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1765, 15, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1766, 15, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1767, 15, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1768, 15, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1769, 15, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1770, 15, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1771, 15, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1772, 15, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1773, 15, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1774, 15, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1775, 15, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1776, 15, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1777, 15, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1778, 15, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1779, 15, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1780, 15, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1781, 15, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1782, 15, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1783, 15, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1784, 15, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1785, 15, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1786, 15, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1787, 15, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1788, 15, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1789, 15, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1790, 15, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1791, 15, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1792, 15, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1793, 15, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1794, 15, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1795, 15, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1796, 15, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1797, 15, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1798, 15, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1799, 15, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1800, 15, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1801, 15, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1802, 15, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1803, 15, 85, 150000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1804, 15, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1805, 15, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1806, 15, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1807, 15, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1808, 15, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1809, 15, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1810, 15, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1811, 15, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1812, 15, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1813, 15, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1814, 15, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1815, 15, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1816, 15, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1817, 15, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1818, 15, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1819, 16, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1820, 16, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1821, 16, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1822, 16, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1823, 16, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1824, 16, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1825, 16, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1826, 16, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1827, 16, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1828, 16, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1829, 16, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1830, 16, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1831, 16, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1832, 16, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1833, 16, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1834, 16, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1835, 16, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1836, 16, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1837, 16, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1838, 16, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1839, 16, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1840, 16, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1841, 16, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1842, 16, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1843, 16, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1844, 16, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1845, 16, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1846, 16, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1847, 16, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1848, 16, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1849, 16, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1850, 16, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1851, 16, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1852, 16, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1853, 16, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1854, 16, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1855, 16, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1856, 16, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1857, 16, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1858, 16, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1859, 16, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1860, 16, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1861, 16, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1862, 16, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1863, 16, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1864, 16, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1865, 16, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1866, 16, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1867, 16, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1868, 16, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1869, 16, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1870, 16, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1871, 16, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1872, 16, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1873, 16, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1874, 16, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1875, 16, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1876, 16, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1877, 16, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1878, 16, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1879, 16, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1880, 16, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1881, 16, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1882, 16, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1883, 16, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1884, 16, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1885, 16, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1886, 16, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1887, 16, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1888, 16, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1889, 16, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1890, 16, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1891, 16, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1892, 16, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1893, 16, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1894, 16, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1895, 16, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1896, 16, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1897, 16, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1898, 16, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1899, 16, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1900, 16, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1901, 16, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1902, 16, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1903, 16, 84, 148500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1904, 16, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1905, 16, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1906, 16, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1907, 16, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1908, 16, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1909, 16, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1910, 16, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1911, 16, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1912, 16, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1913, 16, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1914, 16, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1915, 16, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1916, 16, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1917, 16, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1918, 16, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1919, 16, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1920, 17, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1921, 17, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1922, 17, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1923, 17, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1924, 17, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1925, 17, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1926, 17, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1927, 17, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1928, 17, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1929, 17, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1930, 17, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1931, 17, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1932, 17, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1933, 17, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1934, 17, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1935, 17, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1936, 17, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1937, 17, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1938, 17, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1939, 17, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1940, 17, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1941, 17, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1942, 17, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1943, 17, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1944, 17, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1945, 17, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1946, 17, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1947, 17, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1948, 17, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1949, 17, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1950, 17, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1951, 17, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1952, 17, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1953, 17, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1954, 17, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1955, 17, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1956, 17, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1957, 17, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1958, 17, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1959, 17, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1960, 17, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1961, 17, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1962, 17, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1963, 17, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1964, 17, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1965, 17, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1966, 17, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1967, 17, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1968, 17, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1969, 17, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1970, 17, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1971, 17, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1972, 17, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1973, 17, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1974, 17, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1975, 17, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1976, 17, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1977, 17, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1978, 17, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1979, 17, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1980, 17, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1981, 17, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1982, 17, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1983, 17, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1984, 17, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1985, 17, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1986, 17, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1987, 17, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1988, 17, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1989, 17, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1990, 17, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1991, 17, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1992, 17, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1993, 17, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1994, 17, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1995, 17, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1996, 17, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1997, 17, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1998, 17, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1999, 17, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2000, 17, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2001, 17, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2002, 17, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2003, 17, 83, 147000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2004, 17, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2005, 17, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2006, 17, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2007, 17, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2008, 17, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2009, 17, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2010, 17, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2011, 17, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2012, 17, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2013, 17, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2014, 17, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2015, 17, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2016, 17, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2017, 17, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2018, 17, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2019, 17, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2020, 17, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2021, 18, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2022, 18, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2023, 18, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2024, 18, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2025, 18, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2026, 18, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2027, 18, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2028, 18, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2029, 18, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2030, 18, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2031, 18, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2032, 18, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2033, 18, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2034, 18, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2035, 18, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2036, 18, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2037, 18, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2038, 18, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2039, 18, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2040, 18, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2041, 18, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2042, 18, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2043, 18, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2044, 18, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2045, 18, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2046, 18, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2047, 18, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2048, 18, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2049, 18, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2050, 18, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2051, 18, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2052, 18, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2053, 18, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2054, 18, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2055, 18, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2056, 18, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2057, 18, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2058, 18, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2059, 18, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2060, 18, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2061, 18, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2062, 18, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2063, 18, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2064, 18, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2065, 18, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2066, 18, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2067, 18, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2068, 18, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2069, 18, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2070, 18, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2071, 18, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2072, 18, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2073, 18, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2074, 18, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2075, 18, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2076, 18, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2077, 18, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2078, 18, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2079, 18, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2080, 18, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2081, 18, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2082, 18, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2083, 18, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2084, 18, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2085, 18, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2086, 18, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2087, 18, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2088, 18, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2089, 18, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2090, 18, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2091, 18, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2092, 18, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2093, 18, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2094, 18, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2095, 18, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2096, 18, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2097, 18, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2098, 18, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2099, 18, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2100, 18, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2101, 18, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2102, 18, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2103, 18, 82, 145500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2104, 18, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2105, 18, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2106, 18, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2107, 18, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2108, 18, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2109, 18, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2110, 18, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2111, 18, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2112, 18, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2113, 18, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2114, 18, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2115, 18, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2116, 18, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2117, 18, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2118, 18, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2119, 18, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2120, 18, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2121, 18, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2122, 19, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2123, 19, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2124, 19, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2125, 19, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2126, 19, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2127, 19, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2128, 19, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2129, 19, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2130, 19, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2131, 19, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2132, 19, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2133, 19, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2134, 19, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2135, 19, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2136, 19, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2137, 19, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2138, 19, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2139, 19, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2140, 19, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2141, 19, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2142, 19, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2143, 19, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2144, 19, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2145, 19, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2146, 19, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2147, 19, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2148, 19, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2149, 19, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2150, 19, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2151, 19, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2152, 19, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2153, 19, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2154, 19, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2155, 19, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2156, 19, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2157, 19, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2158, 19, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2159, 19, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2160, 19, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2161, 19, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2162, 19, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2163, 19, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2164, 19, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2165, 19, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2166, 19, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2167, 19, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2168, 19, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2169, 19, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2170, 19, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2171, 19, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2172, 19, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2173, 19, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2174, 19, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2175, 19, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2176, 19, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2177, 19, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2178, 19, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2179, 19, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2180, 19, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2181, 19, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2182, 19, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2183, 19, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2184, 19, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2185, 19, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2186, 19, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2187, 19, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2188, 19, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2189, 19, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2190, 19, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2191, 19, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2192, 19, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2193, 19, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2194, 19, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2195, 19, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2196, 19, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2197, 19, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2198, 19, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2199, 19, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2200, 19, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2201, 19, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2202, 19, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2203, 19, 81, 144000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2204, 19, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2205, 19, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2206, 19, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2207, 19, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2208, 19, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2209, 19, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2210, 19, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2211, 19, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2212, 19, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2213, 19, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2214, 19, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2215, 19, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2216, 19, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2217, 19, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2218, 19, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2219, 19, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2220, 19, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2221, 19, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2222, 19, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2223, 20, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2224, 20, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2225, 20, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2226, 20, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2227, 20, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2228, 20, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2229, 20, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2230, 20, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2231, 20, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2232, 20, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2233, 20, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2234, 20, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2235, 20, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2236, 20, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2237, 20, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2238, 20, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2239, 20, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2240, 20, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2241, 20, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2242, 20, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2243, 20, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2244, 20, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2245, 20, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2246, 20, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2247, 20, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2248, 20, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2249, 20, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2250, 20, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2251, 20, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2252, 20, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2253, 20, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2254, 20, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2255, 20, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2256, 20, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2257, 20, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2258, 20, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2259, 20, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2260, 20, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2261, 20, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2262, 20, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2263, 20, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2264, 20, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2265, 20, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2266, 20, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2267, 20, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2268, 20, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2269, 20, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2270, 20, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2271, 20, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2272, 20, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2273, 20, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2274, 20, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2275, 20, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2276, 20, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2277, 20, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2278, 20, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2279, 20, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2280, 20, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2281, 20, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2282, 20, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2283, 20, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2284, 20, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2285, 20, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2286, 20, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2287, 20, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2288, 20, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2289, 20, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2290, 20, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2291, 20, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2292, 20, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2293, 20, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2294, 20, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2295, 20, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2296, 20, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2297, 20, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2298, 20, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2299, 20, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2300, 20, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2301, 20, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2302, 20, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2303, 20, 80, 128250)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2304, 20, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2305, 20, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2306, 20, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2307, 20, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2308, 20, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2309, 20, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2310, 20, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2311, 20, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2312, 20, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2313, 20, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2314, 20, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2315, 20, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2316, 20, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2317, 20, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2318, 20, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2319, 20, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2320, 20, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2321, 20, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2322, 20, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2323, 20, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2425, 22, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2426, 22, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2427, 22, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2428, 22, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2429, 22, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2430, 22, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2431, 22, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2432, 22, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2433, 22, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2434, 22, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2435, 22, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2436, 22, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2437, 22, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2438, 22, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2439, 22, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2440, 22, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2441, 22, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2442, 22, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2443, 22, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2444, 22, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2445, 22, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2446, 22, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2447, 22, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2448, 22, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2449, 22, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2450, 22, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2451, 22, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2452, 22, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2453, 22, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2454, 22, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2455, 22, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2456, 22, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2457, 22, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2458, 22, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2459, 22, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2460, 22, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2461, 22, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2462, 22, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2463, 22, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2464, 22, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2465, 22, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2466, 22, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2467, 22, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2468, 22, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2469, 22, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2470, 22, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2471, 22, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2472, 22, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2473, 22, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2474, 22, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2475, 22, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2476, 22, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2477, 22, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2478, 22, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2479, 22, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2480, 22, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2481, 22, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2482, 22, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2483, 22, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2484, 22, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2485, 22, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2486, 22, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2487, 22, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2488, 22, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2489, 22, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2490, 22, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2491, 22, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2492, 22, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2493, 22, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2494, 22, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2495, 22, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2496, 22, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2497, 22, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2498, 22, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2499, 22, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2500, 22, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2501, 22, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2502, 22, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2503, 22, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2504, 22, 79, 126900)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2505, 22, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2506, 22, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2507, 22, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2508, 22, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2509, 22, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2510, 22, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2511, 22, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2512, 22, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2513, 22, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2514, 22, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2515, 22, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2516, 22, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2517, 22, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2518, 22, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2519, 22, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2520, 22, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2521, 22, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2522, 22, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2523, 22, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2524, 22, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2525, 22, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2526, 23, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2527, 23, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2528, 23, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2529, 23, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2530, 23, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2531, 23, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2532, 23, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2533, 23, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2534, 23, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2535, 23, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2536, 23, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2537, 23, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2538, 23, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2539, 23, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2540, 23, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2541, 23, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2542, 23, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2543, 23, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2544, 23, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2545, 23, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2546, 23, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2547, 23, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2548, 23, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2549, 23, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2550, 23, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2551, 23, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2552, 23, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2553, 23, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2554, 23, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2555, 23, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2556, 23, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2557, 23, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2558, 23, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2559, 23, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2560, 23, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2561, 23, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2562, 23, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2563, 23, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2564, 23, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2565, 23, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2566, 23, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2567, 23, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2568, 23, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2569, 23, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2570, 23, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2571, 23, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2572, 23, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2573, 23, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2574, 23, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2575, 23, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2576, 23, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2577, 23, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2578, 23, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2579, 23, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2580, 23, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2581, 23, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2582, 23, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2583, 23, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2584, 23, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2585, 23, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2586, 23, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2587, 23, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2588, 23, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2589, 23, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2590, 23, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2591, 23, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2592, 23, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2593, 23, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2594, 23, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2595, 23, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2596, 23, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2597, 23, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2598, 23, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2599, 23, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2600, 23, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2601, 23, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2602, 23, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2603, 23, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2604, 23, 78, 125550)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2605, 23, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2606, 23, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2607, 23, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2608, 23, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2609, 23, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2610, 23, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2611, 23, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2612, 23, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2613, 23, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2614, 23, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2615, 23, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2616, 23, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2617, 23, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2618, 23, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2619, 23, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2620, 23, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2621, 23, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2622, 23, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2623, 23, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2624, 23, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2625, 23, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2626, 23, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2627, 24, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2628, 24, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2629, 24, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2630, 24, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2631, 24, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2632, 24, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2633, 24, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2634, 24, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2635, 24, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2636, 24, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2637, 24, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2638, 24, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2639, 24, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2640, 24, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2641, 24, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2642, 24, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2643, 24, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2644, 24, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2645, 24, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2646, 24, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2647, 24, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2648, 24, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2649, 24, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2650, 24, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2651, 24, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2652, 24, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2653, 24, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2654, 24, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2655, 24, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2656, 24, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2657, 24, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2658, 24, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2659, 24, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2660, 24, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2661, 24, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2662, 24, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2663, 24, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2664, 24, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2665, 24, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2666, 24, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2667, 24, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2668, 24, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2669, 24, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2670, 24, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2671, 24, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2672, 24, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2673, 24, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2674, 24, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2675, 24, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2676, 24, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2677, 24, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2678, 24, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2679, 24, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2680, 24, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2681, 24, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2682, 24, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2683, 24, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2684, 24, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2685, 24, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2686, 24, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2687, 24, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2688, 24, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2689, 24, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2690, 24, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2691, 24, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2692, 24, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2693, 24, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2694, 24, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2695, 24, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2696, 24, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2697, 24, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2698, 24, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2699, 24, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2700, 24, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2701, 24, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2702, 24, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2703, 24, 76, 122850)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2704, 24, 77, 124200)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2705, 24, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2706, 24, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2707, 24, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2708, 24, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2709, 24, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2710, 24, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2711, 24, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2712, 24, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2713, 24, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2714, 24, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2715, 24, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2716, 24, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2717, 24, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2718, 24, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2719, 24, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2720, 24, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2721, 24, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2722, 24, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2723, 24, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2724, 24, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2725, 24, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2726, 24, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2727, 24, 100, 400000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2728, 11, 0, 550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2729, 11, 1, 825)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2730, 11, 2, 1100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2731, 11, 3, 1375)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2732, 11, 4, 1650)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2733, 11, 5, 1925)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2734, 11, 6, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2735, 11, 7, 2420)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2736, 11, 8, 2640)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2737, 11, 9, 2860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2738, 11, 10, 3080)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2739, 11, 11, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2740, 11, 12, 4480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2741, 11, 13, 4760)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2742, 11, 14, 5040)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2743, 11, 15, 5320)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2744, 11, 16, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2745, 11, 17, 5880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2746, 11, 18, 6160)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2747, 11, 19, 6440)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2748, 11, 20, 6720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2749, 11, 21, 8500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2750, 11, 22, 8670)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2751, 11, 23, 8840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2752, 11, 24, 9010)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2753, 11, 25, 9180)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2754, 11, 26, 9350)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2755, 11, 27, 9520)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2756, 11, 28, 9690)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2757, 11, 29, 9860)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2758, 11, 30, 10030)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2759, 11, 31, 10200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2760, 11, 32, 10370)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2761, 11, 33, 10540)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2762, 11, 34, 10710)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2763, 11, 35, 10880)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2764, 11, 36, 11050)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2765, 11, 37, 11220)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2766, 11, 38, 11390)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2767, 11, 39, 11560)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2768, 11, 40, 11730)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2769, 11, 41, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2770, 11, 42, 14200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2771, 11, 43, 14400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2772, 11, 44, 14600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2773, 11, 45, 14800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2774, 11, 46, 15000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2775, 11, 47, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2776, 11, 48, 15400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2777, 11, 49, 16000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2778, 11, 50, 18400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2779, 11, 51, 24960)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2780, 11, 52, 27840)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2781, 11, 53, 30720)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2782, 11, 54, 33600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2783, 11, 55, 36480)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2784, 11, 56, 39360)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2785, 11, 57, 42240)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2786, 11, 58, 45120)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2787, 11, 59, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2788, 11, 60, 51600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2789, 11, 61, 55200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2790, 11, 62, 58800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2791, 11, 63, 62400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2792, 11, 64, 66000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2793, 11, 65, 69600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2794, 11, 66, 73200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2795, 11, 67, 76800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2796, 11, 68, 81600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2797, 11, 69, 86400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2798, 11, 70, 91200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2799, 11, 71, 108000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2800, 11, 72, 113400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2801, 11, 73, 118800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2802, 11, 74, 120150)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2803, 11, 75, 121500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2804, 11, 76, 122850)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2805, 11, 77, 124200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2806, 11, 78, 125550)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2807, 11, 79, 126900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2808, 11, 80, 128250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2809, 11, 81, 144000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2810, 11, 82, 145500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2811, 11, 83, 147000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2812, 11, 84, 148500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2813, 11, 85, 150000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2814, 11, 86, 151500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2815, 11, 87, 153000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2816, 11, 88, 154500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2817, 11, 89, 156000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2818, 11, 90, 159000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2819, 11, 91, 216000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2820, 11, 92, 220000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2821, 11, 93, 224000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2822, 11, 94, 228000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2823, 11, 95, 232000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2824, 11, 96, 236000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2825, 11, 97, 240000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2826, 11, 98, 260000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2827, 11, 99, 280000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2828, 11, 100, 400000)
SET IDENTITY_INSERT [dbo].[SkillXPRequirement] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Areas_Resref]    Script Date: 9/4/2018 4:00:00 PM ******/
ALTER TABLE [dbo].[Areas] ADD  CONSTRAINT [UQ_Areas_Resref] UNIQUE NONCLUSTERED 
(
	[Resref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PCBases_AreaResrefSector]    Script Date: 9/4/2018 4:00:00 PM ******/
ALTER TABLE [dbo].[PCBases] ADD  CONSTRAINT [UQ_PCBases_AreaResrefSector] UNIQUE NONCLUSTERED 
(
	[AreaResref] ASC,
	[Sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_PCCorpseItems_GlobalID]    Script Date: 9/4/2018 4:00:00 PM ******/
ALTER TABLE [dbo].[PCCorpseItems] ADD  CONSTRAINT [uq_PCCorpseItems_GlobalID] UNIQUE NONCLUSTERED 
(
	[GlobalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uq_PerkLevels_PerkIDLevel]    Script Date: 9/4/2018 4:00:00 PM ******/
ALTER TABLE [dbo].[PerkLevels] ADD  CONSTRAINT [uq_PerkLevels_PerkIDLevel] UNIQUE NONCLUSTERED 
(
	[PerkID] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [ResourceQuality]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [Width]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [IsBuildable]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [PurchasePrice]
GO
ALTER TABLE [dbo].[Areas] ADD  DEFAULT ((0)) FOR [DailyUpkeep]
GO
ALTER TABLE [dbo].[Attributes] ADD  CONSTRAINT [DF__Attribute__NWNVa__56E8E7AB]  DEFAULT ((0)) FOR [NWNValue]
GO
ALTER TABLE [dbo].[Attributes] ADD  CONSTRAINT [DF__Attributes__Name__57DD0BE4]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Backgrounds] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Backgrounds] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Backgrounds] ADD  DEFAULT ('') FOR [Bonuses]
GO
ALTER TABLE [dbo].[Backgrounds] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ('') FOR [PlaceableResref]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ('') FOR [ItemResref]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ((0.0)) FOR [Power]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ((0.0)) FOR [CPU]
GO
ALTER TABLE [dbo].[BaseStructures] ADD  DEFAULT ((0)) FOR [HitPoints]
GO
ALTER TABLE [dbo].[BaseStructureType] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[BaseStructureType] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ChatChannelsDomain] ADD  CONSTRAINT [DF__ChatChanne__Name__58D1301D]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ChatLog] ADD  CONSTRAINT [DF__ChatLog__SenderA__59C55456]  DEFAULT ('') FOR [SenderAccountName]
GO
ALTER TABLE [dbo].[ChatLog] ADD  CONSTRAINT [DF__ChatLog__SenderC__5AB9788F]  DEFAULT ('') FOR [SenderCDKey]
GO
ALTER TABLE [dbo].[ChatLog] ADD  CONSTRAINT [DF__ChatLog__Message__5BAD9CC8]  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[ChatLog] ADD  CONSTRAINT [DF__ChatLog__DateSen__5CA1C101]  DEFAULT (getutcdate()) FOR [DateSent]
GO
ALTER TABLE [dbo].[ClientLogEvents] ADD  CONSTRAINT [DF__ClientLog__DateO__5D95E53A]  DEFAULT (getutcdate()) FOR [DateOfEvent]
GO
ALTER TABLE [dbo].[ComponentTypes] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[CooldownCategories] ADD  CONSTRAINT [DF__CooldownCa__Name__5F7E2DAC]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[CooldownCategories] ADD  CONSTRAINT [DF__CooldownC__BaseC__607251E5]  DEFAULT ((0.0)) FOR [BaseCooldownTime]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  CONSTRAINT [DF__CraftBlue__Requi__6166761E]  DEFAULT ((0)) FOR [RequiredPerkLevel]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  CONSTRAINT [DF__CraftBlue__IsAct__625A9A57]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [MainComponentTypeID]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [MainMinimum]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [SecondaryComponentTypeID]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [SecondaryMinimum]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [TertiaryComponentTypeID]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [TertiaryMinimum]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [EnhancementSlots]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [MainMaximum]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [SecondaryMaximum]
GO
ALTER TABLE [dbo].[CraftBlueprints] ADD  DEFAULT ((0)) FOR [TertiaryMaximum]
GO
ALTER TABLE [dbo].[CraftDevices] ADD  CONSTRAINT [DF__CraftDevic__Name__6442E2C9]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF__Downloads__Name__65370702]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF__Downloads__Descr__662B2B3B]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF__Downloads__Url__671F4F74]  DEFAULT ('') FOR [Url]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF__Downloads__IsAct__681373AD]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EnmityAdjustmentRule] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[GameTopics] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GameTopics] ADD  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[GameTopics] ADD  DEFAULT ('') FOR [Icon]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__Remai__690797E6]  DEFAULT ((0)) FOR [RemainingTicks]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__Locat__69FBBC1F]  DEFAULT ('') FOR [LocationAreaTag]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [df_GrowingPlants_LocationX]  DEFAULT ((0.0)) FOR [LocationX]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [df_GrowingPlants_LocationY]  DEFAULT ((0.0)) FOR [LocationY]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [df_GrowingPlants_LocationZ]  DEFAULT ((0.0)) FOR [LocationZ]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [df_GrowingPlants_LocationOrientation]  DEFAULT ((0.0)) FOR [LocationOrientation]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__DateC__6EC0713C]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__IsAct__6FB49575]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__Total__7869D707]  DEFAULT ((0)) FOR [TotalTicks]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__Water__7B4643B2]  DEFAULT ((0)) FOR [WaterStatus]
GO
ALTER TABLE [dbo].[GrowingPlants] ADD  CONSTRAINT [DF__GrowingPl__Longe__7C3A67EB]  DEFAULT ((0)) FOR [LongevityBonus]
GO
ALTER TABLE [dbo].[ItemTypes] ADD  CONSTRAINT [DF__ItemTypes__Name__7E02B4CC]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Mods] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Mods] ADD  DEFAULT ('') FOR [Script]
GO
ALTER TABLE [dbo].[Mods] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PCBases] ADD  DEFAULT (getutcdate()) FOR [DateInitialPurchase]
GO
ALTER TABLE [dbo].[PCCorpseItems] ADD  DEFAULT ('') FOR [ItemName]
GO
ALTER TABLE [dbo].[PCCorpseItems] ADD  DEFAULT ('') FOR [ItemTag]
GO
ALTER TABLE [dbo].[PCCorpseItems] ADD  DEFAULT ('') FOR [ItemResref]
GO
ALTER TABLE [dbo].[PCCorpseItems] ADD  DEFAULT ('') FOR [GlobalID]
GO
ALTER TABLE [dbo].[PCKeyItems] ADD  CONSTRAINT [df_PCKeyItems_AcquiredDate]  DEFAULT (getutcdate()) FOR [AcquiredDate]
GO
ALTER TABLE [dbo].[PCPerks] ADD  CONSTRAINT [DF__PCPerks__Acquire__7FEAFD3E]  DEFAULT (getutcdate()) FOR [AcquiredDate]
GO
ALTER TABLE [dbo].[PCPerks] ADD  CONSTRAINT [DF__PCPerks__PerkLev__00DF2177]  DEFAULT ((0)) FOR [PerkLevel]
GO
ALTER TABLE [dbo].[PCRegionalFame] ADD  CONSTRAINT [DF__PCRegiona__Amoun__01D345B0]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[PCSkills] ADD  CONSTRAINT [DF__PCSkills__XP__02C769E9]  DEFAULT ((0)) FOR [XP]
GO
ALTER TABLE [dbo].[PCSkills] ADD  CONSTRAINT [DF__PCSkills__Rank__03BB8E22]  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[PCSkills] ADD  CONSTRAINT [DF__PCSkills__IsLock__04AFB25B]  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[PerkCategories] ADD  CONSTRAINT [DF__PerkCatego__Name__078C1F06]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[PerkCategories] ADD  CONSTRAINT [DF__PerkCateg__IsAct__0880433F]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PerkCategories] ADD  CONSTRAINT [DF__PerkCateg__Seque__09746778]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[PerkExecutionTypes] ADD  CONSTRAINT [DF__PerkExecut__Name__0A688BB1]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[PerkLevels] ADD  CONSTRAINT [DF__PerkLevel__Level__0B5CAFEA]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[PerkLevels] ADD  CONSTRAINT [DF__PerkLevel__Price__0C50D423]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[PerkLevels] ADD  CONSTRAINT [DF__PerkLevel__Descr__0D44F85C]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[PerkLevelSkillRequirements] ADD  CONSTRAINT [DF__PerkSkill__Requi__278EDA44]  DEFAULT ((0)) FOR [RequiredRank]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__Name__0F2D40CE]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__FeatID__10216507]  DEFAULT ((0)) FOR [FeatID]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__IsActive__11158940]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__JavaScrip__1209AD79]  DEFAULT ('') FOR [JavaScriptName]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__BaseFPC__12FDD1B2]  DEFAULT ((0)) FOR [BaseFPCost]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__BaseCasti__13F1F5EB]  DEFAULT ((0.0)) FOR [BaseCastingTime]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__Descripti__14E61A24]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__Execution__15DA3E5D]  DEFAULT ((0)) FOR [ExecutionTypeID]
GO
ALTER TABLE [dbo].[Perks] ADD  CONSTRAINT [DF__Perks__IsTargetS__16CE6296]  DEFAULT ((0)) FOR [IsTargetSelfOnly]
GO
ALTER TABLE [dbo].[Perks] ADD  DEFAULT ((0)) FOR [Enmity]
GO
ALTER TABLE [dbo].[Perks] ADD  DEFAULT ((0)) FOR [EnmityAdjustmentRuleID]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__Name__17C286CF]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__BaseTick__18B6AB08]  DEFAULT ((0)) FOR [BaseTicks]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__Resref__19AACF41]  DEFAULT ('') FOR [Resref]
GO
ALTER TABLE [dbo].[Plants] ADD  DEFAULT ((0)) FOR [WaterTicks]
GO
ALTER TABLE [dbo].[Plants] ADD  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Plants] ADD  DEFAULT ('') FOR [SeedResref]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [df_PlayerCharacters_CreateTimestamp]  DEFAULT (getutcdate()) FOR [CreateTimestamp]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__MaxMa__1B9317B3]  DEFAULT ((0)) FOR [MaxFP]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Curre__1C873BEC]  DEFAULT ((0)) FOR [CurrentFP]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Curre__1D7B6025]  DEFAULT ((0)) FOR [CurrentFPTick]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Reviv__1E6F845E]  DEFAULT ((0)) FOR [RevivalStoneCount]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Respa__1F63A897]  DEFAULT ('') FOR [RespawnAreaTag]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Respa__2057CCD0]  DEFAULT ((0.0)) FOR [RespawnLocationX]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Respa__214BF109]  DEFAULT ((0.0)) FOR [RespawnLocationY]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Respa__22401542]  DEFAULT ((0.0)) FOR [RespawnLocationZ]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Respa__2334397B]  DEFAULT ((0.0)) FOR [RespawnLocationOrientation]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__DateS__24285DB4]  DEFAULT (dateadd(hour,(72),getutcdate())) FOR [DateSanctuaryEnds]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__IsSan__251C81ED]  DEFAULT ((0)) FOR [IsSanctuaryOverrideEnabled]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__STRBa__2610A626]  DEFAULT ((0)) FOR [STRBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__DEXBa__2704CA5F]  DEFAULT ((0)) FOR [DEXBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__CONBa__27F8EE98]  DEFAULT ((0)) FOR [CONBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__INTBa__28ED12D1]  DEFAULT ((0)) FOR [INTBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__WISBa__29E1370A]  DEFAULT ((0)) FOR [WISBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__CHABa__2AD55B43]  DEFAULT ((0)) FOR [CHABase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [DF__PlayerCha__Total__2BC97F7C]  DEFAULT ((0)) FOR [TotalSPAcquired]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((1)) FOR [DisplayHelmet]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [BackgroundID]
GO
ALTER TABLE [dbo].[Quests] ADD  CONSTRAINT [DF__Quests__AllowRew__2CBDA3B5]  DEFAULT ((0)) FOR [AllowRewardSelection]
GO
ALTER TABLE [dbo].[Quests] ADD  CONSTRAINT [DF__Quests__IsRepeat__2DB1C7EE]  DEFAULT ((0)) FOR [IsRepeatable]
GO
ALTER TABLE [dbo].[Quests] ADD  CONSTRAINT [DF__Quests__RemoveSt__2EA5EC27]  DEFAULT ((0)) FOR [RemoveStartKeyItemAfterCompletion]
GO
ALTER TABLE [dbo].[QuestStates] ADD  CONSTRAINT [DF__QuestStat__IsFin__2F9A1060]  DEFAULT ((0)) FOR [IsFinalState]
GO
ALTER TABLE [dbo].[ServerConfiguration] ADD  CONSTRAINT [DF__ServerCon__Serve__308E3499]  DEFAULT ('') FOR [ServerName]
GO
ALTER TABLE [dbo].[ServerConfiguration] ADD  CONSTRAINT [DF__ServerCon__Messa__318258D2]  DEFAULT ('') FOR [MessageOfTheDay]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  CONSTRAINT [DF__SkillCateg__Name__32767D0B]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  CONSTRAINT [DF__SkillCate__IsAct__336AA144]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  CONSTRAINT [DF__SkillCate__Seque__345EC57D]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__Name__3552E9B6]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__MaxRank__36470DEF]  DEFAULT ((0)) FOR [MaxRank]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__IsActive__373B3228]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__Descript__382F5661]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__Primary__39237A9A]  DEFAULT ('') FOR [Primary]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__Secondar__3A179ED3]  DEFAULT ('') FOR [Secondary]
GO
ALTER TABLE [dbo].[Skills] ADD  CONSTRAINT [DF__Skills__Tertiary__3B0BC30C]  DEFAULT ('') FOR [Tertiary]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__RoleID__4589517F]  DEFAULT ((3)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__DateRegis__467D75B8]  DEFAULT (getutcdate()) FOR [DateRegistered]
GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_NortheastOwner] FOREIGN KEY([NortheastOwner])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_NortheastOwner]
GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_NorthwestOwner] FOREIGN KEY([NorthwestOwner])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_NorthwestOwner]
GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_SoutheastOwner] FOREIGN KEY([SoutheastOwner])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_SoutheastOwner]
GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_SouthwestOwner] FOREIGN KEY([SouthwestOwner])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_SouthwestOwner]
GO
ALTER TABLE [dbo].[BaseStructures]  WITH CHECK ADD  CONSTRAINT [FK_BaseStructures_BaseStructureTypeID] FOREIGN KEY([BaseStructureTypeID])
REFERENCES [dbo].[BaseStructureType] ([BaseStructureTypeID])
GO
ALTER TABLE [dbo].[BaseStructures] CHECK CONSTRAINT [FK_BaseStructures_BaseStructureTypeID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_ChatChannelID] FOREIGN KEY([ChatChannelID])
REFERENCES [dbo].[ChatChannelsDomain] ([ChatChannelID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_ChatChannelID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_ReceiverPlayerID] FOREIGN KEY([ReceiverPlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_ReceiverPlayerID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_SenderPlayerID] FOREIGN KEY([SenderPlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_SenderPlayerID]
GO
ALTER TABLE [dbo].[ClientLogEvents]  WITH CHECK ADD  CONSTRAINT [FK_ClientLogEvents_ClientLogEventTypeID] FOREIGN KEY([ClientLogEventTypeID])
REFERENCES [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID])
GO
ALTER TABLE [dbo].[ClientLogEvents] CHECK CONSTRAINT [FK_ClientLogEvents_ClientLogEventTypeID]
GO
ALTER TABLE [dbo].[ClientLogEvents]  WITH CHECK ADD  CONSTRAINT [FK_ClientLogEvents_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ClientLogEvents] CHECK CONSTRAINT [FK_ClientLogEvents_PlayerID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_CraftCategoryID] FOREIGN KEY([CraftCategoryID])
REFERENCES [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_CraftCategoryID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [FK_CraftBlueprints_CraftDeviceID] FOREIGN KEY([CraftDeviceID])
REFERENCES [dbo].[CraftDevices] ([CraftDeviceID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [FK_CraftBlueprints_CraftDeviceID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_MainComponentTypeID] FOREIGN KEY([MainComponentTypeID])
REFERENCES [dbo].[ComponentTypes] ([ComponentTypeID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_MainComponentTypeID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [FK_CraftBlueprints_PerkID] FOREIGN KEY([PerkID])
REFERENCES [dbo].[Perks] ([PerkID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [FK_CraftBlueprints_PerkID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_SecondaryComponentTypeID] FOREIGN KEY([SecondaryComponentTypeID])
REFERENCES [dbo].[ComponentTypes] ([ComponentTypeID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_SecondaryComponentTypeID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [FK_CraftBlueprints_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [FK_CraftBlueprints_SkillID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_TertiaryComponentTypeID] FOREIGN KEY([TertiaryComponentTypeID])
REFERENCES [dbo].[ComponentTypes] ([ComponentTypeID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_TertiaryComponentTypeID]
GO
ALTER TABLE [dbo].[GameTopics]  WITH CHECK ADD  CONSTRAINT [FK_GameTopics_GameTopicCategoryID] FOREIGN KEY([GameTopicCategoryID])
REFERENCES [dbo].[GameTopicCategories] ([GameTopicCategoryID])
GO
ALTER TABLE [dbo].[GameTopics] CHECK CONSTRAINT [FK_GameTopics_GameTopicCategoryID]
GO
ALTER TABLE [dbo].[GrowingPlants]  WITH CHECK ADD  CONSTRAINT [FK_GrowingPlants_PlantID] FOREIGN KEY([PlantID])
REFERENCES [dbo].[Plants] ([PlantID])
GO
ALTER TABLE [dbo].[GrowingPlants] CHECK CONSTRAINT [FK_GrowingPlants_PlantID]
GO
ALTER TABLE [dbo].[KeyItems]  WITH CHECK ADD  CONSTRAINT [fk_KeyItems_KeyItemCategoryID] FOREIGN KEY([KeyItemCategoryID])
REFERENCES [dbo].[KeyItemCategories] ([KeyItemCategoryID])
GO
ALTER TABLE [dbo].[KeyItems] CHECK CONSTRAINT [fk_KeyItems_KeyItemCategoryID]
GO
ALTER TABLE [dbo].[LootTableItems]  WITH CHECK ADD  CONSTRAINT [fk_LootTableItems_LootTableID] FOREIGN KEY([LootTableID])
REFERENCES [dbo].[LootTables] ([LootTableID])
GO
ALTER TABLE [dbo].[LootTableItems] CHECK CONSTRAINT [fk_LootTableItems_LootTableID]
GO
ALTER TABLE [dbo].[PCBases]  WITH CHECK ADD  CONSTRAINT [FK_PCBases_AreaResref] FOREIGN KEY([AreaResref])
REFERENCES [dbo].[Areas] ([Resref])
GO
ALTER TABLE [dbo].[PCBases] CHECK CONSTRAINT [FK_PCBases_AreaResref]
GO
ALTER TABLE [dbo].[PCBases]  WITH CHECK ADD  CONSTRAINT [FK_PCBases_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCBases] CHECK CONSTRAINT [FK_PCBases_PlayerID]
GO
ALTER TABLE [dbo].[PCCooldowns]  WITH CHECK ADD  CONSTRAINT [fk_PCCooldowns_CooldownCategoryID] FOREIGN KEY([CooldownCategoryID])
REFERENCES [dbo].[CooldownCategories] ([CooldownCategoryID])
GO
ALTER TABLE [dbo].[PCCooldowns] CHECK CONSTRAINT [fk_PCCooldowns_CooldownCategoryID]
GO
ALTER TABLE [dbo].[PCCooldowns]  WITH CHECK ADD  CONSTRAINT [fk_PCCooldowns_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCCooldowns] CHECK CONSTRAINT [fk_PCCooldowns_PlayerID]
GO
ALTER TABLE [dbo].[PCCorpseItems]  WITH CHECK ADD  CONSTRAINT [fk_PCCorpseItems_PCCorpseID] FOREIGN KEY([PCCorpseID])
REFERENCES [dbo].[PCCorpses] ([PCCorpseID])
GO
ALTER TABLE [dbo].[PCCorpseItems] CHECK CONSTRAINT [fk_PCCorpseItems_PCCorpseID]
GO
ALTER TABLE [dbo].[PCCustomEffects]  WITH CHECK ADD  CONSTRAINT [fk_PCCustomEffects_CustomEffectID] FOREIGN KEY([CustomEffectID])
REFERENCES [dbo].[CustomEffects] ([CustomEffectID])
GO
ALTER TABLE [dbo].[PCCustomEffects] CHECK CONSTRAINT [fk_PCCustomEffects_CustomEffectID]
GO
ALTER TABLE [dbo].[PCCustomEffects]  WITH CHECK ADD  CONSTRAINT [fk_PCCustomEffects_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCCustomEffects] CHECK CONSTRAINT [fk_PCCustomEffects_PlayerID]
GO
ALTER TABLE [dbo].[PCKeyItems]  WITH CHECK ADD  CONSTRAINT [fk_PCKeyItems_KeyItemID] FOREIGN KEY([KeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[PCKeyItems] CHECK CONSTRAINT [fk_PCKeyItems_KeyItemID]
GO
ALTER TABLE [dbo].[PCKeyItems]  WITH CHECK ADD  CONSTRAINT [fk_PCKeyItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCKeyItems] CHECK CONSTRAINT [fk_PCKeyItems_PlayerID]
GO
ALTER TABLE [dbo].[PCMapPins]  WITH CHECK ADD  CONSTRAINT [FK_PCMapPins_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCMapPins] CHECK CONSTRAINT [FK_PCMapPins_PlayerID]
GO
ALTER TABLE [dbo].[PCMigrationItems]  WITH CHECK ADD  CONSTRAINT [fk_PCMigrationItems_BaseItemTypeID] FOREIGN KEY([BaseItemTypeID])
REFERENCES [dbo].[BaseItemTypes] ([BaseItemTypeID])
GO
ALTER TABLE [dbo].[PCMigrationItems] CHECK CONSTRAINT [fk_PCMigrationItems_BaseItemTypeID]
GO
ALTER TABLE [dbo].[PCMigrationItems]  WITH CHECK ADD  CONSTRAINT [fk_PCMigrationItems_PCMigrationID] FOREIGN KEY([PCMigrationID])
REFERENCES [dbo].[PCMigrations] ([PCMigrationID])
GO
ALTER TABLE [dbo].[PCMigrationItems] CHECK CONSTRAINT [fk_PCMigrationItems_PCMigrationID]
GO
ALTER TABLE [dbo].[PCOutfits]  WITH CHECK ADD  CONSTRAINT [fk_PCOutfits_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCOutfits] CHECK CONSTRAINT [fk_PCOutfits_PlayerID]
GO
ALTER TABLE [dbo].[PCOverflowItems]  WITH CHECK ADD  CONSTRAINT [fk_PCOverflowItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCOverflowItems] CHECK CONSTRAINT [fk_PCOverflowItems_PlayerID]
GO
ALTER TABLE [dbo].[PCPerks]  WITH CHECK ADD  CONSTRAINT [fk_PCPerks_PerkID] FOREIGN KEY([PerkID])
REFERENCES [dbo].[Perks] ([PerkID])
GO
ALTER TABLE [dbo].[PCPerks] CHECK CONSTRAINT [fk_PCPerks_PerkID]
GO
ALTER TABLE [dbo].[PCPerks]  WITH CHECK ADD  CONSTRAINT [fk_PCPerks_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCPerks] CHECK CONSTRAINT [fk_PCPerks_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_NPCGroupID] FOREIGN KEY([NPCGroupID])
REFERENCES [dbo].[NPCGroups] ([NPCGroupID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_NPCGroupID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_PCQuestStatusID] FOREIGN KEY([PCQuestStatusID])
REFERENCES [dbo].[PCQuestStatus] ([PCQuestStatusID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_PCQuestStatusID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_CurrentQuestStateID] FOREIGN KEY([CurrentQuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_CurrentQuestStateID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_QuestID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_SelectedRewardID] FOREIGN KEY([SelectedItemRewardID])
REFERENCES [dbo].[QuestRewardItems] ([QuestRewardItemID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_SelectedRewardID]
GO
ALTER TABLE [dbo].[PCRegionalFame]  WITH CHECK ADD  CONSTRAINT [FK_PCRegionalFame_FameRegionID] FOREIGN KEY([FameRegionID])
REFERENCES [dbo].[FameRegions] ([FameRegionID])
GO
ALTER TABLE [dbo].[PCRegionalFame] CHECK CONSTRAINT [FK_PCRegionalFame_FameRegionID]
GO
ALTER TABLE [dbo].[PCRegionalFame]  WITH CHECK ADD  CONSTRAINT [FK_PCRegionalFame_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCRegionalFame] CHECK CONSTRAINT [FK_PCRegionalFame_PlayerID]
GO
ALTER TABLE [dbo].[PCSearchSiteItems]  WITH CHECK ADD  CONSTRAINT [fk_PCSearchSiteItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSearchSiteItems] CHECK CONSTRAINT [fk_PCSearchSiteItems_PlayerID]
GO
ALTER TABLE [dbo].[PCSearchSites]  WITH CHECK ADD  CONSTRAINT [fk_PCSearchSites_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSearchSites] CHECK CONSTRAINT [fk_PCSearchSites_PlayerID]
GO
ALTER TABLE [dbo].[PCSkills]  WITH CHECK ADD  CONSTRAINT [FK_PCSkills_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSkills] CHECK CONSTRAINT [FK_PCSkills_PlayerID]
GO
ALTER TABLE [dbo].[PCSkills]  WITH CHECK ADD  CONSTRAINT [FK_PCSkills_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[PCSkills] CHECK CONSTRAINT [FK_PCSkills_SkillID]
GO
ALTER TABLE [dbo].[PerkLevels]  WITH CHECK ADD  CONSTRAINT [FK_PerkLevels_PerkID] FOREIGN KEY([PerkID])
REFERENCES [dbo].[Perks] ([PerkID])
GO
ALTER TABLE [dbo].[PerkLevels] CHECK CONSTRAINT [FK_PerkLevels_PerkID]
GO
ALTER TABLE [dbo].[PerkLevelSkillRequirements]  WITH CHECK ADD  CONSTRAINT [FK_PerkLevelSkillRequirements_PerkLevelID] FOREIGN KEY([PerkLevelID])
REFERENCES [dbo].[PerkLevels] ([PerkLevelID])
GO
ALTER TABLE [dbo].[PerkLevelSkillRequirements] CHECK CONSTRAINT [FK_PerkLevelSkillRequirements_PerkLevelID]
GO
ALTER TABLE [dbo].[PerkLevelSkillRequirements]  WITH CHECK ADD  CONSTRAINT [FK_PerkLevelSkillRequirements_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[PerkLevelSkillRequirements] CHECK CONSTRAINT [FK_PerkLevelSkillRequirements_SkillID]
GO
ALTER TABLE [dbo].[Perks]  WITH CHECK ADD  CONSTRAINT [fk_Perks_CooldownCategoryID] FOREIGN KEY([CooldownCategoryID])
REFERENCES [dbo].[CooldownCategories] ([CooldownCategoryID])
GO
ALTER TABLE [dbo].[Perks] CHECK CONSTRAINT [fk_Perks_CooldownCategoryID]
GO
ALTER TABLE [dbo].[Perks]  WITH CHECK ADD  CONSTRAINT [fk_Perks_EnmityAdjustmentRuleID] FOREIGN KEY([EnmityAdjustmentRuleID])
REFERENCES [dbo].[EnmityAdjustmentRule] ([EnmityAdjustmentRuleID])
GO
ALTER TABLE [dbo].[Perks] CHECK CONSTRAINT [fk_Perks_EnmityAdjustmentRuleID]
GO
ALTER TABLE [dbo].[Perks]  WITH CHECK ADD  CONSTRAINT [fk_Perks_ExecutionTypeID] FOREIGN KEY([ExecutionTypeID])
REFERENCES [dbo].[PerkExecutionTypes] ([PerkExecutionTypeID])
GO
ALTER TABLE [dbo].[Perks] CHECK CONSTRAINT [fk_Perks_ExecutionTypeID]
GO
ALTER TABLE [dbo].[Perks]  WITH CHECK ADD  CONSTRAINT [fk_Perks_PerkCategoryID] FOREIGN KEY([PerkCategoryID])
REFERENCES [dbo].[PerkCategories] ([PerkCategoryID])
GO
ALTER TABLE [dbo].[Perks] CHECK CONSTRAINT [fk_Perks_PerkCategoryID]
GO
ALTER TABLE [dbo].[PlayerCharacters]  WITH CHECK ADD  CONSTRAINT [fk_PlayerCharacters_BackgroundID] FOREIGN KEY([BackgroundID])
REFERENCES [dbo].[Backgrounds] ([BackgroundID])
GO
ALTER TABLE [dbo].[PlayerCharacters] CHECK CONSTRAINT [fk_PlayerCharacters_BackgroundID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_NPCGroupID] FOREIGN KEY([NPCGroupID])
REFERENCES [dbo].[NPCGroups] ([NPCGroupID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_NPCGroupID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_QuestID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_QuestStateID] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_QuestStateID]
GO
ALTER TABLE [dbo].[QuestPrerequisites]  WITH CHECK ADD  CONSTRAINT [FK_QuestPrerequisites_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestPrerequisites] CHECK CONSTRAINT [FK_QuestPrerequisites_QuestID]
GO
ALTER TABLE [dbo].[QuestPrerequisites]  WITH CHECK ADD  CONSTRAINT [FK_QuestPrerequisites_RequiredQuestID] FOREIGN KEY([RequiredQuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestPrerequisites] CHECK CONSTRAINT [FK_QuestPrerequisites_RequiredQuestID]
GO
ALTER TABLE [dbo].[QuestRequiredItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredItemList] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestRequiredItemList] CHECK CONSTRAINT [FK_QuestRequiredItemList]
GO
ALTER TABLE [dbo].[QuestRequiredItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredItemList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRequiredItemList] CHECK CONSTRAINT [FK_QuestRequiredItemList_QuestID]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList_KeyItemID] FOREIGN KEY([KeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList_KeyItemID]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList_QuestID]
GO
ALTER TABLE [dbo].[QuestRewardItems]  WITH CHECK ADD  CONSTRAINT [FK_QuestRewards_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRewardItems] CHECK CONSTRAINT [FK_QuestRewards_QuestID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_FameRegionID] FOREIGN KEY([FameRegionID])
REFERENCES [dbo].[FameRegions] ([FameRegionID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_FameRegionID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_RewardKeyItemID] FOREIGN KEY([RewardKeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_RewardKeyItemID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_TemporaryKeyItemID] FOREIGN KEY([StartKeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_TemporaryKeyItemID]
GO
ALTER TABLE [dbo].[QuestStates]  WITH CHECK ADD  CONSTRAINT [FK_QuestStates_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestStates] CHECK CONSTRAINT [FK_QuestStates_QuestID]
GO
ALTER TABLE [dbo].[QuestStates]  WITH CHECK ADD  CONSTRAINT [FK_QuestStates_QuestTypeID] FOREIGN KEY([QuestTypeID])
REFERENCES [dbo].[QuestTypeDomain] ([QuestTypeID])
GO
ALTER TABLE [dbo].[QuestStates] CHECK CONSTRAINT [FK_QuestStates_QuestTypeID]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Primary] FOREIGN KEY([Primary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Primary]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Secondary] FOREIGN KEY([Secondary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Secondary]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_SkillCategoryID] FOREIGN KEY([SkillCategoryID])
REFERENCES [dbo].[SkillCategories] ([SkillCategoryID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_SkillCategoryID]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Tertiary] FOREIGN KEY([Tertiary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Tertiary]
GO
ALTER TABLE [dbo].[SkillXPRequirement]  WITH CHECK ADD  CONSTRAINT [FK_SkillXPRequirement_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillXPRequirement] CHECK CONSTRAINT [FK_SkillXPRequirement_SkillID]
GO
ALTER TABLE [dbo].[StorageItems]  WITH CHECK ADD  CONSTRAINT [fk_StorageItems_StorageContainerID] FOREIGN KEY([StorageContainerID])
REFERENCES [dbo].[StorageContainers] ([StorageContainerID])
GO
ALTER TABLE [dbo].[StorageItems] CHECK CONSTRAINT [fk_StorageItems_StorageContainerID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Users_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[DMRoleDomain] ([DMRoleDomainID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_Users_RoleID]
GO
ALTER TABLE [dbo].[PCBases]  WITH CHECK ADD  CONSTRAINT [CK_PCBases_Sector] CHECK  (([Sector]='SE' OR [Sector]='SW' OR [Sector]='NE' OR [Sector]='NW'))
GO
ALTER TABLE [dbo].[PCBases] CHECK CONSTRAINT [CK_PCBases_Sector]
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesAvailableToPC]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns crafting categories available for player based on
--				perk and skill levels.
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoriesAvailableToPC]
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cbc.CraftBlueprintCategoryID ,
       cbc.Name ,
       cbc.IsActive
	FROM dbo.CraftBlueprintCategories cbc
	WHERE cbc.CraftBlueprintCategoryID IN (
		SELECT DISTINCT cb2.CraftCategoryID
		FROM dbo.CraftBlueprints AS cb2
		JOIN dbo.PCSkills pcs ON pcs.PlayerID = @PlayerID
		LEFT JOIN dbo.PCPerks pcp ON (cb2.PerkID IS NULL OR pcp.PerkID = cb2.PerkID)
			AND (pcp.PerkLevel >= cb2.RequiredPerkLevel)
			AND (pcs.PlayerID = pcp.PlayerID)
		WHERE cb2.IsActive = 1
			AND (cb2.BaseLevel <= pcs.Rank+5)
			AND (pcp.PCPerkID IS NOT NULL OR cb2.PerkID IS NULL)
	)
		AND cbc.IsActive = 1
	ORDER BY cbc.Name ASC
END


GO
/****** Object:  StoredProcedure [dbo].[GetCraftCategoriesAvailableToPCByDeviceID]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns all craft categories available to a PC
--				based on the device, their perks, and their skill levels.
-- =============================================
CREATE PROCEDURE [dbo].[GetCraftCategoriesAvailableToPCByDeviceID]
	@DeviceID INT,
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cbc.CraftBlueprintCategoryID ,
       cbc.Name ,
       cbc.IsActive
	FROM dbo.CraftBlueprintCategories cbc
	WHERE cbc.CraftBlueprintCategoryID IN (
		SELECT DISTINCT cb2.CraftCategoryID
		FROM dbo.CraftBlueprints AS cb2
		JOIN dbo.PCSkills pcs ON pcs.PlayerID = @PlayerID
		LEFT JOIN dbo.PCPerks pcp ON (cb2.PerkID IS NULL OR pcp.PerkID = cb2.PerkID)
			AND (pcp.PerkLevel >= cb2.RequiredPerkLevel)
			AND (pcs.PlayerID = pcp.PlayerID)
		WHERE cb2.IsActive = 1
			AND (cb2.BaseLevel <= pcs.Rank+5)
			AND (pcp.PCPerkID IS NOT NULL OR cb2.PerkID IS NULL)
			AND cb2.CraftDeviceID = @DeviceID
	)
		AND cbc.IsActive = 1
	ORDER BY cbc.Name ASC

END


GO
/****** Object:  StoredProcedure [dbo].[GetPCBlueprintsByCategoryID]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns the craft blueprints available to PC
--				based on skill and perk levels.
-- =============================================
CREATE PROCEDURE [dbo].[GetPCBlueprintsByCategoryID]
	@PlayerID NVARCHAR(60),
	@CraftCategoryID INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cb2.CraftBlueprintID ,
           cb2.CraftCategoryID ,
           cb2.BaseLevel ,
           cb2.ItemName ,
           cb2.ItemResref ,
           cb2.Quantity ,
           cb2.SkillID ,
           cb2.CraftDeviceID ,
           cb2.PerkID ,
           cb2.RequiredPerkLevel ,
           cb2.IsActive ,
           cb2.MainComponentTypeID ,
           cb2.MainMinimum ,
           cb2.SecondaryComponentTypeID ,
           cb2.SecondaryMinimum ,
           cb2.TertiaryComponentTypeID ,
           cb2.TertiaryMinimum ,
           cb2.EnhancementSlots,
		   cb2.MainMaximum,
		   cb2.SecondaryMaximum,
		   cb2.TertiaryMaximum
	FROM dbo.CraftBlueprints AS cb2
	JOIN dbo.PCSkills pcs ON pcs.PlayerID = @PlayerID AND cb2.SkillID = pcs.SkillID
	LEFT JOIN dbo.PCPerks pcp ON (cb2.PerkID IS NULL OR pcp.PerkID = cb2.PerkID)
		AND (pcp.PerkLevel >= cb2.RequiredPerkLevel)
		AND (pcs.PlayerID = pcp.PlayerID)
	WHERE cb2.IsActive = 1
		AND (cb2.BaseLevel <= pcs.Rank+5)
		AND (pcp.PCPerkID IS NOT NULL OR cb2.PerkID IS NULL)
		AND cb2.CraftCategoryID = @CraftCategoryID
END





GO
/****** Object:  StoredProcedure [dbo].[GetPCCraftBlueprintsByDeviceAndCategoryID]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns the available craft blueprints for a player
--				based on their skill, perks, and the device type
-- =============================================
CREATE PROCEDURE [dbo].[GetPCCraftBlueprintsByDeviceAndCategoryID]
	@DeviceID INT,
	@CraftCategoryID INT,
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cb2.CraftBlueprintID ,
           cb2.CraftCategoryID ,
           cb2.BaseLevel ,
           cb2.ItemName ,
           cb2.ItemResref ,
           cb2.Quantity ,
           cb2.SkillID ,
           cb2.CraftDeviceID ,
           cb2.PerkID ,
           cb2.RequiredPerkLevel ,
           cb2.IsActive ,
           cb2.MainComponentTypeID ,
           cb2.MainMinimum ,
           cb2.SecondaryComponentTypeID ,
           cb2.SecondaryMinimum ,
           cb2.TertiaryComponentTypeID ,
           cb2.TertiaryMinimum ,
           cb2.EnhancementSlots ,
           cb2.MainMaximum ,
           cb2.SecondaryMaximum ,
           cb2.TertiaryMaximum
	FROM dbo.CraftBlueprints AS cb2
	JOIN dbo.PCSkills pcs ON pcs.PlayerID = @PlayerID AND cb2.SkillID = pcs.SkillID
	LEFT JOIN dbo.PCPerks pcp ON (cb2.PerkID IS NULL OR pcp.PerkID = cb2.PerkID)
		AND (pcp.PerkLevel >= cb2.RequiredPerkLevel)
		AND (pcs.PlayerID = pcp.PlayerID)
	WHERE cb2.IsActive = 1
		AND (cb2.BaseLevel <= pcs.Rank+5)
		AND (pcp.PCPerkID IS NOT NULL OR cb2.PerkID IS NULL)
		AND cb2.CraftDeviceID = @DeviceID
		AND cb2.CraftCategoryID = @CraftCategoryID
END






GO
/****** Object:  StoredProcedure [dbo].[GetPCPerksByExecutionType]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns the perks available to player which match the specified execution type.
-- =============================================
CREATE PROCEDURE [dbo].[GetPCPerksByExecutionType]
	@PlayerID NVARCHAR(60),
	@ExecutionTypeID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT pcp.PCPerkID ,
		   pcp.PlayerID ,
		   pcp.AcquiredDate ,
		   pcp.PerkID ,
		   pcp.PerkLevel
	FROM dbo.PCPerks pcp
	CROSS APPLY dbo.fn_GetPlayerEffectivePerkLevel(pcp.PlayerID, pcp.PerkID, NULL) ap
	JOIN dbo.Perks p ON p.PerkID = pcp.PerkID
	WHERE pcp.PlayerID = @PlayerID
		AND p.ExecutionTypeID = @ExecutionTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[GetPCPerksForMenuHeader]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns perk data used for menu headers
-- =============================================
CREATE PROCEDURE [dbo].[GetPCPerksForMenuHeader]
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT pcp.PCPerkID,
		   p.Name AS Name,
		   pcp.PerkLevel AS Level,
		   pl.Description AS BonusDescription
	FROM dbo.PCPerks pcp
	JOIN dbo.Perks p ON p.PerkID = pcp.PerkID
	JOIN dbo.PerkLevels pl ON pl.PerkID = p.PerkID AND pl.Level = pcp.PerkLevel
	WHERE pcp.PlayerID = @PlayerID
	ORDER BY p.Name
END
GO
/****** Object:  StoredProcedure [dbo].[GetPCPerksWithExecutionType]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns all PCPerks for a given player ID which also have
--				execution types.
-- =============================================
CREATE PROCEDURE [dbo].[GetPCPerksWithExecutionType]
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT pcp.PCPerkID ,
		   pcp.PlayerID ,
		   pcp.AcquiredDate ,
		   pcp.PerkID ,
		   pcp.PerkLevel
	FROM dbo.PCPerks pcp
	CROSS APPLY dbo.fn_GetPlayerEffectivePerkLevel(pcp.PlayerID, pcp.PerkID, NULL) ap
	JOIN dbo.Perks p ON p.PerkID = pcp.PerkID
	WHERE pcp.PlayerID = @PlayerID
		AND p.ExecutionTypeID > 0

END

GO
/****** Object:  StoredProcedure [dbo].[GetPCSkillAdjustedPerkLevel]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns player's skill-adjusted perk level.
-- =============================================
CREATE PROCEDURE [dbo].[GetPCSkillAdjustedPerkLevel]
	@PlayerID NVARCHAR(60),
	@PerkID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT PerkLevelID ,
       PerkID ,
       Level ,
       Price ,
       Description
	FROM dbo.fn_GetPlayerEffectivePerkLevel(@PlayerID, @PerkID, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[GetPerkCategoriesForPC]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Get available perk categories for PC
-- =============================================
CREATE PROCEDURE [dbo].[GetPerkCategoriesForPC]
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT pc.PerkCategoryID ,
		   pc.Name ,
		   pc.IsActive ,
		   pc.Sequence
	FROM dbo.PerkCategories pc
	WHERE pc.PerkCategoryID IN (
		SELECT DISTINCT pc.PerkCategoryID
		FROM dbo.PerkCategories pc
		JOIN dbo.Perks p ON p.PerkCategoryID = pc.PerkCategoryID
		JOIN dbo.PlayerCharacters plc ON plc.PlayerID = @PlayerID
		LEFT JOIN dbo.PerkLevels pl ON pl.PerkID = p.PerkID
		LEFT JOIN dbo.PerkLevelSkillRequirements psr ON psr.PerkLevelID = pl.PerkLevelID
		LEFT JOIN dbo.PCSkills pcsk ON pcsk.PlayerID = plc.PlayerID AND pcsk.SkillID = psr.SkillID
		WHERE (psr.SkillID IS NULL OR psr.SkillID = pcsk.SkillID)
			AND (psr.RequiredRank IS NULL OR psr.RequiredRank <= pcsk.Rank)
			AND pc.IsActive = 1
	)
	ORDER BY pc.Sequence

END
GO
/****** Object:  StoredProcedure [dbo].[GetPerksForPC]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns all perks learned by a PC
-- =============================================
CREATE PROCEDURE [dbo].[GetPerksForPC]
	@PlayerID NVARCHAR(60),
	@CategoryID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	SELECT p.PerkID ,
           p.Name ,
           p.FeatID ,
           p.IsActive ,
           p.JavaScriptName ,
           p.BaseFPCost ,
           p.BaseCastingTime ,
           p.Description ,
           p.PerkCategoryID ,
           p.CooldownCategoryID ,
           p.ExecutionTypeID ,
           p.ItemResref ,
           p.IsTargetSelfOnly ,
           p.Enmity ,
           p.EnmityAdjustmentRuleID
	FROM dbo.Perks p
	WHERE p.PerkID IN (
		SELECT DISTINCT p.PerkID
		FROM dbo.Perks p
		JOIN dbo.PlayerCharacters plc ON plc.PlayerID = @PlayerID
		LEFT JOIN dbo.PerkLevels pl ON pl.PerkID = p.PerkID
		LEFT JOIN dbo.PerkLevelSkillRequirements plsr ON plsr.PerkLevelID = pl.PerkLevelID
		LEFT JOIN dbo.PCSkills pcsk ON pcsk.PlayerID = plc.PlayerID AND plsr.SkillID = pcsk.SkillID
		WHERE (plsr.SkillID IS NULL OR plsr.SkillID = pcsk.SkillID)
			AND (plsr.RequiredRank IS NULL OR plsr.RequiredRank <= pcsk.Rank)
			AND p.PerkCategoryID = @CategoryID
			AND p.IsActive = 1
	)

END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestKillTargetsByQuestSequenceID]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-11
-- Description:	Returns kill targets for a given quest and sequence ID
-- =============================================
CREATE PROCEDURE [dbo].[GetQuestKillTargetsByQuestSequenceID]
	@QuestID INT,
	@SequenceID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT qktl.QuestKillTargetListID ,
		   qktl.QuestID ,
		   qktl.NPCGroupID ,
		   qktl.Quantity,
		   qktl.QuestStateID
	FROM dbo.QuestKillTargetList qktl
	WHERE qktl.QuestID = @QuestID
	  AND qktl.QuestStateID = (SELECT QuestStateID
							   FROM QuestStates qs
							   WHERE qs.QuestID = @QuestID
								  AND qs.Sequence = @SequenceID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalXPAmountsForPC]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-10
-- Description:	Returns a result set containing the skill ID and total skill XP earned by a player.
-- =============================================
CREATE PROCEDURE [dbo].[GetTotalXPAmountsForPC]
	@PlayerID NVARCHAR(60),
	@SkillID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	SELECT pcs.SkillID, CAST(SUM(xp.XP) + pcs.XP AS INTEGER) AS TotalSkillXP
	FROM dbo.PCSkills pcs
	JOIN dbo.SkillXPRequirement xp ON xp.SkillID = pcs.SkillID AND ((xp.Rank < pcs.Rank) OR (xp.Rank = 0 AND pcs.XP > 0))
	WHERE pcs.IsLocked = 0
		AND pcs.PlayerID = @PlayerID
		AND pcs.SkillID <> @SkillID
	GROUP BY pcs.SkillID, pcs.XP
	ORDER BY pcs.SkillID

END
GO
/****** Object:  StoredProcedure [dbo].[InsertAllPCSkillsByID]    Script Date: 9/4/2018 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zunath
-- Create date: 2018-08-10
-- Description:	Inserts any missing PCSkills records on player module entry.
-- =============================================
CREATE PROCEDURE [dbo].[InsertAllPCSkillsByID]
	@PlayerID NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO dbo.PCSkills ( PlayerID ,
									   SkillID ,
									   XP ,
									   Rank,
									   IsLocked)
			SELECT @PlayerID,
				s.SkillID,
				0,
				0,
				0
			FROM dbo.Skills s
			WHERE s.SkillID NOT IN (
				SELECT pcs.SkillID
				FROM dbo.PCSkills pcs
				WHERE pcs.PlayerID = @PlayerID
			)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN

		RAISERROR('Failed to insert all PC Skills from OnModuleEnter. (InsertAllPCSkillsByID)', -1, -1)
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [swlor] SET  READ_WRITE 
GO
