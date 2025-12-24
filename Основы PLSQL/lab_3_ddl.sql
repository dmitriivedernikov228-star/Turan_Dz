IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Event_Organizer]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Event] DROP CONSTRAINT [FK_Event_Organizer]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Event_Venue]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Event] DROP CONSTRAINT [FK_Event_Venue]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Registration
_Event]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Registration
] DROP CONSTRAINT [FK_Registration
_Event]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Registration
_Participant]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Registration
] DROP CONSTRAINT [FK_Registration
_Participant]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Venue_City]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Venue] DROP CONSTRAINT [FK_Venue_City]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[City]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [City]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Event]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Event]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Organizer]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Organizer]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Participant]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Participant]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Registration
]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Registration
]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Venue]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Venue]
GO

CREATE TABLE [City]
(
	[city_id] int NOT NULL,
	[name] varchar(50) NOT NULL
)
GO

CREATE TABLE [Event]
(
	[event_id] int NOT NULL,
	[event_name] varchar(100) NOT NULL,
	[description] text NULL,
	[event_date] date NOT NULL,
	[start_time] time(7) NULL,
	[ticket_price] varchar(50) NULL,
	[venue_id] int NOT NULL,
	[organizer_id] int NOT NULL
)
GO

CREATE TABLE [Organizer]
(
	[organizer_id] int NOT NULL,
	[organization_name] varchar(100) NOT NULL,
	[contact_person] varchar(100) NULL,
	[email] varchar(100) NOT NULL,
	[phone] varchar(20) NULL,
	[website] varchar(50) NULL
)
GO

CREATE TABLE [Participant]
(
	[participant_id] int NOT NULL,
	[first_name] varchar(50) NOT NULL,
	[last_name] varchar(50) NOT NULL,
	[email] varchar(100) NOT NULL,
	[phone] varchar(20) NULL,
	[birth_date] date NULL
)
GO

CREATE TABLE [Registration
]
(
	[registration.id] int NOT NULL,
	[participant_id] int NOT NULL,
	[event_id] int NOT NULL,
	[registration_date] date NOT NULL,
	[ticket_number] varchar(50) NOT NULL,
	[payment_status] varchar(50) NOT NULL,
	[attendance_status] varchar(50) NOT NULL
)
GO

CREATE TABLE [Venue]
(
	[venue_id] int NOT NULL,
	[venue_name] varchar(100) NOT NULL,
	[address] varchar(150) NOT NULL,
	[city_id] int NOT NULL,
	[capacity] int NULL,
	[contact_phone] varchar(20) NULL
)
GO

ALTER TABLE [City] 
 ADD CONSTRAINT [PK_City]
	PRIMARY KEY CLUSTERED ([city_id] ASC)
GO

ALTER TABLE [Event] 
 ADD CONSTRAINT [PK_Event]
	PRIMARY KEY CLUSTERED ([event_id] ASC)
GO

ALTER TABLE [Organizer] 
 ADD CONSTRAINT [PK_Organizer]
	PRIMARY KEY CLUSTERED ([organizer_id] ASC)
GO

ALTER TABLE [Participant] 
 ADD CONSTRAINT [PK_Participant]
	PRIMARY KEY CLUSTERED ([participant_id] ASC)
GO

ALTER TABLE [Registration
] 
 ADD CONSTRAINT [PK_Registration
]
	PRIMARY KEY CLUSTERED ([registration.id] ASC)
GO

ALTER TABLE [Venue] 
 ADD CONSTRAINT [PK_Venue]
	PRIMARY KEY CLUSTERED ([venue_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Event_Organizer] 
 ON [Event] ([organizer_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Event_Venue] 
 ON [Event] ([venue_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Registration
_Event] 
 ON [Registration
] ([event_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Registration
_Participant] 
 ON [Registration
] ([participant_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Venue_City] 
 ON [Venue] ([city_id] ASC)
GO

ALTER TABLE [Event] ADD CONSTRAINT [FK_Event_Organizer]
	FOREIGN KEY ([organizer_id]) REFERENCES [Organizer] ([organizer_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Event] ADD CONSTRAINT [FK_Event_Venue]
	FOREIGN KEY ([venue_id]) REFERENCES [Venue] ([venue_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Registration
] ADD CONSTRAINT [FK_Registration
_Event]
	FOREIGN KEY ([event_id]) REFERENCES [Event] ([event_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Registration
] ADD CONSTRAINT [FK_Registration
_Participant]
	FOREIGN KEY ([participant_id]) REFERENCES [Participant] ([participant_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Venue] ADD CONSTRAINT [FK_Venue_City]
	FOREIGN KEY ([city_id]) REFERENCES [City] ([city_id]) ON DELETE No Action ON UPDATE No Action
GO

