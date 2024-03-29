USE [master]
GO
/****** Object:  Database [CCRESDummy]    Script Date: 10/16/2019 7:52:12 PM ******/
CREATE DATABASE [CCRESDummy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CCRESDummy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CCRESDummy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CCRESDummy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CCRESDummy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CCRESDummy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CCRESDummy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CCRESDummy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CCRESDummy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CCRESDummy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CCRESDummy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CCRESDummy] SET ARITHABORT OFF 
GO
ALTER DATABASE [CCRESDummy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CCRESDummy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CCRESDummy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CCRESDummy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CCRESDummy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CCRESDummy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CCRESDummy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CCRESDummy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CCRESDummy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CCRESDummy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CCRESDummy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CCRESDummy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CCRESDummy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CCRESDummy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CCRESDummy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CCRESDummy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CCRESDummy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CCRESDummy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CCRESDummy] SET  MULTI_USER 
GO
ALTER DATABASE [CCRESDummy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CCRESDummy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CCRESDummy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CCRESDummy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CCRESDummy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CCRESDummy] SET QUERY_STORE = OFF
GO
USE [CCRESDummy]
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
USE [CCRESDummy]
GO
/****** Object:  Table [dbo].[AudienceInformation]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudienceInformation](
	[AudienceInformationId] [int] NOT NULL,
	[PointBalance] [int] NOT NULL,
	[EventNickName] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClinicalProgramId] [int] NOT NULL,
	[WaveId] [int] NOT NULL,
	[JobTitleId] [int] NOT NULL,
 CONSTRAINT [PK_AudienceInformation] PRIMARY KEY CLUSTERED 
(
	[AudienceInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClinicalProgram]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalProgram](
	[ClinicalProgramId] [int] NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ClinicalProgram] PRIMARY KEY CLUSTERED 
(
	[ClinicalProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDate] [date] NOT NULL,
	[WaveId] [int] NOT NULL,
	[EventLocation] [varchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[EventName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventQuestion]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventQuestion](
	[EventQuestionId] [int] NOT NULL,
	[Question] [varchar](255) NOT NULL,
	[QuestionTypeId] [int] NOT NULL,
	[SlideId] [int] NOT NULL,
 CONSTRAINT [PK_EventQuestion] PRIMARY KEY CLUSTERED 
(
	[EventQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventQuestionAnswer]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventQuestionAnswer](
	[EventQuestionAnswerId] [int] NOT NULL,
	[EventQuestionId] [int] NOT NULL,
	[CorrectAnswer] [char](10) NOT NULL,
	[PointsAvailable] [int] NULL,
	[TimeLimit] [datetime] NULL,
 CONSTRAINT [PK_EventQuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[EventQuestionAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventQuestionOption]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventQuestionOption](
	[EventQuestionOptionId] [int] NOT NULL,
	[EventQuestionId] [int] NOT NULL,
	[OptionValue] [char](10) NOT NULL,
	[OptionText] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventQuestionOption] PRIMARY KEY CLUSTERED 
(
	[EventQuestionOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[JobTitleId] [int] NOT NULL,
	[JobTitle] [varchar](100) NOT NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobTitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentation]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentation](
	[PresentationId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PresentationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Presentation] PRIMARY KEY CLUSTERED 
(
	[PresentationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresentationEvent]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresentationEvent](
	[PresentationEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[PresentationId] [int] NOT NULL,
 CONSTRAINT [PK_PresentationEvent] PRIMARY KEY CLUSTERED 
(
	[PresentationEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionCategory](
	[QuestionCategoryId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionCategory] PRIMARY KEY CLUSTERED 
(
	[QuestionCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[QuestionTypeId] [int] NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideId] [int] NOT NULL,
	[PresentationEventId] [int] NOT NULL,
	[SlideNumber] [int] NOT NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[HeathlyEmail] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserRoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswer]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswer](
	[UserAnswerId] [int] NOT NULL,
	[EventQuestionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Answer] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UserAnswer] PRIMARY KEY CLUSTERED 
(
	[UserAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEvent]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEvent](
	[UserEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PointsEarned] [int] NULL,
	[StartingPoints] [int] NULL,
 CONSTRAINT [PK_UserEvent] PRIMARY KEY CLUSTERED 
(
	[UserEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserQuestion]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserQuestion](
	[UserQuestionId] [int] NOT NULL,
	[PresentationId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Question] [varchar](255) NOT NULL,
	[FAQ] [bit] NOT NULL,
	[QuestionCategoryId] [int] NOT NULL,
	[Accepted] [bit] NOT NULL,
	[Answer] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UserQuestion] PRIMARY KEY CLUSTERED 
(
	[UserQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wave]    Script Date: 10/16/2019 7:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wave](
	[WaveId] [int] NOT NULL,
	[Desciption] [varchar](255) NOT NULL,
	[WaveNumber] [int] NOT NULL,
 CONSTRAINT [PK_Wave] PRIMARY KEY CLUSTERED 
(
	[WaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AudienceInformation]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalProgram_AudienceInformation] FOREIGN KEY([ClinicalProgramId])
REFERENCES [dbo].[ClinicalProgram] ([ClinicalProgramId])
GO
ALTER TABLE [dbo].[AudienceInformation] CHECK CONSTRAINT [FK_ClinicalProgram_AudienceInformation]
GO
ALTER TABLE [dbo].[AudienceInformation]  WITH CHECK ADD  CONSTRAINT [FK_JobTitle_AudienceInformation] FOREIGN KEY([JobTitleId])
REFERENCES [dbo].[JobTitle] ([JobTitleId])
GO
ALTER TABLE [dbo].[AudienceInformation] CHECK CONSTRAINT [FK_JobTitle_AudienceInformation]
GO
ALTER TABLE [dbo].[AudienceInformation]  WITH CHECK ADD  CONSTRAINT [FK_User_AudienceInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[AudienceInformation] CHECK CONSTRAINT [FK_User_AudienceInformation]
GO
ALTER TABLE [dbo].[AudienceInformation]  WITH CHECK ADD  CONSTRAINT [FK_Wave_AudienceInformation] FOREIGN KEY([WaveId])
REFERENCES [dbo].[Wave] ([WaveId])
GO
ALTER TABLE [dbo].[AudienceInformation] CHECK CONSTRAINT [FK_Wave_AudienceInformation]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_User_Event] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_User_Event]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Wave_Event] FOREIGN KEY([WaveId])
REFERENCES [dbo].[Wave] ([WaveId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Wave_Event]
GO
ALTER TABLE [dbo].[EventQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_EventQuestion_EventQuestionAnswer] FOREIGN KEY([EventQuestionId])
REFERENCES [dbo].[EventQuestion] ([EventQuestionId])
GO
ALTER TABLE [dbo].[EventQuestionAnswer] CHECK CONSTRAINT [FK_EventQuestion_EventQuestionAnswer]
GO
ALTER TABLE [dbo].[EventQuestionOption]  WITH CHECK ADD  CONSTRAINT [FK_EventQuestion_EventQuestionOption] FOREIGN KEY([EventQuestionId])
REFERENCES [dbo].[EventQuestion] ([EventQuestionId])
GO
ALTER TABLE [dbo].[EventQuestionOption] CHECK CONSTRAINT [FK_EventQuestion_EventQuestionOption]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_Agenda_Presentation] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_Agenda_Presentation]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_User_Presentation] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_User_Presentation]
GO
ALTER TABLE [dbo].[PresentationEvent]  WITH CHECK ADD  CONSTRAINT [FK_Event_PresentationEvent] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[PresentationEvent] CHECK CONSTRAINT [FK_Event_PresentationEvent]
GO
ALTER TABLE [dbo].[PresentationEvent]  WITH CHECK ADD  CONSTRAINT [FK_Presentation_PresentationEvent] FOREIGN KEY([PresentationId])
REFERENCES [dbo].[Presentation] ([PresentationId])
GO
ALTER TABLE [dbo].[PresentationEvent] CHECK CONSTRAINT [FK_Presentation_PresentationEvent]
GO
ALTER TABLE [dbo].[PresentationEvent]  WITH CHECK ADD  CONSTRAINT [FK_PresentationEvent_PresentationEvent] FOREIGN KEY([PresentationEventId])
REFERENCES [dbo].[PresentationEvent] ([PresentationEventId])
GO
ALTER TABLE [dbo].[PresentationEvent] CHECK CONSTRAINT [FK_PresentationEvent_PresentationEvent]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_PresenationEvent_Slide] FOREIGN KEY([PresentationEventId])
REFERENCES [dbo].[PresentationEvent] ([PresentationEventId])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_PresenationEvent_Slide]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[UserRole] ([UserRoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
ALTER TABLE [dbo].[UserAnswer]  WITH CHECK ADD  CONSTRAINT [FK_EventQuestionId_UserAnswer] FOREIGN KEY([EventQuestionId])
REFERENCES [dbo].[EventQuestion] ([EventQuestionId])
GO
ALTER TABLE [dbo].[UserAnswer] CHECK CONSTRAINT [FK_EventQuestionId_UserAnswer]
GO
ALTER TABLE [dbo].[UserAnswer]  WITH CHECK ADD  CONSTRAINT [FK_User_UserAnswer] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAnswer] CHECK CONSTRAINT [FK_User_UserAnswer]
GO
ALTER TABLE [dbo].[UserEvent]  WITH CHECK ADD  CONSTRAINT [FK_User_UserEvent] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserEvent] CHECK CONSTRAINT [FK_User_UserEvent]
GO
ALTER TABLE [dbo].[UserQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuestionCategory_UserQuestion] FOREIGN KEY([QuestionCategoryId])
REFERENCES [dbo].[QuestionCategory] ([QuestionCategoryId])
GO
ALTER TABLE [dbo].[UserQuestion] CHECK CONSTRAINT [FK_QuestionCategory_UserQuestion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Connects the user with their userRole' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'CONSTRAINT',@level2name=N'FK_User_UserRole'
GO
USE [master]
GO
ALTER DATABASE [CCRESDummy] SET  READ_WRITE 
GO
