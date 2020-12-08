USE [master]
GO
/****** Object:  Database [GibddTest]    Script Date: 08.12.2020 8:58:08 ******/
CREATE DATABASE [GibddTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GibddTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GibddTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GibddTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GibddTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GibddTest] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GibddTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GibddTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GibddTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GibddTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GibddTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GibddTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [GibddTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GibddTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GibddTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GibddTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GibddTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GibddTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GibddTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GibddTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GibddTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GibddTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GibddTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GibddTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GibddTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GibddTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GibddTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GibddTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GibddTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GibddTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GibddTest] SET  MULTI_USER 
GO
ALTER DATABASE [GibddTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GibddTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GibddTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GibddTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GibddTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GibddTest] SET QUERY_STORE = OFF
GO
USE [GibddTest]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarNumber] [nchar](10) NOT NULL,
	[MarkCar] [nchar](100) NULL,
	[ModelCar] [nchar](100) NULL,
	[VehiclePassport] [int] NULL,
	[InsuranceCar] [int] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[ID_Driver] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nchar](100) NULL,
	[Name] [nchar](100) NULL,
	[MiddleName] [nchar](100) NULL,
	[DateBirth] [date] NULL,
	[DateFine] [date] NULL,
	[CarNumber] [nchar](10) NULL,
	[DriverLicense] [int] NULL,
	[ID_Fine] [int] NULL,
	[ID_Inspector] [int] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[ID_Driver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverForFine]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverForFine](
	[Id_DriverFine] [int] IDENTITY(1,1) NOT NULL,
	[Id_Fine] [int] NULL,
	[Id_Driver] [int] NULL,
 CONSTRAINT [PK_DriverForFine] PRIMARY KEY CLUSTERED 
(
	[Id_DriverFine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[ID_Fine] [int] NOT NULL,
	[NameFine] [nchar](300) NULL,
	[AmountFine] [int] NULL,
 CONSTRAINT [PK_Fine] PRIMARY KEY CLUSTERED 
(
	[ID_Fine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterCar]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterCar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PassportDriver] [nvarchar](10) NULL,
	[PassportVehicle] [nvarchar](10) NULL,
	[InsuranceCar] [nvarchar](10) NULL,
	[NumberPhone] [nvarchar](11) NULL,
 CONSTRAINT [PK_RegisterCar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterDriverLicense]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterDriverLicense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PassportDriver] [nvarchar](10) NULL,
	[NumberPhone] [nvarchar](11) NULL,
	[NumberPostLicense] [nvarchar](10) NULL,
 CONSTRAINT [PK_RegisterDriverLicense] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscribeEmail]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscribeEmail](
	[Id] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrafficPolice]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafficPolice](
	[ID_Inspector] [int] NOT NULL,
	[Surname] [nchar](100) NULL,
	[Name] [nchar](100) NULL,
	[MiddleName] [nchar](100) NULL,
	[Rank] [nchar](50) NULL,
	[TokenNumber] [int] NULL,
 CONSTRAINT [PK_TrafficPolice] PRIMARY KEY CLUSTERED 
(
	[ID_Inspector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPolice]    Script Date: 08.12.2020 8:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPolice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](10) NULL,
	[Password] [nvarchar](10) NULL,
	[Email] [nvarchar](25) NULL,
 CONSTRAINT [PK_UserPolice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Y134YY77  ', N'NISSAN                                                                                              ', N'TEANE                                                                                               ', 344343, 544534)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Г322НН78  ', N'LADA                                                                                                ', N'VESTA                                                                                               ', 323213, 234343)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'г671ор    ', N'Skoda                                                                                               ', N'Rapid                                                                                               ', 895741, 36054505)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Г678ОР116 ', N'Лада                                                                                                ', N'Веста                                                                                               ', 430120, 14252690)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Г980ОЛ83  ', N'Шевролет                                                                                            ', N'Авео                                                                                                ', 478632, 786354151)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Е456ЕГ116 ', N'кИА                                                                                                 ', N'РИО123321                                                                                           ', 123321, 789951)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Е767ША116 ', N'Opel                                                                                                ', N'Astra                                                                                               ', 430876, 78945615)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'н542нг    ', N'Lada                                                                                                ', N'Kalina                                                                                              ', 545968, 20013001)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Н545ГН777 ', N'КИА                                                                                                 ', N'Оптима                                                                                              ', 321765, 9678129)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Н545ГО87  ', N'Nissan                                                                                              ', N'Skyline                                                                                             ', 789425, 96374153)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Н654Г78   ', N'MAZDA                                                                                               ', N'CX-5                                                                                                ', 353234, 352345)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'П347ГЛ716 ', N'LADA                                                                                                ', N'VESTA                                                                                               ', 430143, 324189274)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'П539ГТ78  ', N'Шевролет                                                                                            ', N'Круз                                                                                                ', 431678, 15314264)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'Р276РИ116 ', N'LADA                                                                                                ', N'XRAY                                                                                                ', 231323, 513263)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'р432ог    ', N'Opel                                                                                                ', N'Astra                                                                                               ', 856741, 30054789)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'р654пр    ', N'Kia                                                                                                 ', N'Rio                                                                                                 ', 480980, 123456789)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'у143ум    ', N'Lada                                                                                                ', N'Granta                                                                                              ', 121256, 10002000)
INSERT [dbo].[Car] ([CarNumber], [MarkCar], [ModelCar], [VehiclePassport], [InsuranceCar]) VALUES (N'У324УГ116 ', N'KIA                                                                                                 ', N'RIO                                                                                                 ', 487986, 745896741)
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (0, N'Зиятдинов                                                                                           ', N'Булат                                                                                               ', N'Валерьевич                                                                                          ', CAST(N'2020-04-01' AS Date), CAST(N'2020-01-22' AS Date), N'р654пр    ', 2312323, 1, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1, N'Анинов                                                                                              ', N'Максим                                                                                              ', N'Валерьевич                                                                                          ', CAST(N'1974-06-17' AS Date), CAST(N'2020-04-22' AS Date), N'г671ор    ', 545674198, 2, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (2, N'Герасимов                                                                                           ', N'Николай                                                                                             ', N'Александрович                                                                                       ', CAST(N'1987-03-23' AS Date), CAST(N'2020-04-15' AS Date), N'н542нг    ', 543678536, 3, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (3, N'Аксенов                                                                                             ', N'Никита                                                                                              ', N'Аркадьевич                                                                                          ', CAST(N'1990-05-08' AS Date), CAST(N'2020-05-06' AS Date), N'У324УГ116 ', 21257895, 10, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1003, N'Горошиков                                                                                           ', N'Андрей                                                                                              ', N'Викторович                                                                                          ', CAST(N'2002-05-01' AS Date), CAST(N'2020-05-14' AS Date), N'г671ор    ', 789789, 7, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1006, N'Николаев                                                                                            ', N'Степан                                                                                              ', N'Александрович                                                                                       ', CAST(N'1997-11-09' AS Date), CAST(N'2020-05-11' AS Date), N'П539ГТ78  ', 450214, 4, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1007, N'Горбатиков                                                                                          ', N'Булат                                                                                               ', N'Рафисович                                                                                           ', CAST(N'2001-02-27' AS Date), CAST(N'2020-05-26' AS Date), N'Г678ОР116 ', 870986, 5, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1008, N'Рябчиков                                                                                            ', N'Алексей                                                                                             ', N'Зуфарович                                                                                           ', CAST(N'1996-06-28' AS Date), CAST(N'2020-05-24' AS Date), N'Н545ГН777 ', 480981, 6, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1009, N'Липчиков                                                                                            ', N'Леонид                                                                                              ', N'Олегович                                                                                            ', CAST(N'2000-03-19' AS Date), CAST(N'2020-05-22' AS Date), N'Г980ОЛ83  ', 985632, 7, 1000)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1010, N'Ренин                                                                                               ', N'Иван                                                                                                ', N'Павлович                                                                                            ', CAST(N'2002-11-05' AS Date), CAST(N'2020-11-16' AS Date), N'П347ГЛ716 ', 2233123, 12, 1003)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1011, N'Собчак                                                                                              ', N'Григорий                                                                                            ', N'Павлович                                                                                            ', CAST(N'2002-12-02' AS Date), NULL, N'Y134YY77  ', 2121222, 6, 1001)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1012, N'Пешков                                                                                              ', N'Роберт                                                                                              ', N'Анатольевич                                                                                         ', CAST(N'2002-12-03' AS Date), NULL, N'Е456ЕГ116 ', 3232133, 9, 1001)
INSERT [dbo].[Driver] ([ID_Driver], [Surname], [Name], [MiddleName], [DateBirth], [DateFine], [CarNumber], [DriverLicense], [ID_Fine], [ID_Inspector]) VALUES (1013, N'Иванов                                                                                              ', N'Иван                                                                                                ', N'Иванович                                                                                            ', CAST(N'2002-12-04' AS Date), CAST(N'2020-12-01' AS Date), N'Г322НН78  ', 4355645, 8, 1000)
SET IDENTITY_INSERT [dbo].[Driver] OFF
SET IDENTITY_INSERT [dbo].[DriverForFine] ON 

INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (1, 2, 0)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (2, 3, 0)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (3, 5, 0)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (4, 11, 0)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (6, 1, 2)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (7, 3, 1)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (8, 3, 1)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (10, 2, 1008)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (11, 3, 1008)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (12, 4, 1009)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (13, 2, 3)
INSERT [dbo].[DriverForFine] ([Id_DriverFine], [Id_Fine], [Id_Driver]) VALUES (15, 2, 1010)
SET IDENTITY_INSERT [dbo].[DriverForFine] OFF
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (1, N'Эксплуатация гражданами автомобилей, мотоциклов или других механических ТС, у которых содержание загрязняющих веществ в выбросах либо уровень шума                                                                                                                                                          ', 500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (2, N'Управление ТС в состоянии опьянения                                                                                                                                                                                                                                                                         ', 30000)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (3, N'Отказ от прохождения медицинского освидетельствования на состояние опьянения                                                                                                                                                                                                                                ', 50000)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (4, N'Управление ТС, не зарегистрированным в установленном порядке                                                                                                                                                                                                                                                ', 800)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (5, N'Управление ТС с нечитаемыми, нестандартными или установленными с нарушением требований государственного стандарта государственными регистрационными знаками                                                                                                                                                 ', 500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (6, N'Установка на ТС заведомо подложных государственных регистрационных знаков                                                                                                                                                                                                                                   ', 2500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (7, N'Управление ТС водителем, не имеющим при себе документов на право управления им, страхового полиса обязательного страхования гражданской ответственности владельцев ТС                                                                                                                                       ', 500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (8, N'	Передача управления ТС лицу, не имеющему при себе документов на право управления им                                                                                                                                                                                                                        ', 3500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (9, N'Управление ТС, на котором установлены стекла (в том числе покрытые прозрачными цветными пленками), светопропускание которых не соответствует требованиям технического регламента о безопасности колесных ТС                                                                                                 ', 1000)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (10, N'Управление ТС, на которое незаконно нанесена цветографическая схема легкового такси                                                                                                                                                                                                                         ', 3000)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (11, N'Превышение установленной скорости движения транспортного средства на величину более 20, но не более 40 километров в час                                                                                                                                                                                     ', 500)
INSERT [dbo].[Fine] ([ID_Fine], [NameFine], [AmountFine]) VALUES (12, N'Превышение установленной скорости движения ТС на величину более 40, но не более 60 километров в час                                                                                                                                                                                                         ', 1500)
SET IDENTITY_INSERT [dbo].[RegisterCar] ON 

INSERT [dbo].[RegisterCar] ([Id], [PassportDriver], [PassportVehicle], [InsuranceCar], [NumberPhone]) VALUES (1, N'9212', N'48098922', N'9288321002', N'79586202125')
INSERT [dbo].[RegisterCar] ([Id], [PassportDriver], [PassportVehicle], [InsuranceCar], [NumberPhone]) VALUES (2, N'9117832154', N'55457855', N'4511475477', N'79586202415')
INSERT [dbo].[RegisterCar] ([Id], [PassportDriver], [PassportVehicle], [InsuranceCar], [NumberPhone]) VALUES (3, N'9215904034', N'245967', N'136543', N'79586201165')
INSERT [dbo].[RegisterCar] ([Id], [PassportDriver], [PassportVehicle], [InsuranceCar], [NumberPhone]) VALUES (4, N'9215987234', N'34444444', N'4333333333', N'7937654212')
SET IDENTITY_INSERT [dbo].[RegisterCar] OFF
INSERT [dbo].[TrafficPolice] ([ID_Inspector], [Surname], [Name], [MiddleName], [Rank], [TokenNumber]) VALUES (1000, N'Голубиков                                                                                           ', N'Петр                                                                                                ', N'Михайлович                                                                                          ', N'Старший лейтенант                                 ', 874896)
INSERT [dbo].[TrafficPolice] ([ID_Inspector], [Surname], [Name], [MiddleName], [Rank], [TokenNumber]) VALUES (1001, N'Носиков                                                                                             ', N'Василий                                                                                             ', N'Николаевич                                                                                          ', N'Лейтенант                                         ', 475395)
INSERT [dbo].[TrafficPolice] ([ID_Inspector], [Surname], [Name], [MiddleName], [Rank], [TokenNumber]) VALUES (1002, N'Кузнецов                                                                                            ', N'Валентин                                                                                            ', N'Никитович                                                                                           ', N'Сержант                                           ', 543789)
INSERT [dbo].[TrafficPolice] ([ID_Inspector], [Surname], [Name], [MiddleName], [Rank], [TokenNumber]) VALUES (1003, N'Шамаев                                                                                              ', N'Руслан                                                                                              ', N'Петрович                                                                                            ', N'Старший прапорщик                                 ', 630771)
SET IDENTITY_INSERT [dbo].[UserPolice] ON 

INSERT [dbo].[UserPolice] ([Id], [Login], [Password], [Email]) VALUES (1, N'dps', N'dps', NULL)
INSERT [dbo].[UserPolice] ([Id], [Login], [Password], [Email]) VALUES (2, N'user', N'1', NULL)
SET IDENTITY_INSERT [dbo].[UserPolice] OFF
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Car] FOREIGN KEY([CarNumber])
REFERENCES [dbo].[Car] ([CarNumber])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Car]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Fine] FOREIGN KEY([ID_Fine])
REFERENCES [dbo].[Fine] ([ID_Fine])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Fine]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_TrafficPolice] FOREIGN KEY([ID_Inspector])
REFERENCES [dbo].[TrafficPolice] ([ID_Inspector])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_TrafficPolice]
GO
USE [master]
GO
ALTER DATABASE [GibddTest] SET  READ_WRITE 
GO
