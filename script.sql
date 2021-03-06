USE [huy]
GO
/****** Object:  Table [dbo].[Capstone]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capstone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parrentId] [int] NOT NULL,
	[percent] [float] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Capstone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capstone_Class]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capstone_Class](
	[capstone_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
 CONSTRAINT [PK_Capstone_Class] PRIMARY KEY CLUSTERED 
(
	[capstone_id] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capstone_Grade]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capstone_Grade](
	[capstone_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
 CONSTRAINT [PK_Capstone_Grade] PRIMARY KEY CLUSTERED 
(
	[capstone_id] ASC,
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[teacher_id] [int] NOT NULL,
	[semester_id] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Student]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Student](
	[student_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
 CONSTRAINT [PK_Class_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [float] NOT NULL,
	[student_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[capstone_id] [int] NOT NULL,
	[percent] [float] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/15/2022 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[type] [int] NULL,
	[class_id] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Capstone_Class]  WITH CHECK ADD  CONSTRAINT [FK_Capstone_Class_Capstone] FOREIGN KEY([capstone_id])
REFERENCES [dbo].[Capstone] ([id])
GO
ALTER TABLE [dbo].[Capstone_Class] CHECK CONSTRAINT [FK_Capstone_Class_Capstone]
GO
ALTER TABLE [dbo].[Capstone_Class]  WITH CHECK ADD  CONSTRAINT [FK_Capstone_Class_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[Capstone_Class] CHECK CONSTRAINT [FK_Capstone_Class_Class]
GO
ALTER TABLE [dbo].[Capstone_Grade]  WITH CHECK ADD  CONSTRAINT [FK_Capstone_Grade_Capstone] FOREIGN KEY([capstone_id])
REFERENCES [dbo].[Capstone] ([id])
GO
ALTER TABLE [dbo].[Capstone_Grade] CHECK CONSTRAINT [FK_Capstone_Grade_Capstone]
GO
ALTER TABLE [dbo].[Capstone_Grade]  WITH CHECK ADD  CONSTRAINT [FK_Capstone_Grade_Grade] FOREIGN KEY([grade_id])
REFERENCES [dbo].[Grade] ([id])
GO
ALTER TABLE [dbo].[Capstone_Grade] CHECK CONSTRAINT [FK_Capstone_Grade_Grade]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Semester] FOREIGN KEY([semester_id])
REFERENCES [dbo].[Semester] ([id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Semester]
GO
ALTER TABLE [dbo].[Class_Student]  WITH CHECK ADD  CONSTRAINT [FK_Class_Student_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[Class_Student] CHECK CONSTRAINT [FK_Class_Student_Class]
GO
ALTER TABLE [dbo].[Class_Student]  WITH CHECK ADD  CONSTRAINT [FK_Class_Student_User] FOREIGN KEY([student_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Class_Student] CHECK CONSTRAINT [FK_Class_Student_User]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_User] FOREIGN KEY([student_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_User]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_User1] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_User1]
GO
