USE [master]
GO
/****** Object:  Database [TelerikedIn]    Script Date: 14.7.2013 г. 22:25:12 ч. ******/
CREATE DATABASE [TelerikedIn]

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TelerikedIn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TelerikedIn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TelerikedIn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TelerikedIn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TelerikedIn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TelerikedIn] SET ARITHABORT OFF 
GO
ALTER DATABASE [TelerikedIn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TelerikedIn] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TelerikedIn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TelerikedIn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TelerikedIn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TelerikedIn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TelerikedIn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TelerikedIn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TelerikedIn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TelerikedIn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TelerikedIn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TelerikedIn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TelerikedIn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TelerikedIn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TelerikedIn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TelerikedIn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TelerikedIn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TelerikedIn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TelerikedIn] SET RECOVERY FULL 
GO
ALTER DATABASE [TelerikedIn] SET  MULTI_USER 
GO
ALTER DATABASE [TelerikedIn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TelerikedIn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TelerikedIn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TelerikedIn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TelerikedIn', N'ON'
GO
USE [TelerikedIn]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Connections]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ConnectionName] [nvarchar](max) NULL,
	[ConnectionOccupation] [nvarchar](max) NULL,
	[ConnectionUserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Connections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endorsments]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsments](
	[EndorsmentId] [int] IDENTITY(1,1) NOT NULL,
	[EndorsedUserProfileId] [int] NOT NULL,
	[EndorsedByUserProfileId] [int] NOT NULL,
	[EndorsedSkillId] [int] NOT NULL,
	[PublicUserProfile_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Endorsments] PRIMARY KEY CLUSTERED 
(
	[EndorsmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[ExperienceId] [int] IDENTITY(1,1) NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Current] [bit] NOT NULL,
	[WorkedInCompany_Id] [int] NULL,
	[WorkedOnPosition_Id] [int] NULL,
	[PublicUserProfile_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Experiences] PRIMARY KEY CLUSTERED 
(
	[ExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Read] [bit] NOT NULL,
	[Archived] [bit] NOT NULL,
	[Author_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Recipient_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OccupationName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Occupations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostitionName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PublicUserProfiles]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicUserProfiles](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[Occupation] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NULL,
	[Industry] [nvarchar](max) NULL,
	[FirstNameHidden] [bit] NOT NULL,
	[MiddleNameHidden] [bit] NOT NULL,
	[LastNameHidden] [bit] NOT NULL,
	[OccupationHidden] [bit] NOT NULL,
	[CountryHidden] [bit] NOT NULL,
	[IndustryHidden] [bit] NOT NULL,
	[ExperienceHidden] [bit] NOT NULL,
	[HideConnections] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PublicUserProfiles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skills]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[PublicUserProfile_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Message_MessageId] [int] NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Connections] ON 

INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (1, 6, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (2, 1, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (3, 6, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (4, 2, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (5, 1, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (6, 2, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (7, 1, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (8, 4, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (9, 1, N'Kirilov, Ivailo', N'Architect', 5)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (10, 5, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (11, 1, N'Nikolov, Nikolay', N'Warehouseman', 3)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (12, 3, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (14, 4, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (16, 3, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (17, 5, N'Nikolov, Nikolay', N'Warehouseman', 3)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (18, 3, N'Kirilov, Ivailo', N'Architect', 5)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (19, 5, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (20, 6, N'Kirilov, Ivailo', N'Architect', 5)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (21, 5, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (22, 4, N'Kirilov, Ivailo', N'Architect', 5)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (23, 5, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (26, 4, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (27, 2, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (28, 4, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (30, 3, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (31, 6, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (32, 4, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (33, 6, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (34, 4, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (35, 6, N'Nikolov, Nikolay', N'Warehouseman', 3)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (36, 3, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (37, 7, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (39, 7, N'Nikolov, Nikolay', N'Warehouseman', 3)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (40, 3, N'Parlakov, Georgi', N'Developer', 7)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (41, 7, N'Parlakov, Georgi', N'Developer', 1)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (42, 1, N'Parlakov, Georgi', N'Developer', 7)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (43, 7, N'Lazarov, Nikola', N'Developer', 6)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (44, 6, N'Parlakov, Georgi', N'Developer', 7)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (45, 7, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (46, 4, N'Parlakov, Georgi', N'Developer', 7)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (47, 2, N'kirilov, Ivailo', N'Architect', 5)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (48, 18, N'Otkachenko, Kuiruil', N'Boxer', 16)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (49, 16, N'Hateva, Himiq', N'Chemistry laborant', 18)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (50, 18, N'Lazarova, Petia', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (51, 4, N'Hateva, Himiq', N'Chemistry laborant', 18)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (52, 18, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (53, 2, N'Hateva, Himiq', N'Chemistry laborant', 18)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (54, 1021, N'Georgieva, Pavlina', N'Developer', 2)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (55, 2, N'Bachev, Mariqn ', N'Actor', 1021)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (56, 1021, N'Petrova, Petra', N'Bussiness Analyst', 4)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (57, 4, N'Bachev, Mariqn ', N'Actor', 1021)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (58, 1021, N'Petrovcho, Dimitar', N'CPU Frazion', 17)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (59, 17, N'Bachev, Mariqn ', N'Actor', 1021)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (60, 1021, N'petrov, petar', N'Freelancer', 9)
INSERT [dbo].[Connections] ([Id], [UserId], [ConnectionName], [ConnectionOccupation], [ConnectionUserId]) VALUES (61, 9, N'Bachev, Mariqn ', N'Actor', 1021)
SET IDENTITY_INSERT [dbo].[Connections] OFF
SET IDENTITY_INSERT [dbo].[Endorsments] ON 

INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1, 1, 2, 1, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (2, 1, 2, 2, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (3, 1, 3, 1, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (4, 3, 2, 3, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (5, 6, 1, 11, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (6, 6, 1, 12, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (7, 6, 1, 10, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (8, 4, 1, 5, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (9, 4, 1, 6, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (10, 1, 5, 15, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (11, 2, 5, 4, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (12, 3, 5, 3, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (13, 5, 2, 18, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (14, 5, 2, 16, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (15, 5, 2, 19, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (16, 5, 2, 7, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (17, 5, 2, 8, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (18, 5, 2, 17, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (19, 1, 2, 14, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (20, 1, 2, 13, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (21, 1, 2, 15, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (22, 6, 2, 9, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (23, 6, 2, 9, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (24, 6, 2, 9, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (25, 6, 2, 9, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (26, 6, 2, 10, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (27, 6, 2, 10, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (28, 6, 2, 10, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (29, 2, 18, 4, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (30, 2, 18, 26, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (31, 2, 18, 27, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (32, 2, 18, 28, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (33, 2, 18, 29, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (34, 18, 16, 31, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (35, 18, 16, 33, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (36, 16, 18, 38, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (37, 16, 18, 36, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (38, 16, 18, 34, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (39, 3, 1, 3, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (40, 2, 1, 4, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (41, 2, 1, 26, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (42, 2, 1, 27, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (43, 2, 1, 28, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (44, 2, 1, 29, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (45, 6, 1, 9, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (46, 18, 4, 32, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (47, 18, 4, 33, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (48, 1, 4, 2, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (49, 4, 1, 39, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (50, 4, 1, 41, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (51, 4, 1, 42, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (52, 4, 1, 43, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (53, 4, 1, 40, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1036, 5, 1, 17, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1037, 5, 1, 19, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1038, 5, 1, 19, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1039, 2, 1021, 4, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1040, 1, 4, 14, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1041, 1, 4, 15, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1042, 1, 4, 13, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1043, 19, 4, 1044, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1044, 19, 4, 1042, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1045, 19, 4, 1043, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1046, 19, 4, 1042, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1047, 19, 4, 1044, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1048, 5, 4, 17, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1049, 5, 4, 19, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1050, 5, 4, 16, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1051, 5, 4, 16, NULL)
INSERT [dbo].[Endorsments] ([EndorsmentId], [EndorsedUserProfileId], [EndorsedByUserProfileId], [EndorsedSkillId], [PublicUserProfile_UserId]) VALUES (1052, 5, 4, 16, NULL)
SET IDENTITY_INSERT [dbo].[Endorsments] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageId], [Title], [Content], [Read], [Archived], [Author_UserId]) VALUES (2, N'hi', N'Zdrastvuite', 0, 0, 1)
INSERT [dbo].[Messages] ([MessageId], [Title], [Content], [Read], [Archived], [Author_UserId]) VALUES (3, N'Check encoding', N'&lt;div style="text-align:right;"&gt;&lt;p&gt;&lt;span style="font-size:xx-large;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;Title of message&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style="text-align:left;"&gt;&lt;span style="font-size:small;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;first&lt;/span&gt;&lt;/li&gt;&lt;li style="text-align:left;"&gt;&lt;span style="font-size:small;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;second&amp;nbsp;&lt;/span&gt;&lt;/li&gt;&lt;li style="text-align:left;"&gt;&lt;span style="font-size:small;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;third&lt;/span&gt;&lt;ul&gt;&lt;li style="text-align:left;"&gt;&lt;span style="font-size:small;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;ponints&lt;/span&gt;&lt;/li&gt;&lt;li style="text-align:left;"&gt;&lt;span style="font-size:small;font-family:''Lucida Console'', Monaco, monospace;color:#66ffff;"&gt;moints and so on&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;', 0, 0, 1)
INSERT [dbo].[Messages] ([MessageId], [Title], [Content], [Read], [Archived], [Author_UserId]) VALUES (4, N'One more try', N'<h2 style="text-align:center;"><span style="background-color:#66ff00;">hello</span></h2>', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationId], [Content], [Recipient_UserId]) VALUES (1, N'Hi', 1)
INSERT [dbo].[Notifications] ([NotificationId], [Content], [Recipient_UserId]) VALUES (2, N'not hi', 2)
INSERT [dbo].[Notifications] ([NotificationId], [Content], [Recipient_UserId]) VALUES (3, N'Ivanee Ivanee', 3)
INSERT [dbo].[Notifications] ([NotificationId], [Content], [Recipient_UserId]) VALUES (5, N'<a hreh="/PublicProfile/BrowseUserProfile/1"', 3)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
SET IDENTITY_INSERT [dbo].[PublicUserProfiles] ON 

INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (1, N'Georgi', NULL, N'Parlakov', 1, N'Developer ao', N'Bulgaria', N'IT', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (2, N'Pavlina', N'Drossos', N'Georgieva', 2, N'Developer', N'Bulgaria', N'ITo', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (3, N'Nikolay', N'Kovachev', N'Nikolov', 3, N'Warehouseman', N'Bulgaria', N'IT', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (4, N'Petra', NULL, N'Petrova', 4, N'Bussiness Analyst', N'Bulgaria', N'IT', 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (5, N'Ivailo', N'Parashkevov', N'Kirilov', 5, N'Architect', N'Bulgara', N'Construction', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (6, N'Nikola', NULL, N'Lazarov', 6, N'Developer', N'Bulgaria', N'IT', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (7, N'Georgi', NULL, N'Parlakov', 7, N'Developer', N'Bulgaria', N'IT', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (8, N'Ivana', N'Trump', N'Ivanova', 8, N'Garden Designer', N'France', N'Exterior Design', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (9, N'petar', NULL, N'petrov', 9, N'Freelancer', N'Greece', NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (10, N'Krasimir', NULL, N'Kishishev', 10, N'Coach', N'Bulgaria', N'Sports', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (11, N'Krasimir', NULL, N'Balakov', 11, N'Football Coach', N'Bulgaria', N'Football', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (12, N'T', NULL, N'Iva', 12, N'Football', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (13, N'B', NULL, N'M', 13, N'F', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (14, N'Kim', NULL, N'Neadra', 14, N'Artist', N'Korea', NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (15, N'Yi', NULL, N'Yui', 15, N'Kung-fu Trainer', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (16, N'Kuiruil', NULL, N'Otkachenko', 16, N'Boxer', N'Ukraine', N'Boxing', 0, 1, 0, 0, 1, 1, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (17, N'Dimitar', NULL, N'Petrovcho', 17, N'CPU Frazion', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (18, N'Himiq', NULL, N'Hateva', 18, N'Chemistry laborant', N'Bulgaria', N'Chemistry', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[PublicUserProfiles] ([ProfileId], [FirstName], [MiddleName], [LastName], [UserId], [Occupation], [Country], [Industry], [FirstNameHidden], [MiddleNameHidden], [LastNameHidden], [OccupationHidden], [CountryHidden], [IndustryHidden], [ExperienceHidden], [HideConnections]) VALUES (19, N'Mariqn ', N'marmorko', N'Bachev', 1021, N'Actor', N'Bulgaria', NULL, 0, 0, 0, 0, 1, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[PublicUserProfiles] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (2, N'C#', 1)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (3, N'Warehouse keeping', 3)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (4, N'Knitting', 2)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (7, N'Drawing', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (8, N'Design', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (9, N'iOS', 6)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (10, N'Mobile Development', 6)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (11, N'mySQL', 6)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (12, N'Objective-C', 6)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (13, N'SQL', 1)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (14, N'mySQ', 1)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (15, N'first', 1)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (16, N'Machine repair', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (17, N'Kominochistene', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (18, N'Copier Maintenance', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (19, N'Fuser replacing', 5)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (25, N'asda', NULL)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (26, N'asd', 2)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (27, N'are', 2)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (28, N'Typewriting', 2)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (29, N'BDS Typewriting', 2)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (30, N'Goal Keeping', 13)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (31, N'Chemistry', 18)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (32, N'Lab training', 18)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (33, N'Poison distilling', 18)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (34, N'Boxing', 16)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (35, N'Sparring', 16)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (36, N'Fighting', 16)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (37, N'Wining', 16)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (38, N'Not Loosing and lots more', 16)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (39, N'Knitting', 4)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (40, N'Baking', 4)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (41, N'Cooking', 4)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (42, N'BA', 4)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (43, N'PM', 4)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1039, N'Advertisment', NULL)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1040, N'Marketing', NULL)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1041, N'Acting', NULL)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1042, NULL, 1021)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1043, NULL, 1021)
INSERT [dbo].[Skills] ([Id], [SkillName], [PublicUserProfile_UserId]) VALUES (1044, NULL, 1021)
SET IDENTITY_INSERT [dbo].[Skills] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (1, N'parlakov', 4)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (2, N'georgieva', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (3, N'nikolov', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (4, N'petrova', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (5, N'kirilov', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (6, N'lazarov', 3)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (7, N'gparlakov@gmail.com', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (8, N'ivanova', 3)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (9, N'petrov', 2)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (10, N'kishishev', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (11, N'balakov', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (12, N'tivanov', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (13, N'mihailov', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (14, N'neadra', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (15, N'yui', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (16, N'otkachenko', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (17, N'petrovcho', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (18, N'hateva1', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (19, N'admin', NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Message_MessageId]) VALUES (1021, N'marmorko', NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A1F80146DAE3 AS DateTime), NULL, 1, CAST(0x0000A1FA0185BD95 AS DateTime), 0, N'AIWTZKIh4l1KyLup5CCS9GvvYJiwaIIj8kfV22RMNz/o2JJe1+iYs9fTsagOq8FIQg==', CAST(0x0000A1F80146DAE3 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(0x0000A1F801471994 AS DateTime), NULL, 1, NULL, 0, N'ABc/WIAf89YUDXQwQBjaWAjCzqVPxgGsMBjqpkSIk1d17oAcK5nr6XJdQH6bCzJGYg==', CAST(0x0000A1F801471994 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A1F8014832C9 AS DateTime), NULL, 1, NULL, 0, N'AGTzeyOWfTM0SgDibfBULwGmeHciFGZvGr+JAJTWYRt/t/02L9GpN9Kj1VwoYe288g==', CAST(0x0000A1F8014832C9 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (4, CAST(0x0000A1F900F68C59 AS DateTime), NULL, 1, NULL, 0, N'AFPR1id4nYeKogQUMgUefw29nUKXUFmA0wG4i7D5aFPzVqR+FnmeO5liAUOH2Rd17Q==', CAST(0x0000A1F900F68C59 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (5, CAST(0x0000A1F900F7CA46 AS DateTime), NULL, 1, NULL, 0, N'AHX/OVwqk2b2S6P+ekN7C3tzUNiAwBT0kvmL1wJhdY7Ls3GC63+ZgeU3YgX+voeK1g==', CAST(0x0000A1F900F7CA46 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (6, CAST(0x0000A1F9015D6A5D AS DateTime), NULL, 1, NULL, 0, N'ABAoT5QnSKYjqxNL89gO9BwKCUUYOHjQIw8So5fi6UdpGRFXOOQU00x0i6Ctxe/5Lw==', CAST(0x0000A1F9015D6A5D AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (8, CAST(0x0000A1FA00FB1528 AS DateTime), NULL, 1, NULL, 0, N'AM8D45wM8VbtdhiMTbKlVcacVneM8v0ifsc6VYp47cMXdhD/Qz+7yGmoMURSh0teKg==', CAST(0x0000A1FA00FB1528 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (9, CAST(0x0000A1FA00FBC40F AS DateTime), NULL, 1, NULL, 0, N'AE5YQPNvIzLTWjdxcNoBJk0FAZ1e5X31xNA+q+HJdZFMg/YsISugNLRxsV9J7e/PSg==', CAST(0x0000A1FA00FBC40F AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (10, CAST(0x0000A1FA00FCE22B AS DateTime), NULL, 1, NULL, 0, N'AHKG/UhWz+sRDxSuG11IuaK54jQGLFqasoFPqGNzQkmUGB+ySxqYsUJJqjdQWuEAkQ==', CAST(0x0000A1FA00FCE22B AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (11, CAST(0x0000A1FA00FDB449 AS DateTime), NULL, 1, NULL, 0, N'AH/QpGl1rf6D60g2MTXfGirMFF9bMXUiWcK/noi603W9IGWiW3nvw/OAQHbaF2pxng==', CAST(0x0000A1FA00FDB449 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (12, CAST(0x0000A1FA00FEB2E6 AS DateTime), NULL, 1, NULL, 0, N'AIIclx6NT4P+HO0y+IQnJTezuv7/CahpkHli07l05wqrKQqPaVqIqvnM+pBtu7OI3Q==', CAST(0x0000A1FA00FEB2E6 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (13, CAST(0x0000A1FA00FF13D7 AS DateTime), NULL, 1, NULL, 0, N'AN3V8gYTMeHtmqwZp+gfT4PnhhqVehcQJTDpJPCYSxOF1Pk8dnoB356Gc6q7LYvlRg==', CAST(0x0000A1FA00FF13D7 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (14, CAST(0x0000A1FA00FF7304 AS DateTime), NULL, 1, NULL, 0, N'AFr30dwwBjtbUx2sgs3uZvuJBxgAOs85P1YQejr4YKZspk11+HwBbyzgudm09L7KbA==', CAST(0x0000A1FA00FF7304 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (15, CAST(0x0000A1FA00FFB663 AS DateTime), NULL, 1, NULL, 0, N'ABQEfUQps4h+9g60qZ0uk1S0tyUZzfpPZehn1UfIoaT4d0dNDAYH9A6f/RUxNthS2Q==', CAST(0x0000A1FA00FFB663 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (16, CAST(0x0000A1FA01029A4D AS DateTime), NULL, 1, NULL, 0, N'ADbrcihi87E0K3QKRMI69XCiNOGVoimkzJbfeaKhjcjLT2Qq8w5HKKS7rF47X/oWxQ==', CAST(0x0000A1FA01029A4D AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (17, CAST(0x0000A1FA0103E2DF AS DateTime), NULL, 1, NULL, 0, N'AMgwaBObc5+bLCPiqXg5WIcr2OqM6AKqaTQNhlbScCQR4AkyntKpsxaXTTbR7KYwkw==', CAST(0x0000A1FA0103E2DF AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (18, CAST(0x0000A1FA01054081 AS DateTime), NULL, 1, NULL, 0, N'AImARTCf4nb3qZYi13Pr/Ynzgy7tFxHWBdm19bu2fjpjiNEvAc3yR4EaJp6ItZnePg==', CAST(0x0000A1FA01054081 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (19, CAST(0x0000A1FA015DDE31 AS DateTime), NULL, 1, CAST(0x0000A1FA0185DFAC AS DateTime), 0, N'AF05tCxFMWbqF/z4tdF8A5rLYVOKN9ufHraZeFfKuIHqU8PcZRzKLorQ3ztLqgzXZg==', CAST(0x0000A1FA015DDE31 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1021, CAST(0x0000A1FB00B53129 AS DateTime), NULL, 1, CAST(0x0000A1FB00B6CE26 AS DateTime), 0, N'AF3nMdFUBB2ammB1USurCeonRzPvJlCz4z7R07wK5EhZkHAm3JM9TBYtIxCbILr8Kw==', CAST(0x0000A1FB00F0C8DE AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_OAuthMembership] ([Provider], [ProviderUserId], [UserId]) VALUES (N'google', N'https://www.google.com/accounts/o8/id?id=AItOawnv819pUmSkyhN6yR_SLfqHoXm8lWDkXMw', 7)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'admin')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (19, 1)
/****** Object:  Index [IX_PublicUserProfile_UserId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_PublicUserProfile_UserId] ON [dbo].[Endorsments]
(
	[PublicUserProfile_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PublicUserProfile_UserId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_PublicUserProfile_UserId] ON [dbo].[Experiences]
(
	[PublicUserProfile_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkedInCompany_Id]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_WorkedInCompany_Id] ON [dbo].[Experiences]
(
	[WorkedInCompany_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkedOnPosition_Id]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_WorkedOnPosition_Id] ON [dbo].[Experiences]
(
	[WorkedOnPosition_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Author_UserId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_Author_UserId] ON [dbo].[Messages]
(
	[Author_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recipient_UserId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_Recipient_UserId] ON [dbo].[Notifications]
(
	[Recipient_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PublicUserProfile_UserId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_PublicUserProfile_UserId] ON [dbo].[Skills]
(
	[PublicUserProfile_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_MessageId]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
CREATE NONCLUSTERED INDEX [IX_Message_MessageId] ON [dbo].[UserProfile]
(
	[Message_MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61608740ED55]    Script Date: 14.7.2013 г. 22:25:13 ч. ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Connections] ADD  DEFAULT ((0)) FOR [ConnectionUserId]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [FirstNameHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [MiddleNameHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [LastNameHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [OccupationHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [CountryHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [IndustryHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [ExperienceHidden]
GO
ALTER TABLE [dbo].[PublicUserProfiles] ADD  DEFAULT ((0)) FOR [HideConnections]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Endorsments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Endorsments_dbo.PublicUserProfiles_PublicUserProfile_UserId] FOREIGN KEY([PublicUserProfile_UserId])
REFERENCES [dbo].[PublicUserProfiles] ([UserId])
GO
ALTER TABLE [dbo].[Endorsments] CHECK CONSTRAINT [FK_dbo.Endorsments_dbo.PublicUserProfiles_PublicUserProfile_UserId]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Experiences_dbo.Companies_WorkedInCompany_Id] FOREIGN KEY([WorkedInCompany_Id])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_dbo.Experiences_dbo.Companies_WorkedInCompany_Id]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Experiences_dbo.Positions_WorkedOnPosition_Id] FOREIGN KEY([WorkedOnPosition_Id])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_dbo.Experiences_dbo.Positions_WorkedOnPosition_Id]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Experiences_dbo.PublicUserProfiles_PublicUserProfile_UserId] FOREIGN KEY([PublicUserProfile_UserId])
REFERENCES [dbo].[PublicUserProfiles] ([UserId])
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_dbo.Experiences_dbo.PublicUserProfiles_PublicUserProfile_UserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Messages_dbo.UserProfile_Author_UserId] FOREIGN KEY([Author_UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_dbo.Messages_dbo.UserProfile_Author_UserId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Notifications_dbo.UserProfile_Recipient_UserId] FOREIGN KEY([Recipient_UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_dbo.Notifications_dbo.UserProfile_Recipient_UserId]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Skills_dbo.PublicUserProfiles_PublicUserProfile_UserId] FOREIGN KEY([PublicUserProfile_UserId])
REFERENCES [dbo].[PublicUserProfiles] ([UserId])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_dbo.Skills_dbo.PublicUserProfiles_PublicUserProfile_UserId]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProfile_dbo.Messages_Message_MessageId] FOREIGN KEY([Message_MessageId])
REFERENCES [dbo].[Messages] ([MessageId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_dbo.UserProfile_dbo.Messages_Message_MessageId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [TelerikedIn] SET  READ_WRITE 
GO
