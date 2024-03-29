/****** Object:  Database [ZoosManagementSystem]    Script Date: 01/30/2010 20:45:00 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'ZoosManagementSystem')
DROP DATABASE [ZoosManagementSystem]
GO

/****** Object:  Database [ZoosManagementSystem]    Script Date: 01/30/2010 20:45:00 ******/
CREATE DATABASE [ZoosManagementSystem] ON  PRIMARY 
( NAME = N'ZoosManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ZoosManagementSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZoosManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ZoosManagementSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [ZoosManagementSystem] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZoosManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ZoosManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET ARITHABORT OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [ZoosManagementSystem] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ZoosManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ZoosManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ZoosManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ZoosManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ZoosManagementSystem] SET  READ_WRITE 
GO

ALTER DATABASE [ZoosManagementSystem] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ZoosManagementSystem] SET  MULTI_USER 
GO

ALTER DATABASE [ZoosManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ZoosManagementSystem] SET DB_CHAINING OFF 
GO


USE [ZoosManagementSystem]
GO

/****** Object:  Table [dbo].[Responsible]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsible](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[LastName] [nvarchar](70) NOT NULL,
	[Email] [nvarchar](55) NOT NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](80) NULL,
 CONSTRAINT [PK_Responsible] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Feeding]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeding](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[EnergyValue] [float] NULL,
	[Carbohydrates] [float] NULL,
	[Protein] [float] NULL,
	[TotalFat] [float] NULL,
	[SaturatedFat] [float] NULL,
	[TransFat] [float] NULL,
	[MonounsaturatedFat] [float] NULL,
	[PolyunsaturatedFat] [float] NULL,
	[Cholesterol] [float] NULL,
	[DietaryFiber] [float] NULL,
	[Sodium] [float] NULL,
 CONSTRAINT [PK_Feeding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Environment]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environment](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Surface] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Environment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Animal]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EnvironmentId] [uniqueidentifier] NULL,
	[ResponsibleId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sex] [char](1) NOT NULL,
	[Species] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[BornInCaptivity] [bit] NOT NULL,
	[Cost] [int] NULL,
	[NextHealthMeasure] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TimeSlot]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EnvironmentId] [uniqueidentifier] NOT NULL,
	[InitialTime] [time](7) NOT NULL,
	[FinalTime] [time](7) NOT NULL,
	[TemperatureMin] [float] NULL,
	[TemperatureMax] [float] NULL,
	[HumidityMin] [float] NULL,
	[HumidityMax] [float] NULL,
	[LuminosityMin] [float] NULL,
	[LuminosityMax] [float] NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sensor]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EnvironmentId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[SerialNumber] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EnvironmentMeasure]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvironmentMeasure](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EnvironmentId] [uniqueidentifier] NOT NULL,
	[MeasurementDate] [datetime] NOT NULL,
	[Temperature] [float] NOT NULL,
	[Humidity] [float] NOT NULL,
	[Luminosity] [float] NOT NULL,
 CONSTRAINT [PK_EnvironmentMeasure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HealthMeasure]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthMeasure](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[AnimalId] [uniqueidentifier] NOT NULL,
	[MeasurementDate] [datetime] NOT NULL,
	[Weight] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Temperature] [float] NOT NULL,
	[Vaccine] [nvarchar] (50) NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HealthMeasure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeedingTime]    Script Date: 01/30/2010 20:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedingTime](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FeedingId] [uniqueidentifier] NOT NULL,
	[AnimalId] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_FeedingTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Default [DF_Responsible_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Responsible] ADD  CONSTRAINT [DF_Responsible_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Feeding_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Feeding] ADD  CONSTRAINT [DF_Feeding_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Environment_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Environment] ADD  CONSTRAINT [DF_Environment_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Animal_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [DF_Animal_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_TimeSlot_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[TimeSlot] ADD  CONSTRAINT [DF_TimeSlot_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Sensor_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Sensor] ADD  CONSTRAINT [DF_Sensor_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_EnvironmentMeasure_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[EnvironmentMeasure] ADD  CONSTRAINT [DF_EnvironmentMeasure_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_HealthMeasure_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[HealthMeasure] ADD  CONSTRAINT [DF_HealthMeasure_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_FeedingTime_Id]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[FeedingTime] ADD  CONSTRAINT [DF_FeedingTime_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  ForeignKey [FK_Animal_Environment]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Environment] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environment] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Environment]
GO
/****** Object:  ForeignKey [FK_Animal_Responsible]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Responsible] FOREIGN KEY([ResponsibleId])
REFERENCES [dbo].[Responsible] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Responsible]
GO
/****** Object:  ForeignKey [FK_TimeSlot_Environment]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_Environment] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environment] ([Id])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_Environment]
GO
/****** Object:  ForeignKey [FK_Sensor_Environment]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[Sensor]  WITH CHECK ADD  CONSTRAINT [FK_Sensor_Environment] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environment] ([Id])
GO
ALTER TABLE [dbo].[Sensor] CHECK CONSTRAINT [FK_Sensor_Environment]
GO
/****** Object:  ForeignKey [FK_EnvironmentMeasure_Environment]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[EnvironmentMeasure]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentMeasure_Environment] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environment] ([Id])
GO
ALTER TABLE [dbo].[EnvironmentMeasure] CHECK CONSTRAINT [FK_EnvironmentMeasure_Environment]
GO
/****** Object:  ForeignKey [FK_HealthMeasure_Animal]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[HealthMeasure]  WITH CHECK ADD  CONSTRAINT [FK_HealthMeasure_Animal] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[HealthMeasure] CHECK CONSTRAINT [FK_HealthMeasure_Animal]
GO
/****** Object:  ForeignKey [FK_FeedingTime_Animal]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[FeedingTime]  WITH CHECK ADD  CONSTRAINT [FK_FeedingTime_Animal] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[FeedingTime] CHECK CONSTRAINT [FK_FeedingTime_Animal]
GO
/****** Object:  ForeignKey [FK_FeedingTime_Feeding]    Script Date: 01/30/2010 20:43:05 ******/
ALTER TABLE [dbo].[FeedingTime]  WITH CHECK ADD  CONSTRAINT [FK_FeedingTime_Feeding] FOREIGN KEY([FeedingId])
REFERENCES [dbo].[Feeding] ([Id])
GO
ALTER TABLE [dbo].[FeedingTime] CHECK CONSTRAINT [FK_FeedingTime_Feeding]
GO
