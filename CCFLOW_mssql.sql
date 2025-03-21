
GO
/****** Object:  Database [ccflow]    Script Date: 2023/8/6 0:56:05 ******/
CREATE DATABASE [ccflow] ON  PRIMARY 
( NAME = N'LCRBPM', FILENAME = N'D:\ProM\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LCRBPM.mdf' , SIZE = 11520KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LCRBPM_log', FILENAME = N'D:\ProM\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LCRBPM_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ccflow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ccflow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ccflow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ccflow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ccflow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ccflow] SET ARITHABORT OFF 
GO
ALTER DATABASE [ccflow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ccflow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ccflow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ccflow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ccflow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ccflow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ccflow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ccflow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ccflow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ccflow] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ccflow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ccflow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ccflow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ccflow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ccflow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ccflow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ccflow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ccflow] SET RECOVERY FULL 
GO
ALTER DATABASE [ccflow] SET  MULTI_USER 
GO
ALTER DATABASE [ccflow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ccflow] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LCRBPM', N'ON'
GO
USE [ccflow]
GO
/****** Object:  Table [dbo].[frm_bbs]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_bbs](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ParentNo] [nvarchar](50) NULL,
	[WorkID] [nvarchar](50) NULL,
	[Docs] [nvarchar](50) NULL,
	[Rec] [nvarchar](200) NULL,
	[RecName] [nvarchar](200) NULL,
	[RDT] [nvarchar](50) NULL,
	[DeptNo] [nvarchar](200) NULL,
	[DeptName] [nvarchar](200) NULL,
	[FrmID] [nvarchar](50) NULL,
	[FrmName] [nvarchar](200) NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[WebPath] [nvarchar](300) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [real] NULL,
 CONSTRAINT [PK_frm_bbs_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_collection]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_collection](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[MethodID] [nvarchar](300) NULL,
	[MethodModel] [nvarchar](300) NULL,
	[Tag1] [nvarchar](300) NULL,
	[Mark] [nvarchar](900) NULL,
	[FrmID] [nvarchar](300) NULL,
	[FlowNo] [nvarchar](10) NULL,
	[Icon] [nvarchar](50) NULL,
	[GroupID] [nvarchar](50) NULL,
	[WarningMsg] [nvarchar](300) NULL,
	[MethodDocTypeOfFunc] [int] NULL,
	[MsgSuccess] [nvarchar](300) NULL,
	[MsgErr] [nvarchar](300) NULL,
	[Docs] [nvarchar](300) NULL,
	[IsEnable] [int] NULL,
	[Idx] [int] NULL,
	[RefMethodType] [int] NULL,
	[PopHeight] [int] NULL,
	[PopWidth] [int] NULL,
	[WhatAreYouTodo] [int] NULL,
	[ShowModel] [int] NULL,
 CONSTRAINT [PK_frm_collection_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_deptcreate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_deptcreate](
	[FrmID] [nvarchar](100) NOT NULL,
	[FK_Dept] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_frm_deptcreate_FrmID] PRIMARY KEY CLUSTERED 
(
	[FrmID] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_dictflow]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_dictflow](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](300) NULL,
	[FlowNo] [nvarchar](20) NULL,
	[Label] [nvarchar](20) NULL,
	[IsShowListRight] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_frm_dictflow_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_empcreate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_empcreate](
	[FrmID] [nvarchar](100) NOT NULL,
	[FK_Emp] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_frm_empcreate_FrmID] PRIMARY KEY CLUSTERED 
(
	[FrmID] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_func]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_func](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[FuncID] [nvarchar](300) NULL,
	[Icon] [nvarchar](50) NULL,
	[FuncSrc] [int] NULL,
	[DTSName] [nvarchar](300) NULL,
	[Docs] [nvarchar](max) NULL,
	[WarningMsg] [nvarchar](300) NULL,
	[MethodDocTypeOfFunc] [int] NULL,
	[MethodDoc_Url] [nvarchar](300) NULL,
	[MsgSuccess] [nvarchar](300) NULL,
	[MsgErr] [nvarchar](300) NULL,
	[IsHavePara] [int] NULL,
 CONSTRAINT [PK_frm_func_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_generbill]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_generbill](
	[WorkID] [int] NOT NULL,
	[FK_FrmTree] [nvarchar](10) NULL,
	[FrmID] [nvarchar](100) NULL,
	[FrmName] [nvarchar](200) NULL,
	[BillNo] [nvarchar](100) NULL,
	[Title] [nvarchar](1000) NULL,
	[BillSta] [int] NULL,
	[BillState] [int] NULL,
	[Starter] [nvarchar](200) NULL,
	[StarterName] [nvarchar](200) NULL,
	[Sender] [nvarchar](200) NULL,
	[RDT] [nvarchar](50) NULL,
	[SendDT] [nvarchar](50) NULL,
	[NDStep] [int] NULL,
	[NDStepName] [nvarchar](100) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[DeptName] [nvarchar](100) NULL,
	[PRI] [int] NULL,
	[SDTOfNode] [nvarchar](50) NULL,
	[SDTOfFlow] [nvarchar](50) NULL,
	[PFrmID] [nvarchar](3) NULL,
	[PWorkID] [int] NULL,
	[TSpan] [int] NULL,
	[AtPara] [nvarchar](2000) NULL,
	[Emps] [nvarchar](max) NULL,
	[GUID] [nvarchar](36) NULL,
	[FK_NY] [nvarchar](7) NULL,
 CONSTRAINT [PK_frm_generbill_WorkID] PRIMARY KEY CLUSTERED 
(
	[WorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_groupmethod]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_groupmethod](
	[No] [nvarchar](150) NOT NULL,
	[FrmID] [nvarchar](200) NULL,
	[Name] [nvarchar](500) NULL,
	[Icon] [nvarchar](200) NULL,
	[OrgNo] [nvarchar](40) NULL,
	[Idx] [int] NULL,
	[AtPara] [nvarchar](3000) NULL,
 CONSTRAINT [PK_frm_groupmethod_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_method]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_method](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[MethodID] [nvarchar](300) NULL,
	[GroupID] [nvarchar](50) NULL,
	[MethodModel] [nvarchar](300) NULL,
	[Tag1] [nvarchar](300) NULL,
	[Mark] [nvarchar](900) NULL,
	[FrmID] [nvarchar](300) NULL,
	[FlowNo] [nvarchar](10) NULL,
	[Icon] [nvarchar](50) NULL,
	[ShowModel] [int] NULL,
	[PopHeight] [int] NULL,
	[PopWidth] [int] NULL,
	[IsMyBillToolBar] [int] NULL,
	[IsMyBillToolExt] [int] NULL,
	[IsSearchBar] [int] NULL,
	[DTSDataWay] [int] NULL,
	[DTSSpecFiels] [nvarchar](300) NULL,
	[DTSWhenFlowOver] [int] NULL,
	[DTSWhenNodeOver] [int] NULL,
	[WhatAreYouTodo] [int] NULL,
	[MethodDoc_Url] [nvarchar](300) NULL,
	[Docs] [nvarchar](300) NULL,
	[RefMethodType] [int] NULL,
	[WarningMsg] [nvarchar](300) NULL,
	[MsgSuccess] [nvarchar](300) NULL,
	[MsgErr] [nvarchar](300) NULL,
	[MethodDocTypeOfFunc] [int] NULL,
	[IsEnable] [int] NULL,
	[IsList] [int] NULL,
	[IsHavePara] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_frm_method_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_stationcreate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_stationcreate](
	[FrmID] [nvarchar](100) NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_frm_stationcreate_FrmID] PRIMARY KEY CLUSTERED 
(
	[FrmID] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_stationdept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_stationdept](
	[FK_Frm] [nvarchar](190) NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
	[FK_Dept] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_frm_stationdept_FK_Frm] PRIMARY KEY CLUSTERED 
(
	[FK_Frm] ASC,
	[FK_Station] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_toolbarbtn]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_toolbarbtn](
	[MyPK] [nvarchar](100) NOT NULL,
	[BtnID] [nvarchar](300) NULL,
	[BtnLab] [nvarchar](300) NULL,
	[FrmID] [nvarchar](300) NULL,
	[Icon] [nvarchar](50) NULL,
	[PopHeight] [int] NULL,
	[PopWidth] [int] NULL,
	[IsEnable] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_frm_toolbarbtn_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frm_track]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frm_track](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](50) NULL,
	[FrmName] [nvarchar](200) NULL,
	[ActionType] [nvarchar](30) NULL,
	[ActionTypeText] [nvarchar](30) NULL,
	[WorkID] [nvarchar](100) NULL,
	[Msg] [nvarchar](300) NULL,
	[Rec] [nvarchar](200) NULL,
	[RecName] [nvarchar](200) NULL,
	[RDT] [nvarchar](50) NULL,
	[DeptNo] [nvarchar](200) NULL,
	[DeptName] [nvarchar](200) NULL,
	[FID] [int] NULL,
	[FlowNo] [nvarchar](20) NULL,
	[FlowName] [nvarchar](200) NULL,
	[NodeID] [int] NULL,
	[NodeName] [nvarchar](200) NULL,
	[WorkIDOfFlow] [int] NULL,
	[AtPara] [nvarchar](max) NULL,
 CONSTRAINT [PK_frm_track_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_deptmenu]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_deptmenu](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Menu] [nvarchar](50) NULL,
	[FK_Dept] [nvarchar](50) NULL,
	[IsChecked] [int] NULL,
 CONSTRAINT [PK_gpm_deptmenu_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_empmenu]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_empmenu](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Menu] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[FK_App] [nvarchar](50) NULL,
	[IsChecked] [int] NULL,
 CONSTRAINT [PK_gpm_empmenu_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_group]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_group](
	[No] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_gpm_group_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_groupdept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_groupdept](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Group] [nvarchar](50) NULL,
	[FK_Dept] [nvarchar](100) NULL,
 CONSTRAINT [PK_gpm_groupdept_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_groupemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_groupemp](
	[FK_Group] [nvarchar](50) NOT NULL,
	[FK_Emp] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_gpm_groupemp_FK_Group] PRIMARY KEY CLUSTERED 
(
	[FK_Group] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_groupmenu]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_groupmenu](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Group] [nvarchar](50) NULL,
	[FK_Menu] [nvarchar](50) NULL,
	[IsChecked] [int] NULL,
 CONSTRAINT [PK_gpm_groupmenu_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_groupstation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_groupstation](
	[FK_Group] [nvarchar](50) NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_gpm_groupstation_FK_Group] PRIMARY KEY CLUSTERED 
(
	[FK_Group] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_menu]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_menu](
	[No] [nvarchar](150) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Name] [nvarchar](300) NULL,
	[Title] [nvarchar](200) NULL,
	[Tag4] [nvarchar](200) NULL,
	[ListModel] [int] NULL,
	[TagInt1] [int] NULL,
	[Tag0] [nvarchar](max) NULL,
	[Tag1] [nvarchar](max) NULL,
	[Tag2] [nvarchar](max) NULL,
	[Tag3] [nvarchar](max) NULL,
	[MenuModel] [nvarchar](50) NULL,
	[Mark] [nvarchar](300) NULL,
	[FrmID] [nvarchar](300) NULL,
	[FlowNo] [nvarchar](300) NULL,
	[OpenWay] [int] NULL,
	[UrlExt] [nvarchar](500) NULL,
	[MobileUrlExt] [nvarchar](500) NULL,
	[IsEnable] [int] NULL,
	[SystemNo] [nvarchar](50) NULL,
	[ModuleNo] [nvarchar](50) NULL,
	[ModuleNoText] [nvarchar](200) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
	[IsMyBillToolBar] [int] NULL,
	[IsMyBillToolExt] [int] NULL,
	[IsSearchBar] [int] NULL,
	[DTSDataWay] [int] NULL,
	[DTSSpecFiels] [nvarchar](300) NULL,
	[DTSWhenFlowOver] [int] NULL,
	[DTSWhenNodeOver] [int] NULL,
 CONSTRAINT [PK_gpm_menu_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_menudtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_menudtl](
	[No] [nvarchar](90) NOT NULL,
	[RefMenuNo] [nvarchar](100) NULL,
	[Name] [nvarchar](300) NULL,
	[Tag1] [nvarchar](500) NULL,
	[UrlExt] [nvarchar](500) NULL,
	[Idx] [int] NULL,
	[Icon] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
 CONSTRAINT [PK_gpm_menudtl_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_module]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_module](
	[No] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[SystemNo] [nvarchar](100) NULL,
	[Icon] [nvarchar](500) NULL,
	[Idx] [int] NULL,
	[IsEnable] [int] NULL,
	[OrgNo] [nvarchar](50) NULL,
	[ChildDisplayModel] [int] NULL,
 CONSTRAINT [PK_gpm_module_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_powercenter]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_powercenter](
	[MyPK] [nvarchar](100) NOT NULL,
	[CtrlObj] [nvarchar](300) NULL,
	[CtrlPKVal] [nvarchar](300) NULL,
	[CtrlGroup] [nvarchar](300) NULL,
	[CtrlModel] [nvarchar](300) NULL,
	[IDs] [nvarchar](max) NULL,
	[IDNames] [nvarchar](max) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Idx] [nvarchar](100) NULL,
 CONSTRAINT [PK_gpm_powercenter_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_stationmenu]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_stationmenu](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Menu] [nvarchar](50) NULL,
	[FK_Station] [nvarchar](50) NULL,
	[IsChecked] [int] NULL,
 CONSTRAINT [PK_gpm_stationmenu_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_system]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_system](
	[No] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[IsEnable] [int] NULL,
	[Icon] [nvarchar](50) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_gpm_system_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_window]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_window](
	[MyPK] [nvarchar](100) NOT NULL,
	[EmpNo] [nvarchar](50) NULL,
	[WindowTemplateNo] [nvarchar](50) NULL,
	[Docs] [nvarchar](max) NULL,
	[IsEnable] [int] NULL,
	[Idx] [int] NULL,
	[OrgNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_gpm_window_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_windowtemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_windowtemplate](
	[No] [nvarchar](40) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[ColSpan] [int] NULL,
	[WinDocModel] [nvarchar](300) NULL,
	[Icon] [nvarchar](100) NULL,
	[PageID] [nvarchar](40) NULL,
	[MoreLab] [nvarchar](300) NULL,
	[MoreUrl] [nvarchar](300) NULL,
	[MoreLinkModel] [int] NULL,
	[PopW] [int] NULL,
	[PopH] [int] NULL,
	[Docs] [nvarchar](max) NULL,
	[Idx] [int] NULL,
	[IsDel] [int] NULL,
	[IsEnable] [int] NULL,
	[OrgNo] [nvarchar](50) NULL,
	[LabOfFZ] [nvarchar](100) NULL,
	[SQLOfFZ] [nvarchar](max) NULL,
	[LabOfFM] [nvarchar](100) NULL,
	[SQLOfFM] [nvarchar](max) NULL,
	[LabOfRate] [nvarchar](100) NULL,
	[IsPie] [int] NULL,
	[IsLine] [int] NULL,
	[IsZZT] [int] NULL,
	[IsRing] [int] NULL,
	[IsRate] [int] NULL,
	[DefaultChart] [int] NULL,
	[DBType] [int] NULL,
	[C1Ens] [nvarchar](max) NULL,
	[C2Ens] [nvarchar](max) NULL,
	[C3Ens] [nvarchar](max) NULL,
	[DBSrc] [nvarchar](100) NULL,
 CONSTRAINT [PK_gpm_windowtemplate_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gpm_windowtemplatedtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gpm_windowtemplatedtl](
	[MyPK] [nvarchar](100) NOT NULL,
	[RefPK] [nvarchar](40) NULL,
	[DBType] [int] NULL,
	[DBSrc] [nvarchar](100) NULL,
	[WindowsShowType] [int] NULL,
	[Name] [nvarchar](300) NULL,
	[FontColor] [nvarchar](300) NULL,
	[Exp0] [nvarchar](300) NULL,
	[Exp1] [nvarchar](300) NULL,
	[UrlExt] [nvarchar](300) NULL,
 CONSTRAINT [PK_gpm_windowtemplatedtl_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nd1rpt]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nd1rpt](
	[PWorkID] [int] NULL,
	[PNodeID] [int] NULL,
	[FlowDaySpan] [real] NULL,
	[FlowEnderRDT] [nvarchar](50) NULL,
	[FlowEndNode] [int] NULL,
	[FlowStartRDT] [nvarchar](50) NULL,
	[AtPara] [nvarchar](max) NULL,
	[BillNo] [nvarchar](100) NULL,
	[PEmp] [nvarchar](32) NULL,
	[PrjNo] [nvarchar](100) NULL,
	[PrjName] [nvarchar](100) NULL,
	[PFlowNo] [nvarchar](100) NULL,
	[FlowEmps] [nvarchar](1000) NULL,
	[GUID] [nvarchar](32) NULL,
	[FlowEnder] [nvarchar](32) NULL,
	[FlowStarter] [nvarchar](32) NULL,
	[Title] [nvarchar](200) NULL,
	[WFSta] [int] NULL,
	[WFState] [int] NULL,
	[BMJLSP_Note] [nvarchar](max) NULL,
	[ShenQingRen] [nvarchar](50) NULL,
	[ZJLSP_Note] [nvarchar](max) NULL,
	[BMJLSP_Checker] [nvarchar](50) NULL,
	[ShenQingRiJi] [nvarchar](50) NULL,
	[ZJLSP_Checker] [nvarchar](50) NULL,
	[BMJLSP_RDT] [nvarchar](50) NULL,
	[ZJLSP_RDT] [nvarchar](50) NULL,
	[ShenQingRenBuMen] [nvarchar](50) NULL,
	[RDT] [nvarchar](50) NULL,
	[OID] [int] NOT NULL,
	[FID] [int] NULL,
	[CDT] [nvarchar](50) NULL,
	[Rec] [nvarchar](32) NULL,
	[Emps] [nvarchar](max) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[FK_NY] [nvarchar](7) NULL,
	[MyNum] [int] NULL,
	[QingJiaRiQiCong] [nvarchar](50) NULL,
	[Dao] [nvarchar](50) NULL,
	[QingJiaTianShu] [real] NULL,
	[QingJiaYuanYin] [nvarchar](50) NULL,
 CONSTRAINT [PK_nd1rpt_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nd1track]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nd1track](
	[MyPK] [int] NOT NULL,
	[ActionType] [int] NULL,
	[ActionTypeText] [nvarchar](30) NULL,
	[FID] [int] NULL,
	[WorkID] [int] NULL,
	[NDFrom] [int] NULL,
	[NDFromT] [nvarchar](300) NULL,
	[NDTo] [int] NULL,
	[NDToT] [nvarchar](999) NULL,
	[EmpFrom] [nvarchar](100) NULL,
	[EmpFromT] [nvarchar](100) NULL,
	[EmpTo] [nvarchar](2000) NULL,
	[EmpToT] [nvarchar](2000) NULL,
	[RDT] [nvarchar](20) NULL,
	[WorkTimeSpan] [real] NULL,
	[Msg] [nvarchar](max) NULL,
	[NodeData] [nvarchar](max) NULL,
	[Tag] [nvarchar](300) NULL,
	[Exer] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ND2Rpt]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ND2Rpt](
	[FlowDaySpan] [float] NULL,
	[FlowEnderRDT] [nvarchar](50) NULL,
	[FlowEndNode] [int] NULL,
	[FlowStartRDT] [nvarchar](50) NULL,
	[PNodeID] [int] NULL,
	[PWorkID] [int] NULL,
	[PrjName] [nvarchar](100) NULL,
	[PrjNo] [nvarchar](100) NULL,
	[PEmp] [nvarchar](100) NULL,
	[PFlowNo] [nvarchar](100) NULL,
	[GUID] [nvarchar](32) NULL,
	[FlowEmps] [nvarchar](1000) NULL,
	[AtPara] [nvarchar](max) NULL,
	[BillNo] [nvarchar](100) NULL,
	[FlowEnder] [nvarchar](100) NULL,
	[FlowStarter] [nvarchar](100) NULL,
	[WFSta] [int] NULL,
	[WFState] [int] NULL,
	[OID] [int] NOT NULL,
	[FID] [int] NULL,
	[RDT] [nvarchar](50) NULL,
	[Rec] [nvarchar](50) NULL,
	[Emps] [nvarchar](max) NULL,
	[FK_Dept] [nvarchar](50) NULL,
	[FK_DeptName] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[FK_NY] [nvarchar](7) NULL,
	[SQR] [nvarchar](300) NULL,
	[SQRQ] [nvarchar](50) NULL,
	[SQDept] [nvarchar](300) NULL,
 CONSTRAINT [ND2Rptpk] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ND2Track]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ND2Track](
	[MyPK] [int] NOT NULL,
	[ActionType] [int] NULL,
	[ActionTypeText] [nvarchar](30) NULL,
	[FID] [int] NULL,
	[WorkID] [int] NULL,
	[NDFrom] [int] NULL,
	[NDFromT] [nvarchar](300) NULL,
	[NDTo] [int] NULL,
	[NDToT] [nvarchar](999) NULL,
	[EmpFrom] [nvarchar](100) NULL,
	[EmpFromT] [nvarchar](100) NULL,
	[EmpTo] [nvarchar](2000) NULL,
	[EmpToT] [nvarchar](2000) NULL,
	[RDT] [nvarchar](20) NULL,
	[WorkTimeSpan] [float] NULL,
	[Msg] [nvarchar](max) NULL,
	[NodeData] [nvarchar](max) NULL,
	[Tag] [nvarchar](300) NULL,
	[Exer] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_bbs]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_bbs](
	[No] [nvarchar](59) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Docs] [nvarchar](max) NULL,
	[BBSPRI] [int] NULL,
	[BBSType] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RecDeptNo] [nvarchar](100) NULL,
	[RelerName] [nvarchar](100) NULL,
	[RelDeptName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[NianYue] [nvarchar](10) NULL,
	[MyFileNum] [int] NULL,
	[BBSSta] [int] NULL,
	[ReadTimes] [int] NULL,
	[Reader] [nvarchar](max) NULL,
 CONSTRAINT [PK_oa_bbs_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_bbstype]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_bbstype](
	[No] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_oa_bbstype_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_info]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_info](
	[No] [nvarchar](59) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Docs] [nvarchar](max) NULL,
	[InfoPRI] [int] NULL,
	[InfoType] [nvarchar](100) NULL,
	[InfoSta] [int] NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RecDeptNo] [nvarchar](100) NULL,
	[RelerName] [nvarchar](100) NULL,
	[RelDeptName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[NianYue] [nvarchar](10) NULL,
	[ReadTimes] [int] NULL,
	[Reader] [nvarchar](max) NULL,
	[MyFileNum] [int] NULL,
 CONSTRAINT [PK_oa_info_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_infotype]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_infotype](
	[No] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_oa_infotype_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_kmdtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_kmdtl](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Docs] [nvarchar](max) NULL,
	[RefTreeNo] [nvarchar](50) NULL,
	[KnowledgeNo] [nvarchar](50) NULL,
	[Foucs] [nvarchar](max) NULL,
	[IsDel] [int] NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[Idx] [int] NULL,
	[MyFileNum] [int] NULL,
 CONSTRAINT [PK_oa_kmdtl_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_kmtree]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_kmtree](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ParentNo] [nvarchar](50) NULL,
	[KnowledgeNo] [nvarchar](50) NULL,
	[FileType] [int] NULL,
	[Idx] [int] NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[IsDel] [int] NULL,
 CONSTRAINT [PK_oa_kmtree_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_knowledge]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_knowledge](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ImgUrl] [nvarchar](500) NULL,
	[Title] [nvarchar](max) NULL,
	[Docs] [nvarchar](max) NULL,
	[KnowledgeSta] [int] NULL,
	[Emps] [nvarchar](max) NULL,
	[Foucs] [nvarchar](max) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_knowledge_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_notepad]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_notepad](
	[MyPK] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[Docs] [nvarchar](max) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[NianYue] [nvarchar](10) NULL,
	[IsStar] [int] NULL,
 CONSTRAINT [PK_oa_notepad_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_schedule]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_schedule](
	[MyPK] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[DTStart] [nvarchar](50) NULL,
	[DTEnd] [nvarchar](50) NULL,
	[TimeStart] [nvarchar](10) NULL,
	[TimeEnd] [nvarchar](10) NULL,
	[ChiXuTime] [nvarchar](10) NULL,
	[DTAlert] [nvarchar](50) NULL,
	[Repeats] [int] NULL,
	[Local] [nvarchar](300) NULL,
	[MiaoShu] [nvarchar](300) NULL,
	[NianYue] [nvarchar](10) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_schedule_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_task]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_task](
	[MyPK] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Docs] [nvarchar](max) NULL,
	[ParentNo] [nvarchar](50) NULL,
	[IsSubTask] [int] NULL,
	[TaskPRI] [int] NULL,
	[TaskSta] [int] NULL,
	[DTFrom] [nvarchar](50) NULL,
	[DTTo] [nvarchar](50) NULL,
	[ManagerEmpNo] [nvarchar](30) NULL,
	[ManagerEmpName] [nvarchar](40) NULL,
	[RefEmpsNo] [nvarchar](3000) NULL,
	[RefEmpsName] [nvarchar](3000) NULL,
	[RefLabelNo] [nvarchar](3000) NULL,
	[RefLabelName] [nvarchar](3000) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_task_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_workchecker]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_workchecker](
	[MyPK] [nvarchar](100) NOT NULL,
	[RefPK] [nvarchar](100) NULL,
	[Doc] [nvarchar](999) NULL,
	[Cent] [int] NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_workchecker_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_workrec]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_workrec](
	[MyPK] [nvarchar](100) NOT NULL,
	[WorkRecModel] [int] NULL,
	[Doc1] [nvarchar](999) NULL,
	[Doc2] [nvarchar](999) NULL,
	[Doc3] [nvarchar](999) NULL,
	[HeiJiHour] [real] NULL,
	[NumOfItem] [int] NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[RiQi] [nvarchar](50) NULL,
	[NianYue] [nvarchar](10) NULL,
	[NianDu] [nvarchar](10) NULL,
 CONSTRAINT [PK_oa_workrec_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_workrecdtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_workrecdtl](
	[MyPK] [nvarchar](100) NOT NULL,
	[RefPK] [nvarchar](40) NULL,
	[PrjName] [nvarchar](90) NULL,
	[Doc] [nvarchar](999) NULL,
	[Result] [nvarchar](999) NULL,
	[Hour] [int] NULL,
	[Minute] [int] NULL,
	[HeiJiHour] [real] NULL,
	[OrgNo] [nvarchar](100) NULL,
	[Rec] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[RiQi] [nvarchar](50) NULL,
	[NianYue] [nvarchar](10) NULL,
	[NianDu] [nvarchar](10) NULL,
	[WeekNum] [int] NULL,
 CONSTRAINT [PK_oa_workrecdtl_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_workshare]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_workshare](
	[MyPK] [nvarchar](100) NOT NULL,
	[EmpNo] [nvarchar](100) NULL,
	[EmpName] [nvarchar](100) NULL,
	[ShareToEmpNo] [nvarchar](100) NULL,
	[ShareToEmpName] [nvarchar](100) NULL,
	[ShareState] [int] NULL,
	[OrgNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_workshare_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_dept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_dept](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[NameOfPath] [nvarchar](100) NULL,
	[ParentNo] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Leader] [nvarchar](100) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_dept_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_deptemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_deptemp](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Dept] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[DeptName] [nvarchar](500) NULL,
	[StationNo] [nvarchar](500) NULL,
	[StationNoT] [nvarchar](500) NULL,
 CONSTRAINT [PK_port_deptemp_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_deptempstation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_deptempstation](
	[MyPK] [nvarchar](150) NOT NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[FK_Station] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_port_deptempstation_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_emp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_emp](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[PinYin] [nvarchar](200) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[Tel] [nvarchar](36) NULL,
	[Email] [nvarchar](36) NULL,
	[Leader] [nvarchar](20) NULL,
	[LeaderName] [nvarchar](20) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
	[Pass] [nvarchar](90) NULL,
	[OpenID] [nvarchar](100) NULL,
	[EmpSta] [int] NULL,
 CONSTRAINT [PK_port_emp_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_org]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_org](
	[No] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](60) NULL,
	[ParentNo] [nvarchar](60) NULL,
	[ParentName] [nvarchar](60) NULL,
	[Adminer] [nvarchar](60) NULL,
	[AdminerName] [nvarchar](60) NULL,
	[FlowNums] [int] NULL,
	[FrmNums] [int] NULL,
	[Users] [int] NULL,
	[Depts] [int] NULL,
	[GWFS] [int] NULL,
	[GWFSOver] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_org_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_orgadminer]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_orgadminer](
	[MyPK] [nvarchar](100) NOT NULL,
	[OrgNo] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](50) NULL,
	[EmpName] [nvarchar](50) NULL,
	[FlowSorts] [nvarchar](max) NULL,
	[FrmTrees] [nvarchar](max) NULL,
 CONSTRAINT [PK_port_orgadminer_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_orgadminerflowsort]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_orgadminerflowsort](
	[MyPK] [nvarchar](100) NOT NULL,
	[OrgNo] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](50) NULL,
	[RefOrgAdminer] [nvarchar](50) NULL,
	[FlowSortNo] [nvarchar](100) NULL,
 CONSTRAINT [PK_port_orgadminerflowsort_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_orgadminerfrmtree]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_orgadminerfrmtree](
	[MyPK] [nvarchar](100) NOT NULL,
	[OrgNo] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](50) NULL,
	[RefOrgAdminer] [nvarchar](50) NULL,
	[FrmTreeNo] [nvarchar](100) NULL,
 CONSTRAINT [PK_port_orgadminerfrmtree_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_station]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_station](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[FK_StationType] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_station_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_stationtype]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_stationtype](
	[No] [nvarchar](40) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_stationtype_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_team]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_team](
	[No] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[FK_TeamType] [nvarchar](100) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_team_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_teamemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_teamemp](
	[FK_Team] [nvarchar](50) NOT NULL,
	[FK_Emp] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_port_teamemp_FK_Team] PRIMARY KEY CLUSTERED 
(
	[FK_Team] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_teamtype]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_teamtype](
	[No] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_teamtype_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_token]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_token](
	[MyPK] [nvarchar](100) NOT NULL,
	[EmpNo] [nvarchar](100) NULL,
	[EmpName] [nvarchar](100) NULL,
	[DeptNo] [nvarchar](100) NULL,
	[DeptName] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[OrgName] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
	[SheBei] [int] NULL,
 CONSTRAINT [PK_port_token_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_user]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_user](
	[No] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Pass] [nvarchar](100) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[Token] [nvarchar](36) NULL,
	[Tel] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[PinYin] [nvarchar](1000) NULL,
	[OrgNo] [nvarchar](500) NULL,
	[OrgName] [nvarchar](500) NULL,
	[unionid] [nvarchar](500) NULL,
	[OpenID] [nvarchar](500) NULL,
	[OpenID2] [nvarchar](500) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_port_user_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pub_ny]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pub_ny](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_pub_ny_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_docfile]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_docfile](
	[MyPK] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](200) NULL,
	[FileSize] [int] NULL,
	[FileType] [nvarchar](50) NULL,
	[D1] [nvarchar](max) NULL,
	[D2] [nvarchar](max) NULL,
	[D3] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_docfile_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_encfg]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_encfg](
	[No] [nvarchar](100) NOT NULL,
	[UIRowStyleGlo] [int] NULL,
	[IsEnableDouclickGlo] [int] NULL,
	[IsEnableFocusField] [int] NULL,
	[FocusField] [nvarchar](30) NULL,
	[IsEnableRefFunc] [int] NULL,
	[IsEnableOpenICON] [int] NULL,
	[IsJM] [int] NULL,
	[IsSelectMore] [int] NULL,
	[MoveToShowWay] [int] NULL,
	[TableCol] [int] NULL,
	[IsShowIcon] [int] NULL,
	[KeyLabel] [nvarchar](30) NULL,
	[KeyPlaceholder] [nvarchar](300) NULL,
	[PageSize] [int] NULL,
	[FontSize] [int] NULL,
	[EditerType] [int] NULL,
	[IsCond] [int] NULL,
	[OrderBy] [nvarchar](100) NULL,
	[IsDeSc] [int] NULL,
	[FJSavePath] [nvarchar](100) NULL,
	[FJWebPath] [nvarchar](100) NULL,
	[Datan] [nvarchar](200) NULL,
	[UI] [nvarchar](2000) NULL,
	[ColorSet] [nvarchar](500) NULL,
	[FieldSet] [nvarchar](500) NULL,
	[ForamtFunc] [nvarchar](200) NULL,
	[Drill] [nvarchar](200) NULL,
	[MobileFieldShowModel] [int] NULL,
	[MobileShowContent] [nvarchar](500) NULL,
	[BtnsShowLeft] [int] NULL,
	[IsImp] [int] NULL,
	[ImpFuncUrl] [nvarchar](500) NULL,
	[IsExp] [int] NULL,
	[IsGroup] [int] NULL,
	[IsEnableLazyload] [int] NULL,
	[BtnLab1] [nvarchar](70) NULL,
	[BtnJS1] [nvarchar](300) NULL,
	[BtnLab2] [nvarchar](70) NULL,
	[BtnJS2] [nvarchar](300) NULL,
	[BtnLab3] [nvarchar](70) NULL,
	[BtnJS3] [nvarchar](300) NULL,
	[EnBtnLab1] [nvarchar](70) NULL,
	[EnBtnJS1] [nvarchar](300) NULL,
	[EnBtnLab2] [nvarchar](70) NULL,
	[EnBtnJS2] [nvarchar](300) NULL,
	[SearchUrlOpenType] [int] NULL,
	[IsRefreshParentPage] [int] NULL,
	[UrlExt] [nvarchar](500) NULL,
	[DoubleOrClickModel] [int] NULL,
	[OpenModel] [int] NULL,
	[OpenModelFunc] [nvarchar](300) NULL,
	[WinCardW] [int] NULL,
	[WinCardH] [int] NULL,
	[AtPara] [nvarchar](3000) NULL,
 CONSTRAINT [PK_sys_encfg_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_enum]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_enum](
	[MyPK] [nvarchar](100) NOT NULL,
	[Lab] [nvarchar](300) NULL,
	[EnumKey] [nvarchar](100) NULL,
	[IntKey] [int] NULL,
	[Lang] [nvarchar](10) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[StrKey] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_enum_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_enummain]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_enummain](
	[No] [nvarchar](40) NOT NULL,
	[Name] [nvarchar](40) NULL,
	[CfgVal] [nvarchar](1500) NULL,
	[Lang] [nvarchar](10) NULL,
	[EnumKey] [nvarchar](40) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[IsHaveDtl] [int] NULL,
	[AtPara] [nvarchar](200) NULL,
	[Idx0] [nvarchar](50) NULL,
	[Val0] [nvarchar](500) NULL,
	[Idx1] [nvarchar](50) NULL,
	[Val1] [nvarchar](500) NULL,
	[Idx2] [nvarchar](50) NULL,
	[Val2] [nvarchar](500) NULL,
	[Idx3] [nvarchar](50) NULL,
	[Val3] [nvarchar](500) NULL,
	[Idx4] [nvarchar](50) NULL,
	[Val4] [nvarchar](500) NULL,
	[Idx5] [nvarchar](50) NULL,
	[Val5] [nvarchar](500) NULL,
	[Idx6] [nvarchar](50) NULL,
	[Val6] [nvarchar](500) NULL,
	[Idx7] [nvarchar](50) NULL,
	[Val7] [nvarchar](500) NULL,
	[Idx8] [nvarchar](50) NULL,
	[Val8] [nvarchar](500) NULL,
	[Idx9] [nvarchar](50) NULL,
	[Val9] [nvarchar](500) NULL,
	[Idx10] [nvarchar](50) NULL,
	[Val10] [nvarchar](500) NULL,
	[Idx11] [nvarchar](50) NULL,
	[Val11] [nvarchar](500) NULL,
	[Idx12] [nvarchar](50) NULL,
	[Val12] [nvarchar](500) NULL,
	[Idx13] [nvarchar](50) NULL,
	[Val13] [nvarchar](500) NULL,
	[Idx14] [nvarchar](50) NULL,
	[Val14] [nvarchar](500) NULL,
	[Idx15] [nvarchar](50) NULL,
	[Val15] [nvarchar](500) NULL,
	[Idx16] [nvarchar](50) NULL,
	[Val16] [nvarchar](500) NULL,
	[Idx17] [nvarchar](50) NULL,
	[Val17] [nvarchar](500) NULL,
	[Idx18] [nvarchar](50) NULL,
	[Val18] [nvarchar](500) NULL,
	[Idx19] [nvarchar](50) NULL,
	[Val19] [nvarchar](500) NULL,
	[Idx20] [nvarchar](50) NULL,
	[Val20] [nvarchar](500) NULL,
	[Idx21] [nvarchar](50) NULL,
	[Val21] [nvarchar](500) NULL,
	[Idx22] [nvarchar](50) NULL,
	[Val22] [nvarchar](500) NULL,
	[Idx23] [nvarchar](50) NULL,
	[Val23] [nvarchar](500) NULL,
	[Idx24] [nvarchar](50) NULL,
	[Val24] [nvarchar](500) NULL,
	[Idx25] [nvarchar](50) NULL,
	[Val25] [nvarchar](500) NULL,
	[Idx26] [nvarchar](50) NULL,
	[Val26] [nvarchar](500) NULL,
	[Idx27] [nvarchar](50) NULL,
	[Val27] [nvarchar](500) NULL,
	[Idx28] [nvarchar](50) NULL,
	[Val28] [nvarchar](500) NULL,
	[Idx29] [nvarchar](50) NULL,
	[Val29] [nvarchar](500) NULL,
 CONSTRAINT [PK_sys_enummain_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_enver]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_enver](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[EnPKValue] [nvarchar](40) NULL,
	[EnVer] [int] NULL,
	[RecNo] [nvarchar](100) NULL,
	[RecName] [nvarchar](100) NULL,
	[MyNote] [nvarchar](100) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_sys_enver_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_enverdtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_enverdtl](
	[MyPK] [nvarchar](100) NOT NULL,
	[RefPK] [nvarchar](50) NULL,
	[FrmID] [nvarchar](200) NULL,
	[EnPKValue] [nvarchar](50) NULL,
	[AttrKey] [nvarchar](200) NULL,
	[AttrName] [nvarchar](200) NULL,
	[LGType] [int] NULL,
	[BindKey] [nvarchar](200) NULL,
	[MyVal] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_enverdtl_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_filemanager]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_filemanager](
	[OID] [int] NOT NULL,
	[AttrFileName] [nvarchar](50) NULL,
	[AttrFileNo] [nvarchar](50) NULL,
	[EnName] [nvarchar](50) NULL,
	[RefVal] [nvarchar](50) NULL,
	[WebPath] [nvarchar](100) NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [real] NULL,
	[RDT] [nvarchar](50) NULL,
	[Rec] [nvarchar](50) NULL,
	[Doc] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_filemanager_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_formtree]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_formtree](
	[No] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[ParentNo] [nvarchar](100) NULL,
	[Idx] [int] NULL,
	[OrgNo] [nvarchar](150) NULL,
	[ShortName] [nvarchar](200) NULL,
	[Domain] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_formtree_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmattachment]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmattachment](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[NoOfObj] [nvarchar](50) NULL,
	[FK_Node] [int] NULL,
	[AthRunModel] [int] NULL,
	[AthSaveWay] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Exts] [nvarchar](200) NULL,
	[NumOfUpload] [int] NULL,
	[TopNumOfUpload] [int] NULL,
	[FileMaxSize] [int] NULL,
	[UploadFileNumCheck] [int] NULL,
	[Sort] [nvarchar](500) NULL,
	[H] [real] NULL,
	[IsUpload] [int] NULL,
	[IsVisable] [int] NULL,
	[FileType] [int] NULL,
	[ReadRole] [int] NULL,
	[PicUploadType] [int] NULL,
	[DeleteWay] [int] NULL,
	[IsDownload] [int] NULL,
	[IsAutoSize] [int] NULL,
	[IsNote] [int] NULL,
	[IsExpCol] [int] NULL,
	[IsShowTitle] [int] NULL,
	[UploadType] [int] NULL,
	[IsIdx] [int] NULL,
	[CtrlWay] [int] NULL,
	[AthUploadWay] [int] NULL,
	[DataRefNoOfObj] [nvarchar](150) NULL,
	[AtPara] [nvarchar](3000) NULL,
	[GroupID] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[IsEnableTemplate] [int] NULL,
	[AthSingleRole] [int] NULL,
	[AthEditModel] [int] NULL,
	[IsToHeLiuHZ] [int] NULL,
	[IsHeLiuHuiZong] [int] NULL,
	[IsTurn2Html] [int] NULL,
	[MyFileNum] [int] NULL,
 CONSTRAINT [PK_sys_frmattachment_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmattachmentdb]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmattachmentdb](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[FK_FrmAttachment] [nvarchar](500) NULL,
	[NoOfObj] [nvarchar](50) NULL,
	[RefPKVal] [nvarchar](50) NULL,
	[FID] [int] NULL,
	[NodeID] [int] NULL,
	[Sort] [nvarchar](200) NULL,
	[FileFullName] [nvarchar](700) NULL,
	[FileName] [nvarchar](500) NULL,
	[FileExts] [nvarchar](50) NULL,
	[FileSize] [real] NULL,
	[RDT] [nvarchar](50) NULL,
	[Rec] [nvarchar](50) NULL,
	[RecName] [nvarchar](50) NULL,
	[FK_Dept] [nvarchar](50) NULL,
	[FK_DeptName] [nvarchar](50) NULL,
	[MyNote] [nvarchar](max) NULL,
	[IsRowLock] [int] NULL,
	[Idx] [int] NULL,
	[UploadGUID] [nvarchar](500) NULL,
	[AtPara] [nvarchar](3000) NULL,
 CONSTRAINT [PK_sys_frmattachmentdb_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmbtn]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmbtn](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[Lab] [nvarchar](max) NULL,
	[X] [real] NULL,
	[Y] [real] NULL,
	[IsView] [int] NULL,
	[IsEnable] [int] NULL,
	[UAC] [int] NULL,
	[UACContext] [nvarchar](max) NULL,
	[EventType] [int] NULL,
	[EventContext] [nvarchar](max) NULL,
	[MsgOK] [nvarchar](500) NULL,
	[MsgErr] [nvarchar](500) NULL,
	[BtnID] [nvarchar](128) NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_sys_frmbtn_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmdbremark]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmdbremark](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](100) NULL,
	[RefPKVal] [nvarchar](40) NULL,
	[Field] [nvarchar](60) NULL,
	[Remark] [nvarchar](500) NULL,
	[RecNo] [nvarchar](50) NULL,
	[RecName] [nvarchar](60) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_sys_frmdbremark_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmdbver]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmdbver](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](100) NULL,
	[RefPKVal] [nvarchar](40) NULL,
	[ChangeFields] [nvarchar](max) NULL,
	[ChangeNum] [int] NULL,
	[TrackID] [nvarchar](40) NULL,
	[RecNo] [nvarchar](30) NULL,
	[RecName] [nvarchar](30) NULL,
	[RDT] [nvarchar](50) NULL,
	[Ver] [int] NULL,
	[KeyOfEn] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_frmdbver_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmeledb]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmeledb](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[EleID] [nvarchar](50) NULL,
	[RefPKVal] [nvarchar](50) NULL,
	[FID] [int] NULL,
	[Tag1] [nvarchar](1000) NULL,
	[Tag2] [nvarchar](1000) NULL,
	[Tag3] [nvarchar](1000) NULL,
	[Tag4] [nvarchar](1000) NULL,
	[Tag5] [nvarchar](1000) NULL,
 CONSTRAINT [PK_sys_frmeledb_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmevent]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmevent](
	[MyPK] [nvarchar](100) NOT NULL,
	[EventSource] [int] NULL,
	[FK_Event] [nvarchar](400) NULL,
	[RefFlowNo] [nvarchar](10) NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[FK_Flow] [nvarchar](100) NULL,
	[FK_Node] [int] NULL,
	[EventDoType] [int] NULL,
	[FK_DBSrc] [nvarchar](100) NULL,
	[DoDoc] [nvarchar](400) NULL,
	[MsgOK] [nvarchar](400) NULL,
	[MsgError] [nvarchar](400) NULL,
	[MsgCtrl] [int] NULL,
	[MailEnable] [int] NULL,
	[MailTitle] [nvarchar](200) NULL,
	[MailDoc] [nvarchar](max) NULL,
	[SMSEnable] [int] NULL,
	[SMSDoc] [nvarchar](max) NULL,
	[MobilePushEnable] [int] NULL,
	[AtPara] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_frmevent_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmimg]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmimg](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](200) NULL,
	[KeyOfEn] [nvarchar](200) NULL,
	[ImgAppType] [int] NULL,
	[UIWidth] [real] NULL,
	[UIHeight] [real] NULL,
	[ImgURL] [nvarchar](200) NULL,
	[ImgPath] [nvarchar](200) NULL,
	[LinkURL] [nvarchar](200) NULL,
	[LinkTarget] [nvarchar](200) NULL,
	[GUID] [nvarchar](128) NULL,
	[Tag0] [nvarchar](500) NULL,
	[ImgSrcType] [int] NULL,
	[IsEdit] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[EnPK] [nvarchar](500) NULL,
	[ColSpan] [int] NULL,
	[LabelColSpan] [int] NULL,
	[RowSpan] [int] NULL,
	[GroupID] [int] NULL,
	[GroupIDText] [nvarchar](200) NULL,
 CONSTRAINT [PK_sys_frmimg_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmimgath]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmimgath](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[CtrlID] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[IsEdit] [int] NULL,
	[IsRequired] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[H] [numeric](11, 2) NULL,
	[W] [numeric](11, 2) NULL,
	[GroupID] [int] NULL,
	[GroupIDText] [nvarchar](200) NULL,
	[ColSpan] [int] NULL,
	[LabelColSpan] [int] NULL,
	[RowSpan] [int] NULL,
 CONSTRAINT [PK_sys_frmimgath_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmimgathdb]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmimgathdb](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[FK_FrmImgAth] [nvarchar](50) NULL,
	[RefPKVal] [nvarchar](50) NULL,
	[FileFullName] [nvarchar](700) NULL,
	[FileName] [nvarchar](500) NULL,
	[FileExts] [nvarchar](50) NULL,
	[FileSize] [real] NULL,
	[RDT] [nvarchar](50) NULL,
	[Rec] [nvarchar](50) NULL,
	[RecName] [nvarchar](50) NULL,
	[MyNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_frmimgathdb_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmprinttemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmprinttemplate](
	[MyPK] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[TempFilePath] [nvarchar](200) NULL,
	[NodeID] [int] NULL,
	[FlowNo] [nvarchar](200) NULL,
	[FrmID] [nvarchar](60) NULL,
	[TemplateFileModel] [int] NULL,
	[PrintFileType] [int] NULL,
	[PrintOpenModel] [int] NULL,
	[AthSaveWay] [int] NULL,
	[QRModel] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_sys_frmprinttemplate_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmrb]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmrb](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](200) NULL,
	[KeyOfEn] [nvarchar](200) NULL,
	[EnumKey] [nvarchar](30) NULL,
	[Lab] [nvarchar](500) NULL,
	[IntKey] [int] NULL,
	[UIIsEnable] [int] NULL,
	[Script] [nvarchar](max) NULL,
	[FieldsCfg] [nvarchar](max) NULL,
	[SetVal] [nvarchar](200) NULL,
	[Tip] [nvarchar](1000) NULL,
	[AtPara] [nvarchar](500) NULL,
 CONSTRAINT [PK_sys_frmrb_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_frmsln]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_frmsln](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[FK_Node] [int] NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[KeyOfEn] [nvarchar](200) NULL,
	[Name] [nvarchar](500) NULL,
	[EleType] [nvarchar](20) NULL,
	[UIIsEnable] [int] NULL,
	[UIVisible] [int] NULL,
	[IsSigan] [int] NULL,
	[IsNotNull] [int] NULL,
	[RegularExp] [nvarchar](500) NULL,
	[IsWriteToFlowTable] [int] NULL,
	[IsWriteToGenerWorkFlow] [int] NULL,
	[DefVal] [nvarchar](200) NULL,
 CONSTRAINT [PK_sys_frmsln_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_glovar]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_glovar](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](120) NULL,
	[Val] [nvarchar](max) NULL,
	[GroupKey] [nvarchar](120) NULL,
	[Note] [nvarchar](max) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_sys_glovar_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_groupenstemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_groupenstemplate](
	[OID] [int] NOT NULL,
	[EnName] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[EnsName] [nvarchar](90) NULL,
	[OperateCol] [nvarchar](90) NULL,
	[Attrs] [nvarchar](90) NULL,
	[Rec] [nvarchar](90) NULL,
 CONSTRAINT [PK_sys_groupenstemplate_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_groupfield]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_groupfield](
	[OID] [int] NOT NULL,
	[Lab] [nvarchar](500) NULL,
	[FrmID] [nvarchar](200) NULL,
	[CtrlType] [nvarchar](50) NULL,
	[CtrlID] [nvarchar](500) NULL,
	[IsZDMobile] [int] NULL,
	[ShowType] [int] NULL,
	[Idx] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[AtPara] [nvarchar](3000) NULL,
 CONSTRAINT [PK_sys_groupfield_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapattr]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapattr](
	[MyPK] [nvarchar](200) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[KeyOfEn] [nvarchar](200) NULL,
	[Name] [nvarchar](500) NULL,
	[DefVal] [nvarchar](max) NULL,
	[DefValType] [int] NULL,
	[UIContralType] [int] NULL,
	[MyDataType] [int] NULL,
	[LGType] [int] NULL,
	[UIWidth] [real] NULL,
	[UIHeight] [real] NULL,
	[MinLen] [int] NULL,
	[MaxLen] [int] NULL,
	[UIBindKey] [nvarchar](100) NULL,
	[UIRefKey] [nvarchar](30) NULL,
	[UIRefKeyText] [nvarchar](30) NULL,
	[ExtIsSum] [int] NULL,
	[UIVisible] [int] NULL,
	[UIIsEnable] [int] NULL,
	[UIIsLine] [int] NULL,
	[UIIsInput] [int] NULL,
	[TextModel] [int] NULL,
	[IsSupperText] [int] NULL,
	[FontSize] [int] NULL,
	[IsSigan] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[EditType] [int] NULL,
	[Tag] [nvarchar](max) NULL,
	[Tag1] [nvarchar](100) NULL,
	[Tag2] [nvarchar](500) NULL,
	[Tag3] [nvarchar](100) NULL,
	[Tip] [nvarchar](max) NULL,
	[ColSpan] [int] NULL,
	[LabelColSpan] [int] NULL,
	[RowSpan] [int] NULL,
	[GroupID] [nvarchar](50) NULL,
	[IsEnableInAPP] [int] NULL,
	[CSSCtrl] [nvarchar](50) NULL,
	[CSSLabel] [nvarchar](50) NULL,
	[Idx] [int] NULL,
	[ICON] [nvarchar](50) NULL,
	[AtPara] [nvarchar](max) NULL,
	[GroupIDText] [nvarchar](200) NULL,
	[CSSCtrlText] [nvarchar](200) NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[WebPath] [nvarchar](300) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [numeric](11, 2) NULL,
	[ExtDefVal] [nvarchar](50) NULL,
	[ExtDefValText] [nvarchar](200) NULL,
	[CSSLabelText] [nvarchar](200) NULL,
	[DefValText] [nvarchar](200) NULL,
	[RBShowModel] [int] NULL,
	[NumMin] [nvarchar](400) NULL,
	[NumMax] [nvarchar](400) NULL,
	[NumStepLength] [numeric](11, 2) NULL,
 CONSTRAINT [PK_sys_mapattr_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapdata]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapdata](
	[No] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[FormEventEntity] [nvarchar](100) NULL,
	[EnPK] [nvarchar](200) NULL,
	[PTable] [nvarchar](500) NULL,
	[PTableModel] [int] NULL,
	[UrlExt] [nvarchar](500) NULL,
	[Dtls] [nvarchar](500) NULL,
	[FrmW] [int] NULL,
	[TableCol] [int] NULL,
	[Tag] [nvarchar](500) NULL,
	[FK_FormTree] [nvarchar](500) NULL,
	[FrmType] [int] NULL,
	[FrmShowType] [int] NULL,
	[EntityType] [int] NULL,
	[IsEnableJs] [int] NULL,
	[AppType] [int] NULL,
	[DBSrc] [nvarchar](600) NULL,
	[BodyAttr] [nvarchar](100) NULL,
	[Note] [nvarchar](max) NULL,
	[Designer] [nvarchar](500) NULL,
	[DesignerUnit] [nvarchar](500) NULL,
	[DesignerContact] [nvarchar](500) NULL,
	[Idx] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[Ver] [nvarchar](30) NULL,
	[Icon] [nvarchar](500) NULL,
	[FlowCtrls] [nvarchar](200) NULL,
	[AtPara] [nvarchar](max) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[IsTemplate] [int] NULL,
	[DBType] [int] NULL,
	[ExpEn] [nvarchar](600) NULL,
	[ExpList] [nvarchar](600) NULL,
	[MainTable] [nvarchar](50) NULL,
	[MainTablePK] [nvarchar](50) NULL,
	[ExpCount] [nvarchar](600) NULL,
	[RowOpenModel] [int] NULL,
	[SearchDictOpenType] [int] NULL,
	[PopHeight] [int] NULL,
	[PopWidth] [int] NULL,
	[EntityEditModel] [int] NULL,
	[BillNoFormat] [nvarchar](100) NULL,
	[SortColumns] [nvarchar](100) NULL,
	[ColorSet] [nvarchar](100) NULL,
	[FieldSet] [nvarchar](100) NULL,
	[ForamtFunc] [nvarchar](200) NULL,
	[IsSelectMore] [int] NULL,
	[TitleRole] [nvarchar](100) NULL,
	[RowColorSet] [nvarchar](100) NULL,
	[RefDict] [nvarchar](190) NULL,
	[BtnRefBill] [nvarchar](50) NULL,
	[RefBillRole] [int] NULL,
	[RefBill] [nvarchar](100) NULL,
	[Tag0] [nvarchar](500) NULL,
	[Tag1] [nvarchar](max) NULL,
	[Tag2] [nvarchar](500) NULL,
	[EntityShowModel] [int] NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[DBURL] [int] NULL,
	[URL] [nvarchar](50) NULL,
	[TemplaterVer] [nvarchar](30) NULL,
	[DBSave] [nvarchar](50) NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[WebPath] [nvarchar](300) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [numeric](11, 2) NULL,
	[RefWorkModel] [int] NULL,
	[RefBlurField] [nvarchar](500) NULL,
	[RefUrl] [nvarchar](500) NULL,
	[RefHtml] [nvarchar](max) NULL,
	[RightViewWay] [int] NULL,
	[RightViewTag] [nvarchar](max) NULL,
	[RightDeptWay] [int] NULL,
	[RightDeptTag] [nvarchar](max) NULL,
	[HtmlTemplateFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_mapdata_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapdataver]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapdataver](
	[MyPK] [nvarchar](100) NOT NULL,
	[Ver] [int] NULL,
	[IsRel] [int] NULL,
	[RowNumExt] [int] NULL,
	[FrmID] [nvarchar](50) NULL,
	[AttrsNum] [int] NULL,
	[DtlsNum] [int] NULL,
	[AthsNum] [int] NULL,
	[ExtsNum] [int] NULL,
	[Rec] [nvarchar](50) NULL,
	[RecName] [nvarchar](50) NULL,
	[RecNote] [nvarchar](500) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_sys_mapdataver_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapdtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapdtl](
	[No] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Alias] [nvarchar](200) NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[PTable] [nvarchar](200) NULL,
	[GroupField] [nvarchar](300) NULL,
	[RefPK] [nvarchar](100) NULL,
	[FEBD] [nvarchar](100) NULL,
	[Model] [int] NULL,
	[DtlVer] [int] NULL,
	[RowsOfList] [int] NULL,
	[IsEnableGroupField] [int] NULL,
	[IsShowSum] [int] NULL,
	[IsShowIdx] [int] NULL,
	[IsCopyNDData] [int] NULL,
	[IsHLDtl] [int] NULL,
	[IsReadonly] [int] NULL,
	[IsShowTitle] [int] NULL,
	[IsView] [int] NULL,
	[IsInsert] [int] NULL,
	[IsDelete] [int] NULL,
	[IsUpdate] [int] NULL,
	[IsEnablePass] [int] NULL,
	[IsEnableAthM] [int] NULL,
	[IsCopyFirstData] [int] NULL,
	[InitDBAttrs] [nvarchar](40) NULL,
	[WhenOverSize] [int] NULL,
	[DtlOpenType] [int] NULL,
	[ListShowModel] [int] NULL,
	[EditModel] [int] NULL,
	[UrlDtl] [nvarchar](200) NULL,
	[ColAutoExp] [nvarchar](200) NULL,
	[MobileShowModel] [int] NULL,
	[MobileShowField] [nvarchar](100) NULL,
	[H] [real] NULL,
	[FrmW] [real] NULL,
	[FrmH] [real] NULL,
	[NumOfDtl] [int] NULL,
	[IsEnableLink] [int] NULL,
	[LinkLabel] [nvarchar](50) NULL,
	[LinkTarget] [nvarchar](10) NULL,
	[LinkUrl] [nvarchar](200) NULL,
	[FilterSQLExp] [nvarchar](200) NULL,
	[OrderBySQLExp] [nvarchar](200) NULL,
	[FK_Node] [int] NULL,
	[ShowCols] [nvarchar](500) NULL,
	[IsExp] [int] NULL,
	[ImpModel] [int] NULL,
	[ImpSQLSearch] [nvarchar](max) NULL,
	[ImpSQLInit] [nvarchar](max) NULL,
	[ImpSQLFullOneRow] [nvarchar](max) NULL,
	[ImpSQLNames] [nvarchar](900) NULL,
	[IsImp] [int] NULL,
	[GUID] [nvarchar](128) NULL,
	[AtPara] [nvarchar](300) NULL,
	[ExcType] [int] NULL,
	[IsEnableLink2] [int] NULL,
	[LinkLabel2] [nvarchar](50) NULL,
	[ExcType2] [int] NULL,
	[LinkTarget2] [nvarchar](10) NULL,
	[LinkUrl2] [nvarchar](200) NULL,
	[SubThreadWorker] [nvarchar](50) NULL,
	[SubThreadWorkerText] [nvarchar](200) NULL,
 CONSTRAINT [PK_sys_mapdtl_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapext]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapext](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[ExtModel] [nvarchar](30) NULL,
	[ExtType] [nvarchar](30) NULL,
	[DoWay] [nvarchar](50) NULL,
	[AttrOfOper] [nvarchar](30) NULL,
	[AttrsOfActive] [nvarchar](900) NULL,
	[Doc] [nvarchar](max) NULL,
	[Tag] [nvarchar](2000) NULL,
	[Tag1] [nvarchar](2000) NULL,
	[Tag2] [nvarchar](2000) NULL,
	[Tag3] [nvarchar](2000) NULL,
	[Tag4] [nvarchar](2000) NULL,
	[Tag5] [nvarchar](2000) NULL,
	[H] [int] NULL,
	[W] [int] NULL,
	[DBType] [int] NULL,
	[FK_DBSrc] [nvarchar](100) NULL,
	[PRI] [int] NULL,
	[AtPara] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_mapext_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_mapframe]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mapframe](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[Name] [nvarchar](200) NULL,
	[UrlSrcType] [int] NULL,
	[FrameURL] [nvarchar](3000) NULL,
	[URL] [nvarchar](3000) NULL,
	[W] [nvarchar](20) NULL,
	[H] [nvarchar](20) NULL,
	[IsAutoSize] [int] NULL,
	[EleType] [nvarchar](50) NULL,
	[GUID] [nvarchar](128) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_sys_mapframe_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_rptdept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rptdept](
	[FK_Rpt] [nvarchar](15) NOT NULL,
	[FK_Dept] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_sys_rptdept_FK_Rpt] PRIMARY KEY CLUSTERED 
(
	[FK_Rpt] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_rptemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rptemp](
	[FK_Rpt] [nvarchar](15) NOT NULL,
	[FK_Emp] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_sys_rptemp_FK_Rpt] PRIMARY KEY CLUSTERED 
(
	[FK_Rpt] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_rptstation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rptstation](
	[FK_Rpt] [nvarchar](15) NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_sys_rptstation_FK_Rpt] PRIMARY KEY CLUSTERED 
(
	[FK_Rpt] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_rpttemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rpttemplate](
	[MyPK] [nvarchar](100) NOT NULL,
	[EnsName] [nvarchar](500) NULL,
	[FK_Emp] [nvarchar](20) NULL,
	[D1] [nvarchar](90) NULL,
	[D2] [nvarchar](90) NULL,
	[D3] [nvarchar](90) NULL,
	[AlObjs] [nvarchar](90) NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
	[IsSumBig] [int] NULL,
	[IsSumLittle] [int] NULL,
	[IsSumRight] [int] NULL,
	[PercentModel] [int] NULL,
 CONSTRAINT [PK_sys_rpttemplate_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_serial]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_serial](
	[CfgKey] [nvarchar](100) NOT NULL,
	[IntVal] [int] NULL,
 CONSTRAINT [PK_sys_serial_CfgKey] PRIMARY KEY CLUSTERED 
(
	[CfgKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_sfdbsrc]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sfdbsrc](
	[No] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[DBSrcType] [nvarchar](50) NULL,
	[DBSrcTypeT] [nvarchar](200) NULL,
	[DBName] [nvarchar](30) NULL,
	[ConnString] [nvarchar](200) NULL,
	[AtPara] [nvarchar](200) NULL,
 CONSTRAINT [PK_sys_sfdbsrc_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_sftable]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sftable](
	[No] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[NoGenerModel] [int] NULL,
	[CodeStruct] [int] NULL,
	[SrcType] [int] NULL,
	[FK_Val] [nvarchar](200) NULL,
	[TableDesc] [nvarchar](200) NULL,
	[DefVal] [nvarchar](200) NULL,
	[FK_SFDBSrc] [nvarchar](100) NULL,
	[ParentValue] [nvarchar](200) NULL,
	[SelectStatement] [nvarchar](max) NULL,
	[RDT] [nvarchar](50) NULL,
	[RootVal] [nvarchar](200) NULL,
	[SrcTable] [nvarchar](200) NULL,
	[ColumnValue] [nvarchar](200) NULL,
	[ColumnText] [nvarchar](200) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[AtPara] [nvarchar](50) NULL,
	[BH0] [nvarchar](3) NULL,
	[Name0] [nvarchar](50) NULL,
	[BH1] [nvarchar](3) NULL,
	[Name1] [nvarchar](50) NULL,
	[BH2] [nvarchar](3) NULL,
	[Name2] [nvarchar](50) NULL,
	[BH3] [nvarchar](3) NULL,
	[Name3] [nvarchar](50) NULL,
	[BH4] [nvarchar](3) NULL,
	[Name4] [nvarchar](50) NULL,
	[BH5] [nvarchar](3) NULL,
	[Name5] [nvarchar](50) NULL,
	[BH6] [nvarchar](3) NULL,
	[Name6] [nvarchar](50) NULL,
	[BH7] [nvarchar](3) NULL,
	[Name7] [nvarchar](50) NULL,
	[BH8] [nvarchar](3) NULL,
	[Name8] [nvarchar](50) NULL,
	[BH9] [nvarchar](3) NULL,
	[Name9] [nvarchar](50) NULL,
	[BH10] [nvarchar](3) NULL,
	[Name10] [nvarchar](50) NULL,
	[BH11] [nvarchar](3) NULL,
	[Name11] [nvarchar](50) NULL,
	[BH12] [nvarchar](3) NULL,
	[Name12] [nvarchar](50) NULL,
	[BH13] [nvarchar](3) NULL,
	[Name13] [nvarchar](50) NULL,
	[BH14] [nvarchar](3) NULL,
	[Name14] [nvarchar](50) NULL,
	[BH15] [nvarchar](3) NULL,
	[Name15] [nvarchar](50) NULL,
	[BH16] [nvarchar](3) NULL,
	[Name16] [nvarchar](50) NULL,
	[BH17] [nvarchar](3) NULL,
	[Name17] [nvarchar](50) NULL,
	[BH18] [nvarchar](3) NULL,
	[Name18] [nvarchar](50) NULL,
	[BH19] [nvarchar](3) NULL,
	[Name19] [nvarchar](50) NULL,
	[BH20] [nvarchar](3) NULL,
	[Name20] [nvarchar](50) NULL,
	[BH21] [nvarchar](3) NULL,
	[Name21] [nvarchar](50) NULL,
	[BH22] [nvarchar](3) NULL,
	[Name22] [nvarchar](50) NULL,
	[BH23] [nvarchar](3) NULL,
	[Name23] [nvarchar](50) NULL,
	[BH24] [nvarchar](3) NULL,
	[Name24] [nvarchar](50) NULL,
	[BH25] [nvarchar](3) NULL,
	[Name25] [nvarchar](50) NULL,
	[BH26] [nvarchar](3) NULL,
	[Name26] [nvarchar](50) NULL,
	[BH27] [nvarchar](3) NULL,
	[Name27] [nvarchar](50) NULL,
	[BH28] [nvarchar](3) NULL,
	[Name28] [nvarchar](50) NULL,
	[BH29] [nvarchar](3) NULL,
	[Name29] [nvarchar](50) NULL,
	[BH30] [nvarchar](3) NULL,
	[Name30] [nvarchar](50) NULL,
	[BH31] [nvarchar](3) NULL,
	[Name31] [nvarchar](50) NULL,
	[BH32] [nvarchar](3) NULL,
	[Name32] [nvarchar](50) NULL,
	[BH33] [nvarchar](3) NULL,
	[Name33] [nvarchar](50) NULL,
	[BH34] [nvarchar](3) NULL,
	[Name34] [nvarchar](50) NULL,
	[BH35] [nvarchar](3) NULL,
	[Name35] [nvarchar](50) NULL,
	[BH36] [nvarchar](3) NULL,
	[Name36] [nvarchar](50) NULL,
	[BH37] [nvarchar](3) NULL,
	[Name37] [nvarchar](50) NULL,
	[BH38] [nvarchar](3) NULL,
	[Name38] [nvarchar](50) NULL,
	[BH39] [nvarchar](3) NULL,
	[Name39] [nvarchar](50) NULL,
	[BH40] [nvarchar](3) NULL,
	[Name40] [nvarchar](50) NULL,
	[BH41] [nvarchar](3) NULL,
	[Name41] [nvarchar](50) NULL,
	[BH42] [nvarchar](3) NULL,
	[Name42] [nvarchar](50) NULL,
	[BH43] [nvarchar](3) NULL,
	[Name43] [nvarchar](50) NULL,
	[BH44] [nvarchar](3) NULL,
	[Name44] [nvarchar](50) NULL,
	[BH45] [nvarchar](3) NULL,
	[Name45] [nvarchar](50) NULL,
	[BH46] [nvarchar](3) NULL,
	[Name46] [nvarchar](50) NULL,
	[BH47] [nvarchar](3) NULL,
	[Name47] [nvarchar](50) NULL,
	[BH48] [nvarchar](3) NULL,
	[Name48] [nvarchar](50) NULL,
	[BH49] [nvarchar](3) NULL,
	[Name49] [nvarchar](50) NULL,
 CONSTRAINT [PK_sys_sftable_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_sftabledtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sftabledtl](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_SFTable] [nvarchar](200) NULL,
	[BH] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[ParentNo] [nvarchar](200) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_sys_sftabledtl_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_sms]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sms](
	[MyPK] [nvarchar](100) NOT NULL,
	[Sender] [nvarchar](200) NULL,
	[SendTo] [nvarchar](200) NULL,
	[RDT] [nvarchar](50) NULL,
	[Mobile] [nvarchar](30) NULL,
	[MobileSta] [int] NULL,
	[MobileInfo] [nvarchar](1000) NULL,
	[Email] [nvarchar](200) NULL,
	[EmailSta] [int] NULL,
	[EmailTitle] [nvarchar](3000) NULL,
	[EmailDoc] [nvarchar](max) NULL,
	[SendDT] [nvarchar](50) NULL,
	[IsRead] [int] NULL,
	[IsAlert] [int] NULL,
	[WorkID] [int] NULL,
	[MsgFlag] [nvarchar](200) NULL,
	[MsgType] [nvarchar](200) NULL,
	[AtPara] [nvarchar](500) NULL,
 CONSTRAINT [PK_sys_sms_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_userloglevel]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_userloglevel](
	[No] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_userloglevel_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_userlogt]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_userlogt](
	[MyPK] [nvarchar](100) NOT NULL,
	[EmpNo] [nvarchar](30) NULL,
	[EmpName] [nvarchar](30) NULL,
	[RDT] [nvarchar](20) NULL,
	[IP] [nvarchar](200) NULL,
	[Docs] [nvarchar](max) NULL,
	[LogFlag] [nvarchar](100) NULL,
	[Level] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_userlogt_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_userlogtype]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_userlogtype](
	[No] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_userlogtype_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_userregedit]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_userregedit](
	[MyPK] [nvarchar](100) NOT NULL,
	[CfgKey] [nvarchar](200) NULL,
	[EnsName] [nvarchar](100) NULL,
	[AttrKey] [nvarchar](100) NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[Vals] [nvarchar](2000) NULL,
	[Attrs] [nvarchar](max) NULL,
	[FK_MapData] [nvarchar](100) NULL,
	[LB] [int] NULL,
	[CurValue] [nvarchar](max) NULL,
	[GenerSQL] [nvarchar](2000) NULL,
	[Paras] [nvarchar](2000) NULL,
	[NumKey] [nvarchar](300) NULL,
	[OrderBy] [nvarchar](300) NULL,
	[OrderWay] [nvarchar](300) NULL,
	[SearchKey] [nvarchar](300) NULL,
	[MVals] [nvarchar](2000) NULL,
	[IsPic] [int] NULL,
	[DTFrom] [nvarchar](20) NULL,
	[DTTo] [nvarchar](20) NULL,
	[OrgNo] [nvarchar](32) NULL,
	[AtPara] [nvarchar](max) NULL,
	[BigDocs] [nvarchar](max) NULL,
 CONSTRAINT [PK_sys_userregedit_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_accepterrole]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_accepterrole](
	[OID] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[FK_Node] [nvarchar](100) NULL,
	[FK_Mode] [int] NULL,
	[Tag0] [nvarchar](999) NULL,
	[Tag1] [nvarchar](999) NULL,
	[Tag2] [nvarchar](999) NULL,
	[Tag3] [nvarchar](999) NULL,
	[Tag4] [nvarchar](999) NULL,
	[Tag5] [nvarchar](999) NULL,
 CONSTRAINT [PK_wf_accepterrole_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_auth]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_auth](
	[MyPK] [nvarchar](100) NOT NULL,
	[Auther] [nvarchar](100) NULL,
	[AuthType] [int] NULL,
	[AutherToEmpNo] [nvarchar](100) NULL,
	[AutherToEmpName] [nvarchar](100) NULL,
	[FlowNo] [nvarchar](100) NULL,
	[FlowName] [nvarchar](100) NULL,
	[TakeBackDT] [nvarchar](50) NULL,
	[RDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_wf_auth_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_autorpt]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_autorpt](
	[No] [nvarchar](2) NOT NULL,
	[DTOfExe] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[StartDT] [nvarchar](200) NULL,
	[ToEmpOfSQLs] [nvarchar](500) NULL,
	[Dots] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_autorpt_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_autorptdtl]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_autorptdtl](
	[OID] [int] NOT NULL,
	[Name] [nvarchar](300) NULL,
	[SQLExp] [nvarchar](300) NULL,
	[UrlExp] [nvarchar](300) NULL,
	[BeiZhu] [nvarchar](500) NULL,
	[AutoRptNo] [nvarchar](20) NULL,
 CONSTRAINT [PK_wf_autorptdtl_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_ccdept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_ccdept](
	[FK_Node] [int] NOT NULL,
	[FK_Dept] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_ccdept_FK_Node] PRIMARY KEY CLUSTERED 
(
	[FK_Node] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_ccemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_ccemp](
	[FK_Node] [int] NOT NULL,
	[FK_Emp] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_ccemp_FK_Node] PRIMARY KEY CLUSTERED 
(
	[FK_Node] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_cclist]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_cclist](
	[MyPK] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Doc] [nvarchar](max) NULL,
	[Sta] [int] NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FlowName] [nvarchar](200) NULL,
	[FK_Node] [int] NULL,
	[NodeName] [nvarchar](500) NULL,
	[WorkID] [int] NULL,
	[FID] [int] NULL,
	[Rec] [nvarchar](50) NULL,
	[RDT] [nvarchar](50) NULL,
	[CCTo] [nvarchar](50) NULL,
	[CCToName] [nvarchar](50) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[CDT] [nvarchar](50) NULL,
	[ReadDT] [nvarchar](50) NULL,
	[PFlowNo] [nvarchar](100) NULL,
	[PWorkID] [int] NULL,
	[InEmpWorks] [int] NULL,
	[Domain] [nvarchar](50) NULL,
 CONSTRAINT [PK_wf_cclist_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_ccrole]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_ccrole](
	[MyPK] [nvarchar](100) NOT NULL,
	[NodeID] [int] NULL,
	[FlowNo] [nvarchar](10) NULL,
	[CCRoleExcType] [int] NULL,
	[Tag1] [nvarchar](max) NULL,
	[Tag2] [nvarchar](max) NULL,
	[CCStaWay] [int] NULL,
	[AtPara] [nvarchar](300) NULL,
 CONSTRAINT [PK_wf_ccrole_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_ccstation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_ccstation](
	[FK_Node] [int] NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_ccstation_FK_Node] PRIMARY KEY CLUSTERED 
(
	[FK_Node] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_ch]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_ch](
	[MyPK] [nvarchar](100) NOT NULL,
	[WorkID] [int] NULL,
	[FID] [int] NULL,
	[Title] [nvarchar](900) NULL,
	[FK_Flow] [nvarchar](900) NULL,
	[FK_FlowT] [nvarchar](900) NULL,
	[FK_Node] [int] NULL,
	[FK_NodeT] [nvarchar](200) NULL,
	[Sender] [nvarchar](200) NULL,
	[SenderT] [nvarchar](200) NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[FK_EmpT] [nvarchar](900) NULL,
	[GroupEmps] [nvarchar](400) NULL,
	[GroupEmpsNames] [nvarchar](900) NULL,
	[GroupEmpsNum] [int] NULL,
	[DTFrom] [nvarchar](50) NULL,
	[DTTo] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[FK_DeptT] [nvarchar](900) NULL,
	[FK_NY] [nvarchar](50) NULL,
	[DTSWay] [int] NULL,
	[TimeLimit] [nvarchar](50) NULL,
	[OverMinutes] [real] NULL,
	[UseDays] [real] NULL,
	[OverDays] [real] NULL,
	[CHSta] [int] NULL,
	[WeekNum] [int] NULL,
	[Points] [real] NULL,
	[OrgNo] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_ch_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_cheval]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_cheval](
	[MyPK] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[FlowName] [nvarchar](100) NULL,
	[WorkID] [int] NULL,
	[FK_Node] [int] NULL,
	[NodeName] [nvarchar](100) NULL,
	[Rec] [nvarchar](50) NULL,
	[RecName] [nvarchar](50) NULL,
	[RDT] [nvarchar](50) NULL,
	[EvalEmpNo] [nvarchar](50) NULL,
	[EvalEmpName] [nvarchar](50) NULL,
	[EvalCent] [nvarchar](20) NULL,
	[EvalNote] [nvarchar](20) NULL,
	[FK_Dept] [nvarchar](50) NULL,
	[DeptName] [nvarchar](100) NULL,
	[FK_NY] [nvarchar](7) NULL,
 CONSTRAINT [PK_wf_cheval_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_chnode]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_chnode](
	[WorkID] [int] NULL,
	[FK_Node] [int] NULL,
	[NodeName] [nvarchar](50) NULL,
	[FK_Emp] [nvarchar](30) NULL,
	[FK_EmpT] [nvarchar](200) NULL,
	[StartDT] [nvarchar](50) NULL,
	[EndDT] [nvarchar](50) NULL,
	[GT] [int] NULL,
	[Scale] [real] NULL,
	[TotalScale] [real] NULL,
	[ChanZhi] [real] NULL,
	[AtPara] [nvarchar](500) NULL,
	[MyPK] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_wf_chnode_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_cond]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_cond](
	[MyPK] [nvarchar](100) NOT NULL,
	[RefPKVal] [nvarchar](40) NULL,
	[RefFlowNo] [nvarchar](5) NULL,
	[FK_Node] [int] NULL,
	[CondType] [int] NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[SubFlowNo] [nvarchar](5) NULL,
	[ToNodeID] [int] NULL,
	[DataFrom] [int] NULL,
	[DataFromText] [nvarchar](4) NULL,
	[FK_Attr] [nvarchar](80) NULL,
	[AttrKey] [nvarchar](60) NULL,
	[AttrName] [nvarchar](500) NULL,
	[FK_Operator] [nvarchar](60) NULL,
	[OperatorValue] [nvarchar](max) NULL,
	[OperatorValueT] [nvarchar](max) NULL,
	[Note] [nvarchar](500) NULL,
	[FK_DBSrc] [nvarchar](50) NULL,
	[AtPara] [nvarchar](2000) NULL,
	[Idx] [int] NULL,
	[Tag1] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_cond_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_deptflowsearch]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_deptflowsearch](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Emp] [nvarchar](50) NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[FK_Dept] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_deptflowsearch_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_direction]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_direction](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[Node] [int] NULL,
	[ToNode] [int] NULL,
	[ToNodeName] [nvarchar](300) NULL,
	[GateWay] [int] NULL,
	[Des] [nvarchar](100) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_wf_direction_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_directionstation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_directionstation](
	[FK_Direction] [int] NOT NULL,
	[FK_Station] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_directionstation_FK_Direction] PRIMARY KEY CLUSTERED 
(
	[FK_Direction] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_doctemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_doctemplate](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[FilePath] [nvarchar](200) NULL,
	[FK_Node] [int] NULL,
	[FK_Flow] [nvarchar](4) NULL,
 CONSTRAINT [PK_wf_doctemplate_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_emp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_emp](
	[No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UseSta] [int] NULL,
	[Tel] [nvarchar](50) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Stas] [nvarchar](3000) NULL,
	[Depts] [nvarchar](100) NULL,
	[Msg] [nvarchar](max) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[SPass] [nvarchar](200) NULL,
	[Author] [nvarchar](50) NULL,
	[AuthorDate] [nvarchar](20) NULL,
	[AtPara] [nvarchar](max) NULL,
	[StartFlows] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_emp_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_findworkerrole]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_findworkerrole](
	[OID] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[FK_Node] [int] NULL,
	[SortVal0] [nvarchar](200) NULL,
	[SortText0] [nvarchar](200) NULL,
	[SortVal1] [nvarchar](200) NULL,
	[SortText1] [nvarchar](200) NULL,
	[SortVal2] [nvarchar](200) NULL,
	[SortText2] [nvarchar](200) NULL,
	[SortVal3] [nvarchar](200) NULL,
	[SortText3] [nvarchar](200) NULL,
	[TagVal0] [nvarchar](1000) NULL,
	[TagVal1] [nvarchar](1000) NULL,
	[TagVal2] [nvarchar](1000) NULL,
	[TagVal3] [nvarchar](1000) NULL,
	[TagText0] [nvarchar](1000) NULL,
	[TagText1] [nvarchar](1000) NULL,
	[TagText2] [nvarchar](1000) NULL,
	[TagText3] [nvarchar](1000) NULL,
	[IsEnable] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_wf_findworkerrole_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_flow]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_flow](
	[No] [nvarchar](200) NOT NULL,
	[FK_FlowSort] [nvarchar](100) NULL,
	[Name] [nvarchar](500) NULL,
	[FlowMark] [nvarchar](150) NULL,
	[FlowEventEntity] [nvarchar](150) NULL,
	[TitleRole] [nvarchar](150) NULL,
	[TitleRoleNodes] [nvarchar](300) NULL,
	[IsCanStart] [int] NULL,
	[IsFullSA] [int] NULL,
	[GuestFlowRole] [int] NULL,
	[Draft] [int] NULL,
	[SysType] [nvarchar](50) NULL,
	[Tester] [nvarchar](100) NULL,
	[ChartType] [int] NULL,
	[CreateDate] [nvarchar](50) NULL,
	[Creater] [nvarchar](150) NULL,
	[IsBatchStart] [int] NULL,
	[BatchStartFields] [nvarchar](200) NULL,
	[IsResetData] [int] NULL,
	[IsLoadPriData] [int] NULL,
	[IsDBTemplate] [int] NULL,
	[IsStartInMobile] [int] NULL,
	[IsMD5] [int] NULL,
	[IsJM] [int] NULL,
	[IsEnableDBVer] [int] NULL,
	[PTable] [nvarchar](100) NULL,
	[BillNoFormat] [nvarchar](50) NULL,
	[BuessFields] [nvarchar](100) NULL,
	[AdvEmps] [nvarchar](100) NULL,
	[IsFrmEnable] [int] NULL,
	[IsTruckEnable] [int] NULL,
	[IsTimeBaseEnable] [int] NULL,
	[IsTableEnable] [int] NULL,
	[IsOPEnable] [int] NULL,
	[SubFlowShowType] [int] NULL,
	[TrackOrderBy] [int] NULL,
	[FlowRunWay] [int] NULL,
	[WorkModel] [int] NULL,
	[RunObj] [nvarchar](500) NULL,
	[Note] [nvarchar](300) NULL,
	[RunSQL] [nvarchar](500) NULL,
	[NumOfBill] [int] NULL,
	[NumOfDtl] [int] NULL,
	[FlowAppType] [int] NULL,
	[Idx] [int] NULL,
	[SDTOfFlowRole] [int] NULL,
	[SDTOfFlowRoleSQL] [nvarchar](200) NULL,
	[FrmUrl] [nvarchar](150) NULL,
	[DRCtrlType] [int] NULL,
	[IsToParentNextNode] [int] NULL,
	[StartLimitRole] [int] NULL,
	[StartLimitPara] [nvarchar](500) NULL,
	[StartLimitAlert] [nvarchar](500) NULL,
	[StartLimitWhen] [int] NULL,
	[StartGuideWay] [int] NULL,
	[StartGuideLink] [nvarchar](200) NULL,
	[StartGuideLab] [nvarchar](200) NULL,
	[StartGuidePara1] [nvarchar](500) NULL,
	[StartGuidePara2] [nvarchar](500) NULL,
	[StartGuidePara3] [nvarchar](500) NULL,
	[Ver] [nvarchar](20) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[DevModelType] [int] NULL,
	[DevModelPara] [nvarchar](50) NULL,
	[AtPara] [nvarchar](1000) NULL,
	[DataDTSWay] [int] NULL,
	[DTSDBSrc] [nvarchar](200) NULL,
	[DTSBTable] [nvarchar](200) NULL,
	[DTSBTablePK] [nvarchar](32) NULL,
	[DTSSpecNodes] [nvarchar](max) NULL,
	[DTSTime] [int] NULL,
	[DTSFields] [nvarchar](900) NULL,
	[FlowDevModel] [int] NULL,
	[PStarter] [int] NULL,
	[PWorker] [int] NULL,
	[PCCer] [int] NULL,
	[PAnyOne] [int] NULL,
	[PMyDept] [int] NULL,
	[PPMyDept] [int] NULL,
	[PPDept] [int] NULL,
	[PSameDept] [int] NULL,
	[PSpecDept] [int] NULL,
	[PSpecDeptExt] [nvarchar](200) NULL,
	[PSpecSta] [int] NULL,
	[PSpecStaExt] [nvarchar](200) NULL,
	[PSpecGroup] [int] NULL,
	[PSpecGroupExt] [nvarchar](200) NULL,
	[PSpecEmp] [int] NULL,
	[PSpecEmpExt] [nvarchar](200) NULL,
	[MyDeptRole] [int] NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[WebPath] [nvarchar](300) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [numeric](11, 2) NULL,
	[FK_FlowSortText] [nvarchar](200) NULL,
 CONSTRAINT [PK_wf_flow_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_floworg]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_floworg](
	[FlowNo] [nvarchar](100) NOT NULL,
	[OrgNo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_floworg_FlowNo] PRIMARY KEY CLUSTERED 
(
	[FlowNo] ASC,
	[OrgNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_flowsort]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_flowsort](
	[No] [nvarchar](100) NOT NULL,
	[ParentNo] [nvarchar](100) NULL,
	[Name] [nvarchar](200) NULL,
	[ShortName] [nvarchar](200) NULL,
	[OrgNo] [nvarchar](150) NULL,
	[Domain] [nvarchar](100) NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_wf_flowsort_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_flowtab]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_flowtab](
	[MyPK] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[FK_Flow] [nvarchar](4) NULL,
	[Mark] [nvarchar](50) NULL,
	[Tip] [nvarchar](200) NULL,
	[UrlExt] [nvarchar](300) NULL,
	[Icon] [nvarchar](50) NULL,
	[OrgNo] [nvarchar](50) NULL,
	[Idx] [int] NULL,
	[IsEnable] [int] NULL,
 CONSTRAINT [PK_wf_flowtab_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_frmnode]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_frmnode](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Frm] [nvarchar](200) NULL,
	[FK_Node] [int] NULL,
	[IsPrint] [int] NULL,
	[IsEnableLoadData] [int] NULL,
	[IsCloseEtcFrm] [int] NULL,
	[WhoIsPK] [int] NULL,
	[FrmSln] [int] NULL,
	[BillNoField] [nvarchar](50) NULL,
	[BillNoFieldText] [nvarchar](200) NULL,
	[FrmNameShow] [nvarchar](100) NULL,
	[Is1ToN] [int] NULL,
	[HuiZong] [nvarchar](300) NULL,
	[TempleteFile] [nvarchar](500) NULL,
	[Idx] [int] NULL,
	[IsEnableFWC] [int] NULL,
	[CheckField] [nvarchar](50) NULL,
	[CheckFieldText] [nvarchar](200) NULL,
	[SFSta] [int] NULL,
	[FrmEnableRole] [int] NULL,
	[FrmEnableExp] [nvarchar](900) NULL,
	[FK_Flow] [nvarchar](10) NULL,
	[FrmType] [nvarchar](20) NULL,
	[IsDefaultOpen] [int] NULL,
	[IsEnable] [int] NULL,
 CONSTRAINT [PK_wf_frmnode_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_frmnodefieldremove]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_frmnodefieldremove](
	[MyPK] [nvarchar](100) NOT NULL,
	[FrmID] [nvarchar](200) NULL,
	[NodeID] [int] NULL,
	[FlowNo] [nvarchar](10) NULL,
	[Fields] [nvarchar](50) NULL,
	[ExpType] [nvarchar](50) NULL,
	[Exp] [nvarchar](500) NULL,
 CONSTRAINT [PK_wf_frmnodefieldremove_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_frmorg]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_frmorg](
	[FrmID] [nvarchar](100) NOT NULL,
	[OrgNo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_wf_frmorg_FrmID] PRIMARY KEY CLUSTERED 
(
	[FrmID] ASC,
	[OrgNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_generworkerlist]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_generworkerlist](
	[WorkID] [int] NOT NULL,
	[FK_Emp] [nvarchar](20) NOT NULL,
	[FK_Node] [int] NOT NULL,
	[FID] [int] NULL,
	[FK_EmpText] [nvarchar](30) NULL,
	[FK_NodeText] [nvarchar](100) NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[SDT] [nvarchar](50) NULL,
	[DTOfWarning] [nvarchar](50) NULL,
	[RDT] [nvarchar](50) NULL,
	[CDT] [nvarchar](50) NULL,
	[IsEnable] [int] NULL,
	[IsRead] [int] NULL,
	[IsPass] [int] NULL,
	[WhoExeIt] [int] NULL,
	[Sender] [nvarchar](200) NULL,
	[PRI] [int] NULL,
	[PressTimes] [int] NULL,
	[DTOfHungup] [nvarchar](50) NULL,
	[DTOfUnHungup] [nvarchar](50) NULL,
	[HungupTimes] [int] NULL,
	[GuestNo] [nvarchar](30) NULL,
	[GuestName] [nvarchar](100) NULL,
	[Idx] [int] NULL,
	[AtPara] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_generworkerlist_WorkID] PRIMARY KEY CLUSTERED 
(
	[WorkID] ASC,
	[FK_Emp] ASC,
	[FK_Node] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_generworkflow]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_generworkflow](
	[WorkID] [int] NOT NULL,
	[FID] [int] NULL,
	[FK_FlowSort] [nvarchar](100) NULL,
	[SysType] [nvarchar](10) NULL,
	[FK_Flow] [nvarchar](100) NULL,
	[FlowName] [nvarchar](100) NULL,
	[Title] [nvarchar](300) NULL,
	[WFSta] [int] NULL,
	[WFState] [int] NULL,
	[Starter] [nvarchar](200) NULL,
	[StarterName] [nvarchar](200) NULL,
	[Sender] [nvarchar](200) NULL,
	[RDT] [nvarchar](50) NULL,
	[HungupTime] [nvarchar](50) NULL,
	[SendDT] [nvarchar](50) NULL,
	[FK_Node] [int] NULL,
	[NodeName] [nvarchar](100) NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[DeptName] [nvarchar](100) NULL,
	[PRI] [int] NULL,
	[SDTOfNode] [nvarchar](50) NULL,
	[SDTOfFlow] [nvarchar](50) NULL,
	[SDTOfFlowWarning] [nvarchar](50) NULL,
	[PFlowNo] [nvarchar](100) NULL,
	[PWorkID] [int] NULL,
	[PNodeID] [int] NULL,
	[PFID] [int] NULL,
	[PEmp] [nvarchar](100) NULL,
	[GuestNo] [nvarchar](100) NULL,
	[GuestName] [nvarchar](100) NULL,
	[BillNo] [nvarchar](100) NULL,
	[TodoEmps] [nvarchar](max) NULL,
	[TodoEmpsNum] [int] NULL,
	[TaskSta] [int] NULL,
	[AtPara] [nvarchar](2000) NULL,
	[Emps] [nvarchar](max) NULL,
	[GUID] [nvarchar](36) NULL,
	[FK_NY] [nvarchar](100) NULL,
	[WeekNum] [int] NULL,
	[TSpan] [int] NULL,
	[TodoSta] [int] NULL,
	[Domain] [nvarchar](100) NULL,
	[PrjNo] [nvarchar](100) NULL,
	[PrjName] [nvarchar](100) NULL,
	[OrgNo] [nvarchar](100) NULL,
	[FlowNote] [nvarchar](500) NULL,
	[LostTimeHH] [real] NULL,
 CONSTRAINT [PK_wf_generworkflow_WorkID] PRIMARY KEY CLUSTERED 
(
	[WorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_labnote]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_labnote](
	[MyPK] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](400) NULL,
	[FK_Flow] [nvarchar](10) NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
 CONSTRAINT [PK_wf_labnote_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_node]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_node](
	[NodeID] [int] NOT NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FlowName] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[WhoExeIt] [int] NULL,
	[ReadReceipts] [int] NULL,
	[CancelRole] [int] NULL,
	[CancelDisWhenRead] [int] NULL,
	[IsOpenOver] [int] NULL,
	[IsSendDraftSubFlow] [int] NULL,
	[IsResetAccepter] [int] NULL,
	[IsGuestNode] [int] NULL,
	[IsYouLiTai] [int] NULL,
	[FocusField] [nvarchar](50) NULL,
	[FWCSta] [int] NULL,
	[FWCAth] [int] NULL,
	[DeliveryWay] [int] NULL,
	[SelfParas] [nvarchar](1000) NULL,
	[Step] [int] NULL,
	[Tip] [nvarchar](100) NULL,
	[RunModel] [int] NULL,
	[PassRate] [decimal](20, 4) NULL,
	[ThreadIsCanDel] [int] NULL,
	[ThreadIsCanAdd] [int] NULL,
	[ThreadIsCanShift] [int] NULL,
	[USSWorkIDRole] [int] NULL,
	[IsSendBackNode] [int] NULL,
	[AutoJumpRole0] [int] NULL,
	[AutoJumpRole1] [int] NULL,
	[AutoJumpRole2] [int] NULL,
	[WhenNoWorker] [int] NULL,
	[AutoJumpExp] [nvarchar](200) NULL,
	[SkipTime] [int] NULL,
	[SendLab] [nvarchar](50) NULL,
	[SendJS] [nvarchar](999) NULL,
	[SaveLab] [nvarchar](50) NULL,
	[SaveEnable] [int] NULL,
	[CCLab] [nvarchar](50) NULL,
	[CCRole] [int] NULL,
	[QRCodeLab] [nvarchar](50) NULL,
	[QRCodeRole] [int] NULL,
	[ShiftLab] [nvarchar](50) NULL,
	[ShiftEnable] [int] NULL,
	[DelLab] [nvarchar](50) NULL,
	[DelEnable] [int] NULL,
	[EndFlowLab] [nvarchar](50) NULL,
	[EndFlowEnable] [int] NULL,
	[ShowParentFormLab] [nvarchar](50) NULL,
	[ShowParentFormEnable] [int] NULL,
	[OfficeBtnLab] [nvarchar](50) NULL,
	[OfficeBtnEnable] [int] NULL,
	[OfficeFileType] [int] NULL,
	[OfficeBtnLocal] [int] NULL,
	[TrackLab] [nvarchar](50) NULL,
	[TrackEnable] [int] NULL,
	[HungLab] [nvarchar](50) NULL,
	[HungEnable] [int] NULL,
	[SearchLab] [nvarchar](50) NULL,
	[SearchEnable] [int] NULL,
	[TCLab] [nvarchar](50) NULL,
	[TCEnable] [int] NULL,
	[FrmDBVerLab] [nvarchar](50) NULL,
	[FrmDBVerEnable] [int] NULL,
	[FrmDBRemarkLab] [nvarchar](50) NULL,
	[FrmDBRemarkEnable] [int] NULL,
	[PRILab] [nvarchar](50) NULL,
	[PRIEnable] [int] NULL,
	[CHLab] [nvarchar](50) NULL,
	[CHRole] [int] NULL,
	[AllotLab] [nvarchar](50) NULL,
	[AllotEnable] [int] NULL,
	[FocusLab] [nvarchar](50) NULL,
	[FocusEnable] [int] NULL,
	[ConfirmLab] [nvarchar](50) NULL,
	[ConfirmEnable] [int] NULL,
	[ListLab] [nvarchar](50) NULL,
	[ListEnable] [int] NULL,
	[BatchLab] [nvarchar](50) NULL,
	[BatchEnable] [int] NULL,
	[NoteLab] [nvarchar](50) NULL,
	[NoteEnable] [int] NULL,
	[HelpLab] [nvarchar](50) NULL,
	[HelpRole] [int] NULL,
	[ScripLab] [nvarchar](50) NULL,
	[ScripRole] [int] NULL,
	[FlowBBSLab] [nvarchar](50) NULL,
	[FlowBBSRole] [int] NULL,
	[IMLab] [nvarchar](50) NULL,
	[IMEnable] [int] NULL,
	[NextLab] [nvarchar](50) NULL,
	[NextRole] [int] NULL,
	[ThreadLab] [nvarchar](50) NULL,
	[ThreadEnable] [int] NULL,
	[ThreadKillRole] [int] NULL,
	[JumpWayLab] [nvarchar](50) NULL,
	[JumpWay] [int] NULL,
	[JumpToNodes] [nvarchar](200) NULL,
	[ShowParentFormEnableMyView] [int] NULL,
	[TrackEnableMyView] [int] NULL,
	[FrmDBVerMyView] [int] NULL,
	[FrmDBRemarkEnableMyView] [int] NULL,
	[PressLab] [nvarchar](50) NULL,
	[PressEnable] [int] NULL,
	[RollbackLab] [nvarchar](50) NULL,
	[RollbackEnable] [int] NULL,
	[ShowParentFormEnableMyCC] [int] NULL,
	[TrackEnableMyCC] [int] NULL,
	[FrmDBVerMyCC] [int] NULL,
	[ReturnLab] [nvarchar](50) NULL,
	[ReturnRole] [int] NULL,
	[ReturnAlert] [nvarchar](999) NULL,
	[IsBackTracking] [int] NULL,
	[IsBackResetAccepter] [int] NULL,
	[IsKillEtcThread] [int] NULL,
	[ReturnCHEnable] [int] NULL,
	[ReturnOneNodeRole] [int] NULL,
	[ReturnField] [nvarchar](50) NULL,
	[ReturnReasonsItems] [nvarchar](999) NULL,
	[PrintHtmlLab] [nvarchar](50) NULL,
	[PrintHtmlEnable] [int] NULL,
	[PrintHtmlMyView] [int] NULL,
	[PrintHtmlMyCC] [int] NULL,
	[PrintPDFLab] [nvarchar](50) NULL,
	[PrintPDFEnable] [int] NULL,
	[PrintPDFMyView] [int] NULL,
	[PrintPDFMyCC] [int] NULL,
	[PrintPDFModle] [int] NULL,
	[ShuiYinModle] [nvarchar](100) NULL,
	[PrintZipLab] [nvarchar](50) NULL,
	[PrintZipEnable] [int] NULL,
	[PrintZipMyView] [int] NULL,
	[PrintZipMyCC] [int] NULL,
	[PrintDocLab] [nvarchar](50) NULL,
	[PrintDocEnable] [int] NULL,
	[HuiQianLab] [nvarchar](50) NULL,
	[HuiQianRole] [int] NULL,
	[AddLeaderLab] [nvarchar](50) NULL,
	[AddLeaderEnable] [int] NULL,
	[HuiQianLeaderRole] [int] NULL,
	[TAlertRole] [int] NULL,
	[TAlertWay] [int] NULL,
	[WAlertRole] [int] NULL,
	[WAlertWay] [int] NULL,
	[TCent] [real] NULL,
	[CHWay] [int] NULL,
	[IsEval] [int] NULL,
	[OutTimeDeal] [int] NULL,
	[CCWriteTo] [int] NULL,
	[CCIsAttr] [int] NULL,
	[CCFormAttr] [nvarchar](100) NULL,
	[CCIsStations] [int] NULL,
	[CCStaWay] [int] NULL,
	[CCIsDepts] [int] NULL,
	[CCIsEmps] [int] NULL,
	[CCIsSQLs] [int] NULL,
	[CCSQL] [nvarchar](500) NULL,
	[CCTitle] [nvarchar](100) NULL,
	[CCDoc] [nvarchar](max) NULL,
	[FWCLab] [nvarchar](100) NULL,
	[FWCType] [int] NULL,
	[FWCNodeName] [nvarchar](100) NULL,
	[FWCOpLabel] [nvarchar](50) NULL,
	[FWCDefInfo] [nvarchar](50) NULL,
	[SigantureEnabel] [int] NULL,
	[FWCIsFullInfo] [int] NULL,
	[FWCFields] [nvarchar](50) NULL,
	[FWCVer] [int] NULL,
	[NodeFrmID] [nvarchar](50) NULL,
	[CheckField] [nvarchar](50) NULL,
	[CheckFieldText] [nvarchar](200) NULL,
	[FWCView] [nvarchar](200) NULL,
	[FWCShowModel] [int] NULL,
	[FWCOrderModel] [int] NULL,
	[FWCMsgShow] [int] NULL,
	[FWC_H] [numeric](11, 2) NULL,
	[FWCTrackEnable] [int] NULL,
	[FWCListEnable] [int] NULL,
	[FWCIsShowAllStep] [int] NULL,
	[FWCIsShowTruck] [int] NULL,
	[FWCIsShowReturnMsg] [int] NULL,
	[ICON] [nvarchar](70) NULL,
	[NodeWorkType] [int] NULL,
	[FrmAttr] [nvarchar](300) NULL,
	[SFSta] [int] NULL,
	[SubFlowX] [int] NULL,
	[SubFlowY] [int] NULL,
	[TimeLimit] [numeric](11, 2) NULL,
	[TWay] [int] NULL,
	[WarningDay] [numeric](11, 2) NULL,
	[DoOutTime] [nvarchar](300) NULL,
	[DoOutTimeCond] [nvarchar](200) NULL,
	[Doc] [nvarchar](100) NULL,
	[IsTask] [int] NULL,
	[IsExpSender] [int] NULL,
	[DeliveryParas] [nvarchar](300) NULL,
	[SaveModel] [int] NULL,
	[IsCanDelFlow] [int] NULL,
	[TodolistModel] [int] NULL,
	[TeamLeaderConfirmRole] [int] NULL,
	[TeamLeaderConfirmDoc] [nvarchar](100) NULL,
	[IsRM] [int] NULL,
	[IsHandOver] [int] NULL,
	[BlockModel] [int] NULL,
	[BlockExp] [nvarchar](200) NULL,
	[BlockAlert] [nvarchar](100) NULL,
	[CondModel] [int] NULL,
	[BatchRole] [int] NULL,
	[FormType] [int] NULL,
	[FormUrl] [nvarchar](300) NULL,
	[TurnToDeal] [int] NULL,
	[TurnToDealDoc] [nvarchar](200) NULL,
	[NodePosType] [int] NULL,
	[HisStas] [nvarchar](300) NULL,
	[HisDeptStrs] [nvarchar](600) NULL,
	[HisToNDs] [nvarchar](80) NULL,
	[HisBillIDs] [nvarchar](50) NULL,
	[HisSubFlows] [nvarchar](30) NULL,
	[PTable] [nvarchar](100) NULL,
	[GroupStaNDs] [nvarchar](200) NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[RefOneFrmTreeType] [nvarchar](100) NULL,
	[AtPara] [nvarchar](500) NULL,
	[SF_H] [numeric](11, 2) NULL,
	[NodeStations] [nvarchar](100) NULL,
	[NodeStationsT] [nvarchar](200) NULL,
	[NodeEmps] [nvarchar](100) NULL,
	[NodeEmpsT] [nvarchar](200) NULL,
	[NodeDepts] [nvarchar](100) NULL,
	[NodeDeptsT] [nvarchar](200) NULL,
	[FrmTrackLab] [nvarchar](200) NULL,
	[FrmTrackSta] [int] NULL,
	[FrmTrack_H] [numeric](11, 2) NULL,
	[SFLab] [nvarchar](200) NULL,
	[SFShowModel] [int] NULL,
	[SFShowCtrl] [int] NULL,
	[AllSubFlowOverRole] [int] NULL,
	[SFCaption] [nvarchar](100) NULL,
	[SFDefInfo] [nvarchar](50) NULL,
	[SFFields] [nvarchar](50) NULL,
	[SFOpenType] [int] NULL,
	[FTCLab] [nvarchar](50) NULL,
	[FTCSta] [int] NULL,
	[FTCWorkModel] [int] NULL,
	[FTC_H] [numeric](11, 2) NULL,
	[SelectorModel] [int] NULL,
	[FK_SQLTemplate] [nvarchar](50) NULL,
	[FK_SQLTemplateText] [nvarchar](200) NULL,
	[IsAutoLoadEmps] [int] NULL,
	[IsSimpleSelector] [int] NULL,
	[IsEnableDeptRange] [int] NULL,
	[IsEnableStaRange] [int] NULL,
	[SelectorP1] [nvarchar](300) NULL,
	[SelectorP2] [nvarchar](300) NULL,
	[SelectorP3] [nvarchar](300) NULL,
	[SelectorP4] [nvarchar](300) NULL,
	[DelayedSendLab] [nvarchar](50) NULL,
	[DelayedSendEnable] [int] NULL,
	[ChangeDeptLab] [nvarchar](50) NULL,
	[ChangeDeptEnable] [int] NULL,
 CONSTRAINT [PK_wf_node_NodeID] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodecancel]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodecancel](
	[FK_Node] [int] NOT NULL,
	[CancelTo] [int] NOT NULL,
 CONSTRAINT [PK_wf_nodecancel_FK_Node] PRIMARY KEY CLUSTERED 
(
	[FK_Node] ASC,
	[CancelTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodedept]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodedept](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[FK_Dept] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_nodedept_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodeemp]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodeemp](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[FK_Emp] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_nodeemp_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodereturn]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodereturn](
	[FK_Node] [int] NOT NULL,
	[ReturnTo] [int] NOT NULL,
 CONSTRAINT [PK_wf_nodereturn_FK_Node] PRIMARY KEY CLUSTERED 
(
	[FK_Node] ASC,
	[ReturnTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodestation]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodestation](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[FK_Station] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_nodestation_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodesubflow]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodesubflow](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FK_Node] [int] NULL,
	[SubFlowNo] [nvarchar](10) NULL,
	[SubFlowName] [nvarchar](200) NULL,
	[IsSubFlowGuide] [int] NULL,
	[SubFlowGuideSQL] [nvarchar](200) NULL,
	[SubFlowGuideGroup] [nvarchar](200) NULL,
	[SubFlowGuideEnNoFiled] [nvarchar](40) NULL,
	[SubFlowGuideEnNameFiled] [nvarchar](40) NULL,
	[SubFlowStartModel] [int] NULL,
	[SubFlowShowModel] [int] NULL,
	[SubFlowHidTodolist] [int] NULL,
	[SubFlowType] [int] NULL,
	[SubFlowModel] [int] NULL,
	[SubFlowSta] [int] NULL,
	[ExpType] [int] NULL,
	[CondExp] [nvarchar](500) NULL,
	[YanXuToNode] [nvarchar](100) NULL,
	[YBFlowReturnRole] [int] NULL,
	[ReturnToNode] [nvarchar](200) NULL,
	[ReturnToNodeText] [nvarchar](200) NULL,
	[Idx] [int] NULL,
	[SubFlowLab] [nvarchar](20) NULL,
	[ParentFlowSendNextStepRole] [int] NULL,
	[ParentFlowOverRole] [int] NULL,
	[SubFlowNodeID] [int] NULL,
	[IsAutoSendSLSubFlowOver] [int] NULL,
	[StartOnceOnly] [int] NULL,
	[CompleteReStart] [int] NULL,
	[IsEnableSpecFlowStart] [int] NULL,
	[SpecFlowStart] [nvarchar](200) NULL,
	[SpecFlowStartNote] [nvarchar](500) NULL,
	[IsEnableSpecFlowOver] [int] NULL,
	[SpecFlowOver] [nvarchar](200) NULL,
	[SpecFlowOverNote] [nvarchar](500) NULL,
	[SubFlowCopyFields] [nvarchar](400) NULL,
	[BackCopyRole] [int] NULL,
	[ParentFlowCopyFields] [nvarchar](400) NULL,
	[InvokeTime] [int] NULL,
	[IsEnableSQL] [int] NULL,
	[SpecSQL] [nvarchar](500) NULL,
	[IsEnableSameLevelNode] [int] NULL,
	[SameLevelNode] [nvarchar](500) NULL,
	[SendModel] [int] NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
 CONSTRAINT [PK_wf_nodesubflow_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodeteam]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodeteam](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[FK_Team] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_nodeteam_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_nodetoolbar]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_nodetoolbar](
	[OID] [int] NOT NULL,
	[FK_Node] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[ExcType] [int] NULL,
	[UrlExt] [nvarchar](500) NULL,
	[Target] [nvarchar](100) NULL,
	[IsMyFlow] [int] NULL,
	[IsMyTree] [int] NULL,
	[IsMyView] [int] NULL,
	[IsMyCC] [int] NULL,
	[IconPath] [nvarchar](100) NULL,
	[Idx] [int] NULL,
	[MyFileName] [nvarchar](300) NULL,
	[MyFilePath] [nvarchar](300) NULL,
	[MyFileExt] [nvarchar](20) NULL,
	[WebPath] [nvarchar](300) NULL,
	[MyFileH] [int] NULL,
	[MyFileW] [int] NULL,
	[MyFileSize] [real] NULL,
 CONSTRAINT [PK_wf_nodetoolbar_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_part]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_part](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FK_Node] [int] NULL,
	[PartType] [nvarchar](100) NULL,
	[Tag0] [nvarchar](2000) NULL,
	[Tag1] [nvarchar](2000) NULL,
	[Tag2] [nvarchar](2000) NULL,
	[Tag3] [nvarchar](2000) NULL,
	[Tag4] [nvarchar](2000) NULL,
	[Tag5] [nvarchar](2000) NULL,
	[Tag6] [nvarchar](2000) NULL,
	[Tag7] [nvarchar](2000) NULL,
	[Tag8] [nvarchar](2000) NULL,
	[Tag9] [nvarchar](2000) NULL,
 CONSTRAINT [PK_wf_part_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_powermodel]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_powermodel](
	[MyPK] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](100) NULL,
	[PowerFlag] [nvarchar](100) NULL,
	[PowerFlagName] [nvarchar](100) NULL,
	[PowerCtrlType] [int] NULL,
	[EmpNo] [nvarchar](100) NULL,
	[EmpName] [nvarchar](100) NULL,
	[StaNo] [nvarchar](100) NULL,
	[StaName] [nvarchar](100) NULL,
	[FlowNo] [nvarchar](100) NULL,
	[FrmID] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_powermodel_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_pushmsg]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_pushmsg](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[FK_Node] [int] NULL,
	[FK_Event] [nvarchar](20) NULL,
	[PushWay] [int] NULL,
	[PushDoc] [nvarchar](max) NULL,
	[Tag] [nvarchar](500) NULL,
	[SMSPushWay] [int] NULL,
	[SMSField] [nvarchar](100) NULL,
	[SMSDoc] [nvarchar](max) NULL,
	[SMSNodes] [nvarchar](100) NULL,
	[SMSPushModel] [nvarchar](50) NULL,
	[MailPushWay] [int] NULL,
	[MailAddress] [nvarchar](100) NULL,
	[MailTitle] [nvarchar](200) NULL,
	[MailDoc] [nvarchar](max) NULL,
	[MailNodes] [nvarchar](100) NULL,
	[BySQL] [nvarchar](500) NULL,
	[ByEmps] [nvarchar](100) NULL,
	[AtPara] [nvarchar](500) NULL,
 CONSTRAINT [PK_wf_pushmsg_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_rememberme]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_rememberme](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[FK_Emp] [nvarchar](30) NULL,
	[Objs] [nvarchar](max) NULL,
	[ObjsExt] [nvarchar](max) NULL,
	[Emps] [nvarchar](max) NULL,
	[EmpsExt] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_rememberme_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_returnwork]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_returnwork](
	[MyPK] [nvarchar](100) NOT NULL,
	[WorkID] [int] NULL,
	[FID] [int] NULL,
	[ReturnNode] [int] NULL,
	[ReturnNodeName] [nvarchar](100) NULL,
	[Returner] [nvarchar](50) NULL,
	[ReturnerName] [nvarchar](100) NULL,
	[ReturnToNode] [int] NULL,
	[ReturnToEmp] [nvarchar](max) NULL,
	[BeiZhu] [nvarchar](max) NULL,
	[RDT] [nvarchar](50) NULL,
	[IsBackTracking] [int] NULL,
 CONSTRAINT [PK_wf_returnwork_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_selectaccper]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_selectaccper](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Node] [int] NULL,
	[WorkID] [int] NULL,
	[FK_Emp] [nvarchar](100) NULL,
	[EmpName] [nvarchar](20) NULL,
	[DeptName] [nvarchar](400) NULL,
	[AccType] [int] NULL,
	[Rec] [nvarchar](100) NULL,
	[Info] [nvarchar](200) NULL,
	[IsRemember] [int] NULL,
	[Idx] [int] NULL,
	[Tag] [nvarchar](200) NULL,
	[TimeLimit] [int] NULL,
	[TSpanHour] [real] NULL,
	[ADT] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_wf_selectaccper_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_sqltemplate]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_sqltemplate](
	[No] [nvarchar](3) NOT NULL,
	[SQLType] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[Docs] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_sqltemplate_No] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_syncdata]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_syncdata](
	[MyPK] [nvarchar](100) NOT NULL,
	[FlowNo] [nvarchar](10) NULL,
	[SyncType] [nvarchar](50) NULL,
	[SyncTypeT] [nvarchar](200) NULL,
	[Note] [nvarchar](max) NULL,
	[APIUrl] [nvarchar](10) NULL,
	[DBSrc] [nvarchar](10) NULL,
	[SQLTables] [nvarchar](100) NULL,
	[SQLFields] [nvarchar](100) NULL,
	[AtPara] [nvarchar](max) NULL,
 CONSTRAINT [PK_wf_syncdata_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_syncdatafield]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_syncdatafield](
	[MyPK] [nvarchar](100) NOT NULL,
	[FlowNo] [nvarchar](10) NULL,
	[RefPKVal] [nvarchar](50) NULL,
	[AttrKey] [nvarchar](100) NULL,
	[AttrName] [nvarchar](100) NULL,
	[AttrType] [nvarchar](100) NULL,
	[ToFieldKey] [nvarchar](100) NULL,
	[ToFieldName] [nvarchar](100) NULL,
	[ToFieldType] [nvarchar](100) NULL,
	[IsSync] [int] NULL,
	[TurnFunc] [nvarchar](50) NULL,
 CONSTRAINT [PK_wf_syncdatafield_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_task]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_task](
	[MyPK] [nvarchar](100) NOT NULL,
	[FK_Flow] [nvarchar](5) NULL,
	[Starter] [nvarchar](200) NULL,
	[ToNode] [int] NULL,
	[ToEmps] [nvarchar](200) NULL,
	[Paras] [nvarchar](max) NULL,
	[TaskSta] [int] NULL,
	[Msg] [nvarchar](max) NULL,
	[StartDT] [nvarchar](20) NULL,
	[RDT] [nvarchar](20) NULL,
 CONSTRAINT [PK_wf_task_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_transfercustom]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_transfercustom](
	[MyPK] [nvarchar](100) NOT NULL,
	[WorkID] [int] NULL,
	[FK_Node] [int] NULL,
	[NodeName] [nvarchar](200) NULL,
	[Worker] [nvarchar](200) NULL,
	[WorkerName] [nvarchar](200) NULL,
	[SubFlowNo] [nvarchar](3) NULL,
	[PlanDT] [nvarchar](50) NULL,
	[TodolistModel] [int] NULL,
	[IsEnable] [int] NULL,
	[Idx] [int] NULL,
 CONSTRAINT [PK_wf_transfercustom_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_workflowdeletelog]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_workflowdeletelog](
	[OID] [int] NOT NULL,
	[FID] [int] NULL,
	[FK_Dept] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[FlowStarter] [nvarchar](100) NULL,
	[FlowStartRDT] [nvarchar](50) NULL,
	[FK_Flow] [nvarchar](100) NULL,
	[FlowEnderRDT] [nvarchar](50) NULL,
	[FlowEndNode] [int] NULL,
	[FlowDaySpan] [real] NULL,
	[FlowEmps] [nvarchar](100) NULL,
	[Oper] [nvarchar](20) NULL,
	[OperDept] [nvarchar](20) NULL,
	[OperDeptName] [nvarchar](200) NULL,
	[DeleteNote] [nvarchar](max) NULL,
	[DeleteDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_wf_workflowdeletelog_OID] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wf_workopt]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wf_workopt](
	[MyPK] [nvarchar](100) NOT NULL,
	[WorkID] [int] NULL,
	[NodeID] [int] NULL,
	[ToNodeID] [int] NULL,
	[EmpNo] [nvarchar](100) NULL,
	[FlowNo] [nvarchar](10) NULL,
	[SendEmps] [nvarchar](500) NULL,
	[SendEmpsT] [nvarchar](500) NULL,
	[SendDepts] [nvarchar](500) NULL,
	[SendDeptsT] [nvarchar](500) NULL,
	[SendStas] [nvarchar](100) NULL,
	[SendStasT] [nvarchar](500) NULL,
	[SendNote] [nvarchar](max) NULL,
	[CCEmps] [nvarchar](100) NULL,
	[CCEmpsT] [nvarchar](500) NULL,
	[CCDepts] [nvarchar](100) NULL,
	[CCDeptsT] [nvarchar](500) NULL,
	[CCStas] [nvarchar](100) NULL,
	[CCStasT] [nvarchar](500) NULL,
	[CCNote] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[NodeName] [nvarchar](500) NULL,
	[ToNodeName] [nvarchar](500) NULL,
	[TodoEmps] [nvarchar](200) NULL,
	[SenderName] [nvarchar](100) NULL,
	[SendRDT] [nvarchar](100) NULL,
	[SendSDT] [nvarchar](100) NULL,
 CONSTRAINT [PK_wf_workopt_MyPK] PRIMARY KEY CLUSTERED 
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_flowstarterbpm]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[v_flowstarterbpm] (
	FK_Flow, 
	FlowName, 
	FK_Emp, 
	OrgNo)
AS 
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, c.FK_Emp AS FK_Emp, c.OrgNo AS OrgNo
	FROM ((dbo.wf_node  AS a 
		CROSS JOIN dbo.wf_nodestation  AS b) 
		CROSS JOIN dbo.port_deptempstation  AS c)
	WHERE (
		(a.NodePosType = 0) AND 
		(a.NodeID = b.FK_Node) AND 
		(b.FK_Station = c.FK_Station) AND 
		((a.DeliveryWay = 0) OR (a.DeliveryWay = 14)))
	 UNION
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, c.FK_Emp AS FK_Emp, c.OrgNo AS OrgNo
	FROM ((dbo.wf_node  AS a 
		CROSS JOIN dbo.wf_nodedept  AS b) 
		CROSS JOIN dbo.port_deptemp  AS c)
	WHERE (
		(a.NodePosType = 0) AND 
		(a.NodeID = b.FK_Node) AND 
		(b.FK_Dept = c.FK_Dept) AND 
		(a.DeliveryWay = 1))
	 UNION
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, b.FK_Emp AS FK_Emp, c.OrgNo AS OrgNo
	FROM ((dbo.wf_node  AS a 
		CROSS JOIN dbo.wf_nodeemp  AS b) 
		CROSS JOIN dbo.port_emp  AS c)
	WHERE (
		(a.NodePosType = 0) AND 
		(a.NodeID = b.FK_Node) AND 
		(a.DeliveryWay = 3) AND 
		(b.FK_Emp = c.No))
	 UNION
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, b.No AS FK_Emp, b.OrgNo AS OrgNo
	FROM ((dbo.wf_node  AS a 
		CROSS JOIN dbo.port_emp  AS b) 
		CROSS JOIN dbo.wf_flow  AS c)
	WHERE (
		(a.NodePosType = 0) AND 
		(a.DeliveryWay = 4) AND 
		(a.FK_Flow = c.No) AND 
		((b.OrgNo = c.OrgNo) OR ((b.OrgNo IS NULL) AND (c.OrgNo IS NULL))))
	 UNION
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, e.FK_Emp AS FK_Emp, e.OrgNo AS OrgNo
	FROM (((dbo.wf_node  AS a 
		CROSS JOIN dbo.wf_nodedept  AS b) 
		CROSS JOIN dbo.wf_nodestation  AS c) 
		CROSS JOIN dbo.port_deptempstation  AS e)
	WHERE (
		(a.NodePosType = 0) AND 
		(a.NodeID = b.FK_Node) AND 
		(a.NodeID = c.FK_Node) AND 
		(b.FK_Dept = e.FK_Dept) AND 
		(c.FK_Station = e.FK_Station) AND 
		(a.DeliveryWay = 9))
	 UNION
	SELECT a.FK_Flow AS FK_Flow, a.FlowName AS FlowName, c.No AS FK_Emp, b.OrgNo AS OrgNo
	FROM ((dbo.wf_node  AS a 
		CROSS JOIN dbo.wf_floworg  AS b) 
		CROSS JOIN dbo.port_emp  AS c)
	WHERE (
		(a.FK_Flow = b.FlowNo) AND 
		((b.OrgNo = c.OrgNo) OR ((b.OrgNo IS NULL) AND (c.OrgNo IS NULL))) AND 
		((a.DeliveryWay = 22) OR (a.DeliveryWay = 51)))
GO
/****** Object:  View [dbo].[v_myflowdata]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[v_myflowdata] (
   [WorkID], 
   [FID], 
   [FK_FlowSort], 
   [SysType], 
   [FK_Flow], 
   [FlowName], 
   [Title], 
   [WFSta], 
   [WFState], 
   [Starter], 
   [StarterName], 
   [Sender], 
   [RDT], 
   [HungupTime], 
   [SendDT], 
   [FK_Node], 
   [NodeName], 
   [FK_Dept], 
   [DeptName], 
   [PRI], 
   [SDTOfNode], 
   [SDTOfFlow], 
   [SDTOfFlowWarning], 
   [PFlowNo], 
   [PWorkID], 
   [PNodeID], 
   [PFID], 
   [PEmp], 
   [GuestNo], 
   [GuestName], 
   [BillNo], 
   [TodoEmps], 
   [TodoEmpsNum], 
   [TaskSta], 
   [AtPara], 
   [Emps], 
   [GUID], 
   [FK_NY], 
   [WeekNum], 
   [TSpan], 
   [TodoSta], 
   [Domain], 
   [PrjNo], 
   [PrjName], 
   [OrgNo], 
   [FlowNote], 
   [LostTimeHH], 
   [MyEmpNo])
AS 
   SELECT 
      a.WorkID AS WorkID, 
      a.FID AS FID, 
      a.FK_FlowSort AS FK_FlowSort, 
      a.SysType AS SysType, 
      a.FK_Flow AS FK_Flow, 
      a.FlowName AS FlowName, 
      a.Title AS Title, 
      a.WFSta AS WFSta, 
      a.WFState AS WFState, 
      a.Starter AS Starter, 
      a.StarterName AS StarterName, 
      a.Sender AS Sender, 
      a.RDT AS RDT, 
      a.HungupTime AS HungupTime, 
      a.SendDT AS SendDT, 
      a.FK_Node AS FK_Node, 
      a.NodeName AS NodeName, 
      a.FK_Dept AS FK_Dept, 
      a.DeptName AS DeptName, 
      a.PRI AS PRI, 
      a.SDTOfNode AS SDTOfNode, 
      a.SDTOfFlow AS SDTOfFlow, 
      a.SDTOfFlowWarning AS SDTOfFlowWarning, 
      a.PFlowNo AS PFlowNo, 
      a.PWorkID AS PWorkID, 
      a.PNodeID AS PNodeID, 
      a.PFID AS PFID, 
      a.PEmp AS PEmp, 
      a.GuestNo AS GuestNo, 
      a.GuestName AS GuestName, 
      a.BillNo AS BillNo, 
      a.TodoEmps AS TodoEmps, 
      a.TodoEmpsNum AS TodoEmpsNum, 
      a.TaskSta AS TaskSta, 
      a.AtPara AS AtPara, 
      a.Emps AS Emps, 
      a.GUID AS GUID, 
      a.FK_NY AS FK_NY, 
      a.WeekNum AS WeekNum, 
      a.TSpan AS TSpan, 
      a.TodoSta AS TodoSta, 
      a.Domain AS Domain, 
      a.PrjNo AS PrjNo, 
      a.PrjName AS PrjName, 
      a.OrgNo AS OrgNo, 
      a.FlowNote AS FlowNote, 
      a.LostTimeHH AS LostTimeHH, 
      b.EmpNo AS MyEmpNo
   FROM (dbo.wf_generworkflow  AS a 
      CROSS JOIN dbo.wf_powermodel  AS b)
   WHERE (
      (a.FK_Flow = b.FlowNo) AND 
      (b.PowerCtrlType = 1) AND 
      (a.WFState >= 2))
    UNION
   SELECT 
      a.WorkID AS WorkID, 
      a.FID AS FID, 
      a.FK_FlowSort AS FK_FlowSort, 
      a.SysType AS SysType, 
      a.FK_Flow AS FK_Flow, 
      a.FlowName AS FlowName, 
      a.Title AS Title, 
      a.WFSta AS WFSta, 
      a.WFState AS WFState, 
      a.Starter AS Starter, 
      a.StarterName AS StarterName, 
      a.Sender AS Sender, 
      a.RDT AS RDT, 
      a.HungupTime AS HungupTime, 
      a.SendDT AS SendDT, 
      a.FK_Node AS FK_Node, 
      a.NodeName AS NodeName, 
      a.FK_Dept AS FK_Dept, 
      a.DeptName AS DeptName, 
      a.PRI AS PRI, 
      a.SDTOfNode AS SDTOfNode, 
      a.SDTOfFlow AS SDTOfFlow, 
      a.SDTOfFlowWarning AS SDTOfFlowWarning, 
      a.PFlowNo AS PFlowNo, 
      a.PWorkID AS PWorkID, 
      a.PNodeID AS PNodeID, 
      a.PFID AS PFID, 
      a.PEmp AS PEmp, 
      a.GuestNo AS GuestNo, 
      a.GuestName AS GuestName, 
      a.BillNo AS BillNo, 
      a.TodoEmps AS TodoEmps, 
      a.TodoEmpsNum AS TodoEmpsNum, 
      a.TaskSta AS TaskSta, 
      a.AtPara AS AtPara, 
      a.Emps AS Emps, 
      a.GUID AS GUID, 
      a.FK_NY AS FK_NY, 
      a.WeekNum AS WeekNum, 
      a.TSpan AS TSpan, 
      a.TodoSta AS TodoSta, 
      a.Domain AS Domain, 
      a.PrjNo AS PrjNo, 
      a.PrjName AS PrjName, 
      a.OrgNo AS OrgNo, 
      a.FlowNote AS FlowNote, 
      a.LostTimeHH AS LostTimeHH, 
      c.No AS MyEmpNo
   FROM (((dbo.wf_generworkflow  AS a 
      CROSS JOIN dbo.wf_powermodel  AS b) 
      CROSS JOIN dbo.port_emp  AS c) 
      CROSS JOIN dbo.port_deptempstation  AS d)
   WHERE (
      (a.FK_Flow = b.FlowNo) AND 
      (b.PowerCtrlType = 0) AND 
      (c.No = d.FK_Emp) AND 
      (b.StaNo = d.FK_Station) AND 
      (a.WFState >= 2))
GO
/****** Object:  View [dbo].[v_wf_authtodolist]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[v_wf_authtodolist] (
   [Auther], 
   [AuthName], 
   [PWorkID], 
   [FK_Node], 
   [FID], 
   [WorkID], 
   [AutherToEmpNo], 
   [TakeBackDT], 
   [FK_Flow], 
   [FlowName], 
   [Title])
AS 
   SELECT 
      b.FK_Emp AS Auther, 
      b.FK_EmpText AS AuthName, 
      a.PWorkID AS PWorkID, 
      a.FK_Node AS FK_Node, 
      a.FID AS FID, 
      a.WorkID AS WorkID, 
      c.AutherToEmpNo AS AutherToEmpNo, 
      c.TakeBackDT AS TakeBackDT, 
      a.FK_Flow AS FK_Flow, 
      a.FlowName AS FlowName, 
      a.Title AS Title
   FROM ((dbo.wf_generworkflow  AS a 
      CROSS JOIN dbo.wf_generworkerlist  AS b) 
      CROSS JOIN dbo.wf_auth  AS c)
   WHERE (
      (a.WorkID = b.WorkID) AND 
      (c.AuthType = 1) AND 
      (b.FK_Emp = c.Auther) AND 
      (b.IsPass = 0) AND 
      (b.IsEnable = 1) AND 
      (a.FK_Node = b.FK_Node) AND 
      (a.WFState >= 2))
    UNION
   SELECT 
      b.FK_Emp AS Auther, 
      b.FK_EmpText AS AuthName, 
      a.PWorkID AS PWorkID, 
      a.FK_Node AS FK_Node, 
      a.FID AS FID, 
      a.WorkID AS WorkID, 
      c.AutherToEmpNo AS AutherToEmpNo, 
      c.TakeBackDT AS TakeBackDT, 
      a.FK_Flow AS FK_Flow, 
      a.FlowName AS FlowName, 
      a.Title AS Title
   FROM ((dbo.wf_generworkflow  AS a 
      CROSS JOIN dbo.wf_generworkerlist  AS b) 
      CROSS JOIN dbo.wf_auth  AS c)
   WHERE (
      (a.WorkID = b.WorkID) AND 
      (c.AuthType = 2) AND 
      (b.FK_Emp = c.Auther) AND 
      (b.IsPass = 0) AND 
      (b.IsEnable = 1) AND 
      (a.FK_Node = b.FK_Node) AND 
      (a.WFState >= 2) AND 
      (a.FK_Flow = c.FlowNo))
GO
/****** Object:  View [dbo].[wf_empworks]    Script Date: 2023/8/6 0:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[wf_empworks] (
	[PRI], 
	[WorkID], 
	[IsRead], 
	[Starter], 
	[StarterName], 
	[WFState], 
	[FK_Dept], 
	[DeptName], 
	[TodoEmpDeptNo], 
	[FK_Flow], 
	[FlowName], 
	[PWorkID], 
	[PFlowNo], 
	[FK_Node], 
	[NodeName], 
	[Title], 
	[RDT], 
	[ADT], 
	[SDT], 
	[FK_Emp], 
	[FID], 
	[FK_FlowSort], 
	[SysType], 
	[SDTOfNode], 
	[PressTimes], 
	[GuestNo], 
	[GuestName], 
	[BillNo], 
	[TodoEmps], 
	[TodoEmpsNum], 
	[TodoSta], 
	[TaskSta], 
	[FlowNote], 
	[ListType], 
	[Sender], 
	[AtPara], 
	[Domain], 
	[OrgNo], 
	[FlowIdx], 
	[FlowSortIdx])
AS 
	SELECT 
		a.PRI AS PRI, 
		a.WorkID AS WorkID, 
		b.IsRead AS IsRead, 
		a.Starter AS Starter, 
		a.StarterName AS StarterName, 
		a.WFState AS WFState, 
		a.FK_Dept AS FK_Dept, 
		a.DeptName AS DeptName, 
		b.FK_Dept AS TodoEmpDeptNo, 
		a.FK_Flow AS FK_Flow, 
		a.FlowName AS FlowName, 
		a.PWorkID AS PWorkID, 
		a.PFlowNo AS PFlowNo, 
		b.FK_Node AS FK_Node, 
		b.FK_NodeText AS NodeName, 
		a.Title AS Title, 
		a.RDT AS RDT, 
		b.RDT AS ADT, 
		b.SDT AS SDT, 
		b.FK_Emp AS FK_Emp, 
		b.FID AS FID, 
		a.FK_FlowSort AS FK_FlowSort, 
		a.SysType AS SysType, 
		a.SDTOfNode AS SDTOfNode, 
		b.PressTimes AS PressTimes, 
		a.GuestNo AS GuestNo, 
		a.GuestName AS GuestName, 
		a.BillNo AS BillNo, 
		a.TodoEmps AS TodoEmps, 
		a.TodoEmpsNum AS TodoEmpsNum, 
		a.TodoSta AS TodoSta, 
		a.TaskSta AS TaskSta, 
		a.FlowNote AS FlowNote, 
		0 AS ListType, 
		a.Sender AS Sender, 
		a.AtPara AS AtPara, 
		a.Domain AS Domain, 
		a.OrgNo AS OrgNo, 
		c.Idx AS FlowIdx, 
		d.Idx AS FlowSortIdx
	FROM (((dbo.wf_generworkflow  AS a 
		CROSS JOIN dbo.wf_generworkerlist  AS b) 
		CROSS JOIN dbo.wf_flow  AS c) 
		CROSS JOIN dbo.wf_flowsort  AS d)
	WHERE (
		(b.IsEnable = 1) AND 
		(b.IsPass = 0) AND 
		(a.WorkID = b.WorkID) AND 
		(a.FK_Node = b.FK_Node) AND 
		(a.WFState <> 0) AND 
		(b.WhoExeIt <> 1) AND 
		(a.FK_Flow = c.No) AND 
		(a.FK_FlowSort = d.No) AND 
		(c.FK_FlowSort = d.No))
	 UNION
	SELECT 
		a.PRI AS PRI, 
		a.WorkID AS WorkID, 
		b.Sta AS IsRead, 
		a.Starter AS Starter, 
		a.StarterName AS StarterName, 
		2 AS WFState, 
		a.FK_Dept AS FK_Dept, 
		a.DeptName AS DeptName, 
		N'' AS TodoEmpDeptNo, 
		a.FK_Flow AS FK_Flow, 
		a.FlowName AS FlowName, 
		a.PWorkID AS PWorkID, 
		a.PFlowNo AS PFlowNo, 
		b.FK_Node AS FK_Node, 
		b.NodeName AS NodeName, 
		a.Title AS Title, 
		a.RDT AS RDT, 
		b.RDT AS ADT, 
		b.RDT AS SDT, 
		b.CCTo AS FK_Emp, 
		b.FID AS FID, 
		a.FK_FlowSort AS FK_FlowSort, 
		a.SysType AS SysType, 
		a.SDTOfNode AS SDTOfNode, 
		0 AS PressTimes, 
		a.GuestNo AS GuestNo, 
		a.GuestName AS GuestName, 
		a.BillNo AS BillNo, 
		a.TodoEmps AS TodoEmps, 
		a.TodoEmpsNum AS TodoEmpsNum, 
		0 AS TodoSta, 
		0 AS TaskSta, 
		a.FlowNote AS FlowNote, 
		1 AS ListType, 
		b.Rec AS Sender, 
		a.AtPara AS AtPara, 
		a.Domain AS Domain, 
		a.OrgNo AS OrgNo, 
		c.Idx AS FlowIdx, 
		d.Idx AS FlowSortIdx
	FROM (((dbo.wf_generworkflow  AS a 
		CROSS JOIN dbo.wf_cclist  AS b) 
		CROSS JOIN dbo.wf_flow  AS c) 
		CROSS JOIN dbo.wf_flowsort  AS d)
	WHERE (
		(a.WorkID = b.WorkID) AND 
		(b.Sta <= 1) AND 
		(b.InEmpWorks = 1) AND 
		(a.WFState <> 0) AND 
		(a.FK_Flow = c.No) AND 
		(a.FK_FlowSort = d.No) AND 
		(c.FK_FlowSort = d.No))
GO
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1101', N'icon-share-alt', N'最近发起', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/StartEarlyer.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1102', N'icon-paper-plane', N'发起', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Start.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1103', N'icon-bell', N'待办', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Todolist.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1104', N'icon-clock', N'在途', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/RuningDataGrid.htm?IsContainFuture=1', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1105', N'fa-hourglass-end', N'已完成', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Complete.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1106', N'icon-layers', N'批处理', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Batch.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1107', N'icon-people', N'抄送', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/CC.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1108', N'icon-note', N'我的草稿', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Draft.htm', N'', 1, N'AppFlow', N'FlowGener', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1201', N'icon-target', N'监控', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Watchdog.htm?EnsName=BP.WF.Data.MyStartFlows', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1202', N'icon-flag', N'我发起的', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Comm/Search.htm?EnsName=BP.WF.Data.MyStartFlows', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1203', N'icon-user-following', N'我审批的', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Comm/Search.htm?EnsName=BP.WF.Data.MyJoinFlows', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1204', N'icon-calendar', N'我的流程分布', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/RptSearch/DistributedOfMy.htm', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1205', N'icon-speech', N'我的流程', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/SearchDataGrid.htm', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1207', N'icon-magnifier', N'综合查询', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/RptSearch/Default.htm', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1208', N'icon-magnifier', N'流程监控', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Watchdog.htm', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1209', N'icon-magnifier', N'逾期流程', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Comm/Search.htm?EnsName=BP.WF.Data.Delays', N'', 1, N'AppFlow', N'Search', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1301', N'icon-organization', N'会签主持人待办', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/HuiQianList.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1303', N'icon-organization', N'协作待办', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/TeamupList.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1304', N'icon-briefcase', N'授权待办', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/AuthorList.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1305', N'icon-direction', N'工作委托2019', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/AuthorTodolist2019.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1307', N'icon-share', N'共享任务', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/TaskPoolSharing.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1308', N'icon-folder-alt', N'申请下来的任务', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/TaskPoolApply.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1309', N'icon-paper-plane', N'未来任务', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/FutureTodolist.htm', N'', 1, N'AppFlow', N'TodolistType', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1401', N'icon-share', N'共享任务', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/TaskPoolSharing.htm', N'', 1, N'AppFlow', N'FlowAdv', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1402', N'icon-folder-alt', N'申请下来的任务', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/TaskPoolApply.htm', N'', 1, N'AppFlow', N'FlowAdv', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1403', N'icon-star', N'我的关注', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Focus.htm', N'', 1, N'AppFlow', N'FlowAdv', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1405', N'icon-loop', N'挂起的工作', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/HungupList.htm', N'', 1, N'AppFlow', N'FlowAdv', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_menu] ([No], [Icon], [Name], [Title], [Tag4], [ListModel], [TagInt1], [Tag0], [Tag1], [Tag2], [Tag3], [MenuModel], [Mark], [FrmID], [FlowNo], [OpenWay], [UrlExt], [MobileUrlExt], [IsEnable], [SystemNo], [ModuleNo], [ModuleNoText], [OrgNo], [Idx], [IsMyBillToolBar], [IsMyBillToolExt], [IsSearchBar], [DTSDataWay], [DTSSpecFiels], [DTSWhenFlowOver], [DTSWhenNodeOver]) VALUES (N'1406', N'icon-settings', N'我的设置', NULL, NULL, 0, 0, NULL, N'', NULL, NULL, N'', N'', N'', N'', 1, N'../../WF/Setting/Default.htm', N'', 1, N'AppFlow', N'FlowAdv', N'', N'', 0, 1, 0, 0, 0, N'', 0, 0)
INSERT [dbo].[gpm_module] ([No], [Name], [SystemNo], [Icon], [Idx], [IsEnable], [OrgNo], [ChildDisplayModel]) VALUES (N'FlowAdv', N'高级功能', N'AppFlow', N'icon-emotsmile', 0, 1, N'', 0)
INSERT [dbo].[gpm_module] ([No], [Name], [SystemNo], [Icon], [Idx], [IsEnable], [OrgNo], [ChildDisplayModel]) VALUES (N'FlowGener', N'基础功能', N'AppFlow', N'fa-cubes', 0, 1, N'', 0)
INSERT [dbo].[gpm_module] ([No], [Name], [SystemNo], [Icon], [Idx], [IsEnable], [OrgNo], [ChildDisplayModel]) VALUES (N'Search', N'流程查询', N'AppFlow', N'icon-magnifier', 0, 1, N'', 0)
INSERT [dbo].[gpm_module] ([No], [Name], [SystemNo], [Icon], [Idx], [IsEnable], [OrgNo], [ChildDisplayModel]) VALUES (N'TodolistType', N'分类待办', N'AppFlow', N'icon-emotsmile', 0, 1, N'', 0)
INSERT [dbo].[gpm_system] ([No], [Name], [IsEnable], [Icon], [OrgNo], [Idx]) VALUES (N'AppFlow', N'业务流程', 1, N'icon-emotsmile', N'', 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'100', N'集团总部', NULL, N'0', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1001', N'集团市场部', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1002', N'集团研发部', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1003', N'集团服务部', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1004', N'集团财务部', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1005', N'集团人力资源部', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1060', N'南方分公司', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1061', N'市场部', NULL, N'1060', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1062', N'财务部', NULL, N'1060', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1063', N'销售部', NULL, N'1060', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1070', N'北方分公司', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1071', N'市场部', NULL, N'1070', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1072', N'财务部', NULL, N'1070', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1073', N'销售部', NULL, N'1070', NULL, NULL, 0)
INSERT [dbo].[port_dept] ([No], [Name], [NameOfPath], [ParentNo], [OrgNo], [Leader], [Idx]) VALUES (N'1099', N'外来单位', NULL, N'100', NULL, NULL, 0)
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'100_admin', N'100', N'admin', N'', N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'100_oubl', N'100', N'oubl', N'', N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'100_zhoupeng', N'100', N'zhoupeng', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1001_zhanghaicheng', N'1001', N'zhanghaicheng', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1001_zhangyifan', N'1001', N'zhangyifan', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1001_zhoushengyu', N'1001', N'zhoushengyu', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1002_qifenglin', N'1002', N'qifenglin', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1002_zhoutianjiao', N'1002', N'zhoutianjiao', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1003_fuhui', N'1003', N'fuhui', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1003_guoxiangbin', N'1003', N'guoxiangbin', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1004_guobaogeng', N'1004', N'guobaogeng', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1004_yangyilei', N'1004', N'yangyilei', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1005_liping', N'1005', N'liping', NULL, N'', N'', N'')
INSERT [dbo].[port_deptemp] ([MyPK], [FK_Dept], [FK_Emp], [OrgNo], [DeptName], [StationNo], [StationNoT]) VALUES (N'1005_liyan', N'1005', N'liyan', NULL, N'', N'', N'')
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'100_zhoupeng_01', N'100', N'01', N'zhoupeng', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1001_zhanghaicheng_02', N'1001', N'02', N'zhanghaicheng', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1001_zhangyifan_07', N'1001', N'07', N'zhangyifan', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1001_zhoushengyu_07', N'1001', N'07', N'zhoushengyu', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1002_qifenglin_03', N'1002', N'03', N'qifenglin', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1002_zhoutianjiao_08', N'1002', N'08', N'zhoutianjiao', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1003_fuhui_09', N'1003', N'09', N'fuhui', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1003_guoxiangbin_04', N'1003', N'04', N'guoxiangbin', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1004_guobaogeng_10', N'1004', N'10', N'guobaogeng', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1004_yangyilei_05', N'1004', N'05', N'yangyilei', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1005_liping_06', N'1005', N'06', N'liping', NULL)
INSERT [dbo].[port_deptempstation] ([MyPK], [FK_Dept], [FK_Station], [FK_Emp], [OrgNo]) VALUES (N'1005_liyan_11', N'1005', N'11', N'liyan', NULL)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'admin', N'admin', N',admin,admin,', N'100', N'0531-82374939', N'zhoupeng@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'fuhui', N'福惠', N',fuhui,fh,fh/jtfwb,', N'1003', N'0531-82374939', N'fuhui@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'guobaogeng', N'郭宝庚', N',guobaogeng,gbg,gbg/jtcwb,', N'1004', N'0531-82374939', N'guobaogeng@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'guoxiangbin', N'郭祥斌', N',guoxiangbin,gxb,gxb/jtfwb,', N'1003', N'0531-82374939', N'guoxiangbin@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'liping', N'李萍', N',liping,lp,lp/jtrlzyb,', N'1005', N'0531-82374939', N'liping@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'liyan', N'李言', N',liyan,ly,ly/jtrlzyb,', N'1005', N'0531-82374939', N'liyan@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'oubl', N'oubl', N',oubl,oubl,', N'100', N'', N'', N'', N'', N'', 0, N'', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'qifenglin', N'祁凤林', N',qifenglin,qfl,qfl/jtyfb,', N'1002', N'0531-82374939', N'qifenglin@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'yangyilei', N'杨依雷', N',yangyilei,yyl,yyl/jtcwb,', N'1004', N'0531-82374939', N'yangyilei@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'zhanghaicheng', N'张海成', N',zhanghaicheng,zhc,zhc/jtscb,', N'1001', N'0531-82374939', N'zhanghaicheng@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'zhangyifan', N'张一帆', N',zhangyifan,zyf,zyf/jtscb,', N'1001', N'0531-82374939', N'zhangyifan@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'zhoupeng', N'周朋', N',zhoupeng,zp,zp/jtzb,', N'100', N'0531-82374939', N'zhoupeng@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'zhoushengyu', N'周升雨', N',zhoushengyu,zsy,zsy/jtscb,', N'1001', N'0531-82374939', N'zhoushengyu@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_emp] ([No], [Name], [PinYin], [FK_Dept], [Tel], [Email], [Leader], [LeaderName], [OrgNo], [Idx], [Pass], [OpenID], [EmpSta]) VALUES (N'zhoutianjiao', N'周天娇', N',zhoutianjiao,ztj,ztj/jtyfb,', N'1002', N'0531-82374939', N'zhoutianjiao@ccflow.org', N'', N'', N'', 0, N'123', N'', 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'01', N'总经理', N'1', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'02', N'市场部经理', N'2', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'03', N'研发部经理', N'2', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'04', N'客服部经理', N'2', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'05', N'财务部经理', N'2', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'06', N'人力资源部经理', N'2', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'07', N'销售人员岗', N'3', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'08', N'程序员岗', N'3', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'09', N'技术服务岗', N'3', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'10', N'出纳岗', N'3', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'11', N'人力资源助理岗', N'3', NULL, 0)
INSERT [dbo].[port_station] ([No], [Name], [FK_StationType], [OrgNo], [Idx]) VALUES (N'12', N'外来人员岗', N'3', NULL, 0)
INSERT [dbo].[port_stationtype] ([No], [Name], [Idx]) VALUES (N'1', N'高层', 0)
INSERT [dbo].[port_stationtype] ([No], [Name], [Idx]) VALUES (N'2', N'中层', 0)
INSERT [dbo].[port_stationtype] ([No], [Name], [Idx]) VALUES (N'3', N'基层', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'32c46e6b-6f3a-4702-8285-1d340e8e5da6', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 19:00', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'338fbc1c-a9f8-4a03-baac-70f0f29d9d17', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-01 02:34', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'4332e87c-f904-4269-9a4b-0559aa8d18bf', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 23:41', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'48b6912d-b27d-4d46-ab92-c0884c19b68e', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 15:57', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'5500d491-28f9-4917-ae30-7ab2b56b3b2b', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-01 02:31', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'5fbbd778-e84b-4bd6-8856-9a6d4ca0039f', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-06 00:06', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'65be2c3a-77df-424a-9598-d24a736e33d0', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 15:08', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'66a005bf-d781-46ec-b0b5-1485609904d5', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 23:54', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'70b91080-59ac-4183-b234-5de183c87a63', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-05 15:18', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'78eb8e39-bcfc-4cbc-84c4-d46fff740740', N'oubl', N'oubl', N'100', N'集团总部', N'', N'', N'2023-08-05 00:58', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'81f10c14-d034-447e-81d6-4004868e60b7', N'oubl', N'oubl', N'100', N'集团总部', N'', N'', N'2023-08-05 01:02', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'a88fe628-110d-41f6-9cbc-6534241530aa', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-05 15:12', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'b1378456-418a-4ca6-9d62-531f203db20f', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 18:38', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'c0ef3e59-de92-429c-9d41-1175c490b763', N'oubl', N'oubl', N'100', N'集团总部', N'', N'', N'2023-08-05 00:59', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'd89ed722-12fd-4230-88cf-2286be43327e', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-02-15 11:35', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'db4a7258-e61f-442a-86b2-45b327a84a3c', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 19:02', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'dd6814d3-cef8-45da-8bbf-102f3d511291', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-05 12:10', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'df5a17e7-f09b-4634-ae17-3597545718af', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-04 15:59', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'ea3b7c87-1e16-4f20-a0fe-011fee4a351e', N'admin', N'admin', N'100', N'集团总部', N'', N'', N'2023-08-06 00:40', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'ea9139db-dd28-46e9-929c-a30746f781ce', N'oubl', N'oubl', N'100', N'集团总部', N'', N'', N'2023-08-05 01:07', 0)
INSERT [dbo].[port_token] ([MyPK], [EmpNo], [EmpName], [DeptNo], [DeptName], [OrgNo], [OrgName], [RDT], [SheBei]) VALUES (N'f7c7e3ce-1ab7-409a-9e4d-f23a4cd8fbf1', N'oubl', N'oubl', N'100', N'集团总部', N'', N'', N'2023-08-05 01:01', 0)
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertType_CH_0', N'短信', N'AlertType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertType_CH_1', N'邮件', N'AlertType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertType_CH_2', N'邮件与短信', N'AlertType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertType_CH_3', N'系统(内部)消息', N'AlertType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_0', N'不接收', N'AlertWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_1', N'短信', N'AlertWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_2', N'邮件', N'AlertWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_3', N'内部消息', N'AlertWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_4', N'QQ消息', N'AlertWay', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_5', N'RTX消息', N'AlertWay', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AlertWay_CH_6', N'MSN消息', N'AlertWay', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AllSubFlowOverRole_CH_0', N'不处理', N'AllSubFlowOverRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AllSubFlowOverRole_CH_1', N'当前流程自动运行下一步', N'AllSubFlowOverRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AllSubFlowOverRole_CH_2', N'结束当前流程', N'AllSubFlowOverRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AppType_CH_0', N'外部Url连接', N'AppType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AppType_CH_1', N'本地可执行文件', N'AppType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_0', N'PK-主键', N'AthCtrlWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_1', N'FID-干流程ID', N'AthCtrlWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_2', N'PWorkID-父流程ID', N'AthCtrlWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_3', N'仅能查看自己上传的字段单附件', N'AthCtrlWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_4', N'WorkID-按照WorkID计算(对流程节点表单有效)', N'AthCtrlWay', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_5', N'P2WorkID', N'AthCtrlWay', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthCtrlWay_CH_6', N'P3WorkID', N'AthCtrlWay', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthEditModel_CH_0', N'只读', N'AthEditModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthEditModel_CH_1', N'可编辑全部区域', N'AthEditModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthEditModel_CH_2', N'可编辑非数据标签区域', N'AthEditModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSaveWay_CH_0', N'保存到web服务器', N'AthSaveWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSaveWay_CH_1', N'保存到数据库', N'AthSaveWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSaveWay_CH_2', N'ftp服务器', N'AthSaveWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSingleRole_CH_0', N'不使用模板', N'AthSingleRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSingleRole_CH_1', N'使用上传模板', N'AthSingleRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthSingleRole_CH_2', N'使用上传模板自动加载数据标签', N'AthSingleRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthUploadWay_CH_0', N'继承模式', N'AthUploadWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AthUploadWay_CH_1', N'协作模式', N'AthUploadWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AuthorWay_CH_0', N'不授权', N'AuthorWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AuthorWay_CH_1', N'全部流程授权', N'AuthorWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'AuthorWay_CH_2', N'指定流程授权', N'AuthorWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BackCopyRole_CH_0', N'不反填', N'BackCopyRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BackCopyRole_CH_1', N'字段自动匹配', N'BackCopyRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BackCopyRole_CH_2', N'按照设置的格式', N'BackCopyRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BackCopyRole_CH_3', N'混合模式', N'BackCopyRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BBSPRI_CH_0', N'普通', N'BBSPRI', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BBSPRI_CH_1', N'紧急', N'BBSPRI', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BBSPRI_CH_2', N'火急', N'BBSPRI', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BBSSta_CH_0', N'发布中', N'BBSSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BBSSta_CH_1', N'禁用', N'BBSSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillFrmType_CH_0', N'傻瓜表单', N'BillFrmType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillFrmType_CH_1', N'自由表单', N'BillFrmType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillFrmType_CH_8', N'开发者表单', N'BillFrmType', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillSta_CH_0', N'运行中', N'BillSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillSta_CH_1', N'已完成', N'BillSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillSta_CH_2', N'其他', N'BillSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillState_CH_0', N'空白', N'BillState', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillState_CH_1', N'草稿', N'BillState', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillState_CH_100', N'归档', N'BillState', 100, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'BillState_CH_2', N'编辑中', N'BillState', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CancelRole_CH_0', N'上一步可以撤销', N'CancelRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CancelRole_CH_1', N'不能撤销', N'CancelRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CancelRole_CH_2', N'上一步与开始节点可以撤销', N'CancelRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CancelRole_CH_3', N'指定的节点可以撤销', N'CancelRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_0', N'不能抄送', N'CCRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_1', N'手工抄送', N'CCRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_2', N'自动抄送', N'CCRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_3', N'手工与自动', N'CCRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_4', N'按表单SysCCEmps字段计算', N'CCRole', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRole_CH_5', N'在发送前打开抄送窗口', N'CCRole', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRoleExcType_CH_0', N'按表单字段计算', N'CCRoleExcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRoleExcType_CH_1', N'按人员计算', N'CCRoleExcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRoleExcType_CH_2', N'按角色计算', N'CCRoleExcType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRoleExcType_CH_3', N'按部门计算', N'CCRoleExcType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCRoleExcType_CH_4', N'按SQL计算', N'CCRoleExcType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCSta_CH_0', N'未读', N'CCSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCSta_CH_1', N'已读', N'CCSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCSta_CH_2', N'已回复', N'CCSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCSta_CH_3', N'删除', N'CCSta', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_0', N'仅按角色计算', N'CCStaWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_1', N'按角色智能计算(当前节点)', N'CCStaWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_2', N'按角色智能计算(发送到节点)', N'CCStaWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_3', N'按角色与部门的交集', N'CCStaWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_4', N'按直线上级部门找角色下的人员(当前节点)', N'CCStaWay', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCStaWay_CH_5', N'按直线上级部门找角色下的人员(接受节点)', N'CCStaWay', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCWriteTo_CH_0', N'写入抄送列表', N'CCWriteTo', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCWriteTo_CH_1', N'写入待办', N'CCWriteTo', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CCWriteTo_CH_2', N'写入待办与抄送列表', N'CCWriteTo', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertRole_CH_0', N'不提示', N'CHAlertRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertRole_CH_1', N'每天1次', N'CHAlertRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertRole_CH_2', N'每天2次', N'CHAlertRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertWay_CH_0', N'邮件', N'CHAlertWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertWay_CH_1', N'短信', N'CHAlertWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHAlertWay_CH_2', N'CCIM即时通讯', N'CHAlertWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ChartType_CH_0', N'几何图形', N'ChartType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ChartType_CH_1', N'肖像图片', N'ChartType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHRole_CH_0', N'禁用', N'CHRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHRole_CH_1', N'启用', N'CHRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHRole_CH_2', N'只读', N'CHRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHRole_CH_3', N'启用并可以调整流程应完成时间', N'CHRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHSta_CH_0', N'及时完成', N'CHSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHSta_CH_1', N'按期完成', N'CHSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHSta_CH_2', N'逾期完成', N'CHSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CHSta_CH_3', N'超期完成', N'CHSta', 3, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CodeStruct_CH_0', N'普通的编码表(具有No,Name)', N'CodeStruct', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CodeStruct_CH_1', N'树结构(具有No,Name,ParentNo)', N'CodeStruct', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CodeStruct_CH_2', N'行政机构编码表(编码以两位编号标识级次树形关系)', N'CodeStruct', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_1', N'跨1个单元格', N'ColSpanAttrDT', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_2', N'跨2个单元格', N'ColSpanAttrDT', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_3', N'跨3个单元格', N'ColSpanAttrDT', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_4', N'跨4个单元格', N'ColSpanAttrDT', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_5', N'跨5个单元格', N'ColSpanAttrDT', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrDT_CH_6', N'跨6个单元格', N'ColSpanAttrDT', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrString_CH_1', N'跨1个单元格', N'ColSpanAttrString', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrString_CH_2', N'跨2个单元格', N'ColSpanAttrString', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrString_CH_3', N'跨3个单元格', N'ColSpanAttrString', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ColSpanAttrString_CH_4', N'跨4个单元格', N'ColSpanAttrString', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CondModel_CH_0', N'由连接线条件控制', N'CondModel', 0, N'CH', NULL, NULL)
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CondModel_CH_1', N'按照用户选择计算', N'CondModel', 1, N'CH', NULL, NULL)
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CondModel_CH_2', N'发送按钮旁下拉框选择', N'CondModel', 2, N'CH', NULL, NULL)
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlEnableType_CH_0', N'禁用(隐藏)', N'CtrlEnableType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlEnableType_CH_1', N'启用', N'CtrlEnableType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlEnableType_CH_2', N'只读', N'CtrlEnableType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlWay_CH_0', N'单个', N'CtrlWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlWay_CH_1', N'多个', N'CtrlWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'CtrlWay_CH_2', N'指定', N'CtrlWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DBListDBType_CH_0', N'数据库查询SQL', N'DBListDBType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DBListDBType_CH_1', N'执行Url返回Json', N'DBListDBType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DBListDBType_CH_2', N'执行存储过程', N'DBListDBType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefaultChart_CH_0', N'饼图', N'DefaultChart', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefaultChart_CH_1', N'折线图', N'DefaultChart', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefaultChart_CH_2', N'柱状图', N'DefaultChart', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefaultChart_CH_3', N'显示环形图', N'DefaultChart', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefValType_CH_0', N'默认值为空', N'DefValType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DefValType_CH_1', N'按照设置的默认值设置', N'DefValType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DelEnable_CH_0', N'不能删除', N'DelEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DelEnable_CH_1', N'逻辑删除', N'DelEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DelEnable_CH_2', N'记录日志方式删除', N'DelEnable', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DelEnable_CH_3', N'彻底删除', N'DelEnable', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DelEnable_CH_4', N'让用户决定删除方式', N'DelEnable', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DeleteWay_CH_0', N'不能删除', N'DeleteWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DeleteWay_CH_1', N'删除所有', N'DeleteWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DeleteWay_CH_2', N'只能删除自己上传的', N'DeleteWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DocType_CH_0', N'正式公文', N'DocType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DocType_CH_1', N'便函', N'DocType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DoubleOrClickModel_CH_0', N'双击行弹窗', N'DoubleOrClickModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DoubleOrClickModel_CH_1', N'单击行弹窗', N'DoubleOrClickModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Draft_CH_0', N'无(不设草稿)', N'Draft', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Draft_CH_1', N'保存到待办', N'Draft', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Draft_CH_2', N'保存到草稿箱', N'Draft', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlAddRecModel_CH_0', N'按设置的数量初始化空白行', N'DtlAddRecModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlAddRecModel_CH_1', N'用按钮增加空白行', N'DtlAddRecModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlOpenType_CH_0', N'操作员', N'DtlOpenType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlOpenType_CH_1', N'WorkID-流程ID', N'DtlOpenType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlOpenType_CH_2', N'FID-干流程ID', N'DtlOpenType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlOpenType_CH_3', N'PWorkID-父流程WorkID', N'DtlOpenType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlSaveModel_CH_0', N'自动存盘(失去焦点自动存盘)', N'DtlSaveModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlSaveModel_CH_1', N'手动存盘(保存按钮触发存盘)', N'DtlSaveModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DtlVer_CH_0', N'2017传统版', N'DtlVer', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSDataWay_CH_0', N'不同步', N'DTSDataWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSDataWay_CH_1', N'同步全部的相同字段的数据', N'DTSDataWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSDataWay_CH_2', N'同步指定字段的数据', N'DTSDataWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSearchWay_CH_0', N'不启用', N'DTSearchWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSearchWay_CH_1', N'按日期', N'DTSearchWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSearchWay_CH_2', N'按日期时间', N'DTSearchWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSWay_CH_0', N'不考核', N'DTSWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSWay_CH_1', N'按照时效考核', N'DTSWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'DTSWay_CH_2', N'按照工作量考核', N'DTSWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditerType_CH_0', N'无编辑器', N'EditerType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditerType_CH_1', N'Sina编辑器0', N'EditerType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditerType_CH_2', N'FKEditer', N'EditerType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditerType_CH_3', N'KindEditor', N'EditerType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditerType_CH_4', N'百度的UEditor', N'EditerType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditModel_CH_0', N'表格模式', N'EditModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditModel_CH_1', N'傻瓜表单', N'EditModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EditModel_CH_2', N'开发者表单', N'EditModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityEditModel_CH_0', N'表格', N'EntityEditModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityEditModel_CH_1', N'行编辑', N'EntityEditModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityShowModel_CH_0', N'表格', N'EntityShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityShowModel_CH_1', N'树干模式', N'EntityShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityType_CH_0', N'独立表单', N'EntityType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityType_CH_1', N'单据', N'EntityType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityType_CH_2', N'编号名称实体', N'EntityType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EntityType_CH_3', N'树结构实体', N'EntityType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EnumUIContralType_CH_1', N'下拉框', N'EnumUIContralType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EnumUIContralType_CH_2', N'复选框', N'EnumUIContralType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EnumUIContralType_CH_3', N'单选按钮', N'EnumUIContralType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EventType_CH_0', N'禁用', N'EventType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EventType_CH_1', N'执行URL', N'EventType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'EventType_CH_2', N'执行CCFromRef.js', N'EventType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ExcType_CH_0', N'超链接', N'ExcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ExcType_CH_1', N'函数', N'ExcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ExpType_CH_3', N'按照SQL计算', N'ExpType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ExpType_CH_4', N'按照参数计算', N'ExpType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FileType_CH_0', N'普通附件', N'FileType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FileType_CH_1', N'图片文件', N'FileType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FJOpen_CH_0', N'关闭附件', N'FJOpen', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FJOpen_CH_1', N'操作员', N'FJOpen', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FJOpen_CH_2', N'工作ID', N'FJOpen', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FJOpen_CH_3', N'流程ID', N'FJOpen', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowBBSRole_CH_0', N'禁用', N'FlowBBSRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowBBSRole_CH_1', N'启用', N'FlowBBSRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowBBSRole_CH_2', N'只读', N'FlowBBSRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowRunWay_CH_0', N'手工启动', N'FlowRunWay', 0, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowRunWay_CH_1', N'指定人员按时启动', N'FlowRunWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowRunWay_CH_2', N'数据集按时启动', N'FlowRunWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FlowRunWay_CH_3', N'触发式启动', N'FlowRunWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FLRole_CH_0', N'按接受人', N'FLRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FLRole_CH_1', N'按部门', N'FLRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FLRole_CH_2', N'按岗位', N'FLRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmDBRemarkEnable_CH_0', N'禁用', N'FrmDBRemarkEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmDBRemarkEnable_CH_1', N'可编辑', N'FrmDBRemarkEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmDBRemarkEnable_CH_2', N'不可编辑', N'FrmDBRemarkEnable', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmSln_CH_0', N'默认方案', N'FrmSln', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmSln_CH_1', N'只读方案', N'FrmSln', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmSln_CH_2', N'自定义方案', N'FrmSln', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_0', N'傻瓜表单', N'FrmType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_1', N'自由表单', N'FrmType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_10', N'章节表单', N'FrmType', 10, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_11', N'累加表单', N'FrmType', 11, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_3', N'嵌入式表单', N'FrmType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_4', N'Word表单', N'FrmType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_5', N'在线编辑模式Excel表单', N'FrmType', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_6', N'VSTO模式Excel表单', N'FrmType', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_7', N'实体类组件', N'FrmType', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_8', N'开发者表单', N'FrmType', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmType_CH_9', N'Wps表单', N'FrmType', 9, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmUrlShowWay_CH_0', N'不显示', N'FrmUrlShowWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmUrlShowWay_CH_1', N'自动大小', N'FrmUrlShowWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmUrlShowWay_CH_2', N'指定大小', N'FrmUrlShowWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FrmUrlShowWay_CH_3', N'新窗口', N'FrmUrlShowWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FTCWorkModel_CH_0', N'简洁模式', N'FTCWorkModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FTCWorkModel_CH_1', N'高级模式', N'FTCWorkModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FuncSrc_CH_0', N'自定义', N'FuncSrc', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FuncSrc_CH_1', N'系统内置', N'FuncSrc', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCAth_CH_0', N'不启用', N'FWCAth', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCAth_CH_1', N'多附件', N'FWCAth', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCAth_CH_2', N'单附件(暂不支持)', N'FWCAth', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCAth_CH_3', N'图片附件(暂不支持)', N'FWCAth', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCMsgShow_CH_0', N'都显示', N'FWCMsgShow', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCMsgShow_CH_1', N'仅显示自己的意见', N'FWCMsgShow', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCOrderModel_CH_0', N'按审批时间先后排序', N'FWCOrderModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCOrderModel_CH_1', N'按照接受人员列表先后顺序(官职大小)', N'FWCOrderModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCShowModel_CH_0', N'表格方式', N'FWCShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCShowModel_CH_1', N'自由模式', N'FWCShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCSta_CH_0', N'禁用', N'FWCSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCSta_CH_1', N'启用', N'FWCSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCSta_CH_2', N'只读', N'FWCSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCType_CH_0', N'审核组件', N'FWCType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCType_CH_1', N'日志组件', N'FWCType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCType_CH_2', N'周报组件', N'FWCType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCType_CH_3', N'月报组件', N'FWCType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCVer_CH_0', N'1个节点1个人保留1个意见', N'FWCVer', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'FWCVer_CH_1', N'保留节点历史意见(默认)', N'FWCVer', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GovDocType_CH_0', N'RTF模板', N'GovDocType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GovDocType_CH_1', N'HTML模板', N'GovDocType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GovDocType_CH_2', N'Weboffice组件', N'GovDocType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GovDocType_CH_3', N'WPS组件', N'GovDocType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GovDocType_CH_4', N'金格组件', N'GovDocType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GuestFlowRole_CH_0', N'不参与', N'GuestFlowRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GuestFlowRole_CH_1', N'开始节点参与', N'GuestFlowRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'GuestFlowRole_CH_2', N'中间节点参与', N'GuestFlowRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HelpRole_CH_0', N'禁用', N'HelpRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HelpRole_CH_1', N'启用', N'HelpRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HelpRole_CH_2', N'强制提示', N'HelpRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HelpRole_CH_3', N'选择性提示', N'HelpRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianLeaderRole_CH_0', N'只有一个组长', N'HuiQianLeaderRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianLeaderRole_CH_1', N'最后一个组长发送', N'HuiQianLeaderRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianLeaderRole_CH_2', N'任意组长可以发送', N'HuiQianLeaderRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianRole_CH_0', N'不启用', N'HuiQianRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianRole_CH_1', N'协作(同事)模式', N'HuiQianRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'HuiQianRole_CH_4', N'组长(领导)模式', N'HuiQianRole', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IMEnable_CH_0', N'禁用', N'IMEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IMEnable_CH_1', N'启用', N'IMEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ImgSrcType_CH_0', N'本地', N'ImgSrcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ImgSrcType_CH_1', N'URL', N'ImgSrcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ImpModel_CH_0', N'不导入', N'ImpModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ImpModel_CH_1', N'按配置模式导入', N'ImpModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ImpModel_CH_2', N'按照xls文件模版导入', N'ImpModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InfoPRI_CH_0', N'普通', N'InfoPRI', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InfoPRI_CH_1', N'紧急', N'InfoPRI', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InfoPRI_CH_2', N'火急', N'InfoPRI', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InfoSta_CH_0', N'发布中', N'InfoSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InfoSta_CH_1', N'禁用', N'InfoSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InvokeTime_CH_0', N'发送时', N'InvokeTime', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'InvokeTime_CH_1', N'工作到达时', N'InvokeTime', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsAutoSendSLSubFlowOver_CH_0', N'不处理', N'IsAutoSendSLSubFlowOver', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsAutoSendSLSubFlowOver_CH_1', N'让同级子流程自动运行下一步', N'IsAutoSendSLSubFlowOver', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsAutoSendSLSubFlowOver_CH_2', N'结束同级子流程', N'IsAutoSendSLSubFlowOver', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsBackTracking_CH_0', N'不允许原路返回', N'IsBackTracking', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsBackTracking_CH_1', N'由退回人决定', N'IsBackTracking', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsBackTracking_CH_2', N'强制原路返回', N'IsBackTracking', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsCanStart_CH_0', N'不启用', N'IsCanStart', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsCanStart_CH_1', N'独立启动', N'IsCanStart', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsKillEtcThread_CH_0', N'不删除其它的子线程', N'IsKillEtcThread', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsKillEtcThread_CH_1', N'删除其它的子线程', N'IsKillEtcThread', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsKillEtcThread_CH_2', N'由子线程退回人决定是否删除', N'IsKillEtcThread', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSigan_CH_0', N'无', N'IsSigan', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSigan_CH_1', N'图片签名', N'IsSigan', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSigan_CH_2', N'山东CA', N'IsSigan', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSigan_CH_3', N'广东CA', N'IsSigan', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSigan_CH_4', N'图片盖章', N'IsSigan', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_0', N'yyyy-MM-dd', N'IsSupperText', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_1', N'yyyy-MM-dd HH:mm', N'IsSupperText', 1, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_2', N'yyyy-MM-dd HH:mm:ss', N'IsSupperText', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_3', N'yyyy-MM', N'IsSupperText', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_4', N'HH:mm', N'IsSupperText', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_5', N'HH:mm:ss', N'IsSupperText', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_6', N'MM-dd', N'IsSupperText', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_7', N'yyyy', N'IsSupperText', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'IsSupperText_CH_8', N'MM', N'IsSupperText', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JMCD_CH_0', N'一般', N'JMCD', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JMCD_CH_1', N'保密', N'JMCD', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JMCD_CH_2', N'秘密', N'JMCD', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JMCD_CH_3', N'机密', N'JMCD', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JumpWay_CH_0', N'不能跳转', N'JumpWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JumpWay_CH_1', N'只能向后跳转', N'JumpWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JumpWay_CH_2', N'只能向前跳转', N'JumpWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JumpWay_CH_3', N'任意节点跳转', N'JumpWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'JumpWay_CH_4', N'按指定规则跳转', N'JumpWay', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'KnowledgeSta_CH_0', N'公开', N'KnowledgeSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'KnowledgeSta_CH_1', N'私有', N'KnowledgeSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'LGType_CH_0', N'普通', N'LGType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'LGType_CH_1', N'枚举', N'LGType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'LGType_CH_2', N'外键', N'LGType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'LGType_CH_3', N'打开系统页面', N'LGType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ListModel_CH_0', N'编辑模式', N'ListModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ListModel_CH_1', N'视图模式', N'ListModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ListShowModel_CH_0', N'表格', N'ListShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ListShowModel_CH_1', N'卡片', N'ListShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ListShowModel_CH_2', N'自定义Url', N'ListShowModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MethodDocTypeOfFunc_CH_0', N'SQL', N'MethodDocTypeOfFunc', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MethodDocTypeOfFunc_CH_1', N'URL', N'MethodDocTypeOfFunc', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MethodDocTypeOfFunc_CH_2', N'JavaScript', N'MethodDocTypeOfFunc', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MethodDocTypeOfFunc_CH_3', N'业务单元', N'MethodDocTypeOfFunc', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MobileFieldShowModel_CH_0', N'默认设置', N'MobileFieldShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MobileFieldShowModel_CH_1', N'设置显示字段', N'MobileFieldShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MobileFieldShowModel_CH_2', N'设置模板', N'MobileFieldShowModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MobileShowModel_CH_0', N'新页面显示模式', N'MobileShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MobileShowModel_CH_1', N'列表模式', N'MobileShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Model_CH_0', N'普通', N'Model', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Model_CH_1', N'固定行', N'Model', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoreLinkModel_CH_0', N'新窗口', N'MoreLinkModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoreLinkModel_CH_1', N'本窗口', N'MoreLinkModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoreLinkModel_CH_2', N'覆盖新窗口', N'MoreLinkModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoveToShowWay_CH_0', N'不显示', N'MoveToShowWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoveToShowWay_CH_1', N'下拉列表0', N'MoveToShowWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MoveToShowWay_CH_2', N'平铺', N'MoveToShowWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MsgCtrl_CH_0', N'不发送', N'MsgCtrl', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MsgCtrl_CH_1', N'按设置的下一步接受人自动发送（默认）', N'MsgCtrl', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MsgCtrl_CH_2', N'由本节点表单系统字段(IsSendEmail,IsSendSMS)来决定', N'MsgCtrl', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MsgCtrl_CH_3', N'由SDK开发者参数(IsSendEmail,IsSendSMS)来决定', N'MsgCtrl', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_1', N'字符串String', N'MyDataType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_2', N'整数类型Int', N'MyDataType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_3', N'浮点类型AppFloat', N'MyDataType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_4', N'判断类型Boolean', N'MyDataType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_5', N'双精度类型Double', N'MyDataType', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_6', N'日期型Date', N'MyDataType', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_7', N'时间类型Datetime', N'MyDataType', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDataType_CH_8', N'金额类型AppMoney', N'MyDataType', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDeptRole_CH_0', N'仅部门领导可以查看', N'MyDeptRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDeptRole_CH_1', N'部门下所有的人都可以查看', N'MyDeptRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'MyDeptRole_CH_2', N'本部门里指定角色的人可以查看', N'MyDeptRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NextRole_CH_0', N'禁用', N'NextRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NextRole_CH_1', N'相同节点', N'NextRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NextRole_CH_2', N'相同流程', N'NextRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NextRole_CH_3', N'相同的人', N'NextRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NextRole_CH_4', N'不限流程', N'NextRole', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoGenerModel_CH_0', N'自定义', N'NoGenerModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoGenerModel_CH_1', N'流水号', N'NoGenerModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoGenerModel_CH_2', N'标签的全拼', N'NoGenerModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoGenerModel_CH_3', N'标签的简拼', N'NoGenerModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoGenerModel_CH_4', N'按GUID生成', N'NoGenerModel', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoteEnable_CH_0', N'禁用', N'NoteEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoteEnable_CH_1', N'启用', N'NoteEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'NoteEnable_CH_2', N'只读', N'NoteEnable', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeBtnEnable_CH_0', N'不可用', N'OfficeBtnEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeBtnEnable_CH_1', N'可编辑', N'OfficeBtnEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeBtnEnable_CH_2', N'不可编辑', N'OfficeBtnEnable', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeBtnLocal_CH_0', N'工具栏上', N'OfficeBtnLocal', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeBtnLocal_CH_1', N'表单标签(divID=GovDocFile)', N'OfficeBtnLocal', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeFileType_CH_0', N'word文件', N'OfficeFileType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OfficeFileType_CH_1', N'WPS文件', N'OfficeFileType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenModel_CH_0', N'弹窗-强制关闭', N'OpenModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenModel_CH_1', N'新窗口打开-winopen模式', N'OpenModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenModel_CH_2', N'弹窗-非强制关闭', N'OpenModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenModel_CH_3', N'执行指定的方法.', N'OpenModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenModel_CH_4', N'流程设计器打开模式', N'OpenModel', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenWay_CH_0', N'新窗口', N'OpenWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenWay_CH_1', N'本窗口', N'OpenWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'OpenWay_CH_2', N'覆盖新窗口', N'OpenWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ParentFlowSendNextStepRole_CH_0', N'不处理', N'ParentFlowSendNextStepRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ParentFlowSendNextStepRole_CH_1', N'该子流程运行结束', N'ParentFlowSendNextStepRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ParentFlowSendNextStepRole_CH_2', N'该子流程运行到指定节点', N'ParentFlowSendNextStepRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PicUploadType_CH_0', N'拍照上传或者相册上传', N'PicUploadType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PicUploadType_CH_1', N'只能拍照上传', N'PicUploadType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PopValFormat_CH_0', N'No(仅编号)', N'PopValFormat', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PopValFormat_CH_1', N'Name(仅名称)', N'PopValFormat', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PopValFormat_CH_2', N'No,Name(编号与名称,比如zhangsan,张三;lisi,李四;)', N'PopValFormat', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PowerCtrlType_CH_0', N'角色', N'PowerCtrlType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PowerCtrlType_CH_1', N'人员', N'PowerCtrlType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRI_CH_0', N'低', N'PRI', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRI_CH_1', N'中', N'PRI', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRI_CH_2', N'高', N'PRI', 2, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRIEnable_CH_0', N'不启用', N'PRIEnable', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRIEnable_CH_1', N'只读', N'PRIEnable', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PRIEnable_CH_2', N'编辑', N'PRIEnable', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PrintOpenModel_CH_0', N'下载本地', N'PrintOpenModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PrintOpenModel_CH_1', N'在线打开', N'PrintOpenModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PrintPDFModle_CH_0', N'全部打印', N'PrintPDFModle', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PrintPDFModle_CH_1', N'单个表单打印(针对树形表单)', N'PrintPDFModle', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_0', N'按照指定节点的工作人员', N'PushWay', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_1', N'按照指定的工作人员', N'PushWay', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_2', N'按照指定的工作角色', N'PushWay', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_3', N'按照指定的部门', N'PushWay', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_4', N'按照指定的SQL', N'PushWay', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'PushWay_CH_5', N'按照系统指定的字段', N'PushWay', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRCodeRole_CH_0', N'无', N'QRCodeRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRCodeRole_CH_1', N'查看流程表单-无需权限', N'QRCodeRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRCodeRole_CH_2', N'查看流程表单-需要登录', N'QRCodeRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRCodeRole_CH_3', N'外部账户协作模式处理工作', N'QRCodeRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRModel_CH_0', N'不生成', N'QRModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'QRModel_CH_1', N'生成二维码', N'QRModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RBShowModel_CH_0', N'竖向', N'RBShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RBShowModel_CH_3', N'横向', N'RBShowModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadReceipts_CH_0', N'不回执', N'ReadReceipts', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadReceipts_CH_1', N'自动回执', N'ReadReceipts', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadReceipts_CH_2', N'由上一节点表单字段决定', N'ReadReceipts', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadReceipts_CH_3', N'由SDK开发者参数决定', N'ReadReceipts', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadRole_CH_0', N'不控制', N'ReadRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadRole_CH_1', N'未阅读阻止发送', N'ReadRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReadRole_CH_2', N'未阅读做记录', N'ReadRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefBillRole_CH_0', N'不启用', N'RefBillRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefBillRole_CH_1', N'非必须选择关联单据', N'RefBillRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefBillRole_CH_2', N'必须选择关联单据', N'RefBillRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefMethodTypeLink_CH_0', N'模态窗口打开', N'RefMethodTypeLink', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefMethodTypeLink_CH_1', N'新窗口打开', N'RefMethodTypeLink', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefMethodTypeLink_CH_2', N'右侧窗口打开', N'RefMethodTypeLink', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefMethodTypeLink_CH_4', N'转到新页面', N'RefMethodTypeLink', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefWorkModel_CH_0', N'禁用', N'RefWorkModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefWorkModel_CH_1', N'静态Html脚本', N'RefWorkModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefWorkModel_CH_2', N'静态框架Url', N'RefWorkModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefWorkModel_CH_3', N'动态Url', N'RefWorkModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RefWorkModel_CH_4', N'动态Html脚本', N'RefWorkModel', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Repeat_CH_0', N'永不', N'Repeat', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Repeat_CH_1', N'每年', N'Repeat', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Repeat_CH_2', N'每月', N'Repeat', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnOneNodeRole_CH_0', N'不启用', N'ReturnOneNodeRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnOneNodeRole_CH_1', N'按照[退回信息填写字段]作为退回意见直接退回', N'ReturnOneNodeRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnOneNodeRole_CH_2', N'按照[审核组件]填写的信息作为退回意见直接退回', N'ReturnOneNodeRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnRole_CH_0', N'不能退回', N'ReturnRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnRole_CH_1', N'只能退回上一个节点', N'ReturnRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnRole_CH_2', N'可以退回任意节点', N'ReturnRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnRole_CH_3', N'退回指定的节点', N'ReturnRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnSendModel_CH_0', N'从退回节点正常执行', N'ReturnSendModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnSendModel_CH_1', N'直接发送到当前节点', N'ReturnSendModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ReturnSendModel_CH_2', N'直接发送到当前节点的下一个节点', N'ReturnSendModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenMode_CH_0', N'新窗口打开', N'RowOpenMode', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenMode_CH_1', N'在本窗口打开', N'RowOpenMode', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenMode_CH_2', N'弹出窗口打开,关闭后不刷新列表', N'RowOpenMode', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenMode_CH_3', N'弹出窗口打开,关闭后刷新列表', N'RowOpenMode', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenModel_CH_0', N'新窗口打开', N'RowOpenModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenModel_CH_1', N'弹出窗口打开,关闭后刷新列表', N'RowOpenModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowOpenModel_CH_2', N'弹出窗口打开,关闭后不刷新列表', N'RowOpenModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowSpanAttrString_CH_1', N'跨1个行', N'RowSpanAttrString', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowSpanAttrString_CH_2', N'跨2行', N'RowSpanAttrString', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RowSpanAttrString_CH_3', N'跨3行', N'RowSpanAttrString', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Rpt3SumModel_CH_0', N'不显示', N'Rpt3SumModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Rpt3SumModel_CH_1', N'底部', N'Rpt3SumModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Rpt3SumModel_CH_2', N'头部', N'Rpt3SumModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RptModel_CH_0', N'左边', N'RptModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'RptModel_CH_1', N'顶部', N'RptModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SaveModel_CH_0', N'仅节点表', N'SaveModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SaveModel_CH_1', N'节点表与Rpt表', N'SaveModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ScripRole_CH_0', N'禁用', N'ScripRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ScripRole_CH_1', N'按钮启用', N'ScripRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ScripRole_CH_2', N'发送启用', N'ScripRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchDictOpenType_CH_0', N'MyDictFrameWork.htm 实体与实体相关功能编辑器', N'SearchDictOpenType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchDictOpenType_CH_1', N'MyDict.htm 实体编辑器', N'SearchDictOpenType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchDictOpenType_CH_2', N'MyBill.htm 单据编辑器', N'SearchDictOpenType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchDictOpenType_CH_9', N'自定义URL', N'SearchDictOpenType', 9, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchUrlOpenType_CH_0', N'En.htm 实体与实体相关功能编辑器', N'SearchUrlOpenType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchUrlOpenType_CH_1', N'EnOnly.htm 实体编辑器', N'SearchUrlOpenType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchUrlOpenType_CH_2', N'/CCForm/FrmGener.htm 傻瓜表单解析器', N'SearchUrlOpenType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchUrlOpenType_CH_3', N'/CCForm/FrmGener.htm 自由表单解析器', N'SearchUrlOpenType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SearchUrlOpenType_CH_9', N'自定义URL', N'SearchUrlOpenType', 9, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SendModel_CH_0', N'给当前人员设置开始节点待办', N'SendModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SendModel_CH_1', N'发送到下一个节点', N'SendModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFOpenType_CH_0', N'工作查看器', N'SFOpenType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFOpenType_CH_1', N'流程轨迹', N'SFOpenType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFShowCtrl_CH_0', N'可以看所有的子流程', N'SFShowCtrl', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFShowCtrl_CH_1', N'仅仅可以看自己发起的子流程', N'SFShowCtrl', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFShowModel_CH_0', N'表格方式', N'SFShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFShowModel_CH_1', N'自由模式', N'SFShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFSta_CH_0', N'禁用', N'SFSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFSta_CH_1', N'启用', N'SFSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SFSta_CH_2', N'只读', N'SFSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SharingType_CH_0', N'共享', N'SharingType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SharingType_CH_1', N'私有', N'SharingType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ShowModel_CH_0', N'按钮', N'ShowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ShowModel_CH_1', N'超链接', N'ShowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ShowType_CH_0', N'显示', N'ShowType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ShowType_CH_1', N'PC折叠', N'ShowType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ShowType_CH_2', N'隐藏', N'ShowType', 2, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_0', N'不签名', N'SigantureEnabel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_1', N'图片签名', N'SigantureEnabel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_2', N'写字板', N'SigantureEnabel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_3', N'电子签名', N'SigantureEnabel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_4', N'电子盖章', N'SigantureEnabel', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SigantureEnabel_CH_5', N'电子签名+盖章', N'SigantureEnabel', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SkipTime_CH_0', N'上一个节点发送时', N'SkipTime', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SkipTime_CH_1', N'当前节点工作打开时', N'SkipTime', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_0', N'方向条件', N'SQLType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_1', N'接受人规则', N'SQLType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_2', N'下拉框数据过滤', N'SQLType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_3', N'级联下拉框', N'SQLType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_4', N'PopVal开窗返回值', N'SQLType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SQLType_CH_5', N'人员选择器人员选择范围', N'SQLType', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_0', N'本地的类', N'SrcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_1', N'创建表', N'SrcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_2', N'表或视图', N'SrcType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_3', N'SQL查询表', N'SrcType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_4', N'WebServices', N'SrcType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_5', N'微服务Handler外部数据源', N'SrcType', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_6', N'JavaScript外部数据源', N'SrcType', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_7', N'系统字典表', N'SrcType', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SrcType_CH_8', N'WebApi接口', N'SrcType', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowModel_CH_0', N'下级子流程', N'SubFlowModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowModel_CH_1', N'同级子流程', N'SubFlowModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowShowType_CH_0', N'平铺模式显示', N'SubFlowShowType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowShowType_CH_1', N'合并模式显示', N'SubFlowShowType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowSta_CH_0', N'禁用', N'SubFlowSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowSta_CH_1', N'启用', N'SubFlowSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowSta_CH_2', N'只读', N'SubFlowSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowType_CH_0', N'手动启动子流程', N'SubFlowType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowType_CH_1', N'触发启动子流程', N'SubFlowType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'SubFlowType_CH_2', N'延续子流程', N'SubFlowType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TabType_CH_0', N'本地表或视图', N'TabType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TabType_CH_1', N'通过一个SQL确定的一个外部数据源', N'TabType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TabType_CH_2', N'通过WebServices获得的一个数据源', N'TabType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Target_CH_0', N'新窗口', N'Target', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Target_CH_1', N'本窗口', N'Target', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'Target_CH_2', N'父窗口', N'Target', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TaskPRI_CH_0', N'高', N'TaskPRI', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TaskPRI_CH_1', N'中', N'TaskPRI', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TaskPRI_CH_2', N'低', N'TaskPRI', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TaskSta_CH_0', N'未完成', N'TaskSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TaskSta_CH_1', N'已完成', N'TaskSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TemplateFileModel_CH_0', N'rtf模版', N'TemplateFileModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TemplateFileModel_CH_1', N'VSTO模式的word模版', N'TemplateFileModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TemplateFileModel_CH_2', N'VSTO模式的Excel模版', N'TemplateFileModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TemplateFileModel_CH_3', N'Wps模板', N'TemplateFileModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TextModel_CH_0', N'普通文本', N'TextModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TextModel_CH_1', N'密码框', N'TextModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TextModel_CH_2', N'大文本', N'TextModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TextModel_CH_3', N'富文本', N'TextModel', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ThreadKillRole_CH_0', N'不能删除', N'ThreadKillRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ThreadKillRole_CH_1', N'手工删除', N'ThreadKillRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ThreadKillRole_CH_2', N'自动删除', N'ThreadKillRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ToobarExcType_CH_0', N'超链接', N'ToobarExcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'ToobarExcType_CH_1', N'函数', N'ToobarExcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TrackOrderBy_CH_0', N'按照时间先后顺序', N'TrackOrderBy', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TrackOrderBy_CH_1', N'倒序(新发生的在前面)', N'TrackOrderBy', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TSpan_CH_0', N'本周', N'TSpan', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TSpan_CH_1', N'上周', N'TSpan', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TSpan_CH_2', N'上上周', N'TSpan', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'TSpan_CH_3', N'更早', N'TSpan', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UIRowStyleGlo_CH_0', N'无风格', N'UIRowStyleGlo', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UIRowStyleGlo_CH_1', N'交替风格', N'UIRowStyleGlo', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UIRowStyleGlo_CH_2', N'鼠标移动', N'UIRowStyleGlo', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UIRowStyleGlo_CH_3', N'交替并鼠标移动', N'UIRowStyleGlo', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileCheck_CH_0', N'不控制', N'UploadFileCheck', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileCheck_CH_1', N'上传附件个数不能为0', N'UploadFileCheck', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileCheck_CH_2', N'每个类别下面的个数不能为0', N'UploadFileCheck', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileNumCheck_CH_0', N'不用校验', N'UploadFileNumCheck', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileNumCheck_CH_1', N'不能为空', N'UploadFileNumCheck', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UploadFileNumCheck_CH_2', N'每个类别下不能为空', N'UploadFileNumCheck', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UrlSrcType_CH_0', N'自定义', N'UrlSrcType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UrlSrcType_CH_1', N'地图', N'UrlSrcType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UrlSrcType_CH_2', N'流程轨迹表', N'UrlSrcType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'UrlSrcType_CH_3', N'流程轨迹图', N'UrlSrcType', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'USSWorkIDRole_CH_0', N'仅生成一个WorkID', N'USSWorkIDRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'USSWorkIDRole_CH_1', N'按接受人生成WorkID', N'USSWorkIDRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFSta_CH_0', N'运行中', N'WFSta', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFSta_CH_1', N'已完成', N'WFSta', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFSta_CH_2', N'其他', N'WFSta', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_0', N'空白', N'WFState', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_1', N'草稿', N'WFState', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_10', N'批处理', N'WFState', 10, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_11', N'加签回复状态', N'WFState', 11, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_2', N'运行中', N'WFState', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_3', N'已完成', N'WFState', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_4', N'挂起', N'WFState', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_5', N'退回', N'WFState', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_6', N'转发', N'WFState', 6, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_7', N'删除', N'WFState', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_8', N'加签', N'WFState', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFState_CH_9', N'冻结', N'WFState', 9, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_10', N'批处理', N'WFStateApp', 10, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_2', N'运行中', N'WFStateApp', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_3', N'已完成', N'WFStateApp', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_4', N'挂起', N'WFStateApp', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_5', N'退回', N'WFStateApp', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_6', N'转发', N'WFStateApp', 6, N'CH', N'', N'')
GO
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_7', N'删除', N'WFStateApp', 7, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_8', N'加签', N'WFStateApp', 8, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WFStateApp_CH_9', N'冻结', N'WFStateApp', 9, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhatAreYouTodo_CH_0', N'关闭提示窗口', N'WhatAreYouTodo', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhatAreYouTodo_CH_1', N'关闭提示窗口并刷新', N'WhatAreYouTodo', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhatAreYouTodo_CH_2', N'转入到Search.htm页面上去', N'WhatAreYouTodo', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhenOverSize_CH_0', N'不处理', N'WhenOverSize', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhenOverSize_CH_1', N'向下顺增行', N'WhenOverSize', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhenOverSize_CH_2', N'次页显示', N'WhenOverSize', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoExeIt_CH_0', N'操作员执行', N'WhoExeIt', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoExeIt_CH_1', N'机器执行', N'WhoExeIt', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoExeIt_CH_2', N'混合执行', N'WhoExeIt', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_0', N'WorkID是主键', N'WhoIsPK', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_1', N'FID是主键(干流程的WorkID)', N'WhoIsPK', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_2', N'父流程ID是主键', N'WhoIsPK', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_3', N'延续流程ID是主键', N'WhoIsPK', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_4', N'P2WorkID是主键', N'WhoIsPK', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WhoIsPK_CH_5', N'P3WorkID是主键', N'WhoIsPK', 5, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardH_CH_0', N'75%', N'WinCardH', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardH_CH_1', N'50%', N'WinCardH', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardH_CH_2', N'100%', N'WinCardH', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardH_CH_3', N'85%', N'WinCardH', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardH_CH_4', N'25%', N'WinCardH', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardW_CH_0', N'75%', N'WinCardW', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardW_CH_1', N'50%', N'WinCardW', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardW_CH_2', N'100%', N'WinCardW', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WinCardW_CH_3', N'25%', N'WinCardW', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsDBType_CH_0', N'数据库查询SQL', N'WindowsDBType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsDBType_CH_1', N'执行Url返回Json', N'WindowsDBType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsDBType_CH_2', N'执行\DataUser\JSLab\Windows.js的函数.', N'WindowsDBType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsShowType_CH_0', N'饼图', N'WindowsShowType', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsShowType_CH_1', N'柱图', N'WindowsShowType', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsShowType_CH_2', N'折线图', N'WindowsShowType', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WindowsShowType_CH_4', N'简单Table', N'WindowsShowType', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WorkRecModel_CH_0', N'日志', N'WorkRecModel', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WorkRecModel_CH_1', N'周报', N'WorkRecModel', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'WorkRecModel_CH_2', N'月报', N'WorkRecModel', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'YBFlowReturnRole_CH_0', N'不能退回', N'YBFlowReturnRole', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'YBFlowReturnRole_CH_1', N'退回到父流程的开始节点', N'YBFlowReturnRole', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'YBFlowReturnRole_CH_2', N'退回到父流程的任何节点', N'YBFlowReturnRole', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'YBFlowReturnRole_CH_3', N'退回父流程的启动节点', N'YBFlowReturnRole', 3, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'YBFlowReturnRole_CH_4', N'可退回到指定的节点', N'YBFlowReturnRole', 4, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'表单展示方式_CH_0', N'普通方式', N'表单展示方式', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'表单展示方式_CH_1', N'页签方式', N'表单展示方式', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'傻瓜表单显示方式_CH_0', N'4列', N'傻瓜表单显示方式', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'傻瓜表单显示方式_CH_1', N'6列', N'傻瓜表单显示方式', 1, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'傻瓜表单显示方式_CH_2', N'上下模式3列', N'傻瓜表单显示方式', 2, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'实体表单显示列数_CH_0', N'4列', N'实体表单显示列数', 0, N'CH', N'', N'')
INSERT [dbo].[sys_enum] ([MyPK], [Lab], [EnumKey], [IntKey], [Lang], [OrgNo], [StrKey]) VALUES (N'实体表单显示列数_CH_1', N'6列', N'实体表单显示列数', 1, N'CH', N'', N'')
INSERT [dbo].[sys_formtree] ([No], [Name], [ParentNo], [Idx], [OrgNo], [ShortName], [Domain]) VALUES (N'1', N'表单库', N'0', 0, N'', N'', N'')
INSERT [dbo].[sys_formtree] ([No], [Name], [ParentNo], [Idx], [OrgNo], [ShortName], [Domain]) VALUES (N'100', N'表单树', N'0', 0, N'', N'', N'')
INSERT [dbo].[sys_formtree] ([No], [Name], [ParentNo], [Idx], [OrgNo], [ShortName], [Domain]) VALUES (N'102', N'流程独立表单', N'0', 0, N'', N'', N'')
INSERT [dbo].[sys_formtree] ([No], [Name], [ParentNo], [Idx], [OrgNo], [ShortName], [Domain]) VALUES (N'104', N'常用信息管理', N'0', 0, N'', N'', N'')
INSERT [dbo].[sys_formtree] ([No], [Name], [ParentNo], [Idx], [OrgNo], [ShortName], [Domain]) VALUES (N'106', N'常用单据', N'0', 0, N'', N'', N'')
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@FK_ND', N'当前年度', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@FK_YF', N'当前月份', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.FK_Dept', N'登陆人员部门编号', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.FK_DeptFullName', N'登陆人员部门全称', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.FK_DeptName', N'登陆人员部门名称', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.Name', N'登陆人员名称', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.No', N'登陆人员账号', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.OrgName', N'登录人员组织名称', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@WebUser.OrgNo', N'登录人员组织', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@yyyy年MM月dd日', N'当前日期(yyyy年MM月dd日)', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@yyyy年MM月dd日HH时mm分', N'当前日期(yyyy年MM月dd日HH时mm分)', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@yy年MM月dd日', N'当前日期(yy年MM月dd日)', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'@yy年MM月dd日HH时mm分', N'当前日期(yy年MM月dd日HH时mm分)', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'0', N'选择系统约定默认值', NULL, N'DefVal', NULL, 0)
INSERT [dbo].[sys_glovar] ([No], [Name], [Val], [GroupKey], [Note], [Idx]) VALUES (N'FlowDevModel_admin', N'FlowDevModel', N'2', NULL, NULL, 0)
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (101, N'填写请假申请单', N'ND101', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (103, N'流程信息', N'ND1Rpt', N'', N'', 0, 0, 2, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (105, N'填写请假申请单', N'ND102', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (107, N'部门经理审批', N'ND102', N'', N'', 0, 0, 2, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (109, N'填写请假申请单', N'ND103', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (111, N'部门经理审批', N'ND103', N'', N'', 0, 0, 2, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (113, N'总经理审批', N'ND103', N'', N'', 0, 0, 3, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (115, N'填写请假申请单', N'ND104', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (117, N'部门经理审批', N'ND104', N'', N'', 0, 0, 2, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (119, N'总经理审批', N'ND104', N'', N'', 0, 0, 3, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (121, N'基础信息', N'ND201', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (123, N'基础信息', N'ND202', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (125, N'基础信息', N'ND2Rpt', N'', N'', 0, 0, 1, N'', N'')
INSERT [dbo].[sys_groupfield] ([OID], [Lab], [FrmID], [CtrlType], [CtrlID], [IsZDMobile], [ShowType], [Idx], [GUID], [AtPara]) VALUES (127, N'流程信息', N'ND2Rpt', N'', N'', 0, 0, 2, N'', N'')
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_AtPara', N'ND101', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_CDT', N'ND101', N'CDT', N'发起时间', N'@RDT', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1001, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_Dao', N'ND101', N'Dao', N'到', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1008, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_Emps', N'ND101', N'Emps', N'Emps', N'', 0, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1003, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_FID', N'ND101', N'FID', N'FID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1000, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_FK_Dept', N'ND101', N'FK_Dept', N'操作员部门', N'', 0, 1, 1, 2, 100, 23, 0, 100, N'BP.Port.Depts', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1004, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_FK_NY', N'ND101', N'FK_NY', N'年月', N'', 0, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1005, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_OID', N'ND101', N'OID', N'OID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_QingJiaRiQiCong', N'ND101', N'QingJiaRiQiCong', N'请假日期从', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1007, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_QingJiaTianShu', N'ND101', N'QingJiaTianShu', N'请假天数', N'0', 0, 0, 3, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1009, N'0', N'@IsSum=0@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_QingJiaYuanYin', N'ND101', N'QingJiaYuanYin', N'请假原因', N'', 0, 0, 1, 0, 100, 123, 0, 50, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'101', 1, N'0', N'0', 1010, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_RDT', N'ND101', N'RDT', N'更新时间', N'@RDT', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_Rec', N'ND101', N'Rec', N'发起人', N'@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1002, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_ShenQingRen', N'ND101', N'ShenQingRen', N'申请人', N'@WebUser.Name', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 1, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_ShenQingRenBuMen', N'ND101', N'ShenQingRenBuMen', N'申请人部门', N'@WebUser.FK_DeptName', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'101', 1, N'0', N'0', 3, N'0', N'@FontSize=12@IsRichText=0@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_ShenQingRiJi', N'ND101', N'ShenQingRiJi', N'申请日期', N'@RDT', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', 2, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND101_Title', N'ND101', N'Title', N'标题', N'', 0, 0, 1, 0, 251, 23, 0, 200, N'', N'', N'', 0, 0, 1, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'101', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_AtPara', N'ND102', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_BMJLSP_Checker', N'ND102', N'BMJLSP_Checker', N'审核人', N'@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'107', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_BMJLSP_Note', N'ND102', N'BMJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 1, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'107', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_BMJLSP_RDT', N'ND102', N'BMJLSP_RDT', N'审核日期', N'@RDT', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'107', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_CDT', N'ND102', N'CDT', N'发起时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1001, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_Dao', N'ND102', N'Dao', N'到', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1008, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_Emps', N'ND102', N'Emps', N'Emps', N'', 0, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1003, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_FID', N'ND102', N'FID', N'FID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1000, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_FK_Dept', N'ND102', N'FK_Dept', N'操作员部门', N'', 0, 1, 1, 2, 100, 23, 0, 100, N'BP.Port.Depts', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1004, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_FK_NY', N'ND102', N'FK_NY', N'年月', N'', 0, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1005, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_OID', N'ND102', N'OID', N'OID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_QingJiaRiQiCong', N'ND102', N'QingJiaRiQiCong', N'请假日期从', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1007, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_QingJiaTianShu', N'ND102', N'QingJiaTianShu', N'请假天数', N'0', 0, 0, 3, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1009, N'0', N'@IsSum=0@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_QingJiaYuanYin', N'ND102', N'QingJiaYuanYin', N'请假原因', N'', 0, 0, 1, 0, 100, 123, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'105', 1, N'0', N'0', 1010, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_RDT', N'ND102', N'RDT', N'更新时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_Rec', N'ND102', N'Rec', N'发起人', N'', 0, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1002, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_ShenQingRen', N'ND102', N'ShenQingRen', N'申请人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 1, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_ShenQingRenBuMen', N'ND102', N'ShenQingRenBuMen', N'申请人部门', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'105', 1, N'0', N'0', 3, N'0', N'@FontSize=12@IsRichText=0@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_ShenQingRiJi', N'ND102', N'ShenQingRiJi', N'申请日期', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', 2, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND102_Title', N'ND102', N'Title', N'标题', N'', 0, 0, 1, 0, 251, 23, 0, 200, N'', N'', N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'105', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_AtPara', N'ND103', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_BMJLSP_Checker', N'ND103', N'BMJLSP_Checker', N'审核人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'111', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_BMJLSP_Note', N'ND103', N'BMJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'111', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_BMJLSP_RDT', N'ND103', N'BMJLSP_RDT', N'审核日期', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'111', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_CDT', N'ND103', N'CDT', N'发起时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1001, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_Dao', N'ND103', N'Dao', N'到', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1008, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_Emps', N'ND103', N'Emps', N'Emps', N'', 0, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1003, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_FID', N'ND103', N'FID', N'FID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1000, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_FK_Dept', N'ND103', N'FK_Dept', N'操作员部门', N'', 0, 1, 1, 2, 100, 23, 0, 100, N'BP.Port.Depts', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1004, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_FK_NY', N'ND103', N'FK_NY', N'年月', N'', 0, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1005, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_OID', N'ND103', N'OID', N'OID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_QingJiaRiQiCong', N'ND103', N'QingJiaRiQiCong', N'请假日期从', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1007, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_QingJiaTianShu', N'ND103', N'QingJiaTianShu', N'请假天数', N'0', 0, 0, 3, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1009, N'0', N'@IsSum=0@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_QingJiaYuanYin', N'ND103', N'QingJiaYuanYin', N'请假原因', N'', 0, 0, 1, 0, 100, 123, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'109', 1, N'0', N'0', 1010, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_RDT', N'ND103', N'RDT', N'更新时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_Rec', N'ND103', N'Rec', N'发起人', N'', 0, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1002, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ShenQingRen', N'ND103', N'ShenQingRen', N'申请人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 1, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ShenQingRenBuMen', N'ND103', N'ShenQingRenBuMen', N'申请人部门', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'109', 1, N'0', N'0', 3, N'0', N'@FontSize=12@IsRichText=0@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ShenQingRiJi', N'ND103', N'ShenQingRiJi', N'申请日期', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', 2, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_Title', N'ND103', N'Title', N'标题', N'', 0, 0, 1, 0, 251, 23, 0, 200, N'', N'', N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'109', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ZJLSP_Checker', N'ND103', N'ZJLSP_Checker', N'审核人', N'@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'113', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ZJLSP_Note', N'ND103', N'ZJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 1, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'113', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND103_ZJLSP_RDT', N'ND103', N'ZJLSP_RDT', N'审核日期', N'@RDT', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'113', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_AtPara', N'ND104', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_BMJLSP_Checker', N'ND104', N'BMJLSP_Checker', N'审核人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'117', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_BMJLSP_Note', N'ND104', N'BMJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'117', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_BMJLSP_RDT', N'ND104', N'BMJLSP_RDT', N'审核日期', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'117', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_CDT', N'ND104', N'CDT', N'发起时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1001, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_Dao', N'ND104', N'Dao', N'到', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1008, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_Emps', N'ND104', N'Emps', N'Emps', N'', 0, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1003, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_FID', N'ND104', N'FID', N'FID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1000, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_FK_Dept', N'ND104', N'FK_Dept', N'操作员部门', N'', 0, 1, 1, 2, 100, 23, 0, 100, N'BP.Port.Depts', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1004, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_FK_NY', N'ND104', N'FK_NY', N'年月', N'', 0, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1005, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_OID', N'ND104', N'OID', N'OID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_QingJiaRiQiCong', N'ND104', N'QingJiaRiQiCong', N'请假日期从', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1007, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_QingJiaTianShu', N'ND104', N'QingJiaTianShu', N'请假天数', N'0', 0, 0, 3, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1009, N'0', N'@IsSum=0@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_QingJiaYuanYin', N'ND104', N'QingJiaYuanYin', N'请假原因', N'', 0, 0, 1, 0, 100, 123, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'115', 1, N'0', N'0', 1010, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_RDT', N'ND104', N'RDT', N'更新时间', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_Rec', N'ND104', N'Rec', N'发起人', N'', 0, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1002, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ShenQingRen', N'ND104', N'ShenQingRen', N'申请人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 1, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ShenQingRenBuMen', N'ND104', N'ShenQingRenBuMen', N'申请人部门', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'115', 1, N'0', N'0', 3, N'0', N'@FontSize=12@IsRichText=0@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ShenQingRiJi', N'ND104', N'ShenQingRiJi', N'申请日期', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', 2, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_Title', N'ND104', N'Title', N'标题', N'', 0, 0, 1, 0, 251, 23, 0, 200, N'', N'', N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'115', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ZJLSP_Checker', N'ND104', N'ZJLSP_Checker', N'审核人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'119', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ZJLSP_Note', N'ND104', N'ZJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'119', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND104_ZJLSP_RDT', N'ND104', N'ZJLSP_RDT', N'审核日期', N'', 0, 0, 7, 0, 145, 23, 0, 20, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'119', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_AtPara', N'ND1Rpt', N'AtPara', N'参数', N'', 0, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_BillNo', N'ND1Rpt', N'BillNo', N'单据编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_BMJLSP_Checker', N'ND1Rpt', N'BMJLSP_Checker', N'审核人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'107', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_BMJLSP_Note', N'ND1Rpt', N'BMJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'107', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_BMJLSP_RDT', N'ND1Rpt', N'BMJLSP_RDT', N'审核日期', N'', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'107', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_CDT', N'ND1Rpt', N'CDT', N'活动时间', N'', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1001, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_Dao', N'ND1Rpt', N'Dao', N'到', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1008, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_Emps', N'ND1Rpt', N'Emps', N'参与者', N'', 0, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1003, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FID', N'ND1Rpt', N'FID', N'FID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1000, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FK_Dept', N'ND1Rpt', N'FK_Dept', N'操作员部门', N'', 0, 0, 1, 0, 100, 23, 0, 100, N'BP.Port.Depts', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', 1004, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FK_NY', N'ND1Rpt', N'FK_NY', N'年月', N'', 0, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', 1005, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowDaySpan', N'ND1Rpt', N'FlowDaySpan', N'流程时长(天)', N'', 1, 0, 3, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowEmps', N'ND1Rpt', N'FlowEmps', N'参与人', N'', 1, 0, 1, 0, 100, 23, 0, 1000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowEnder', N'ND1Rpt', N'FlowEnder', N'结束人', N'', 1, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowEnderRDT', N'ND1Rpt', N'FlowEnderRDT', N'结束时间', N'', 1, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowEndNode', N'ND1Rpt', N'FlowEndNode', N'结束节点', N'', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowStarter', N'ND1Rpt', N'FlowStarter', N'发起人', N'', 1, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
GO
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_FlowStartRDT', N'ND1Rpt', N'FlowStartRDT', N'发起时间', N'', 1, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_GUID', N'ND1Rpt', N'GUID', N'GUID', N'', 1, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_OID', N'ND1Rpt', N'OID', N'OID', N'0', 0, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PEmp', N'ND1Rpt', N'PEmp', N'调起子流程的人员', N'', 1, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PFlowNo', N'ND1Rpt', N'PFlowNo', N'父流程编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PNodeID', N'ND1Rpt', N'PNodeID', N'父流程启动的节点', N'', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PrjName', N'ND1Rpt', N'PrjName', N'项目名称', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PrjNo', N'ND1Rpt', N'PrjNo', N'项目编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_PWorkID', N'ND1Rpt', N'PWorkID', N'父流程WorkID', N'', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_QingJiaRiQiCong', N'ND1Rpt', N'QingJiaRiQiCong', N'请假日期从', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1007, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_QingJiaTianShu', N'ND1Rpt', N'QingJiaTianShu', N'请假天数', N'0', 0, 0, 3, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1009, N'0', N'@IsSum=0@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_QingJiaYuanYin', N'ND1Rpt', N'QingJiaYuanYin', N'请假原因', N'', 0, 0, 1, 0, 100, 123, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'100', 1, N'0', N'0', 1010, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_RDT', N'ND1Rpt', N'RDT', N'更新时间', N'', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 1, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 999, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_Rec', N'ND1Rpt', N'Rec', N'发起人', N'', 0, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1002, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ShenQingRen', N'ND1Rpt', N'ShenQingRen', N'申请人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 1, N'0', N'@IsRichText=0@FontSize=12@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ShenQingRenBuMen', N'ND1Rpt', N'ShenQingRenBuMen', N'申请人部门', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'100', 1, N'0', N'0', 3, N'0', N'@FontSize=12@IsRichText=0@IsSupperText=0', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ShenQingRiJi', N'ND1Rpt', N'ShenQingRiJi', N'申请日期', N'', 0, 0, 6, 0, 125, 23, 0, 10, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', 2, N'0', N'@FontSize=12', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_Title', N'ND1Rpt', N'Title', N'标题', N'', 0, 0, 1, 0, 251, 23, 0, 200, N'', N'', N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'100', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_WFSta', N'ND1Rpt', N'WFSta', N'状态', N'', 1, 1, 2, 1, 100, 23, 0, 1000, N'WFSta', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_WFState', N'ND1Rpt', N'WFState', N'流程状态', N'', 1, 1, 2, 1, 100, 23, 0, 1000, N'WFState', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ZJLSP_Checker', N'ND1Rpt', N'ZJLSP_Checker', N'审核人', N'', 0, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ZJLSP_Note', N'ND1Rpt', N'ZJLSP_Note', N'审核意见', N'', 0, 0, 1, 0, 100, 69, 0, 4000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 4, 1, 1, N'103', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND1Rpt_ZJLSP_RDT', N'ND1Rpt', N'ZJLSP_RDT', N'审核日期', N'', 0, 0, 7, 0, 145, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 1, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'103', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_AtPara', N'ND201', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_Emps', N'ND201', N'Emps', N'Emps', N'', 1, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 5, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_FID', N'ND201', N'FID', N'FID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_FK_Dept', N'ND201', N'FK_Dept', N'操作员部门', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 6, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_FK_DeptName', N'ND201', N'FK_DeptName', N'操作员部门名称', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 7, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_FK_NY', N'ND201', N'FK_NY', N'年月', N'', 1, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 9, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_OID', N'ND201', N'OID', N'WorkID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_RDT', N'ND201', N'RDT', N'接受时间', N'@RDT', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_Rec', N'ND201', N'Rec', N'完成时间', N'@RDT', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 4, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_SQDept', N'ND201', N'SQDept', N'申请人部门', N'@WebUser.FK_DeptName', 1, 0, 1, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'121', 1, N'0', N'0', 12, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_SQR', N'ND201', N'SQR', N'申请人', N'@WebUser.Name', 1, 0, 1, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 10, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_SQRQ', N'ND201', N'SQRQ', N'申请日期', N'@RDT', 1, 0, 7, 0, 165, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 11, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND201_Title', N'ND201', N'Title', N'标题', N'', 1, 0, 1, 0, 100, 23, 0, 200, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 8, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_AtPara', N'ND202', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_Emps', N'ND202', N'Emps', N'Emps', N'', 1, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 5, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_FID', N'ND202', N'FID', N'FID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_FK_Dept', N'ND202', N'FK_Dept', N'操作员部门', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 6, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_FK_DeptName', N'ND202', N'FK_DeptName', N'操作员部门名称', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 7, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_OID', N'ND202', N'OID', N'WorkID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_RDT', N'ND202', N'RDT', N'接受时间', N'@RDT', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND202_Rec', N'ND202', N'Rec', N'发起时间', N'@RDT', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'123', 1, N'0', N'0', 4, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_AtPara', N'ND2Rpt', N'AtPara', N'参数', N'', 1, 0, 1, 0, 100, 23, 0, 4000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_BillNo', N'ND2Rpt', N'BillNo', N'单据编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_Emps', N'ND2Rpt', N'Emps', N'参与者', N'', 1, 0, 1, 0, 100, 23, 0, 8000, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 5, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FID', N'ND2Rpt', N'FID', N'FID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 2, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FK_Dept', N'ND2Rpt', N'FK_Dept', N'操作员部门', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', 6, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FK_DeptName', N'ND2Rpt', N'FK_DeptName', N'操作员部门名称', N'', 1, 0, 1, 0, 100, 23, 0, 50, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 7, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FK_NY', N'ND2Rpt', N'FK_NY', N'年月', N'', 1, 0, 1, 0, 100, 23, 0, 7, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', 9, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowDaySpan', N'ND2Rpt', N'FlowDaySpan', N'流程时长(天)', N'0', 1, 0, 3, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 1, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowEmps', N'ND2Rpt', N'FlowEmps', N'参与人', N'', 1, 0, 1, 0, 100, 23, 0, 1000, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowEnder', N'ND2Rpt', N'FlowEnder', N'结束人', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowEnderRDT', N'ND2Rpt', N'FlowEnderRDT', N'结束时间', N'', 1, 0, 7, 0, 165, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowEndNode', N'ND2Rpt', N'FlowEndNode', N'结束节点', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowStarter', N'ND2Rpt', N'FlowStarter', N'发起人', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_FlowStartRDT', N'ND2Rpt', N'FlowStartRDT', N'发起时间', N'', 1, 0, 7, 0, 165, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_GUID', N'ND2Rpt', N'GUID', N'GUID', N'', 1, 0, 1, 0, 100, 23, 0, 32, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_OID', N'ND2Rpt', N'OID', N'WorkID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 2, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PEmp', N'ND2Rpt', N'PEmp', N'调起子流程的人员', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PFlowNo', N'ND2Rpt', N'PFlowNo', N'父流程编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 1, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PNodeID', N'ND2Rpt', N'PNodeID', N'父流程启动的节点', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PrjName', N'ND2Rpt', N'PrjName', N'项目名称', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PrjNo', N'ND2Rpt', N'PrjNo', N'项目编号', N'', 1, 0, 1, 0, 100, 23, 0, 100, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -100, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_PWorkID', N'ND2Rpt', N'PWorkID', N'父流程WorkID', N'0', 1, 0, 2, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -101, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_RDT', N'ND2Rpt', N'RDT', N'接受时间', N'', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 3, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_Rec', N'ND2Rpt', N'Rec', N'完成时间', N'', 1, 0, 7, 0, 165, 23, 0, 40, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'1', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 4, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_SQDept', N'ND2Rpt', N'SQDept', N'申请人部门', N'', 1, 0, 1, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 3, 1, 1, N'121', 1, N'0', N'0', 12, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_SQR', N'ND2Rpt', N'SQR', N'申请人', N'', 1, 0, 1, 0, 100, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 10, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_SQRQ', N'ND2Rpt', N'SQRQ', N'申请日期', N'', 1, 0, 7, 0, 165, 23, 0, 300, N'', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 11, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_Title', N'ND2Rpt', N'Title', N'标题', N'', 1, 0, 1, 0, 100, 23, 0, 200, N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'', N'', N'', N'', N'', 1, 1, 1, N'121', 1, N'0', N'0', 8, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_WFSta', N'ND2Rpt', N'WFSta', N'状态', N'', 1, 1, 2, 1, 100, 23, 0, 1000, N'WFSta', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'125', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapattr] ([MyPK], [FK_MapData], [KeyOfEn], [Name], [DefVal], [DefValType], [UIContralType], [MyDataType], [LGType], [UIWidth], [UIHeight], [MinLen], [MaxLen], [UIBindKey], [UIRefKey], [UIRefKeyText], [ExtIsSum], [UIVisible], [UIIsEnable], [UIIsLine], [UIIsInput], [TextModel], [IsSupperText], [FontSize], [IsSigan], [GUID], [EditType], [Tag], [Tag1], [Tag2], [Tag3], [Tip], [ColSpan], [LabelColSpan], [RowSpan], [GroupID], [IsEnableInAPP], [CSSCtrl], [CSSLabel], [Idx], [ICON], [AtPara], [GroupIDText], [CSSCtrlText], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [ExtDefVal], [ExtDefValText], [CSSLabelText], [DefValText], [RBShowModel], [NumMin], [NumMax], [NumStepLength]) VALUES (N'ND2Rpt_WFState', N'ND2Rpt', N'WFState', N'流程状态', N'', 1, 1, 2, 1, 100, 23, 0, 1000, N'WFState', N'', N'', 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 1, N'', N'', N'', N'', N'', 1, 1, 1, N'127', 1, N'0', N'0', -1, N'0', N'', N'0', N'0', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'0', N'0', N'0', N'0', 3, N'', N'', CAST(1.00 AS Numeric(11, 2)))
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND101', N'填写请假申请单', N'', N'', N'ND1Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'2020-04-05 18:22:56', N'', N'', N'@IsHaveCA=0@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND102', N'部门经理审批', N'', N'', N'ND1Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'2020-04-05 20:44:37', N'', N'', N'@IsHaveCA=0@Ver=1', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND103', N'总经理审批', N'', N'', N'ND1Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'2020-04-05 20:45:03', N'', N'', N'@IsHaveCA=0@Ver=1', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND104', N'反馈给申请人', N'', N'', N'ND1Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'2020-04-05 20:45:19', N'', N'', N'@IsHaveCA=0@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND1Rpt', N'请假流程-经典表单-演示', N'', N'', N'ND1Rpt', 0, N'', N'', 900, 0, N'', N'', 1, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'2020-04-05 20:52:19', N'', N'', N'@IsHaveCA=0@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND201', N'Start Node', N'', N'', N'ND2Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'', N'', N'', N'@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND202', N'Node 2', N'', N'', N'ND2Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'', N'', N'', N'@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_mapdata] ([No], [Name], [FormEventEntity], [EnPK], [PTable], [PTableModel], [UrlExt], [Dtls], [FrmW], [TableCol], [Tag], [FK_FormTree], [FrmType], [FrmShowType], [EntityType], [IsEnableJs], [AppType], [DBSrc], [BodyAttr], [Note], [Designer], [DesignerUnit], [DesignerContact], [Idx], [GUID], [Ver], [Icon], [FlowCtrls], [AtPara], [OrgNo], [IsTemplate], [DBType], [ExpEn], [ExpList], [MainTable], [MainTablePK], [ExpCount], [RowOpenModel], [SearchDictOpenType], [PopHeight], [PopWidth], [EntityEditModel], [BillNoFormat], [SortColumns], [ColorSet], [FieldSet], [ForamtFunc], [IsSelectMore], [TitleRole], [RowColorSet], [RefDict], [BtnRefBill], [RefBillRole], [RefBill], [Tag0], [Tag1], [Tag2], [EntityShowModel], [FK_Flow], [DBURL], [URL], [TemplaterVer], [DBSave], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [RefWorkModel], [RefBlurField], [RefUrl], [RefHtml], [RightViewWay], [RightViewTag], [RightDeptWay], [RightDeptTag], [HtmlTemplateFile]) VALUES (N'ND2Rpt', N'不合格评审单', N'', N'', N'ND2Rpt', 0, N'', N'', 900, 0, N'', N'', 0, 0, 0, 0, 0, N'local', N'', N'', N'', N'', N'', 100, N'', N'', N'', N'', N'@Ver=1@MapDtls_AutoNum=0', N'', 0, 0, N'', N'', N'', N'', N'', 2, 0, 500, 760, 0, N'', N'', N'', N'', N'', 1, N'', N'', N'', N'关联单据', 0, N'', N'', NULL, N'', 0, N'', 0, N'', N'', N'', N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), 0, N'', N'', NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[sys_serial] ([CfgKey], [IntVal]) VALUES (N'BP.WF.Template.FlowSort', 102)
INSERT [dbo].[sys_serial] ([CfgKey], [IntVal]) VALUES (N'BP.WF.Template.SysFormTree', 106)
INSERT [dbo].[sys_serial] ([CfgKey], [IntVal]) VALUES (N'OID', 127)
INSERT [dbo].[sys_serial] ([CfgKey], [IntVal]) VALUES (N'UpdataCCFlowVer', 2023080101)
INSERT [dbo].[sys_serial] ([CfgKey], [IntVal]) VALUES (N'Ver', 20230221)
INSERT [dbo].[sys_sfdbsrc] ([No], [Name], [DBSrcType], [DBSrcTypeT], [DBName], [ConnString], [AtPara]) VALUES (N'CCFromRef', N'本机JavaScript数据源', N'CCFromRef', N'local', N'', N'', N'@EditType=1')
INSERT [dbo].[sys_sfdbsrc] ([No], [Name], [DBSrcType], [DBSrcTypeT], [DBName], [ConnString], [AtPara]) VALUES (N'local', N'本机数据库', N'local', N'local', N'', N'', N'@EditType=1')
INSERT [dbo].[sys_sfdbsrc] ([No], [Name], [DBSrcType], [DBSrcTypeT], [DBName], [ConnString], [AtPara]) VALUES (N'LocalHandler', N'内置Handler', N'LocalHandler', N'local', N'', N'', N'@EditType=1')
INSERT [dbo].[sys_sfdbsrc] ([No], [Name], [DBSrcType], [DBSrcTypeT], [DBName], [ConnString], [AtPara]) VALUES (N'LocalWS', N'内置WebServies', N'LocalWS', N'local', N'', N'', N'@EditType=1')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'0ef94ef5-9312-4eba-9646-07d3143590f5', N'admin', N'admin', N'2023-08-04 23:42', N'127.0.0.1', N'表结构@icon-organization@../../WF/Comm/Sys/SystemClass.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'106048fa-d63a-4719-a7e6-e450f8f80096', N'admin', N'admin', N'2023-08-04 15:58', N'127.0.0.1', N'我的设置@icon-settings@../../WF/Setting/Default.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'11f4ac25-ca60-4fdc-ae15-970946aac362', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'系统字典@icon-book-open@../../WF/Comm/Search.htm?EnsName=BP.Sys.SFTables', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'131ab07d-876e-4870-a6b2-5aac72d57509', N'admin', N'admin', N'2023-08-05 15:22', N'127.0.0.1', N'人员台帐@icon-list@../../WF/Comm/Search.htm?EnsName=BP.Port.Emps', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'15fecce4-e002-48ae-a89c-124c1c3c6733', N'admin', N'admin', N'2023-08-04 15:58', N'127.0.0.1', N'挂起的工作@icon-loop@../../WF/HungupList.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'1cd51ac5-ffb8-48d8-92c8-e42b9b2ec746', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'数据源@icon-layers@../../WF/Comm/Search.htm?EnsName=BP.Sys.SFDBSrcs', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'2779e9df-7f1d-48de-8eac-a2fc1dfcbc69', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'岗位维护@icon-note@../../WF/Comm/Ens.htm?EnsName=BP.Port.Stations', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'27979b3f-e458-498b-8889-0afbc743b107', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'系统字典@icon-book-open@../../WF/Comm/Search.htm?EnsName=BP.Sys.SFTables', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'341dc949-4f9c-4670-8e18-af988ac4d175', N'admin', N'admin', N'2023-08-04 16:00', N'127.0.0.1', N'组织结构@icon-people@../../GPM/Organization.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'3dc019c0-d3e7-47ad-bebd-9e6800446036', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'系统枚举@icon-note@../../WF/Admin/FoolFormDesigner/SysEnumList.htm?DoType=AddEnum', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'4420b566-8ad7-4dda-a6a1-07c381ae0ea6', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'自动报表@icon-pie-chart@../../WF/Comm/Search.htm?EnsName=BP.WF.Data.AutoRpts', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'45a27814-d9c4-433a-ab4d-b74550a9a2c1', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'岗位类型维护@icon-note@../../WF/Comm/Ens.htm?EnsName=BP.Port.StationTypes', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'539ad092-6140-4404-89e4-13d520762d0b', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'自动报表@icon-pie-chart@../../WF/Comm/Search.htm?EnsName=BP.WF.Data.AutoRpts', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'5ade5802-dfd1-4d0d-ad4a-50c3f68f1965', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'人员台帐@icon-list@../../WF/Comm/Search.htm?EnsName=BP.Port.Emps', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'5d53be3c-24cd-4f91-9fba-c20a68462a44', N'admin', N'admin', N'2023-08-04 16:00', N'127.0.0.1', N'对应人员(3)@icon-drop@BranchesAndLeaf.htm?EnName=BP.Port.Dept&Dot2DotEnsName=BP.Port.DeptEmps&Dot2DotEnName=BP.Port.DeptEmp&AttrOfOneInMM=FK_Dept&AttrOfMInMM=FK_Emp&EnsOfM=BP.Port.Emps&DefaultGroupAttrKey=FK_Dept&RootNo=&No=1001&PKVal=1001', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'60be41e0-efca-4204-8b03-681da1c0b323', N'admin', N'admin', N'2023-08-04 15:59', N'127.0.0.1', N'已完成@fa-hourglass-end@../../WF/Complete.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'67663275-661c-4391-8180-bfc2d2a4da0a', N'admin', N'admin', N'2023-08-04 15:59', N'127.0.0.1', N'发起@icon-paper-plane@../../WF/Start.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'75786d85-0f1e-4939-8f78-eebc51a6a4b0', N'admin', N'admin', N'2023-08-04 15:59', N'127.0.0.1', N'最近发起@icon-share-alt@../../WF/StartEarlyer.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'7fc347a9-869d-4992-9429-f8bc06f70ba5', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'岗位维护@icon-note@../../WF/Comm/Ens.htm?EnsName=BP.Port.Stations', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'8cb3e9cc-757f-4afc-b028-d29ab3442913', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'系统枚举@icon-note@../../WF/Admin/FoolFormDesigner/SysEnumList.htm?DoType=AddEnum', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'8e715832-e175-463d-8c03-43b2de5b05c1', N'admin', N'admin', N'2023-08-05 15:22', N'127.0.0.1', N'系统枚举@icon-note@../../WF/Admin/FoolFormDesigner/SysEnumList.htm?DoType=AddEnum', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'a18c9cb5-a994-416e-8d3e-2b378293da31', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'节假日设置@icon-notebook@../../WF/Comm/Sys/Holiday.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'a76b8b5c-dbfd-4943-98d3-5b220a385436', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'人员台帐@icon-list@../../WF/Comm/Search.htm?EnsName=BP.Port.Emps', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'abadf7af-db50-4113-aa27-01ed43908a91', N'admin', N'admin', N'2023-08-05 15:22', N'127.0.0.1', N'自动报表@icon-pie-chart@../../WF/Comm/Search.htm?EnsName=BP.WF.Data.AutoRpts', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'b127a427-7aba-4da7-8538-8fa795297f1b', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'组织结构@icon-people@../../GPM/Organization.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'b43e434d-6f5e-445c-9c19-d604b2fa509f', N'admin', N'admin', N'2023-08-04 15:59', N'127.0.0.1', N'批处理@icon-layers@../../WF/Batch.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'b8b30ab6-3cfc-44ea-9b03-98b79acbc709', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'数据源@icon-layers@../../WF/Comm/Search.htm?EnsName=BP.Sys.SFDBSrcs', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'b9e30412-0f3d-4ae8-85b0-4bd321be49e0', N'admin', N'admin', N'2023-08-05 15:22', N'127.0.0.1', N'系统字典@icon-book-open@../../WF/Comm/Search.htm?EnsName=BP.Sys.SFTables', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'c492fb5b-ec41-4ef4-9e67-21bde97af03a', N'admin', N'admin', N'2023-08-04 15:58', N'127.0.0.1', N'共享任务@icon-share@../../WF/TaskPoolSharing.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'dff6e07c-06f8-4172-885a-1b97841ad846', N'admin', N'admin', N'2023-08-04 15:58', N'127.0.0.1', N'我的关注@icon-star@../../WF/Focus.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'e1083089-23a3-4117-8667-73925ffab982', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'系统字典Adv@icon-note@../../WF/Admin/FoolFormDesigner/SFList.htm?DoType=AddEnum', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'e8cbe689-a9ac-4ad4-9075-57d141592b19', N'admin', N'admin', N'2023-08-04 15:59', N'127.0.0.1', N'待办@icon-bell@../../WF/Todolist.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'ee6e051c-28d9-46e0-8176-a6c30b1c5ad8', N'admin', N'admin', N'2023-08-04 16:02', N'127.0.0.1', N'信息窗@icon-organization@../../WF/Comm/Search.htm?EnsName=BP.CCFast.Portal.WindowTemplates', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'f34f1fc5-6b60-4a7d-8720-26e13784f124', N'admin', N'admin', N'2023-08-04 15:58', N'127.0.0.1', N'申请下来的任务@icon-folder-alt@../../WF/TaskPoolApply.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'f7f226a3-6b96-4580-827c-d46a69ba7811', N'admin', N'admin', N'2023-08-05 15:18', N'127.0.0.1', N'系统字典Adv@icon-note@../../WF/Admin/FoolFormDesigner/SFList.htm?DoType=AddEnum', N'MenuClick', N'')
INSERT [dbo].[sys_userlogt] ([MyPK], [EmpNo], [EmpName], [RDT], [IP], [Docs], [LogFlag], [Level]) VALUES (N'fd4207fa-dd85-4ceb-ba33-5eec9a498563', N'admin', N'admin', N'2023-08-04 16:01', N'127.0.0.1', N'表结构@icon-organization@../../WF/Comm/Sys/SystemClass.htm', N'MenuClick', N'')
INSERT [dbo].[sys_userregedit] ([MyPK], [CfgKey], [EnsName], [AttrKey], [FK_Emp], [Vals], [Attrs], [FK_MapData], [LB], [CurValue], [GenerSQL], [Paras], [NumKey], [OrderBy], [OrderWay], [SearchKey], [MVals], [IsPic], [DTFrom], [DTTo], [OrgNo], [AtPara], [BigDocs]) VALUES (N'admin_BP.CCFast.Portal.WindowTemplates_SearchAttrs', N'SearchAttrs', NULL, NULL, N'admin', N'', NULL, N'', 0, NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'@RecCount=0', NULL)
INSERT [dbo].[sys_userregedit] ([MyPK], [CfgKey], [EnsName], [AttrKey], [FK_Emp], [Vals], [Attrs], [FK_MapData], [LB], [CurValue], [GenerSQL], [Paras], [NumKey], [OrderBy], [OrderWay], [SearchKey], [MVals], [IsPic], [DTFrom], [DTTo], [OrgNo], [AtPara], [BigDocs]) VALUES (N'admin_BP.Port.Emps_SearchAttrs', N'SearchAttrs', NULL, NULL, N'admin', N'@FK_Dept=', NULL, N'', 0, NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'@RecCount=14', NULL)
INSERT [dbo].[sys_userregedit] ([MyPK], [CfgKey], [EnsName], [AttrKey], [FK_Emp], [Vals], [Attrs], [FK_MapData], [LB], [CurValue], [GenerSQL], [Paras], [NumKey], [OrderBy], [OrderWay], [SearchKey], [MVals], [IsPic], [DTFrom], [DTTo], [OrgNo], [AtPara], [BigDocs]) VALUES (N'admin_BP.Sys.SFDBSrcs_SearchAttrs', N'SearchAttrs', NULL, NULL, N'admin', N'', NULL, N'', 0, NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'@RecCount=4', NULL)
INSERT [dbo].[sys_userregedit] ([MyPK], [CfgKey], [EnsName], [AttrKey], [FK_Emp], [Vals], [Attrs], [FK_MapData], [LB], [CurValue], [GenerSQL], [Paras], [NumKey], [OrderBy], [OrderWay], [SearchKey], [MVals], [IsPic], [DTFrom], [DTTo], [OrgNo], [AtPara], [BigDocs]) VALUES (N'admin_BP.Sys.SFTables_SearchAttrs', N'SearchAttrs', NULL, NULL, N'admin', N'@FK_SFDBSrc=all', NULL, N'', 0, NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'@RecCount=0', NULL)
INSERT [dbo].[sys_userregedit] ([MyPK], [CfgKey], [EnsName], [AttrKey], [FK_Emp], [Vals], [Attrs], [FK_MapData], [LB], [CurValue], [GenerSQL], [Paras], [NumKey], [OrderBy], [OrderWay], [SearchKey], [MVals], [IsPic], [DTFrom], [DTTo], [OrgNo], [AtPara], [BigDocs]) VALUES (N'admin_BP.WF.Data.AutoRpts_SearchAttrs', N'SearchAttrs', NULL, NULL, N'admin', N'', NULL, N'', 0, NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'@RecCount=0', NULL)
INSERT [dbo].[wf_direction] ([MyPK], [FK_Flow], [Node], [ToNode], [ToNodeName], [GateWay], [Des], [Idx]) VALUES (N'001_101_102', N'001', 101, 102, N'部门经理审批', 0, N'', 0)
INSERT [dbo].[wf_direction] ([MyPK], [FK_Flow], [Node], [ToNode], [ToNodeName], [GateWay], [Des], [Idx]) VALUES (N'001_102_103', N'001', 102, 103, N'总经理审批', 0, N'', 0)
INSERT [dbo].[wf_direction] ([MyPK], [FK_Flow], [Node], [ToNode], [ToNodeName], [GateWay], [Des], [Idx]) VALUES (N'001_103_104', N'001', 103, 104, N'反馈给申请人', 0, N'', 0)
INSERT [dbo].[wf_direction] ([MyPK], [FK_Flow], [Node], [ToNode], [ToNodeName], [GateWay], [Des], [Idx]) VALUES (N'002_201_202', N'002', 201, 202, N'', 0, N'', 0)
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'admin', N'admin', 1, NULL, NULL, N'zhoupeng@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'@VerifyCode=HlyBox77Wv5e2JC%2Bdzj0Ag==', N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'fuhui', N'福惠', 1, NULL, NULL, N'fuhui@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'guobaogeng', N'郭宝庚', 1, NULL, NULL, N'guobaogeng@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'guoxiangbin', N'郭祥斌', 1, NULL, NULL, N'guoxiangbin@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'liping', N'李萍', 1, NULL, NULL, N'liping@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'liyan', N'李言', 1, NULL, NULL, N'liyan@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'oubl', N'oubl', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'qifenglin', N'祁凤林', 1, NULL, NULL, N'qifenglin@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'yangyilei', N'杨依雷', 1, NULL, NULL, N'yangyilei@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'zhanghaicheng', N'张海成', 1, NULL, NULL, N'zhanghaicheng@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'zhangyifan', N'张一帆', 1, NULL, NULL, N'zhangyifan@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'zhoupeng', N'周朋', 1, NULL, NULL, N'zhoupeng@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'zhoushengyu', N'周升雨', 1, NULL, NULL, N'zhoushengyu@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_emp] ([No], [Name], [UseSta], [Tel], [FK_Dept], [Email], [Stas], [Depts], [Msg], [OrgNo], [SPass], [Author], [AuthorDate], [AtPara], [StartFlows]) VALUES (N'zhoutianjiao', N'周天娇', 1, NULL, NULL, N'zhoutianjiao@ccflow.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[wf_flow] ([No], [FK_FlowSort], [Name], [FlowMark], [FlowEventEntity], [TitleRole], [TitleRoleNodes], [IsCanStart], [IsFullSA], [GuestFlowRole], [Draft], [SysType], [Tester], [ChartType], [CreateDate], [Creater], [IsBatchStart], [BatchStartFields], [IsResetData], [IsLoadPriData], [IsDBTemplate], [IsStartInMobile], [IsMD5], [IsJM], [IsEnableDBVer], [PTable], [BillNoFormat], [BuessFields], [AdvEmps], [IsFrmEnable], [IsTruckEnable], [IsTimeBaseEnable], [IsTableEnable], [IsOPEnable], [SubFlowShowType], [TrackOrderBy], [FlowRunWay], [WorkModel], [RunObj], [Note], [RunSQL], [NumOfBill], [NumOfDtl], [FlowAppType], [Idx], [SDTOfFlowRole], [SDTOfFlowRoleSQL], [FrmUrl], [DRCtrlType], [IsToParentNextNode], [StartLimitRole], [StartLimitPara], [StartLimitAlert], [StartLimitWhen], [StartGuideWay], [StartGuideLink], [StartGuideLab], [StartGuidePara1], [StartGuidePara2], [StartGuidePara3], [Ver], [OrgNo], [DevModelType], [DevModelPara], [AtPara], [DataDTSWay], [DTSDBSrc], [DTSBTable], [DTSBTablePK], [DTSSpecNodes], [DTSTime], [DTSFields], [FlowDevModel], [PStarter], [PWorker], [PCCer], [PAnyOne], [PMyDept], [PPMyDept], [PPDept], [PSameDept], [PSpecDept], [PSpecDeptExt], [PSpecSta], [PSpecStaExt], [PSpecGroup], [PSpecGroupExt], [PSpecEmp], [PSpecEmpExt], [MyDeptRole], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [FK_FlowSortText]) VALUES (N'001', N'100', N'请假流程-经典表单-演示', N'', N'', N'', N'', 1, 0, 0, 0, N'', NULL, 1, N'', N'', 0, N'', 0, 0, 0, 1, 0, 0, 0, N'', N'', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, 0, 0, 0, N'', N'', 0, 0, 0, N'', N'', 0, 0, N'', N'', N'', N'', N'', N'2023-02-15 11:34:21', N'', 0, N'', N'', 0, N'', N'', N'', N'', 0, N'', 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, N'', 1, N'', 1, N'', 1, N'', 0, N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'')
INSERT [dbo].[wf_flow] ([No], [FK_FlowSort], [Name], [FlowMark], [FlowEventEntity], [TitleRole], [TitleRoleNodes], [IsCanStart], [IsFullSA], [GuestFlowRole], [Draft], [SysType], [Tester], [ChartType], [CreateDate], [Creater], [IsBatchStart], [BatchStartFields], [IsResetData], [IsLoadPriData], [IsDBTemplate], [IsStartInMobile], [IsMD5], [IsJM], [IsEnableDBVer], [PTable], [BillNoFormat], [BuessFields], [AdvEmps], [IsFrmEnable], [IsTruckEnable], [IsTimeBaseEnable], [IsTableEnable], [IsOPEnable], [SubFlowShowType], [TrackOrderBy], [FlowRunWay], [WorkModel], [RunObj], [Note], [RunSQL], [NumOfBill], [NumOfDtl], [FlowAppType], [Idx], [SDTOfFlowRole], [SDTOfFlowRoleSQL], [FrmUrl], [DRCtrlType], [IsToParentNextNode], [StartLimitRole], [StartLimitPara], [StartLimitAlert], [StartLimitWhen], [StartGuideWay], [StartGuideLink], [StartGuideLab], [StartGuidePara1], [StartGuidePara2], [StartGuidePara3], [Ver], [OrgNo], [DevModelType], [DevModelPara], [AtPara], [DataDTSWay], [DTSDBSrc], [DTSBTable], [DTSBTablePK], [DTSSpecNodes], [DTSTime], [DTSFields], [FlowDevModel], [PStarter], [PWorker], [PCCer], [PAnyOne], [PMyDept], [PPMyDept], [PPDept], [PSameDept], [PSpecDept], [PSpecDeptExt], [PSpecSta], [PSpecStaExt], [PSpecGroup], [PSpecGroupExt], [PSpecEmp], [PSpecEmpExt], [MyDeptRole], [MyFileName], [MyFilePath], [MyFileExt], [WebPath], [MyFileH], [MyFileW], [MyFileSize], [FK_FlowSortText]) VALUES (N'002', N'100', N'不合格评审单', N'', N'', N'', N'', 1, 0, 0, 0, N'', N'admin', 1, N'2023-08-06 00:45', N'admin', 0, N'', 0, 0, 0, 1, 0, 0, 0, N'ND2Rpt', N'', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, 0, 0, 0, N'', N'', 0, 0, 0, N'', N'', 0, 0, N'', N'', N'', N'', N'', N'2023-08-06 00:45:10', N'', 0, N'', N'', 0, N'', N'', N'', N'', 0, N'', 2, 1, 1, 1, 0, 1, 1, 1, 1, 1, N'', 1, N'', 1, N'', 1, N'', 0, N'', N'', N'', N'', 0, 0, CAST(0.00 AS Numeric(11, 2)), N'')
INSERT [dbo].[wf_flowsort] ([No], [ParentNo], [Name], [ShortName], [OrgNo], [Domain], [Idx]) VALUES (N'1', N'0', N'流程树', N'', N'0', N'', 0)
INSERT [dbo].[wf_flowsort] ([No], [ParentNo], [Name], [ShortName], [OrgNo], [Domain], [Idx]) VALUES (N'100', N'1', N'品质类', N'', N'0', N'', 0)
INSERT [dbo].[wf_flowsort] ([No], [ParentNo], [Name], [ShortName], [OrgNo], [Domain], [Idx]) VALUES (N'b11130c9-9a3c-47e1-8e50-726adb75b54d', N'1', N'财务类', N'', N'0', N'', 0)
INSERT [dbo].[wf_frmnode] ([MyPK], [FK_Frm], [FK_Node], [IsPrint], [IsEnableLoadData], [IsCloseEtcFrm], [WhoIsPK], [FrmSln], [BillNoField], [BillNoFieldText], [FrmNameShow], [Is1ToN], [HuiZong], [TempleteFile], [Idx], [IsEnableFWC], [CheckField], [CheckFieldText], [SFSta], [FrmEnableRole], [FrmEnableExp], [FK_Flow], [FrmType], [IsDefaultOpen], [IsEnable]) VALUES (N'ND201_201_002', N'ND201', 201, 0, 0, 0, 0, 1, N'', NULL, N'', 0, N'', N'', 0, 0, N'', NULL, 0, 0, N'', N'002', N'0', 0, 1)
INSERT [dbo].[wf_frmnode] ([MyPK], [FK_Frm], [FK_Node], [IsPrint], [IsEnableLoadData], [IsCloseEtcFrm], [WhoIsPK], [FrmSln], [BillNoField], [BillNoFieldText], [FrmNameShow], [Is1ToN], [HuiZong], [TempleteFile], [Idx], [IsEnableFWC], [CheckField], [CheckFieldText], [SFSta], [FrmEnableRole], [FrmEnableExp], [FK_Flow], [FrmType], [IsDefaultOpen], [IsEnable]) VALUES (N'ND202_202_002', N'ND202', 202, 0, 0, 0, 0, 1, N'', NULL, N'', 0, N'', N'', 0, 0, N'', NULL, 0, 0, N'', N'002', N'0', 0, 1)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (101, N'001', N'请假流程-经典表单-演示', N'填写请假申请单', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 4, N'', 1, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'发送', N'', N'保存', 1, N'抄送', 0, N'二维码', 0, N'移交', 0, N'删除', 0, N'结束流程', 0, N'查看父流程', 0, N'打开公文', 0, 0, 0, N'轨迹', 1, N'挂起', 0, N'查询', 0, N'流转自定义', 0, N'数据版本', 0, N'数据批阅', 0, N'重要性', 0, N'节点时限', 0, N'分配', 0, N'关注', 0, N'确认', 0, N'列表', 1, N'批量审核', 0, N'备注', 0, N'帮助提示', 0, N'小纸条', 0, N'评论', 0, N'即时通讯', 0, N'下一条', 0, N'子线程', 0, 0, N'跳转', 0, N'', 0, 1, 0, 0, N'催办', 1, N'回滚', 1, 0, 1, 0, N'退回', 0, N'', 1, 0, 0, 0, 0, N'', N'', N'打印Html', 0, 0, 0, N'打印pdf', 0, 0, 0, 0, N'', N'打包下载', 0, 0, 0, N'打印单据', 0, N'会签', 0, N'加主持人', 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', N'', N'审核信息', 0, N'', N'审核', N'', 0, 1, N'', 0, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'前台', 1, N'', 0, 0, 0, CAST(2.00 AS Numeric(11, 2)), 0, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 0, N'http://', 0, N'', 0, N'', N'', N'@102', N'', N'', N'', N'@101@102@104', 52, 46, N'', N'@IsYouLiTai=0', CAST(300.00 AS Numeric(11, 2)), N'', N'', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (102, N'001', N'请假流程-经典表单-演示', N'部门经理审批', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'审核意见:@BMJLSP_Note', 0, 0, 4, N'', 2, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'发送', N'', N'保存', 1, N'抄送', 0, N'二维码', 0, N'移交', 0, N'删除', 0, N'结束流程', 0, N'查看父流程', 0, N'打开公文', 0, 0, 0, N'轨迹', 1, N'挂起', 0, N'查询', 0, N'流转自定义', 0, N'数据版本', 0, N'数据批阅', 0, N'重要性', 0, N'节点时限', 0, N'分配', 0, N'关注', 0, N'确认', 0, N'列表', 1, N'批量审核', 0, N'备注', 0, N'帮助提示', 0, N'小纸条', 0, N'评论', 0, N'即时通讯', 0, N'下一条', 0, N'子线程', 0, 0, N'跳转', 0, N'', 0, 1, 0, 0, N'催办', 1, N'回滚', 1, 0, 1, 0, N'退回', 1, N'', 1, 0, 0, 0, 0, N'', N'', N'打印Html', 0, 0, 0, N'打印pdf', 0, 0, 0, 0, N'', N'打包下载', 0, 0, 0, N'打印单据', 0, N'会签', 0, N'加主持人', 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', N'', N'审核信息', 0, N'', N'审核', N'', 0, 1, N'', 0, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'审核', 0, N'', 0, 0, 0, CAST(1.00 AS Numeric(11, 2)), 1, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 0, N'http://', 0, N'', 2, N'', N'', N'@103', N'', N'', N'', N'@101@102@104', 244, 221, N'', N'@IsYouLiTai=0', CAST(300.00 AS Numeric(11, 2)), N'', N'', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (103, N'001', N'请假流程-经典表单-演示', N'总经理审批', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'审核意见:@ZJLSP_Note', 0, 0, 14, N'', 3, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'发送', N'', N'保存', 1, N'抄送', 0, N'二维码', 0, N'移交', 0, N'删除', 0, N'结束流程', 0, N'查看父流程', 0, N'打开公文', 0, 0, 0, N'轨迹', 1, N'挂起', 0, N'查询', 0, N'流转自定义', 0, N'数据版本', 0, N'数据批阅', 0, N'重要性', 0, N'节点时限', 0, N'分配', 0, N'关注', 0, N'确认', 0, N'列表', 1, N'批量审核', 0, N'备注', 0, N'帮助提示', 0, N'小纸条', 0, N'评论', 0, N'即时通讯', 0, N'下一条', 0, N'子线程', 0, 0, N'跳转', 0, N'', 0, 1, 0, 0, N'催办', 1, N'回滚', 1, 0, 1, 0, N'退回', 1, N'', 1, 0, 0, 0, 0, N'', N'', N'打印Html', 0, 0, 0, N'打印pdf', 0, 0, 0, 0, N'', N'打包下载', 0, 0, 0, N'打印单据', 0, N'会签', 0, N'加主持人', 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', N'', N'审核信息', 0, N'', N'审核', N'', 0, 1, N'', 1, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'审核.png', 0, N'', 0, 0, 0, CAST(1.00 AS Numeric(11, 2)), 1, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 0, N'http://', 0, N'', 2, N'@01', N'@01', N'@104', N'', N'', N'', N'@103', 421, 84, N'', N'@IsYouLiTai=0', CAST(300.00 AS Numeric(11, 2)), N'01,', N'总经理,', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (104, N'001', N'请假流程-经典表单-演示', N'反馈给申请人', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 7, N'', 4, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 1, 0, 0, 0, 0, 0, 0, 0, N'', 0, N'发送', N'', N'保存', 1, N'抄送', 0, N'二维码', 0, N'移交', 0, N'删除', 0, N'结束流程', 0, N'查看父流程', 0, N'打开公文', 0, 0, 0, N'轨迹', 1, N'挂起', 0, N'查询', 0, N'流转自定义', 0, N'数据版本', 0, N'数据批阅', 0, N'重要性', 0, N'节点时限', 0, N'分配', 0, N'关注', 0, N'确认', 0, N'列表', 1, N'批量审核', 0, N'备注', 0, N'帮助提示', 0, N'小纸条', 0, N'评论', 0, N'即时通讯', 0, N'下一条', 0, N'子线程', 0, 0, N'跳转', 0, N'', 0, 1, 0, 0, N'催办', 1, N'回滚', 1, 0, 1, 0, N'退回', 1, N'', 1, 0, 0, 0, 0, N'', N'', N'打印Html', 0, 0, 0, N'打印pdf', 0, 0, 0, 0, N'', N'打包下载', 0, 0, 0, N'打印单据', 0, N'会签', 0, N'加主持人', 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', N'', N'审核信息', 0, N'', N'审核', N'', 0, 1, N'', 1, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'审核.png', 0, N'', 0, 0, 0, CAST(1.00 AS Numeric(11, 2)), 1, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 0, N'http://', 0, N'', 2, N'', N'', N'', N'', N'', N'', N'@101@102@104', 580, 190, N'', N'@IsYouLiTai=0', CAST(300.00 AS Numeric(11, 2)), N'', N'', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (201, N'002', N'不合格评审单', N'Start Node', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 4, N'', 1, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, N'节点时限', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, NULL, 0, NULL, 0, N'帮助提示', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, NULL, 0, N'', 0, 1, 0, 0, NULL, 1, NULL, 1, 0, 1, 0, NULL, 0, N'', 1, 0, 0, 0, 0, N'', N'', NULL, 0, 0, 0, NULL, 0, 0, 0, 0, N'', NULL, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', NULL, N'审核信息', 0, N'', N'审核', N'', 0, 1, N'', 0, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'前台', 1, N'', 0, 0, 0, CAST(2.00 AS Numeric(11, 2)), 0, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 10, N'http://', 0, N'', 0, N'', N'', N'@202', N'', N'', N'', N'@201@202', 200, 150, N'', N'', CAST(300.00 AS Numeric(11, 2)), N'', N'', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_node] ([NodeID], [FK_Flow], [FlowName], [Name], [WhoExeIt], [ReadReceipts], [CancelRole], [CancelDisWhenRead], [IsOpenOver], [IsSendDraftSubFlow], [IsResetAccepter], [IsGuestNode], [IsYouLiTai], [FocusField], [FWCSta], [FWCAth], [DeliveryWay], [SelfParas], [Step], [Tip], [RunModel], [PassRate], [ThreadIsCanDel], [ThreadIsCanAdd], [ThreadIsCanShift], [USSWorkIDRole], [IsSendBackNode], [AutoJumpRole0], [AutoJumpRole1], [AutoJumpRole2], [WhenNoWorker], [AutoJumpExp], [SkipTime], [SendLab], [SendJS], [SaveLab], [SaveEnable], [CCLab], [CCRole], [QRCodeLab], [QRCodeRole], [ShiftLab], [ShiftEnable], [DelLab], [DelEnable], [EndFlowLab], [EndFlowEnable], [ShowParentFormLab], [ShowParentFormEnable], [OfficeBtnLab], [OfficeBtnEnable], [OfficeFileType], [OfficeBtnLocal], [TrackLab], [TrackEnable], [HungLab], [HungEnable], [SearchLab], [SearchEnable], [TCLab], [TCEnable], [FrmDBVerLab], [FrmDBVerEnable], [FrmDBRemarkLab], [FrmDBRemarkEnable], [PRILab], [PRIEnable], [CHLab], [CHRole], [AllotLab], [AllotEnable], [FocusLab], [FocusEnable], [ConfirmLab], [ConfirmEnable], [ListLab], [ListEnable], [BatchLab], [BatchEnable], [NoteLab], [NoteEnable], [HelpLab], [HelpRole], [ScripLab], [ScripRole], [FlowBBSLab], [FlowBBSRole], [IMLab], [IMEnable], [NextLab], [NextRole], [ThreadLab], [ThreadEnable], [ThreadKillRole], [JumpWayLab], [JumpWay], [JumpToNodes], [ShowParentFormEnableMyView], [TrackEnableMyView], [FrmDBVerMyView], [FrmDBRemarkEnableMyView], [PressLab], [PressEnable], [RollbackLab], [RollbackEnable], [ShowParentFormEnableMyCC], [TrackEnableMyCC], [FrmDBVerMyCC], [ReturnLab], [ReturnRole], [ReturnAlert], [IsBackTracking], [IsBackResetAccepter], [IsKillEtcThread], [ReturnCHEnable], [ReturnOneNodeRole], [ReturnField], [ReturnReasonsItems], [PrintHtmlLab], [PrintHtmlEnable], [PrintHtmlMyView], [PrintHtmlMyCC], [PrintPDFLab], [PrintPDFEnable], [PrintPDFMyView], [PrintPDFMyCC], [PrintPDFModle], [ShuiYinModle], [PrintZipLab], [PrintZipEnable], [PrintZipMyView], [PrintZipMyCC], [PrintDocLab], [PrintDocEnable], [HuiQianLab], [HuiQianRole], [AddLeaderLab], [AddLeaderEnable], [HuiQianLeaderRole], [TAlertRole], [TAlertWay], [WAlertRole], [WAlertWay], [TCent], [CHWay], [IsEval], [OutTimeDeal], [CCWriteTo], [CCIsAttr], [CCFormAttr], [CCIsStations], [CCStaWay], [CCIsDepts], [CCIsEmps], [CCIsSQLs], [CCSQL], [CCTitle], [CCDoc], [FWCLab], [FWCType], [FWCNodeName], [FWCOpLabel], [FWCDefInfo], [SigantureEnabel], [FWCIsFullInfo], [FWCFields], [FWCVer], [NodeFrmID], [CheckField], [CheckFieldText], [FWCView], [FWCShowModel], [FWCOrderModel], [FWCMsgShow], [FWC_H], [FWCTrackEnable], [FWCListEnable], [FWCIsShowAllStep], [FWCIsShowTruck], [FWCIsShowReturnMsg], [ICON], [NodeWorkType], [FrmAttr], [SFSta], [SubFlowX], [SubFlowY], [TimeLimit], [TWay], [WarningDay], [DoOutTime], [DoOutTimeCond], [Doc], [IsTask], [IsExpSender], [DeliveryParas], [SaveModel], [IsCanDelFlow], [TodolistModel], [TeamLeaderConfirmRole], [TeamLeaderConfirmDoc], [IsRM], [IsHandOver], [BlockModel], [BlockExp], [BlockAlert], [CondModel], [BatchRole], [FormType], [FormUrl], [TurnToDeal], [TurnToDealDoc], [NodePosType], [HisStas], [HisDeptStrs], [HisToNDs], [HisBillIDs], [HisSubFlows], [PTable], [GroupStaNDs], [X], [Y], [RefOneFrmTreeType], [AtPara], [SF_H], [NodeStations], [NodeStationsT], [NodeEmps], [NodeEmpsT], [NodeDepts], [NodeDeptsT], [FrmTrackLab], [FrmTrackSta], [FrmTrack_H], [SFLab], [SFShowModel], [SFShowCtrl], [AllSubFlowOverRole], [SFCaption], [SFDefInfo], [SFFields], [SFOpenType], [FTCLab], [FTCSta], [FTCWorkModel], [FTC_H], [SelectorModel], [FK_SQLTemplate], [FK_SQLTemplateText], [IsAutoLoadEmps], [IsSimpleSelector], [IsEnableDeptRange], [IsEnableStaRange], [SelectorP1], [SelectorP2], [SelectorP3], [SelectorP4], [DelayedSendLab], [DelayedSendEnable], [ChangeDeptLab], [ChangeDeptEnable]) VALUES (202, N'002', N'不合格评审单', N'Node 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 4, N'', 2, N'', 0, CAST(100.0000 AS Decimal(20, 4)), 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, N'节点时限', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, NULL, 0, NULL, 0, N'帮助提示', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, NULL, 0, N'', 0, 1, 0, 0, NULL, 1, NULL, 1, 0, 1, 0, NULL, 2, N'', 1, 0, 0, 0, 0, N'', N'', NULL, 0, 0, 0, NULL, 0, 0, 0, 0, N'', NULL, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', N'', NULL, N'审核信息', 0, N'', N'审核', N'同意', 0, 1, N'', 0, N'', N'', N'', N'', 1, 0, 0, CAST(0.00 AS Numeric(11, 2)), 1, 1, 0, 0, 0, N'审核', 0, N'', 0, 0, 0, CAST(2.00 AS Numeric(11, 2)), 0, CAST(1.00 AS Numeric(11, 2)), N'', N'', N'', 1, 1, N'', 0, 0, 0, 0, N'', 1, 0, 0, N'', N'', 2, 0, 10, N'http://', 0, N'', 2, N'', N'', N'', N'', N'', N'', N'@201@202', 200, 250, N'', N'', CAST(300.00 AS Numeric(11, 2)), N'', N'', N'', N'', N'', N'', N'轨迹', 0, CAST(300.00 AS Numeric(11, 2)), N'子流程', 0, 0, 0, N'启动子流程', N'', N'', 0, N'流转自定义', 0, 0, CAST(300.00 AS Numeric(11, 2)), 5, N'', N'', 1, 0, 0, 0, N'', N'', N'', N'', N'延期发送', 0, N'切换部门', 0)
INSERT [dbo].[wf_nodestation] ([MyPK], [FK_Node], [FK_Station]) VALUES (N'103_01', 103, N'01')
INSERT [dbo].[wf_pushmsg] ([MyPK], [FK_Flow], [FK_Node], [FK_Event], [PushWay], [PushDoc], [Tag], [SMSPushWay], [SMSField], [SMSDoc], [SMSNodes], [SMSPushModel], [MailPushWay], [MailAddress], [MailTitle], [MailDoc], [MailNodes], [BySQL], [ByEmps], [AtPara]) VALUES (N'21b5347d-2a81-4fc4-a194-ab3aa194c636', N'002', 202, N'ReturnAfter', 0, N'', N'', 1, N'', N'', N'', N'Email', 0, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[wf_pushmsg] ([MyPK], [FK_Flow], [FK_Node], [FK_Event], [PushWay], [PushDoc], [Tag], [SMSPushWay], [SMSField], [SMSDoc], [SMSNodes], [SMSPushModel], [MailPushWay], [MailAddress], [MailTitle], [MailDoc], [MailNodes], [BySQL], [ByEmps], [AtPara]) VALUES (N'2dae88d3-d2a8-47b6-844e-7b22070d21d5', N'002', 201, N'SendSuccess', 0, N'', N'', 1, N'', N'', N'', N'Email', 0, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[wf_pushmsg] ([MyPK], [FK_Flow], [FK_Node], [FK_Event], [PushWay], [PushDoc], [Tag], [SMSPushWay], [SMSField], [SMSDoc], [SMSNodes], [SMSPushModel], [MailPushWay], [MailAddress], [MailTitle], [MailDoc], [MailNodes], [BySQL], [ByEmps], [AtPara]) VALUES (N'3016617a-d46a-47f4-8d79-d232aa283a4b', N'002', 202, N'SendSuccess', 0, N'', N'', 1, N'', N'', N'', N'Email', 0, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[wf_pushmsg] ([MyPK], [FK_Flow], [FK_Node], [FK_Event], [PushWay], [PushDoc], [Tag], [SMSPushWay], [SMSField], [SMSDoc], [SMSNodes], [SMSPushModel], [MailPushWay], [MailAddress], [MailTitle], [MailDoc], [MailNodes], [BySQL], [ByEmps], [AtPara]) VALUES (N'8cf6b48f-ed46-4ecc-927d-d1c981ddc38b', N'002', 201, N'ReturnAfter', 0, N'', N'', 1, N'', N'', N'', N'Email', 0, N'', N'', N'', N'', N'', N'', N'')
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_BBS_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_BBS_No] ON [dbo].[frm_bbs]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_Collection_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_Collection_No] ON [dbo].[frm_collection]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_DeptCreateID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_DeptCreateID] ON [dbo].[frm_deptcreate]
(
	[FrmID] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_DictFlow_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_DictFlow_MyPK] ON [dbo].[frm_dictflow]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_EmpCreateID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_EmpCreateID] ON [dbo].[frm_empcreate]
(
	[FrmID] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_Func_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_Func_No] ON [dbo].[frm_func]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Frm_GenerBill_WorkID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_GenerBill_WorkID] ON [dbo].[frm_generbill]
(
	[WorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_GroupMethod_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_GroupMethod_No] ON [dbo].[frm_groupmethod]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_Method_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_Method_No] ON [dbo].[frm_method]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_StationCreateID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_StationCreateID] ON [dbo].[frm_stationcreate]
(
	[FrmID] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_StationDeptID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_StationDeptID] ON [dbo].[frm_stationdept]
(
	[FK_Frm] ASC,
	[FK_Station] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_ToolbarBtn_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_ToolbarBtn_MyPK] ON [dbo].[frm_toolbarbtn]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Frm_Track_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Frm_Track_MyPK] ON [dbo].[frm_track]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_DeptMenu_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_DeptMenu_MyPK] ON [dbo].[gpm_deptmenu]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_EmpMenu_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_EmpMenu_MyPK] ON [dbo].[gpm_empmenu]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_Group_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_Group_No] ON [dbo].[gpm_group]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_GroupDept_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_GroupDept_MyPK] ON [dbo].[gpm_groupdept]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_GroupEmpID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_GroupEmpID] ON [dbo].[gpm_groupemp]
(
	[FK_Group] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_GroupMenu_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_GroupMenu_MyPK] ON [dbo].[gpm_groupmenu]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_GroupStationID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_GroupStationID] ON [dbo].[gpm_groupstation]
(
	[FK_Group] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_Menu_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_Menu_No] ON [dbo].[gpm_menu]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_MenuDtl_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_MenuDtl_No] ON [dbo].[gpm_menudtl]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_Module_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_Module_No] ON [dbo].[gpm_module]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_PowerCenter_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_PowerCenter_MyPK] ON [dbo].[gpm_powercenter]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_StationMenu_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_StationMenu_MyPK] ON [dbo].[gpm_stationmenu]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_System_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_System_No] ON [dbo].[gpm_system]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_Window_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_Window_MyPK] ON [dbo].[gpm_window]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_WindowTemplate_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_WindowTemplate_No] ON [dbo].[gpm_windowtemplate]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GPM_WindowTemplateDtl_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [GPM_WindowTemplateDtl_MyPK] ON [dbo].[gpm_windowtemplatedtl]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ND1Rpt_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [ND1Rpt_OID] ON [dbo].[nd1rpt]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_Track_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Track_MyPK] ON [dbo].[nd1track]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ND2Rpt_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [ND2Rpt_OID] ON [dbo].[ND2Rpt]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_Track_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Track_MyPK] ON [dbo].[ND2Track]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_BBS_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_BBS_No] ON [dbo].[oa_bbs]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_BBSType_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_BBSType_No] ON [dbo].[oa_bbstype]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_Info_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_Info_No] ON [dbo].[oa_info]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_InfoType_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_InfoType_No] ON [dbo].[oa_infotype]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_KMDtl_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_KMDtl_No] ON [dbo].[oa_kmdtl]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_KMTree_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_KMTree_No] ON [dbo].[oa_kmtree]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_Knowledge_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_Knowledge_No] ON [dbo].[oa_knowledge]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_Notepad_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_Notepad_MyPK] ON [dbo].[oa_notepad]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_Schedule_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_Schedule_MyPK] ON [dbo].[oa_schedule]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_Task_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_Task_MyPK] ON [dbo].[oa_task]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_WorkChecker_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_WorkChecker_MyPK] ON [dbo].[oa_workchecker]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_WorkRec_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_WorkRec_MyPK] ON [dbo].[oa_workrec]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_WorkRecDtl_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_WorkRecDtl_MyPK] ON [dbo].[oa_workrecdtl]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OA_WorkShare_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [OA_WorkShare_MyPK] ON [dbo].[oa_workshare]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Dept_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Dept_No] ON [dbo].[port_dept]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_DeptEmp_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_DeptEmp_MyPK] ON [dbo].[port_deptemp]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_DeptEmpStation_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_DeptEmpStation_MyPK] ON [dbo].[port_deptempstation]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Emp_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Emp_No] ON [dbo].[port_emp]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Org_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Org_No] ON [dbo].[port_org]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_OrgAdminer_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_OrgAdminer_MyPK] ON [dbo].[port_orgadminer]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_OrgAdminerFlowSort_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_OrgAdminerFlowSort_MyPK] ON [dbo].[port_orgadminerflowsort]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_OrgAdminerFrmTree_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_OrgAdminerFrmTree_MyPK] ON [dbo].[port_orgadminerfrmtree]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Station_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Station_No] ON [dbo].[port_station]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_StationType_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_StationType_No] ON [dbo].[port_stationtype]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Team_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Team_No] ON [dbo].[port_team]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_TeamEmpID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_TeamEmpID] ON [dbo].[port_teamemp]
(
	[FK_Team] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_TeamType_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_TeamType_No] ON [dbo].[port_teamtype]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_Token_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_Token_MyPK] ON [dbo].[port_token]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Port_User_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Port_User_No] ON [dbo].[port_user]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Pub_NY_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Pub_NY_No] ON [dbo].[pub_ny]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_DocFile_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_DocFile_MyPK] ON [dbo].[sys_docfile]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_EnCfg_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_EnCfg_No] ON [dbo].[sys_encfg]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_Enum_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_Enum_MyPK] ON [dbo].[sys_enum]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_EnumMain_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_EnumMain_No] ON [dbo].[sys_enummain]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_EnVer_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_EnVer_MyPK] ON [dbo].[sys_enver]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_EnVerDtl_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_EnVerDtl_MyPK] ON [dbo].[sys_enverdtl]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sys_FileManager_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FileManager_OID] ON [dbo].[sys_filemanager]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FormTree_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FormTree_No] ON [dbo].[sys_formtree]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmAttachment_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmAttachment_MyPK] ON [dbo].[sys_frmattachment]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmAttachmentDB_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmAttachmentDB_MyPK] ON [dbo].[sys_frmattachmentdb]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmBtn_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmBtn_MyPK] ON [dbo].[sys_frmbtn]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmDBRemark_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmDBRemark_MyPK] ON [dbo].[sys_frmdbremark]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmDBVer_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmDBVer_MyPK] ON [dbo].[sys_frmdbver]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmEleDB_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmEleDB_MyPK] ON [dbo].[sys_frmeledb]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmEvent_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmEvent_MyPK] ON [dbo].[sys_frmevent]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmImg_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmImg_MyPK] ON [dbo].[sys_frmimg]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmImgAth_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmImgAth_MyPK] ON [dbo].[sys_frmimgath]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmImgAthDB_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmImgAthDB_MyPK] ON [dbo].[sys_frmimgathdb]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmPrintTemplate_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmPrintTemplate_MyPK] ON [dbo].[sys_frmprinttemplate]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmRB_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmRB_MyPK] ON [dbo].[sys_frmrb]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_FrmSln_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_FrmSln_MyPK] ON [dbo].[sys_frmsln]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_GloVar_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_GloVar_No] ON [dbo].[sys_glovar]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sys_GroupEnsTemplate_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_GroupEnsTemplate_OID] ON [dbo].[sys_groupenstemplate]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sys_GroupField_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_GroupField_OID] ON [dbo].[sys_groupfield]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapAttr_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapAttr_MyPK] ON [dbo].[sys_mapattr]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapData_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapData_No] ON [dbo].[sys_mapdata]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapDataVer_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapDataVer_MyPK] ON [dbo].[sys_mapdataver]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapDtl_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapDtl_No] ON [dbo].[sys_mapdtl]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapExt_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapExt_MyPK] ON [dbo].[sys_mapext]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_MapFrame_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_MapFrame_MyPK] ON [dbo].[sys_mapframe]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_RptDeptID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_RptDeptID] ON [dbo].[sys_rptdept]
(
	[FK_Rpt] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_RptEmpID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_RptEmpID] ON [dbo].[sys_rptemp]
(
	[FK_Rpt] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_RptStationID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_RptStationID] ON [dbo].[sys_rptstation]
(
	[FK_Rpt] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_RptTemplate_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_RptTemplate_MyPK] ON [dbo].[sys_rpttemplate]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_Serial_CfgKey]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_Serial_CfgKey] ON [dbo].[sys_serial]
(
	[CfgKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_SFDBSrc_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_SFDBSrc_No] ON [dbo].[sys_sfdbsrc]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_SFTable_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_SFTable_No] ON [dbo].[sys_sftable]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_SFTableDtl_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_SFTableDtl_MyPK] ON [dbo].[sys_sftabledtl]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_SMS_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_SMS_MyPK] ON [dbo].[sys_sms]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_UserLogLevel_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_UserLogLevel_No] ON [dbo].[sys_userloglevel]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_UserLogT_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_UserLogT_MyPK] ON [dbo].[sys_userlogt]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_UserLogType_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_UserLogType_No] ON [dbo].[sys_userlogtype]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sys_UserRegedit_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [Sys_UserRegedit_MyPK] ON [dbo].[sys_userregedit]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_AccepterRole_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_AccepterRole_OID] ON [dbo].[wf_accepterrole]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Auth_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Auth_MyPK] ON [dbo].[wf_auth]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_AutoRpt_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_AutoRpt_No] ON [dbo].[wf_autorpt]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_AutoRptDtl_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_AutoRptDtl_OID] ON [dbo].[wf_autorptdtl]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CCDeptID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CCDeptID] ON [dbo].[wf_ccdept]
(
	[FK_Node] ASC,
	[FK_Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CCEmpID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CCEmpID] ON [dbo].[wf_ccemp]
(
	[FK_Node] ASC,
	[FK_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CCList_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CCList_MyPK] ON [dbo].[wf_cclist]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CCRole_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CCRole_MyPK] ON [dbo].[wf_ccrole]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CCStationID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CCStationID] ON [dbo].[wf_ccstation]
(
	[FK_Node] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CH_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CH_MyPK] ON [dbo].[wf_ch]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CHEval_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CHEval_MyPK] ON [dbo].[wf_cheval]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_CHNode_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_CHNode_MyPK] ON [dbo].[wf_chnode]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Cond_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Cond_MyPK] ON [dbo].[wf_cond]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_DeptFlowSearch_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_DeptFlowSearch_MyPK] ON [dbo].[wf_deptflowsearch]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Direction_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Direction_MyPK] ON [dbo].[wf_direction]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_DirectionStationID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_DirectionStationID] ON [dbo].[wf_directionstation]
(
	[FK_Direction] ASC,
	[FK_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_DocTemplate_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_DocTemplate_No] ON [dbo].[wf_doctemplate]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Emp_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Emp_No] ON [dbo].[wf_emp]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_FindWorkerRole_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FindWorkerRole_OID] ON [dbo].[wf_findworkerrole]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Flow_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Flow_No] ON [dbo].[wf_flow]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FlowOrgID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FlowOrgID] ON [dbo].[wf_floworg]
(
	[FlowNo] ASC,
	[OrgNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FlowSort_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FlowSort_No] ON [dbo].[wf_flowsort]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FlowTab_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FlowTab_MyPK] ON [dbo].[wf_flowtab]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FrmNode_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FrmNode_MyPK] ON [dbo].[wf_frmnode]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FrmNodeFieldRemove_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FrmNodeFieldRemove_MyPK] ON [dbo].[wf_frmnodefieldremove]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_FrmOrgID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_FrmOrgID] ON [dbo].[wf_frmorg]
(
	[FrmID] ASC,
	[OrgNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_GenerWorkerlistID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_GenerWorkerlistID] ON [dbo].[wf_generworkerlist]
(
	[WorkID] ASC,
	[FK_Emp] ASC,
	[FK_Node] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_GenerWorkFlow_WorkID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_GenerWorkFlow_WorkID] ON [dbo].[wf_generworkflow]
(
	[WorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_LabNote_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_LabNote_MyPK] ON [dbo].[wf_labnote]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_Node_NodeID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Node_NodeID] ON [dbo].[wf_node]
(
	[NodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_NodeCancelID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeCancelID] ON [dbo].[wf_nodecancel]
(
	[FK_Node] ASC,
	[CancelTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_NodeDept_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeDept_MyPK] ON [dbo].[wf_nodedept]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_NodeEmp_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeEmp_MyPK] ON [dbo].[wf_nodeemp]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_NodeReturnID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeReturnID] ON [dbo].[wf_nodereturn]
(
	[FK_Node] ASC,
	[ReturnTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_NodeStation_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeStation_MyPK] ON [dbo].[wf_nodestation]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_NodeSubFlow_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeSubFlow_MyPK] ON [dbo].[wf_nodesubflow]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_NodeTeam_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeTeam_MyPK] ON [dbo].[wf_nodeteam]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_NodeToolbar_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_NodeToolbar_OID] ON [dbo].[wf_nodetoolbar]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Part_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Part_MyPK] ON [dbo].[wf_part]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_PowerModel_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_PowerModel_MyPK] ON [dbo].[wf_powermodel]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_PushMsg_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_PushMsg_MyPK] ON [dbo].[wf_pushmsg]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_RememberMe_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_RememberMe_MyPK] ON [dbo].[wf_rememberme]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_ReturnWork_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_ReturnWork_MyPK] ON [dbo].[wf_returnwork]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_SelectAccper_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_SelectAccper_MyPK] ON [dbo].[wf_selectaccper]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_SQLTemplate_No]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_SQLTemplate_No] ON [dbo].[wf_sqltemplate]
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_SyncData_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_SyncData_MyPK] ON [dbo].[wf_syncdata]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_SyncDataField_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_SyncDataField_MyPK] ON [dbo].[wf_syncdatafield]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_Task_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_Task_MyPK] ON [dbo].[wf_task]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_TransferCustom_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_TransferCustom_MyPK] ON [dbo].[wf_transfercustom]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WF_WorkFlowDeleteLog_OID]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_WorkFlowDeleteLog_OID] ON [dbo].[wf_workflowdeletelog]
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WF_WorkOpt_MyPK]    Script Date: 2023/8/6 0:56:06 ******/
CREATE NONCLUSTERED INDEX [WF_WorkOpt_MyPK] ON [dbo].[wf_workopt]
(
	[MyPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [WorkID]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [Docs]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [DeptNo]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [FrmName]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [MyFileName]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [MyFilePath]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [MyFileExt]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [WebPath]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[frm_bbs] ADD  DEFAULT (NULL) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [MethodID]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [MethodModel]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [Mark]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (N'') FOR [GroupID]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (N'') FOR [WarningMsg]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [MethodDocTypeOfFunc]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (N'') FOR [MsgSuccess]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (N'') FOR [MsgErr]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT (N'') FOR [Docs]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [RefMethodType]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [PopHeight]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [PopWidth]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [WhatAreYouTodo]
GO
ALTER TABLE [dbo].[frm_collection] ADD  DEFAULT ((0)) FOR [ShowModel]
GO
ALTER TABLE [dbo].[frm_dictflow] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_dictflow] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[frm_dictflow] ADD  DEFAULT (NULL) FOR [Label]
GO
ALTER TABLE [dbo].[frm_dictflow] ADD  DEFAULT ((0)) FOR [IsShowListRight]
GO
ALTER TABLE [dbo].[frm_dictflow] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [FuncID]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT ((0)) FOR [FuncSrc]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [DTSName]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [WarningMsg]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT ((0)) FOR [MethodDocTypeOfFunc]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [MethodDoc_Url]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [MsgSuccess]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT (NULL) FOR [MsgErr]
GO
ALTER TABLE [dbo].[frm_func] ADD  DEFAULT ((0)) FOR [IsHavePara]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [FK_FrmTree]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [FrmName]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [BillNo]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [BillSta]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [BillState]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [Starter]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [StarterName]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [Sender]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [SendDT]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [NDStep]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [NDStepName]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((1)) FOR [PRI]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [SDTOfNode]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [SDTOfFlow]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [PFrmID]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [PWorkID]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT ((0)) FOR [TSpan]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[frm_generbill] ADD  DEFAULT (NULL) FOR [FK_NY]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[frm_groupmethod] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [MethodID]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [GroupID]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [MethodModel]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [Mark]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [ShowModel]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((100)) FOR [PopHeight]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((260)) FOR [PopWidth]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((1)) FOR [IsMyBillToolBar]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [IsMyBillToolExt]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [IsSearchBar]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [DTSDataWay]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [DTSSpecFiels]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [DTSWhenFlowOver]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [DTSWhenNodeOver]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [WhatAreYouTodo]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [MethodDoc_Url]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [Docs]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [RefMethodType]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [WarningMsg]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [MsgSuccess]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT (N'') FOR [MsgErr]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [MethodDocTypeOfFunc]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [IsList]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [IsHavePara]
GO
ALTER TABLE [dbo].[frm_method] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT (NULL) FOR [BtnID]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT (NULL) FOR [BtnLab]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT ((0)) FOR [PopHeight]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT ((0)) FOR [PopWidth]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[frm_toolbarbtn] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [FrmName]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [ActionType]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [ActionTypeText]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [WorkID]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [Msg]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [DeptNo]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[frm_track] ADD  DEFAULT ((0)) FOR [WorkIDOfFlow]
GO
ALTER TABLE [dbo].[gpm_deptmenu] ADD  DEFAULT (NULL) FOR [FK_Menu]
GO
ALTER TABLE [dbo].[gpm_deptmenu] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[gpm_deptmenu] ADD  DEFAULT ((1)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[gpm_empmenu] ADD  DEFAULT (NULL) FOR [FK_Menu]
GO
ALTER TABLE [dbo].[gpm_empmenu] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[gpm_empmenu] ADD  DEFAULT (NULL) FOR [FK_App]
GO
ALTER TABLE [dbo].[gpm_empmenu] ADD  DEFAULT ((1)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[gpm_group] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_group] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_groupdept] ADD  DEFAULT (NULL) FOR [FK_Group]
GO
ALTER TABLE [dbo].[gpm_groupdept] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[gpm_groupmenu] ADD  DEFAULT (NULL) FOR [FK_Group]
GO
ALTER TABLE [dbo].[gpm_groupmenu] ADD  DEFAULT (NULL) FOR [FK_Menu]
GO
ALTER TABLE [dbo].[gpm_groupmenu] ADD  DEFAULT ((1)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (NULL) FOR [Tag4]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [ListModel]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [TagInt1]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [MenuModel]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [Mark]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [FrmID]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [FlowNo]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((1)) FOR [OpenWay]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [UrlExt]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [MobileUrlExt]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [SystemNo]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [ModuleNo]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [ModuleNoText]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((1)) FOR [IsMyBillToolBar]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [IsMyBillToolExt]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [IsSearchBar]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [DTSDataWay]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT (N'') FOR [DTSSpecFiels]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [DTSWhenFlowOver]
GO
ALTER TABLE [dbo].[gpm_menu] ADD  DEFAULT ((0)) FOR [DTSWhenNodeOver]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (NULL) FOR [RefMenuNo]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (NULL) FOR [UrlExt]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (N'') FOR [Icon]
GO
ALTER TABLE [dbo].[gpm_menudtl] ADD  DEFAULT (N'') FOR [Model]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT (NULL) FOR [SystemNo]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_module] ADD  DEFAULT ((0)) FOR [ChildDisplayModel]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [CtrlObj]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [CtrlPKVal]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [CtrlGroup]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [CtrlModel]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_powercenter] ADD  DEFAULT (NULL) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_stationmenu] ADD  DEFAULT (NULL) FOR [FK_Menu]
GO
ALTER TABLE [dbo].[gpm_stationmenu] ADD  DEFAULT (NULL) FOR [FK_Station]
GO
ALTER TABLE [dbo].[gpm_stationmenu] ADD  DEFAULT ((1)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[gpm_system] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_system] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[gpm_system] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[gpm_system] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_system] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_window] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[gpm_window] ADD  DEFAULT (NULL) FOR [WindowTemplateNo]
GO
ALTER TABLE [dbo].[gpm_window] ADD  DEFAULT ((0)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[gpm_window] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_window] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((1)) FOR [ColSpan]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [WinDocModel]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [PageID]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [MoreLab]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [MoreUrl]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [MoreLinkModel]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((500)) FOR [PopW]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((400)) FOR [PopH]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((1)) FOR [IsDel]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [LabOfFZ]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [LabOfFM]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (NULL) FOR [LabOfRate]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsPie]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsLine]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsZZT]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsRing]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [IsRate]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [DefaultChart]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT ((0)) FOR [DBType]
GO
ALTER TABLE [dbo].[gpm_windowtemplate] ADD  DEFAULT (N'') FOR [DBSrc]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (NULL) FOR [RefPK]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT ((0)) FOR [DBType]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (NULL) FOR [DBSrc]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT ((0)) FOR [WindowsShowType]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (NULL) FOR [FontColor]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (NULL) FOR [Exp0]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (N'') FOR [Exp1]
GO
ALTER TABLE [dbo].[gpm_windowtemplatedtl] ADD  DEFAULT (N'') FOR [UrlExt]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [PWorkID]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [PNodeID]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowDaySpan]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowEnderRDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [FlowEndNode]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowStartRDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [BillNo]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [PEmp]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [PrjNo]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [PrjName]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [PFlowNo]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowEmps]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowEnder]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FlowStarter]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [WFSta]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [WFState]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [ShenQingRen]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [BMJLSP_Checker]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [ShenQingRiJi]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [ZJLSP_Checker]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [BMJLSP_RDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [ZJLSP_RDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [ShenQingRenBuMen]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [CDT]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [FK_NY]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT ((1)) FOR [MyNum]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [QingJiaRiQiCong]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [Dao]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [QingJiaTianShu]
GO
ALTER TABLE [dbo].[nd1rpt] ADD  DEFAULT (NULL) FOR [QingJiaYuanYin]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [MyPK]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [ActionType]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [ActionTypeText]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [NDFrom]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [NDFromT]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT ((0)) FOR [NDTo]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [NDToT]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [EmpFrom]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [EmpFromT]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [EmpTo]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [EmpToT]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [WorkTimeSpan]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [Tag]
GO
ALTER TABLE [dbo].[nd1track] ADD  DEFAULT (NULL) FOR [Exer]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT ((0)) FOR [BBSPRI]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [BBSType]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [RecDeptNo]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [RelerName]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [RelDeptName]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT ((0)) FOR [MyFileNum]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT ((0)) FOR [BBSSta]
GO
ALTER TABLE [dbo].[oa_bbs] ADD  DEFAULT ((0)) FOR [ReadTimes]
GO
ALTER TABLE [dbo].[oa_bbstype] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT ((0)) FOR [InfoPRI]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [InfoType]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT ((0)) FOR [InfoSta]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [RecDeptNo]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [RelerName]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [RelDeptName]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT ((0)) FOR [ReadTimes]
GO
ALTER TABLE [dbo].[oa_info] ADD  DEFAULT ((0)) FOR [MyFileNum]
GO
ALTER TABLE [dbo].[oa_infotype] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [RefTreeNo]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [KnowledgeNo]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[oa_kmdtl] ADD  DEFAULT ((0)) FOR [MyFileNum]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [KnowledgeNo]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT ((1)) FOR [FileType]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_kmtree] ADD  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [ImgUrl]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT ((0)) FOR [KnowledgeSta]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_knowledge] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_notepad] ADD  DEFAULT ((0)) FOR [IsStar]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [DTStart]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [DTEnd]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [TimeStart]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [TimeEnd]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [ChiXuTime]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [DTAlert]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT ((0)) FOR [Repeats]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [Local]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [MiaoShu]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_schedule] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT ((0)) FOR [IsSubTask]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT ((0)) FOR [TaskPRI]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT ((0)) FOR [TaskSta]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [DTFrom]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [DTTo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [ManagerEmpNo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [ManagerEmpName]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RefEmpsNo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RefEmpsName]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RefLabelNo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RefLabelName]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_task] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [RefPK]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [Doc]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT ((0)) FOR [Cent]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_workchecker] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT ((0)) FOR [WorkRecModel]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [Doc1]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [Doc2]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [Doc3]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [HeiJiHour]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT ((0)) FOR [NumOfItem]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [RiQi]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_workrec] ADD  DEFAULT (NULL) FOR [NianDu]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [RefPK]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [PrjName]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [Doc]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [Result]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT ((0)) FOR [Hour]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT ((0)) FOR [Minute]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [HeiJiHour]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [RiQi]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [NianYue]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT (NULL) FOR [NianDu]
GO
ALTER TABLE [dbo].[oa_workrecdtl] ADD  DEFAULT ((0)) FOR [WeekNum]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT (NULL) FOR [ShareToEmpNo]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT (NULL) FOR [ShareToEmpName]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT ((0)) FOR [ShareState]
GO
ALTER TABLE [dbo].[oa_workshare] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT (NULL) FOR [NameOfPath]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT (NULL) FOR [Leader]
GO
ALTER TABLE [dbo].[port_dept] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (N'') FOR [DeptName]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (N'') FOR [StationNo]
GO
ALTER TABLE [dbo].[port_deptemp] ADD  DEFAULT (N'') FOR [StationNoT]
GO
ALTER TABLE [dbo].[port_deptempstation] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[port_deptempstation] ADD  DEFAULT (NULL) FOR [FK_Station]
GO
ALTER TABLE [dbo].[port_deptempstation] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[port_deptempstation] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [PinYin]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [Tel]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [Leader]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [LeaderName]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (N'') FOR [Pass]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT (N'') FOR [OpenID]
GO
ALTER TABLE [dbo].[port_emp] ADD  DEFAULT ((0)) FOR [EmpSta]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT (NULL) FOR [ParentName]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT (NULL) FOR [Adminer]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT (NULL) FOR [AdminerName]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [FlowNums]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [FrmNums]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [Users]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [Depts]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [GWFS]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [GWFSOver]
GO
ALTER TABLE [dbo].[port_org] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_orgadminer] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_orgadminer] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[port_orgadminer] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[port_orgadminerflowsort] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_orgadminerflowsort] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[port_orgadminerflowsort] ADD  DEFAULT (NULL) FOR [RefOrgAdminer]
GO
ALTER TABLE [dbo].[port_orgadminerflowsort] ADD  DEFAULT (NULL) FOR [FlowSortNo]
GO
ALTER TABLE [dbo].[port_orgadminerfrmtree] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_orgadminerfrmtree] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[port_orgadminerfrmtree] ADD  DEFAULT (NULL) FOR [RefOrgAdminer]
GO
ALTER TABLE [dbo].[port_orgadminerfrmtree] ADD  DEFAULT (NULL) FOR [FrmTreeNo]
GO
ALTER TABLE [dbo].[port_station] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_station] ADD  DEFAULT (NULL) FOR [FK_StationType]
GO
ALTER TABLE [dbo].[port_station] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_station] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_stationtype] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_stationtype] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_team] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_team] ADD  DEFAULT (NULL) FOR [FK_TeamType]
GO
ALTER TABLE [dbo].[port_team] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_teamtype] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_teamtype] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [DeptNo]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [OrgName]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[port_token] ADD  DEFAULT ((0)) FOR [SheBei]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [Pass]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [Token]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [Tel]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [PinYin]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [OrgName]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [unionid]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [OpenID]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT (NULL) FOR [OpenID2]
GO
ALTER TABLE [dbo].[port_user] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_docfile] ADD  DEFAULT (NULL) FOR [FileName]
GO
ALTER TABLE [dbo].[sys_docfile] ADD  DEFAULT ((0)) FOR [FileSize]
GO
ALTER TABLE [dbo].[sys_docfile] ADD  DEFAULT (NULL) FOR [FileType]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [UIRowStyleGlo]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsEnableDouclickGlo]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsEnableFocusField]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [FocusField]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsEnableRefFunc]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsEnableOpenICON]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsJM]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsSelectMore]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [MoveToShowWay]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [TableCol]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsShowIcon]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [KeyLabel]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [KeyPlaceholder]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((10)) FOR [PageSize]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((14)) FOR [FontSize]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [EditerType]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsCond]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [OrderBy]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsDeSc]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [FJSavePath]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [FJWebPath]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [Datan]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [UI]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [ColorSet]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [FieldSet]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [ForamtFunc]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [Drill]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [MobileFieldShowModel]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [MobileShowContent]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [BtnsShowLeft]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsImp]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [ImpFuncUrl]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [IsExp]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsGroup]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsEnableLazyload]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnLab1]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnJS1]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnLab2]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnJS2]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnLab3]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [BtnJS3]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [EnBtnLab1]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [EnBtnJS1]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [EnBtnLab2]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [EnBtnJS2]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [SearchUrlOpenType]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((1)) FOR [IsRefreshParentPage]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [UrlExt]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [DoubleOrClickModel]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [OpenModel]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [OpenModelFunc]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((0)) FOR [WinCardW]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT ((2)) FOR [WinCardH]
GO
ALTER TABLE [dbo].[sys_encfg] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT (NULL) FOR [Lab]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT (NULL) FOR [EnumKey]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT ((0)) FOR [IntKey]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT (NULL) FOR [Lang]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_enum] ADD  DEFAULT (NULL) FOR [StrKey]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [CfgVal]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Lang]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [EnumKey]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT ((0)) FOR [IsHaveDtl]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx0]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val0]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx1]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val1]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx2]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val2]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx3]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val3]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx4]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val4]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx5]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val5]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx6]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val6]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx7]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val7]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx8]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val8]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx9]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val9]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx10]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val10]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx11]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val11]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx12]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val12]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx13]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val13]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx14]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val14]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx15]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val15]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx16]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val16]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx17]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val17]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx18]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val18]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx19]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val19]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx20]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val20]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx21]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val21]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx22]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val22]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx23]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val23]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx24]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val24]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx25]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val25]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx26]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val26]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx27]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val27]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx28]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val28]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Idx29]
GO
ALTER TABLE [dbo].[sys_enummain] ADD  DEFAULT (NULL) FOR [Val29]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [EnPKValue]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT ((0)) FOR [EnVer]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [RecNo]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [MyNote]
GO
ALTER TABLE [dbo].[sys_enver] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [RefPK]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [EnPKValue]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [AttrKey]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [AttrName]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT ((0)) FOR [LGType]
GO
ALTER TABLE [dbo].[sys_enverdtl] ADD  DEFAULT (NULL) FOR [BindKey]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [AttrFileName]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [AttrFileNo]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [EnName]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [RefVal]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [WebPath]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [MyFileName]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [MyFilePath]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [MyFileExt]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_filemanager] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT (N'') FOR [ShortName]
GO
ALTER TABLE [dbo].[sys_formtree] ADD  DEFAULT (N'') FOR [Domain]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [NoOfObj]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [AthRunModel]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [AthSaveWay]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [Exts]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [NumOfUpload]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((99)) FOR [TopNumOfUpload]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((10240)) FOR [FileMaxSize]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [UploadFileNumCheck]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [Sort]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [H]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsUpload]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsVisable]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [FileType]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [ReadRole]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [PicUploadType]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [DeleteWay]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsDownload]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsAutoSize]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsNote]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [IsExpCol]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsShowTitle]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [UploadType]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [IsIdx]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [CtrlWay]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [AthUploadWay]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [DataRefNoOfObj]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [IsEnableTemplate]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [AthSingleRole]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [AthEditModel]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsToHeLiuHZ]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((1)) FOR [IsHeLiuHuiZong]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [IsTurn2Html]
GO
ALTER TABLE [dbo].[sys_frmattachment] ADD  DEFAULT ((0)) FOR [MyFileNum]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FK_FrmAttachment]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [NoOfObj]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [Sort]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FileFullName]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FileName]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FileExts]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FileSize]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [FK_DeptName]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT ((0)) FOR [IsRowLock]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [UploadGUID]
GO
ALTER TABLE [dbo].[sys_frmattachmentdb] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [X]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [Y]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT ((0)) FOR [IsView]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT ((0)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT ((0)) FOR [UAC]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT ((0)) FOR [EventType]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [MsgOK]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [MsgErr]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT (NULL) FOR [BtnID]
GO
ALTER TABLE [dbo].[sys_frmbtn] ADD  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [Field]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [Remark]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [RecNo]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_frmdbremark] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT ((0)) FOR [ChangeNum]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [TrackID]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [RecNo]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT ((0)) FOR [Ver]
GO
ALTER TABLE [dbo].[sys_frmdbver] ADD  DEFAULT (NULL) FOR [KeyOfEn]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [EleID]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [Tag2]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [Tag3]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [Tag4]
GO
ALTER TABLE [dbo].[sys_frmeledb] ADD  DEFAULT (NULL) FOR [Tag5]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((0)) FOR [EventSource]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [FK_Event]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [RefFlowNo]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((0)) FOR [EventDoType]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [FK_DBSrc]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [DoDoc]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [MsgOK]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [MsgError]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((0)) FOR [MsgCtrl]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((1)) FOR [MailEnable]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT (NULL) FOR [MailTitle]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((0)) FOR [SMSEnable]
GO
ALTER TABLE [dbo].[sys_frmevent] ADD  DEFAULT ((1)) FOR [MobilePushEnable]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [KeyOfEn]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((0)) FOR [ImgAppType]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [UIWidth]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [UIHeight]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [ImgURL]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [ImgPath]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [LinkURL]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [LinkTarget]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [Tag0]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((0)) FOR [ImgSrcType]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((0)) FOR [IsEdit]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [EnPK]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((0)) FOR [ColSpan]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((1)) FOR [LabelColSpan]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((1)) FOR [RowSpan]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[sys_frmimg] ADD  DEFAULT (NULL) FOR [GroupIDText]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT (NULL) FOR [CtrlID]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((1)) FOR [IsEdit]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((200.00)) FOR [H]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((160.00)) FOR [W]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT (N'0') FOR [GroupIDText]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((0)) FOR [ColSpan]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((1)) FOR [LabelColSpan]
GO
ALTER TABLE [dbo].[sys_frmimgath] ADD  DEFAULT ((1)) FOR [RowSpan]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FK_FrmImgAth]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FileFullName]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FileName]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FileExts]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [FileSize]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[sys_frmimgathdb] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT (NULL) FOR [TempFilePath]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [TemplateFileModel]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [PrintFileType]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [PrintOpenModel]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [AthSaveWay]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [QRModel]
GO
ALTER TABLE [dbo].[sys_frmprinttemplate] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [KeyOfEn]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [EnumKey]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [Lab]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT ((0)) FOR [IntKey]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT ((0)) FOR [UIIsEnable]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [SetVal]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [Tip]
GO
ALTER TABLE [dbo].[sys_frmrb] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [KeyOfEn]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [EleType]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((1)) FOR [UIIsEnable]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((1)) FOR [UIVisible]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((0)) FOR [IsSigan]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((0)) FOR [IsNotNull]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [RegularExp]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((0)) FOR [IsWriteToFlowTable]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT ((0)) FOR [IsWriteToGenerWorkFlow]
GO
ALTER TABLE [dbo].[sys_frmsln] ADD  DEFAULT (NULL) FOR [DefVal]
GO
ALTER TABLE [dbo].[sys_glovar] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_glovar] ADD  DEFAULT (NULL) FOR [GroupKey]
GO
ALTER TABLE [dbo].[sys_glovar] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [EnName]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [EnsName]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [OperateCol]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [Attrs]
GO
ALTER TABLE [dbo].[sys_groupenstemplate] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [Lab]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [CtrlType]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [CtrlID]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT ((0)) FOR [IsZDMobile]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT ((0)) FOR [ShowType]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT ((99)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_groupfield] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [KeyOfEn]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [DefValType]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [UIContralType]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [MyDataType]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [LGType]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [UIWidth]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [UIHeight]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [MinLen]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((300)) FOR [MaxLen]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [UIBindKey]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [UIRefKey]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [UIRefKeyText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [ExtIsSum]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [UIVisible]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [UIIsEnable]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [UIIsLine]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [UIIsInput]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [TextModel]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [IsSupperText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [FontSize]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [IsSigan]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [EditType]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [Tag2]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [Tag3]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [ColSpan]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [LabelColSpan]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [RowSpan]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [GroupID]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1)) FOR [IsEnableInAPP]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [CSSCtrl]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [CSSLabel]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (NULL) FOR [ICON]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [GroupIDText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [CSSCtrlText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [MyFileName]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [MyFilePath]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [MyFileExt]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [WebPath]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((0.00)) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [ExtDefVal]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [ExtDefValText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [CSSLabelText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'0') FOR [DefValText]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((3)) FOR [RBShowModel]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [NumMin]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT (N'') FOR [NumMax]
GO
ALTER TABLE [dbo].[sys_mapattr] ADD  DEFAULT ((1.00)) FOR [NumStepLength]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [FormEventEntity]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [EnPK]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [PTable]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [PTableModel]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [UrlExt]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Dtls]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((900)) FOR [FrmW]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [TableCol]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Tag]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [FK_FormTree]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [FrmShowType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [EntityType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [IsEnableJs]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [AppType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [DBSrc]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [BodyAttr]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Designer]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [DesignerUnit]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [DesignerContact]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((100)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Ver]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [FlowCtrls]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [IsTemplate]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [DBType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [ExpEn]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [ExpList]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [MainTable]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [MainTablePK]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [ExpCount]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((2)) FOR [RowOpenModel]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [SearchDictOpenType]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((500)) FOR [PopHeight]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((760)) FOR [PopWidth]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [EntityEditModel]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [BillNoFormat]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [SortColumns]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [ColorSet]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [FieldSet]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [ForamtFunc]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((1)) FOR [IsSelectMore]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [TitleRole]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [RowColorSet]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [RefDict]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'关联单据') FOR [BtnRefBill]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [RefBillRole]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [RefBill]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [Tag0]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [Tag2]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [EntityShowModel]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [FK_Flow]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [DBURL]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [URL]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [TemplaterVer]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [DBSave]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [MyFileName]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [MyFilePath]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [MyFileExt]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [WebPath]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0.00)) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [RefWorkModel]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [RefBlurField]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT (N'') FOR [RefUrl]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [RightViewWay]
GO
ALTER TABLE [dbo].[sys_mapdata] ADD  DEFAULT ((0)) FOR [RightDeptWay]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [Ver]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [IsRel]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [RowNumExt]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [AttrsNum]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [DtlsNum]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [AthsNum]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT ((0)) FOR [ExtsNum]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT (NULL) FOR [RecNote]
GO
ALTER TABLE [dbo].[sys_mapdataver] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [Alias]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [PTable]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [GroupField]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [RefPK]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [FEBD]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [Model]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [DtlVer]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((6)) FOR [RowsOfList]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsEnableGroupField]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsShowSum]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsShowIdx]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsCopyNDData]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsHLDtl]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsReadonly]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsShowTitle]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsView]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsInsert]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsUpdate]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsEnablePass]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsEnableAthM]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsCopyFirstData]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [InitDBAttrs]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [WhenOverSize]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [DtlOpenType]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [ListShowModel]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [EditModel]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [UrlDtl]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [ColAutoExp]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [MobileShowModel]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [MobileShowField]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [H]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [FrmW]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [FrmH]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [NumOfDtl]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsEnableLink]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [LinkLabel]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [LinkTarget]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [LinkUrl]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [FilterSQLExp]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [OrderBySQLExp]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [ShowCols]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((1)) FOR [IsExp]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [ImpModel]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [ImpSQLNames]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsImp]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [ExcType]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [IsEnableLink2]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (N'') FOR [LinkLabel2]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT ((0)) FOR [ExcType2]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (N'') FOR [LinkTarget2]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (N'') FOR [LinkUrl2]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (N'') FOR [SubThreadWorker]
GO
ALTER TABLE [dbo].[sys_mapdtl] ADD  DEFAULT (N'') FOR [SubThreadWorkerText]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [ExtModel]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [ExtType]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [DoWay]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [AttrOfOper]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [AttrsOfActive]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag2]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag3]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag4]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [Tag5]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT ((500)) FOR [H]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT ((400)) FOR [W]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT ((0)) FOR [DBType]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT (NULL) FOR [FK_DBSrc]
GO
ALTER TABLE [dbo].[sys_mapext] ADD  DEFAULT ((0)) FOR [PRI]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT ((0)) FOR [UrlSrcType]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [FrameURL]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [URL]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [W]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [H]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT ((1)) FOR [IsAutoSize]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [EleType]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[sys_mapframe] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [EnsName]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [D1]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [D2]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [D3]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT (NULL) FOR [AlObjs]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((600)) FOR [Height]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((800)) FOR [Width]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((0)) FOR [IsSumBig]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((0)) FOR [IsSumLittle]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((0)) FOR [IsSumRight]
GO
ALTER TABLE [dbo].[sys_rpttemplate] ADD  DEFAULT ((0)) FOR [PercentModel]
GO
ALTER TABLE [dbo].[sys_serial] ADD  DEFAULT ((0)) FOR [IntVal]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [DBSrcType]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [DBSrcTypeT]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [DBName]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [ConnString]
GO
ALTER TABLE [dbo].[sys_sfdbsrc] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT ((1)) FOR [NoGenerModel]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT ((0)) FOR [CodeStruct]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT ((0)) FOR [SrcType]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [FK_Val]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [TableDesc]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [DefVal]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'local') FOR [FK_SFDBSrc]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [ParentValue]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [RootVal]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [SrcTable]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [ColumnValue]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [ColumnText]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH0]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name0]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH1]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name1]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH2]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name2]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH3]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name3]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH4]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name4]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH5]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name5]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH6]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name6]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH7]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name7]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH8]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name8]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH9]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name9]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH10]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name10]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH11]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name11]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH12]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name12]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH13]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name13]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH14]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name14]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH15]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name15]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH16]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name16]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH17]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name17]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH18]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name18]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH19]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name19]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH20]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name20]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH21]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name21]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH22]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name22]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH23]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name23]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH24]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name24]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH25]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name25]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH26]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name26]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH27]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name27]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH28]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name28]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH29]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name29]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH30]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name30]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH31]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name31]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH32]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name32]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH33]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name33]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH34]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name34]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH35]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name35]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH36]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name36]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH37]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name37]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH38]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name38]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH39]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name39]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH40]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name40]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH41]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name41]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH42]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name42]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH43]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name43]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH44]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name44]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH45]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name45]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH46]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name46]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH47]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name47]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH48]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name48]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [BH49]
GO
ALTER TABLE [dbo].[sys_sftable] ADD  DEFAULT (N'') FOR [Name49]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT (NULL) FOR [FK_SFTable]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT (NULL) FOR [BH]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[sys_sftabledtl] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [Sender]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [SendTo]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [Mobile]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT ((0)) FOR [MobileSta]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [MobileInfo]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT ((0)) FOR [EmailSta]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [EmailTitle]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [SendDT]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT ((0)) FOR [IsAlert]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [MsgFlag]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [MsgType]
GO
ALTER TABLE [dbo].[sys_sms] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[sys_userloglevel] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [IP]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [LogFlag]
GO
ALTER TABLE [dbo].[sys_userlogt] ADD  DEFAULT (NULL) FOR [Level]
GO
ALTER TABLE [dbo].[sys_userlogtype] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (NULL) FOR [CfgKey]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (NULL) FOR [EnsName]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (NULL) FOR [AttrKey]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (NULL) FOR [Vals]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [FK_MapData]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT ((0)) FOR [LB]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [GenerSQL]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [Paras]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [NumKey]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [OrderBy]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [OrderWay]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [SearchKey]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [MVals]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT ((0)) FOR [IsPic]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [DTFrom]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [DTTo]
GO
ALTER TABLE [dbo].[sys_userregedit] ADD  DEFAULT (N'') FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT ((0)) FOR [FK_Mode]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag0]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag2]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag3]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag4]
GO
ALTER TABLE [dbo].[wf_accepterrole] ADD  DEFAULT (NULL) FOR [Tag5]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [Auther]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT ((0)) FOR [AuthType]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [AutherToEmpNo]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [AutherToEmpName]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [TakeBackDT]
GO
ALTER TABLE [dbo].[wf_auth] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_autorpt] ADD  DEFAULT (NULL) FOR [DTOfExe]
GO
ALTER TABLE [dbo].[wf_autorpt] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_autorpt] ADD  DEFAULT (NULL) FOR [StartDT]
GO
ALTER TABLE [dbo].[wf_autorpt] ADD  DEFAULT (NULL) FOR [ToEmpOfSQLs]
GO
ALTER TABLE [dbo].[wf_autorptdtl] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_autorptdtl] ADD  DEFAULT (NULL) FOR [SQLExp]
GO
ALTER TABLE [dbo].[wf_autorptdtl] ADD  DEFAULT (NULL) FOR [UrlExp]
GO
ALTER TABLE [dbo].[wf_autorptdtl] ADD  DEFAULT (NULL) FOR [BeiZhu]
GO
ALTER TABLE [dbo].[wf_autorptdtl] ADD  DEFAULT (NULL) FOR [AutoRptNo]
GO
ALTER TABLE [dbo].[wf_ccdept] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_ccemp] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [Sta]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [CCTo]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [CCToName]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [CDT]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [ReadDT]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [PFlowNo]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [PWorkID]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT ((0)) FOR [InEmpWorks]
GO
ALTER TABLE [dbo].[wf_cclist] ADD  DEFAULT (NULL) FOR [Domain]
GO
ALTER TABLE [dbo].[wf_ccrole] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[wf_ccrole] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_ccrole] ADD  DEFAULT ((0)) FOR [CCRoleExcType]
GO
ALTER TABLE [dbo].[wf_ccrole] ADD  DEFAULT ((0)) FOR [CCStaWay]
GO
ALTER TABLE [dbo].[wf_ccrole] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_ccstation] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_FlowT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_NodeT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [Sender]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [SenderT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_EmpT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [GroupEmps]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [GroupEmpsNames]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((1)) FOR [GroupEmpsNum]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [DTFrom]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [DTTo]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [SDT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_DeptT]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [FK_NY]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [DTSWay]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [OverMinutes]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [UseDays]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [OverDays]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [CHSta]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT ((0)) FOR [WeekNum]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [Points]
GO
ALTER TABLE [dbo].[wf_ch] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [RecName]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [EvalEmpNo]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [EvalEmpName]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [EvalCent]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [EvalNote]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[wf_cheval] ADD  DEFAULT (NULL) FOR [FK_NY]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [FK_EmpT]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [StartDT]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [EndDT]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT ((0)) FOR [GT]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [Scale]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [TotalScale]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [ChanZhi]
GO
ALTER TABLE [dbo].[wf_chnode] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [RefFlowNo]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT ((0)) FOR [CondType]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [SubFlowNo]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT ((0)) FOR [ToNodeID]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT ((0)) FOR [DataFrom]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [DataFromText]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [FK_Attr]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [AttrKey]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [AttrName]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [FK_Operator]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [Note]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [FK_DBSrc]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_cond] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[wf_deptflowsearch] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_deptflowsearch] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_deptflowsearch] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT ((0)) FOR [Node]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT ((0)) FOR [ToNode]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT (NULL) FOR [ToNodeName]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT ((0)) FOR [GateWay]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT (NULL) FOR [Des]
GO
ALTER TABLE [dbo].[wf_direction] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_directionstation] ADD  DEFAULT ((0)) FOR [FK_Direction]
GO
ALTER TABLE [dbo].[wf_doctemplate] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_doctemplate] ADD  DEFAULT (NULL) FOR [FilePath]
GO
ALTER TABLE [dbo].[wf_doctemplate] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_doctemplate] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT ((1)) FOR [UseSta]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Tel]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Stas]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Depts]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [SPass]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [Author]
GO
ALTER TABLE [dbo].[wf_emp] ADD  DEFAULT (NULL) FOR [AuthorDate]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortVal0]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortText0]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortVal1]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortText1]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortVal2]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortText2]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortVal3]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [SortText3]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagVal0]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagVal1]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagVal2]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagVal3]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagText0]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagText1]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagText2]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT (NULL) FOR [TagText3]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[wf_findworkerrole] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [FK_FlowSort]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [FlowMark]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [FlowEventEntity]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [TitleRole]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [TitleRoleNodes]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsCanStart]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsFullSA]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [GuestFlowRole]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [Draft]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [SysType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [Tester]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [ChartType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [CreateDate]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [Creater]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsBatchStart]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [BatchStartFields]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsResetData]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsLoadPriData]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsDBTemplate]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsStartInMobile]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsMD5]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsJM]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsEnableDBVer]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [PTable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [BillNoFormat]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [BuessFields]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (NULL) FOR [AdvEmps]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsFrmEnable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsTruckEnable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsTimeBaseEnable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [IsTableEnable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsOPEnable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [SubFlowShowType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [TrackOrderBy]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [FlowRunWay]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [WorkModel]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [RunObj]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [Note]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [RunSQL]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [NumOfBill]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [NumOfDtl]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [FlowAppType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [SDTOfFlowRole]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [SDTOfFlowRoleSQL]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [FrmUrl]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [DRCtrlType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [IsToParentNextNode]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [StartLimitRole]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartLimitPara]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartLimitAlert]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [StartLimitWhen]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [StartGuideWay]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartGuideLink]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartGuideLab]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartGuidePara1]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartGuidePara2]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [StartGuidePara3]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [Ver]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [DevModelType]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [DevModelPara]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [DataDTSWay]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [DTSDBSrc]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [DTSBTable]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [DTSBTablePK]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [DTSTime]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [DTSFields]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [FlowDevModel]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PStarter]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PWorker]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PCCer]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [PAnyOne]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PMyDept]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PPMyDept]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PPDept]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PSameDept]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PSpecDept]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [PSpecDeptExt]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PSpecSta]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [PSpecStaExt]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PSpecGroup]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [PSpecGroupExt]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((1)) FOR [PSpecEmp]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [PSpecEmpExt]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [MyDeptRole]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [MyFileName]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [MyFilePath]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [MyFileExt]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [WebPath]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT ((0.00)) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[wf_flow] ADD  DEFAULT (N'') FOR [FK_FlowSortText]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT (NULL) FOR [ParentNo]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT (NULL) FOR [ShortName]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT (NULL) FOR [Domain]
GO
ALTER TABLE [dbo].[wf_flowsort] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [Mark]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [Tip]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [UrlExt]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [Icon]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_flowtab] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [FK_Frm]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [IsPrint]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [IsEnableLoadData]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [IsCloseEtcFrm]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [WhoIsPK]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [FrmSln]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [BillNoField]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [BillNoFieldText]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [FrmNameShow]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [Is1ToN]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [HuiZong]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [TempleteFile]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [IsEnableFWC]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [CheckField]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [CheckFieldText]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [SFSta]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [FrmEnableRole]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [FrmEnableExp]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT (N'0') FOR [FrmType]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((0)) FOR [IsDefaultOpen]
GO
ALTER TABLE [dbo].[wf_frmnode] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT (NULL) FOR [Fields]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT (NULL) FOR [ExpType]
GO
ALTER TABLE [dbo].[wf_frmnodefieldremove] ADD  DEFAULT (NULL) FOR [Exp]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [FK_EmpText]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [FK_NodeText]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [SDT]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [DTOfWarning]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [CDT]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [IsPass]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [WhoExeIt]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [Sender]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((1)) FOR [PRI]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [PressTimes]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [DTOfHungup]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [DTOfUnHungup]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((0)) FOR [HungupTimes]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [GuestNo]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT (NULL) FOR [GuestName]
GO
ALTER TABLE [dbo].[wf_generworkerlist] ADD  DEFAULT ((1)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FK_FlowSort]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [SysType]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [WFSta]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [WFState]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [Starter]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [StarterName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [Sender]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [HungupTime]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [SendDT]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((1)) FOR [PRI]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [SDTOfNode]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [SDTOfFlow]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [SDTOfFlowWarning]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [PFlowNo]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [PWorkID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [PNodeID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [PFID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [PEmp]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [GuestNo]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [GuestName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [BillNo]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [TodoEmpsNum]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [TaskSta]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [GUID]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FK_NY]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [WeekNum]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [TSpan]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT ((0)) FOR [TodoSta]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [Domain]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [PrjNo]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [PrjName]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [OrgNo]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [FlowNote]
GO
ALTER TABLE [dbo].[wf_generworkflow] ADD  DEFAULT (NULL) FOR [LostTimeHH]
GO
ALTER TABLE [dbo].[wf_labnote] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_labnote] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_labnote] ADD  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[wf_labnote] ADD  DEFAULT ((0)) FOR [Y]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FlowName]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [WhoExeIt]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ReadReceipts]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CancelRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CancelDisWhenRead]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsOpenOver]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsSendDraftSubFlow]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsResetAccepter]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsGuestNode]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsYouLiTai]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FocusField]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCSta]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCAth]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [DeliveryWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [SelfParas]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [Step]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [Tip]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [RunModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PassRate]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [ThreadIsCanDel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [ThreadIsCanAdd]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ThreadIsCanShift]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [USSWorkIDRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsSendBackNode]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AutoJumpRole0]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AutoJumpRole1]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AutoJumpRole2]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [WhenNoWorker]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [AutoJumpExp]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SkipTime]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [SendLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [SendJS]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [SaveLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [SaveEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [CCLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [QRCodeLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [QRCodeRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ShiftLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ShiftEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [DelLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [DelEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [EndFlowLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [EndFlowEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ShowParentFormLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ShowParentFormEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [OfficeBtnLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [OfficeBtnEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [OfficeFileType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [OfficeBtnLocal]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [TrackLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [TrackEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [HungLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [HungEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [SearchLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SearchEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [TCLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TCEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FrmDBVerLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmDBVerEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FrmDBRemarkLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmDBRemarkEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PRILab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PRIEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [CHLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CHRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [AllotLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AllotEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FocusLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FocusEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ConfirmLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ConfirmEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ListLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [ListEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [BatchLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [BatchEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [NoteLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [NoteEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [HelpLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [HelpRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ScripLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ScripRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [FlowBBSLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FlowBBSRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [IMLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IMEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [NextLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [NextRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ThreadLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ThreadEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ThreadKillRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [JumpWayLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [JumpWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [JumpToNodes]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ShowParentFormEnableMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [TrackEnableMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmDBVerMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmDBRemarkEnableMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PressLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [PressEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [RollbackLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [RollbackEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ShowParentFormEnableMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [TrackEnableMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmDBVerMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ReturnLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ReturnRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ReturnAlert]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsBackTracking]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsBackResetAccepter]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsKillEtcThread]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ReturnCHEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ReturnOneNodeRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ReturnField]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ReturnReasonsItems]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PrintHtmlLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintHtmlEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintHtmlMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintHtmlMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PrintPDFLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintPDFEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintPDFMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintPDFMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintPDFModle]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [ShuiYinModle]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PrintZipLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintZipEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintZipMyView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintZipMyCC]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [PrintDocLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [PrintDocEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [HuiQianLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [HuiQianRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [AddLeaderLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AddLeaderEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [HuiQianLeaderRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TAlertRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TAlertWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [WAlertRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [WAlertWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (NULL) FOR [TCent]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CHWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsEval]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [OutTimeDeal]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCWriteTo]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCIsAttr]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [CCFormAttr]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCIsStations]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCStaWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCIsDepts]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCIsEmps]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CCIsSQLs]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [CCSQL]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [CCTitle]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'审核信息') FOR [FWCLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FWCNodeName]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'审核') FOR [FWCOpLabel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FWCDefInfo]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SigantureEnabel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FWCIsFullInfo]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FWCFields]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FWCVer]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeFrmID]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [CheckField]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [CheckFieldText]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FWCView]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FWCShowModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCOrderModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCMsgShow]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((300.00)) FOR [FWC_H]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FWCTrackEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FWCListEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCIsShowAllStep]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCIsShowTruck]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FWCIsShowReturnMsg]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [ICON]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [NodeWorkType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FrmAttr]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SFSta]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SubFlowX]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SubFlowY]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((2.00)) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TWay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1.00)) FOR [WarningDay]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [DoOutTime]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [DoOutTimeCond]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [Doc]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [IsTask]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [IsExpSender]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [DeliveryParas]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SaveModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsCanDelFlow]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TodolistModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TeamLeaderConfirmRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [TeamLeaderConfirmDoc]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [IsRM]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsHandOver]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [BlockModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [BlockExp]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [BlockAlert]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [CondModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [BatchRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [FormType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'http://') FOR [FormUrl]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [TurnToDeal]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [TurnToDealDoc]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [NodePosType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [HisStas]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [HisDeptStrs]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [HisToNDs]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [HisBillIDs]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [HisSubFlows]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [PTable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [GroupStaNDs]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [Y]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [RefOneFrmTreeType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((300.00)) FOR [SF_H]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeStations]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeStationsT]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeEmps]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeEmpsT]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeDepts]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [NodeDeptsT]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'轨迹') FOR [FrmTrackLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FrmTrackSta]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((300.00)) FOR [FrmTrack_H]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'子流程') FOR [SFLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SFShowModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SFShowCtrl]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [AllSubFlowOverRole]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'启动子流程') FOR [SFCaption]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SFDefInfo]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SFFields]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [SFOpenType]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'流转自定义') FOR [FTCLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FTCSta]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [FTCWorkModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((300.00)) FOR [FTC_H]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((5)) FOR [SelectorModel]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FK_SQLTemplate]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [FK_SQLTemplateText]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((1)) FOR [IsAutoLoadEmps]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsSimpleSelector]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsEnableDeptRange]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [IsEnableStaRange]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SelectorP1]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SelectorP2]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SelectorP3]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'') FOR [SelectorP4]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'延期发送') FOR [DelayedSendLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [DelayedSendEnable]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT (N'切换部门') FOR [ChangeDeptLab]
GO
ALTER TABLE [dbo].[wf_node] ADD  DEFAULT ((0)) FOR [ChangeDeptEnable]
GO
ALTER TABLE [dbo].[wf_nodecancel] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodecancel] ADD  DEFAULT ((0)) FOR [CancelTo]
GO
ALTER TABLE [dbo].[wf_nodedept] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodedept] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_nodeemp] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodeemp] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_nodereturn] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodereturn] ADD  DEFAULT ((0)) FOR [ReturnTo]
GO
ALTER TABLE [dbo].[wf_nodestation] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodestation] ADD  DEFAULT (NULL) FOR [FK_Station]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowNo]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowName]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsSubFlowGuide]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowGuideSQL]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowGuideGroup]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowGuideEnNoFiled]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [SubFlowGuideEnNameFiled]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SubFlowStartModel]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SubFlowShowModel]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SubFlowHidTodolist]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((2)) FOR [SubFlowType]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SubFlowModel]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((1)) FOR [SubFlowSta]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((3)) FOR [ExpType]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [CondExp]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [YanXuToNode]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [YBFlowReturnRole]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (NULL) FOR [ReturnToNode]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'0') FOR [ReturnToNodeText]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SubFlowLab]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [ParentFlowSendNextStepRole]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [ParentFlowOverRole]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SubFlowNodeID]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsAutoSendSLSubFlowOver]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [StartOnceOnly]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [CompleteReStart]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsEnableSpecFlowStart]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SpecFlowStart]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SpecFlowStartNote]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsEnableSpecFlowOver]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SpecFlowOver]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SpecFlowOverNote]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SubFlowCopyFields]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [BackCopyRole]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [ParentFlowCopyFields]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [InvokeTime]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsEnableSQL]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SpecSQL]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [IsEnableSameLevelNode]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT (N'') FOR [SameLevelNode]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [SendModel]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[wf_nodesubflow] ADD  DEFAULT ((0)) FOR [Y]
GO
ALTER TABLE [dbo].[wf_nodeteam] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodeteam] ADD  DEFAULT (NULL) FOR [FK_Team]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [ExcType]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [UrlExt]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [Target]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [IsMyFlow]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [IsMyTree]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [IsMyView]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [IsMyCC]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [IconPath]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [MyFileName]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [MyFilePath]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [MyFileExt]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [WebPath]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [MyFileH]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT ((0)) FOR [MyFileW]
GO
ALTER TABLE [dbo].[wf_nodetoolbar] ADD  DEFAULT (NULL) FOR [MyFileSize]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [PartType]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag0]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag1]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag2]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag3]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag4]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag5]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag6]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag7]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag8]
GO
ALTER TABLE [dbo].[wf_part] ADD  DEFAULT (NULL) FOR [Tag9]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [Model]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [PowerFlag]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [PowerFlagName]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT ((0)) FOR [PowerCtrlType]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [StaNo]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [StaName]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_powermodel] ADD  DEFAULT (NULL) FOR [FrmID]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [FK_Event]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT ((0)) FOR [PushWay]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [Tag]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT ((0)) FOR [SMSPushWay]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [SMSField]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [SMSNodes]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [SMSPushModel]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT ((0)) FOR [MailPushWay]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [MailAddress]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [MailTitle]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [MailNodes]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [BySQL]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [ByEmps]
GO
ALTER TABLE [dbo].[wf_pushmsg] ADD  DEFAULT (NULL) FOR [AtPara]
GO
ALTER TABLE [dbo].[wf_rememberme] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_rememberme] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT ((0)) FOR [ReturnNode]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT (NULL) FOR [ReturnNodeName]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT (NULL) FOR [Returner]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT (NULL) FOR [ReturnerName]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT ((0)) FOR [ReturnToNode]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_returnwork] ADD  DEFAULT ((0)) FOR [IsBackTracking]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [FK_Emp]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [EmpName]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [DeptName]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [AccType]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [Rec]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [Info]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [IsRemember]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [Tag]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT ((0)) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [TSpanHour]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [ADT]
GO
ALTER TABLE [dbo].[wf_selectaccper] ADD  DEFAULT (NULL) FOR [SDT]
GO
ALTER TABLE [dbo].[wf_sqltemplate] ADD  DEFAULT ((0)) FOR [SQLType]
GO
ALTER TABLE [dbo].[wf_sqltemplate] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [SyncType]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [SyncTypeT]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [APIUrl]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [DBSrc]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [SQLTables]
GO
ALTER TABLE [dbo].[wf_syncdata] ADD  DEFAULT (NULL) FOR [SQLFields]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [RefPKVal]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [AttrKey]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [AttrName]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [AttrType]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [ToFieldKey]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [ToFieldName]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [ToFieldType]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT ((0)) FOR [IsSync]
GO
ALTER TABLE [dbo].[wf_syncdatafield] ADD  DEFAULT (NULL) FOR [TurnFunc]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT (NULL) FOR [Starter]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT ((0)) FOR [ToNode]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT (NULL) FOR [ToEmps]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT ((0)) FOR [TaskSta]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT (NULL) FOR [StartDT]
GO
ALTER TABLE [dbo].[wf_task] ADD  DEFAULT (NULL) FOR [RDT]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT ((0)) FOR [FK_Node]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT (NULL) FOR [Worker]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT (NULL) FOR [WorkerName]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT (NULL) FOR [SubFlowNo]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT (NULL) FOR [PlanDT]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT ((0)) FOR [TodolistModel]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT ((0)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[wf_transfercustom] ADD  DEFAULT ((0)) FOR [Idx]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT ((0)) FOR [FID]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FK_Dept]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FlowStarter]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FlowStartRDT]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FK_Flow]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FlowEnderRDT]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT ((0)) FOR [FlowEndNode]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FlowDaySpan]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [FlowEmps]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [Oper]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [OperDept]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [OperDeptName]
GO
ALTER TABLE [dbo].[wf_workflowdeletelog] ADD  DEFAULT (NULL) FOR [DeleteDT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT ((0)) FOR [WorkID]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT ((0)) FOR [NodeID]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT ((0)) FOR [ToNodeID]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [EmpNo]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [FlowNo]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendEmps]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendEmpsT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendDepts]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendDeptsT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendStas]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendStasT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCEmps]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCEmpsT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCDepts]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCDeptsT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCStas]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [CCStasT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [NodeName]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [ToNodeName]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [TodoEmps]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SenderName]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendRDT]
GO
ALTER TABLE [dbo].[wf_workopt] ADD  DEFAULT (NULL) FOR [SendSDT]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_bbs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_bbs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_collection' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_collection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_deptcreate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_deptcreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_dictflow' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_dictflow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_empcreate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_empcreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_func' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_func'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_generbill' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_generbill'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_groupmethod' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_groupmethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_method' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_stationcreate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_stationcreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_stationdept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_stationdept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_toolbarbtn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_toolbarbtn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.frm_track' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'frm_track'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_deptmenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_deptmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_empmenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_empmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_groupdept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_groupdept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_groupemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_groupemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_groupmenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_groupmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_groupstation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_groupstation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_menudtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_menudtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_module' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_powercenter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_powercenter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_stationmenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_stationmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_system'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_window' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_window'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_windowtemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_windowtemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.gpm_windowtemplatedtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gpm_windowtemplatedtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.nd1rpt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'nd1rpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.nd1track' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'nd1track'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_bbs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_bbs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_bbstype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_bbstype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_infotype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_infotype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_kmdtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_kmdtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_kmtree' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_kmtree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_knowledge' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_knowledge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_notepad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notepad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_schedule' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_task' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_task'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_workchecker' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_workchecker'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_workrec' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_workrec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_workrecdtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_workrecdtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.oa_workshare' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_workshare'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_dept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_deptemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_deptemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_deptempstation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_deptempstation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_emp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_emp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_org' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_orgadminer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_orgadminer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_orgadminerflowsort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_orgadminerflowsort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_orgadminerfrmtree' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_orgadminerfrmtree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_station' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_station'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_stationtype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_stationtype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_team'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_teamemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_teamemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_teamtype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_teamtype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.port_user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'port_user'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.pub_ny' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pub_ny'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_docfile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_docfile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_encfg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_encfg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_enum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_enum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_enummain' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_enummain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_enver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_enver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_enverdtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_enverdtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_filemanager' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_filemanager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_formtree' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_formtree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmattachment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmattachment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmattachmentdb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmattachmentdb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmbtn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmbtn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmdbremark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmdbremark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmdbver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmdbver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmeledb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmeledb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmevent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmevent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmimg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmimg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmimgath' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmimgath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmimgathdb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmimgathdb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmprinttemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmprinttemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmrb' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmrb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_frmsln' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_frmsln'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_glovar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_glovar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_groupenstemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groupenstemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_groupfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groupfield'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapattr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapattr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapdata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapdata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapdataver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapdataver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapdtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapdtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapext' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapext'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_mapframe' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mapframe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_rptdept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_rptdept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_rptemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_rptemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_rptstation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_rptstation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_rpttemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_rpttemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_serial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_serial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_sfdbsrc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_sfdbsrc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_sftable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_sftable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_sftabledtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_sftabledtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_sms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_sms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_userloglevel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_userloglevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_userlogt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_userlogt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_userlogtype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_userlogtype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.sys_userregedit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_userregedit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_accepterrole' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_accepterrole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_auth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_auth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_autorpt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_autorpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_autorptdtl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_autorptdtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_ccdept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_ccdept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_ccemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_ccemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_cclist' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_cclist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_ccrole' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_ccrole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_ccstation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_ccstation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_ch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_ch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_cheval' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_cheval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_chnode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_chnode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_cond' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_cond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_deptflowsearch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_deptflowsearch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_direction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_direction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_directionstation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_directionstation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_doctemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_doctemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_emp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_emp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_findworkerrole' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_findworkerrole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_flow' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_flow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_floworg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_floworg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_flowsort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_flowsort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_flowtab' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_flowtab'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_frmnode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_frmnode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_frmnodefieldremove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_frmnodefieldremove'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_frmorg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_frmorg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_generworkerlist' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_generworkerlist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_generworkflow' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_generworkflow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_labnote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_labnote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_node' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_node'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodecancel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodecancel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodedept' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodedept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodeemp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodeemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodereturn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodereturn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodestation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodestation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodesubflow' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodesubflow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodeteam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodeteam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_nodetoolbar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_nodetoolbar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_part' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_part'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_powermodel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_powermodel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_pushmsg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_pushmsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_rememberme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_rememberme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_returnwork' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_returnwork'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_selectaccper' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_selectaccper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_sqltemplate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_sqltemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_syncdata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_syncdata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_syncdatafield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_syncdatafield'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_task' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_task'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_transfercustom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_transfercustom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_workflowdeletelog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_workflowdeletelog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.wf_workopt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wf_workopt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.v_myflowdata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_myflowdata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ccflow.v_wf_authtodolist' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_wf_authtodolist'
GO
USE [master]
GO
ALTER DATABASE [ccflow] SET  READ_WRITE 
GO
