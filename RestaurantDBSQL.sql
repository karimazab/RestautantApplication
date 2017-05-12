USE [master]
GO
/****** Object:  Database [Restaurant]    Script Date: 05/12/2017 16:33:30 ******/
CREATE DATABASE [Restaurant] 
GO
ALTER DATABASE [Restaurant] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurant] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Restaurant] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Restaurant] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Restaurant] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Restaurant] SET ARITHABORT OFF
GO
ALTER DATABASE [Restaurant] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Restaurant] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Restaurant] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Restaurant] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Restaurant] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Restaurant] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Restaurant] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Restaurant] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Restaurant] SET  DISABLE_BROKER
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Restaurant] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Restaurant] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Restaurant] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Restaurant] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Restaurant] SET  READ_WRITE
GO
ALTER DATABASE [Restaurant] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Restaurant] SET  MULTI_USER
GO
ALTER DATABASE [Restaurant] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Restaurant] SET DB_CHAINING OFF
GO
USE [Restaurant]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05/12/2017 16:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Pizza')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Grills')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Burgers')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 05/12/2017 16:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (3, CAST(0x0000A77100CC4224 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (4, CAST(0x0000A77100CCAD05 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (5, CAST(0x0000A77100CCDA27 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (6, CAST(0x0000A77100CDF1F9 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (7, CAST(0x0000A77100CE0375 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (8, CAST(0x0000A77100CE4524 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (9, CAST(0x0000A77100CED18D AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (10, CAST(0x0000A77100CEF5CA AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (11, CAST(0x0000A77100CFD047 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (12, CAST(0x0000A77101065A1A AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (13, CAST(0x0000A7710106BB09 AS DateTime))
INSERT [dbo].[Order] ([Id], [DateTime]) VALUES (14, CAST(0x0000A77101070E9A AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[Meal]    Script Date: 05/12/2017 16:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PictureURL] [nvarchar](500) NULL,
	[Price] [float] NOT NULL,
	[Descripition] [nvarchar](max) NULL,
	[Category_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Meal] ON
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (1, N'Meal1', N'C:\Restaurant\Restaurant\Images\2.jpg', 10, N'Meal1', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (2, N'Meal2', N'C:\Restaurant\Restaurant\Images\2.jpg', 20, N'Meal2', 2)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (3, N'Meal3', N'C:\Restaurant\Restaurant\Images\2.jpg', 30, N'Meal3', 3)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (4, N'Meal4', N'C:\Restaurant\Restaurant\Images\2.jpg', 10, N'Meal4', 3)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (5, N'Meal5', N'C:\Restaurant\Restaurant\Images\2.jpg', 20, N'Meal17', 3)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (6, N'Meal6', N'C:\Restaurant\Restaurant\Images\2.jpg', 30, N'Meal5', 3)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (7, N'Meal7', N'C:\Restaurant\Restaurant\Images\2.jpg', 40, N'Meal6', 2)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (8, N'Meal8', N'C:\Restaurant\Restaurant\Images\2.jpg', 50, N'Meal7', 2)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (9, N'Meal9', N'C:\Restaurant\Restaurant\Images\2.jpg', 10, N'Meal8', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (10, N'Meal10', N'C:\Restaurant\Restaurant\Images\2.jpg', 20, N'Meal9', 2)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (11, N'Meal11', N'C:\Restaurant\Restaurant\Images\2.jpg', 30, N'Meal10', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (14, N'Meal12', N'C:\Restaurant\Restaurant\Images\2.jpg', 50, N'Meal11', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (15, N'Meal13', N'C:\Restaurant\Restaurant\Images\2.jpg', 60, N'Meal12', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (16, N'Meal14', N'C:\Restaurant\Restaurant\Images\2.jpg', 70, N'Meal13', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (17, N'Meal15', N'C:\Restaurant\Restaurant\Images\2.jpg', 20, N'Meal14', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (18, N'Meal16', N'C:\Restaurant\Restaurant\Images\2.jpg', 10, N'Meal15', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (19, N'Meal17', N'C:\Restaurant\Restaurant\Images\2.jpg', 30, N'Meal16', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (21, N'qwe', NULL, 0, N'qw', 1)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (22, N'qwe', N'C:\Users\karim\Documents\Visual Studio 2015\Projects\Restaurant\Restaurant\Images\2.jpg', 2, N'qwe', 2)
INSERT [dbo].[Meal] ([Id], [Name], [PictureURL], [Price], [Descripition], [Category_Id]) VALUES (23, N'test', NULL, 12, N'test', 1)
SET IDENTITY_INSERT [dbo].[Meal] OFF
/****** Object:  Table [dbo].[Order_Meals]    Script Date: 05/12/2017 16:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Meals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Q] [int] NOT NULL,
	[IsCombo] [bit] NOT NULL,
	[IsSpicy] [bit] NOT NULL,
	[Meal_Id] [bigint] NOT NULL,
	[Order_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Order_Meals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order_Meals] ON
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (3, 1, 1, 1, 1, 3)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (4, 2, 0, 0, 1, 3)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (5, 3, 0, 0, 1, 3)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (6, 1, 1, 1, 1, 4)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (7, 2, 1, 1, 7, 4)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (8, 4, 1, 1, 1, 5)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (9, 2, 1, 1, 1, 5)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (10, 1, 0, 0, 1, 5)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (11, 3, 1, 1, 1, 6)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (12, 2, 1, 1, 2, 6)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (13, 4, 1, 1, 1, 7)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (14, 5, 1, 1, 2, 8)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (15, 1, 0, 0, 7, 8)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (16, 2, 1, 1, 1, 9)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (17, 3, 1, 1, 2, 9)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (18, 4, 1, 1, 1, 10)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (19, 5, 0, 0, 1, 10)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (20, 6, 1, 1, 2, 11)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (21, 3, 1, 1, 7, 11)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (22, 4, 1, 1, 2, 11)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (23, 5, 1, 1, 2, 11)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (24, 2, 1, 0, 2, 12)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (25, 1, 1, 1, 2, 13)
INSERT [dbo].[Order_Meals] ([Id], [Q], [IsCombo], [IsSpicy], [Meal_Id], [Order_Id]) VALUES (26, 2, 1, 0, 1, 14)
SET IDENTITY_INSERT [dbo].[Order_Meals] OFF
/****** Object:  StoredProcedure [dbo].[GetMealOrderReport]    Script Date: 05/12/2017 16:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetMealOrderReport] 
(
  @FromDate Datetime,
  @ToDate Datetime
)
as
begin 

select Meal.Id ,Meal.Name ,Sum (Order_Meals.Q) as allsum from Order_Meals join Meal on Order_Meals.Meal_Id = Meal.Id  
join dbo.[Order] on Order_Meals.Order_Id = dbo.[Order].Id
where CAST(dbo.[Order].DateTime as DATE) >= CAST(@FromDate as DATE) and CAST(dbo.[Order].DateTime as DATE) <= CAST(@ToDate as DATE)  
group by Meal.Id ,Meal.Name 

end
GO
/****** Object:  ForeignKey [FK_Meal_Category]    Script Date: 05/12/2017 16:33:31 ******/
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Category]
GO
/****** Object:  ForeignKey [FK_Order_Meals_Meal]    Script Date: 05/12/2017 16:33:31 ******/
ALTER TABLE [dbo].[Order_Meals]  WITH CHECK ADD  CONSTRAINT [FK_Order_Meals_Meal] FOREIGN KEY([Meal_Id])
REFERENCES [dbo].[Meal] ([Id])
GO
ALTER TABLE [dbo].[Order_Meals] CHECK CONSTRAINT [FK_Order_Meals_Meal]
GO
/****** Object:  ForeignKey [FK_Order_Meals_Order]    Script Date: 05/12/2017 16:33:31 ******/
ALTER TABLE [dbo].[Order_Meals]  WITH CHECK ADD  CONSTRAINT [FK_Order_Meals_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Meals] CHECK CONSTRAINT [FK_Order_Meals_Order]
GO
