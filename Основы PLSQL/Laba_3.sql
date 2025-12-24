IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Organizer_Event]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Organizer] DROP CONSTRAINT [FK_Organizer_Event]
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

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Venue_Event]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Venue] DROP CONSTRAINT [FK_Venue_Event]
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
	[website] varchar(50) NULL,
	[event_id] int NULL
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
	[city] varchar(50) NOT NULL,
	[capacity] int NULL,
	[contact_phone] varchar(20) NULL,
	[event_id] int NULL
)
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
 ADD CONSTRAINT [PK_Table2]
	PRIMARY KEY CLUSTERED ([venue_id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Registration
_Event] 
 ON [Registration
] ([event_id] ASC)
GO

ALTER TABLE [Organizer] ADD CONSTRAINT [FK_Organizer_Event]
	FOREIGN KEY ([event_id]) REFERENCES [Event] ([event_id]) ON DELETE No Action ON UPDATE No Action
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

ALTER TABLE [Venue] ADD CONSTRAINT [FK_Venue_Event]
	FOREIGN KEY ([event_id]) REFERENCES [Event] ([event_id]) ON DELETE No Action ON UPDATE No Action
GO




-- PRIMARY KEY
ALTER TABLE dbo.Event ADD CONSTRAINT PK_Event PRIMARY KEY (event_id);
ALTER TABLE dbo.Organizer ADD CONSTRAINT PK_Organizer PRIMARY KEY (organizer_id);
ALTER TABLE dbo.Participant ADD CONSTRAINT PK_Participant PRIMARY KEY (participant_id);
ALTER TABLE dbo.Registration ADD CONSTRAINT PK_Registration PRIMARY KEY ([registration.id]);
ALTER TABLE dbo.Venue ADD CONSTRAINT PK_Venue PRIMARY KEY (venue_id);

-- FOREIGN KEYS
ALTER TABLE Event ADD CONSTRAINT FK_Event_Venue FOREIGN KEY (venue_id) REFERENCES Venue(venue_id);
ALTER TABLE Event ADD CONSTRAINT FK_Event_Organizer FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id);
ALTER TABLE Registration ADD CONSTRAINT FK_Registration_Participant FOREIGN KEY (participant_id) REFERENCES Participant(participant_id);
ALTER TABLE Registration ADD CONSTRAINT FK_Registration_Event FOREIGN KEY (event_id) REFERENCES Event(event_id);

-- UNIQUE
ALTER TABLE Participant ADD CONSTRAINT UQ_Participant_Email UNIQUE (email);
ALTER TABLE Registration ADD CONSTRAINT UQ_Registration_Ticket UNIQUE (ticket_number);

-- CHECK
ALTER TABLE Registration ADD CONSTRAINT CHK_Payment_Status CHECK (payment_status IN ('paid', 'unpaid', 'pending'));
ALTER TABLE Registration ADD CONSTRAINT CHK_Attendance_Status CHECK (attendance_status IN ('present', 'absent'));

-- DEFAULT
ALTER TABLE Registration ADD CONSTRAINT DF_Registration_Date DEFAULT GETDATE() FOR registration_date;
ALTER TABLE Registration ADD CONSTRAINT DF_Payment_Status DEFAULT 'pending' FOR payment_status;
ALTER TABLE Registration ADD CONSTRAINT DF_Attendance_Status DEFAULT 'absent' FOR attendance_status;


ALTER TABLE dbo.Participant ADD CONSTRAINT UQ_Participant_Email UNIQUE (email);

IF OBJECT_ID('dbo.Registration', 'U') IS NOT NULL DROP TABLE dbo.Registration;
IF OBJECT_ID('dbo.Participant', 'U') IS NOT NULL DROP TABLE dbo.Participant;
IF OBJECT_ID('dbo.Event', 'U') IS NOT NULL DROP TABLE dbo.Event;
IF OBJECT_ID('dbo.Organizer', 'U') IS NOT NULL DROP TABLE dbo.Organizer;
IF OBJECT_ID('dbo.Venue', 'U') IS NOT NULL DROP TABLE dbo.Venue;

IF OBJECT_ID('dbo.Registration', 'U') IS NOT NULL DROP TABLE dbo.Registration;
IF OBJECT_ID('dbo.Participant', 'U') IS NOT NULL DROP TABLE dbo.Participant;
IF OBJECT_ID('dbo.Event', 'U') IS NOT NULL DROP TABLE dbo.Event;
IF OBJECT_ID('dbo.Organizer', 'U') IS NOT NULL DROP TABLE dbo.Organizer;
IF OBJECT_ID('dbo.Venue', 'U') IS NOT NULL DROP TABLE dbo.Venue;

PRINT '✅ Все таблицы удалены.';
GO




-- UNIQUE
ALTER TABLE dbo.Participant
ADD CONSTRAINT UQ_Participant_Email UNIQUE (email);

ALTER TABLE dbo.Registration
ADD CONSTRAINT UQ_Registration_Ticket UNIQUE (ticket_number);

-- CHECK
ALTER TABLE dbo.Registration
ADD CONSTRAINT CHK_Payment_Status
CHECK (payment_status IN ('paid', 'unpaid', 'pending'));

ALTER TABLE dbo.Registration
ADD CONSTRAINT CHK_Attendance_Status
CHECK (attendance_status IN ('present', 'absent'));

-- DEFAULT
ALTER TABLE dbo.Registration
ADD CONSTRAINT DF_Registration_Date
DEFAULT GETDATE() FOR registration_date;

ALTER TABLE dbo.Registration
ADD CONSTRAINT DF_Payment_Status
DEFAULT 'pending' FOR payment_status;

ALTER TABLE dbo.Registration
ADD CONSTRAINT DF_Attendance_Status
DEFAULT 'absent' FOR attendance_status;


EXEC sp_helpconstraint 'dbo.Participant';
EXEC sp_helpconstraint 'dbo.Registration';



SELECT COUNT(*) AS Total_Organizers FROM dbo.Organizer;
SELECT COUNT(*) AS Total_Venues FROM dbo.Venue;
SELECT COUNT(*) AS Total_Events FROM dbo.Event;
SELECT COUNT(*) AS Total_Participants FROM dbo.Participant;
SELECT COUNT(*) AS Total_Registrations FROM dbo.Registration;

-- SELECT
-- 1. Все участники и их электронные адреса
SELECT participant_id, first_name, last_name, email
FROM dbo.Participant;

-- 2. Все события и где они проходят
SELECT e.event_name, v.venue_name, v.city, e.event_date, e.ticket_price
FROM dbo.Event e
JOIN dbo.Venue v ON e.venue_id = v.venue_id;

-- 3. Все регистрации с указанием участника и статуса оплаты
SELECT r.ticket_number, p.first_name, p.last_name, e.event_name, r.payment_status
FROM dbo.Registration r
JOIN dbo.Participant p ON r.participant_id = p.participant_id
JOIN dbo.Event e ON r.event_id = e.event_id;

-- 4. Сколько участников оплатили участие
SELECT payment_status, COUNT(*) AS total
FROM dbo.Registration
GROUP BY payment_status;

--UPDATE
-- 1. Изменить статус оплаты для конкретного билета
UPDATE dbo.Registration
SET payment_status = 'paid'
WHERE ticket_number = 'TCK-002';

-- 2. Изменить город места проведения
UPDATE dbo.Venue
SET city = 'Astana'
WHERE venue_name = 'Palace of Youth';

-- 3. Изменить контактное лицо организатора
UPDATE dbo.Organizer
SET contact_person = 'Updated Person'
WHERE organizer_id = 1;

-- 4. Обновить статус посещения для всех, кто оплатил
UPDATE dbo.Registration
SET attendance_status = 'present'
WHERE payment_status = 'paid';

-- До обновления
SELECT * FROM dbo.Registration WHERE ticket_number = 'TCK-002';
-- После обновления
UPDATE dbo.Registration SET payment_status = 'paid' WHERE ticket_number = 'TCK-002';
SELECT * FROM dbo.Registration WHERE ticket_number = 'TCK-002';



-- 1. Удалить участника по ID (например, если ошибка в данных)
DELETE FROM dbo.Participant
WHERE participant_id = 20;

-- 2. Удалить регистрацию с неоплаченным билетом
DELETE FROM dbo.Registration
WHERE payment_status = 'unpaid';

-- 3. Удалить событие, которое уже прошло (для примера)
DELETE FROM dbo.Event
WHERE event_date < '2025-09-01';

-- 4. Удалить площадку с низкой вместимостью
DELETE FROM dbo.Venue
WHERE capacity < 300;


-- Попытка вставить участника с уже существующим email
INSERT INTO dbo.Participant (first_name, last_name, email, phone, birth_date)
VALUES ('Duplicate', 'Email', 'dmitry@mail.com', '87079990000', '2000-01-01');

-- Попытка вставить неверный статус оплаты
INSERT INTO dbo.Registration (participant_id, event_id, ticket_number, payment_status, attendance_status)
VALUES (1, 1, 'TCK-999', 'waiting', 'present');



-- 1️⃣ Удалить регистрацию с определённым статусом оплаты (pending)
DELETE FROM dbo.Registration
WHERE payment_status = 'pending';


-- 2️⃣ Удалить конкретного участника (если он не участвует в регистрации)
-- (для примера: участник с ID = 19)
DELETE FROM dbo.Participant
WHERE participant_id = 19;


-- 3️⃣ Удалить событие с определённым названием
-- (если на него нет активных регистраций)
DELETE FROM dbo.Event
WHERE event_name = 'Education Fair';


-- 4️⃣ Удалить площадки с вместимостью меньше 400 человек
DELETE FROM dbo.Venue
WHERE capacity < 400;


SELECT COUNT(*) AS Registrations FROM dbo.Registration;
SELECT COUNT(*) AS Participants FROM dbo.Participant;
SELECT COUNT(*) AS Events FROM dbo.Event;
SELECT COUNT(*) AS Venues FROM dbo.Venue;
