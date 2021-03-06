 USE [master]
GO
/****** Base de datos de Cleaning Service creada por ******/
/****** Karla Geraldin García Ogando          19-MIIT-1-015******/
/****** Juan Omar Pilar                       05-SIIN-1-099******/
/****** Dalin Alescar Portorreal de León      19-MIIN-1-129******/
CREATE DATABASE [Cleaning_Services]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cleaning_Services', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019CORE\MSSQL\DATA\Cleaning_Services.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cleaning_Services_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019CORE\MSSQL\DATA\Cleaning_Services_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cleaning_Services] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cleaning_Services].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cleaning_Services] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cleaning_Services] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cleaning_Services] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cleaning_Services] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cleaning_Services] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cleaning_Services] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Cleaning_Services] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cleaning_Services] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cleaning_Services] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cleaning_Services] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cleaning_Services] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cleaning_Services] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cleaning_Services] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cleaning_Services] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cleaning_Services] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cleaning_Services] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cleaning_Services] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cleaning_Services] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cleaning_Services] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cleaning_Services] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cleaning_Services] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cleaning_Services] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cleaning_Services] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cleaning_Services] SET  MULTI_USER 
GO
ALTER DATABASE [Cleaning_Services] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cleaning_Services] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cleaning_Services] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cleaning_Services] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cleaning_Services] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cleaning_Services] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cleaning_Services] SET QUERY_STORE = OFF
GO
USE [Cleaning_Services]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 21/12/2020 14:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[AsistenciaId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [varchar](50) NOT NULL,
	[Tipo_asistencia] [varchar](50) NOT NULL,
	[ColaboradorId] [int] NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Asistencia] PRIMARY KEY CLUSTERED 
(
	[AsistenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/12/2020 14:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [varchar](50) NOT NULL,
	[Nombre_cliente] [varchar](40) NOT NULL,
	[Tipo_cliente] [varchar](10) NOT NULL,
	[Direccion] [varchar](40) NOT NULL,
	[Telefono] [numeric](11, 0) NOT NULL,
 CONSTRAINT [PK__Clientes__FCE0399264041ED2] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colaboradores]    Script Date: 21/12/2020 14:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colaboradores](
	[ColaboradorId] [int] IDENTITY(1,32) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Posicion] [text] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Colabora__63C76BE2548D9C9B] PRIMARY KEY CLUSTERED 
(
	[ColaboradorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 21/12/2020 14:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ServicioId] [int] IDENTITY(1,1) NOT NULL,
	[Servicio] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Precio] [numeric](38, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServicioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 21/12/2020 14:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[FacturaId] [varchar](50) NOT NULL,
	[No_factura] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[ClienteId] [varchar](50) NOT NULL,
	[ServicioId] [int] NOT NULL,
	[ColaboradorID] [int] NOT NULL,
 CONSTRAINT [PK__Ventas__A6DB936229C837BA] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asistencia] ON 

INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (1, N'10', N'Consulta', 1, N'21-12-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (2, N'1', N'Soporte', 97, N'15-03-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (3, N'8', N'Queja', 65, N'16-05-2019')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (4, N'4', N'Sugerencia', 257, N'02-03-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (5, N'5', N'Consulta', 193, N'01-04-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (6, N'7', N'Soporte', 225, N'04-04-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (7, N'3', N'Requerimiento', 65, N'10-09-2020')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (9, N'6', N'Requerimiento', 129, N'24-26-2019')
INSERT [dbo].[Asistencia] ([AsistenciaId], [ClienteId], [Tipo_asistencia], [ColaboradorId], [Fecha]) VALUES (10, N'2', N'Soporte', 193, N'07-07-2020')
SET IDENTITY_INSERT [dbo].[Asistencia] OFF
GO
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'1', N'Juan Perez', N'Personal', N'Santo Domingo', CAST(8096554658 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'10', N'Aeropaq', N'Empresa', N'Santo Domingo', CAST(8495651232 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'2', N'Cecomsa', N'Empresa', N'Santo Domingo', CAST(8094445566 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'3', N'SeNaSa', N'Empresa', N'Santiago', CAST(8093333822 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'4', N'Maria Rondon', N'Personal', N'Mao', CAST(8295563347 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'5', N'Karla Garcia', N'Personal', N'San Cristobal', CAST(8493356896 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'6', N'Universidad O&M', N'Empresa', N'Santo Domingo', CAST(8098154636 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'7', N'Jose Peguero', N'Personal', N'La Romana', CAST(8094120541 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'8', N'Matos S.A.', N'Empresa', N'Monte Plata', CAST(8495632363 AS Numeric(11, 0)))
INSERT [dbo].[Clientes] ([ClienteId], [Nombre_cliente], [Tipo_cliente], [Direccion], [Telefono]) VALUES (N'9', N'EPS', N'Empresa', N'Bani', CAST(8294125603 AS Numeric(11, 0)))
GO
SET IDENTITY_INSERT [dbo].[Colaboradores] ON 

INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (1, N'Juan Pilar
', N'DBA
', N'Jp@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (65, N'Karla Garcia

', N'CEO
', N'Kg@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (97, N'Darlin Aleskar
', N'Desarrollador
', N'Da@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (129, N'Maria Fuentes
', N'Encargado
', N'Mf@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (161, N'Javier Ramos
', N'Gerente
', N'Jr@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (193, N'Oscar Perez
', N'Tecnico
', N'op@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (225, N'Juana Martinez
', N'Tecnico
', N'Jm@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (257, N'Isabel Clase
', N'asistente
', N'Ic@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (289, N'Naomi Ramirez
', N'conserje', N'Nr@Cleaning.com
')
INSERT [dbo].[Colaboradores] ([ColaboradorId], [Nombre], [Posicion], [Correo]) VALUES (321, N'Sebastian Vargas
', N'mensajero
', N'Sv@Cleaning.com
')
SET IDENTITY_INSERT [dbo].[Colaboradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (1, N'Mantenimiento Preventivo', N'Prevencion de perdida de datos', CAST(50000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (3, N'Manteniniento Correctivo', N'Correccion de fallas y errores', CAST(70000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (4, N'Asesoria', N'Asesoria en materia de seguridad', CAST(30000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (5, N'Diseño de Base de Datos', N'Diseño de base de datos', CAST(40000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (6, N'Actualizacion de servidores', N'Actualizacion de servidores', CAST(50000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (7, N'Instalacion de redes', N'Instalacion de redes', CAST(30000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (8, N'Derrollo de Software', N'Desarrollo de aplicaciones', CAST(40000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (9, N'Administracion de Base de Datos', N'Administracion de bases de datos', CAST(65000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (10, N'Consultoria', N'Consultoria en tema de servidores y software', CAST(50000 AS Numeric(38, 0)))
INSERT [dbo].[Servicio] ([ServicioId], [Servicio], [Descripcion], [Precio]) VALUES (11, N'Supervision', N'Supervision de Infraestructura', CAST(45000 AS Numeric(38, 0)))
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'1', N'123', CAST(N'2017-01-15' AS Date), N'2', 4, 1)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'10', N'78456', CAST(N'2020-11-05' AS Date), N'3', 1, 65)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'2', N'1235', CAST(N'2017-01-30' AS Date), N'2', 5, 65)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'3', N'2123', CAST(N'2017-09-23' AS Date), N'4', 10, 129)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'4', N'3125', CAST(N'2018-03-02' AS Date), N'5', 3, 161)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'5', N'4565', CAST(N'2018-05-14' AS Date), N'6', 11, 225)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'6', N'5564', CAST(N'2018-07-06' AS Date), N'7', 9, 97)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'7', N'5568', CAST(N'2018-07-29' AS Date), N'7', 10, 97)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'8', N'6577', CAST(N'2019-04-05' AS Date), N'9', 4, 1)
INSERT [dbo].[Ventas] ([FacturaId], [No_factura], [Fecha], [ClienteId], [ServicioId], [ColaboradorID]) VALUES (N'9', N'9778', CAST(N'2020-07-29' AS Date), N'10', 10, 97)
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Asistencia] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Asistencia]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Colaboradores] FOREIGN KEY([ColaboradorId])
REFERENCES [dbo].[Colaboradores] ([ColaboradorId])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Colaboradores]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Clientes]
GO
ALTER TABLE [dbo].[Colaboradores]  WITH CHECK ADD  CONSTRAINT [FK_Colaboradores_Colaboradores] FOREIGN KEY([ColaboradorId])
REFERENCES [dbo].[Colaboradores] ([ColaboradorId])
GO
ALTER TABLE [dbo].[Colaboradores] CHECK CONSTRAINT [FK_Colaboradores_Colaboradores]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Colaboradores] FOREIGN KEY([ColaboradorID])
REFERENCES [dbo].[Colaboradores] ([ColaboradorId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Colaboradores]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Servicio] FOREIGN KEY([ServicioId])
REFERENCES [dbo].[Servicio] ([ServicioId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Servicio]
GO
USE [master]
GO
ALTER DATABASE [Cleaning_Services] SET  READ_WRITE 
GO
