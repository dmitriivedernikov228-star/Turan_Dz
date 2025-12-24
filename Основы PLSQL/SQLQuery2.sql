alter table [Registration
]
add constraint check_status
check (payment_status in ('registered', 'unregistered', 'pending', 'banned'));

select * from Registration

-- ========================================
-- Вставка данных в таблицу City (25 записей)
-- ========================================
INSERT INTO City (city_id, name) VALUES
(1, 'Almaty'),
(2, 'Astana'),
(3, 'Shymkent'),
(4, 'Karaganda'),
(5, 'Aktobe'),
(6, 'Taraz'),
(7, 'Pavlodar'),
(8, 'Ust-Kamenogorsk'),
(9, 'Semey'),
(10, 'Atyrau'),
(11, 'Kostanay'),
(12, 'Kyzylorda'),
(13, 'Uralsk'),
(14, 'Petropavlovsk'),
(15, 'Aktau'),
(16, 'Temirtau'),
(17, 'Turkistan'),
(18, 'Kokshetau'),
(19, 'Taldykorgan'),
(20, 'Ekibastuz'),
(21, 'Rudny'),
(22, 'Zhezkazgan'),
(23, 'Balkhash'),
(24, 'Kentau'),
(25, 'Satpaev');
GO

-- ========================================
-- Вставка данных в таблицу Organizer (25 записей)
-- ========================================
INSERT INTO Organizer (organizer_id, organization_name, contact_person, email, phone, website) VALUES
(1, 'Event Pro KZ', 'Aibek Nurlan', 'info@eventpro.kz', '+77017654321', 'eventpro.kz'),
(2, 'Music Events', 'Saule Bekova', 'contact@musicevents.kz', '+77027654322', 'musicevents.kz'),
(3, 'Tech Conference Ltd', 'Dias Omarov', 'hello@techconf.kz', '+77017654323', 'techconf.kz'),
(4, 'Sports Management', 'Arman Kazybek', 'info@sportsmanage.kz', '+77027654324', 'sportsmanage.kz'),
(5, 'Cultural Events', 'Aigerim Suleimenova', 'culture@events.kz', '+77017654325', 'culturalevents.kz'),
(6, 'Business Summit Org', 'Murat Aitzhanov', 'business@summit.kz', '+77027654326', 'businesssummit.kz'),
(7, 'Festival Group', 'Zhanna Kamzina', 'info@festivalgroup.kz', '+77017654327', 'festivalgroup.kz'),
(8, 'Exhibition Center', 'Olzhas Beketov', 'expo@center.kz', '+77027654328', 'expocenter.kz'),
(9, 'Concert Hall Agency', 'Aliya Mynbayeva', 'concerts@agency.kz', '+77017654329', 'concerthall.kz'),
(10, 'Educational Events', 'Baurzhan Toktar', 'edu@events.kz', '+77027654330', 'eduevents.kz'),
(11, 'Art Gallery Events', 'Madina Zhumabek', 'art@gallery.kz', '+77017654331', 'artgallery.kz'),
(12, 'Food Festival Co', 'Yerlan Sarsenbay', 'food@festival.kz', '+77027654332', 'foodfest.kz'),
(13, 'Theater Productions', 'Kamila Nurzhanova', 'theater@prod.kz', '+77017654333', 'theaterprod.kz'),
(14, 'Marathon Organizers', 'Daniyar Alimov', 'run@marathon.kz', '+77027654334', 'marathon.kz'),
(15, 'Fashion Show Events', 'Ainur Kassymova', 'fashion@show.kz', '+77017654335', 'fashionshow.kz'),
(16, 'Charity Foundation', 'Askar Nurpeisov', 'charity@foundation.kz', '+77027654336', 'charity.kz'),
(17, 'Gaming Tournament', 'Alibek Shynggys', 'gaming@tournament.kz', '+77017654337', 'gamingtour.kz'),
(18, 'Science Fair', 'Gaukhar Esimova', 'science@fair.kz', '+77027654338', 'sciencefair.kz'),
(19, 'Youth Forum', 'Nurlan Abdikarim', 'youth@forum.kz', '+77017654339', 'youthforum.kz'),
(20, 'Wedding Planners', 'Assel Dauletova', 'wedding@planners.kz', '+77027654340', 'weddingplan.kz'),
(21, 'Comedy Club', 'Ruslan Mukanov', 'comedy@club.kz', '+77017654341', 'comedyclub.kz'),
(22, 'Film Festival', 'Laura Temirbekova', 'film@festival.kz', '+77027654342', 'filmfest.kz'),
(23, 'Book Fair Organizers', 'Azamat Kuanysh', 'book@fair.kz', '+77017654343', 'bookfair.kz'),
(24, 'Dance Competition', 'Meruert Zhanibek', 'dance@comp.kz', '+77017654344', 'dancecomp.kz'),
(25, 'Startup Events', 'Timur Sailaubek', 'startup@events.kz', '+77017654345', 'startupev.kz');
GO

-- ========================================
-- Вставка данных в таблицу Venue (30 записей)
-- ========================================
INSERT INTO Venue (venue_id, venue_name, address, city_id, capacity, contact_phone) VALUES
(1, 'Central Concert Hall', 'Abay Avenue 125', 1, 5000, '+77017001001'),
(2, 'Astana Arena', 'Kabanbay Batyr 42', 2, 30000, '+77172001002'),
(3, 'Shymkent Plaza', 'Tauke Khan 15', 3, 2000, '+77252001003'),
(4, 'Karaganda Sports Palace', 'Bukhar Zhyrau 38', 4, 8000, '+77212001004'),
(5, 'Aktobe Convention Center', 'Abulkhair Khan 52', 5, 3000, '+77132001005'),
(6, 'Taraz Exhibition Hall', 'Tole Bi 88', 6, 1500, '+77262001006'),
(7, 'Pavlodar Theater', 'Satpayev Street 125', 7, 1200, '+77182001007'),
(8, 'Ust-Kamenogorsk Arena', 'Ushanov 45', 8, 6000, '+77232001008'),
(9, 'Semey Cultural Center', 'Shakarim Avenue 22', 9, 2500, '+77222001009'),
(10, 'Atyrau Music Hall', 'Satpayev 18', 10, 1800, '+77122001010'),
(11, 'Kostanay Stadium', 'Al-Farabi 95', 11, 12000, '+77142001011'),
(12, 'Kyzylorda Palace', 'Aiteke Bi 33', 12, 2200, '+77242001012'),
(13, 'Uralsk Event Center', 'Dostyk Avenue 156', 13, 3500, '+77112001013'),
(14, 'Petropavlovsk Hall', 'Constitution Street 48', 14, 1600, '+77152001014'),
(15, 'Aktau Beach Arena', 'Microdistrict 15', 15, 4000, '+77292001015'),
(16, 'Temirtau Sports Complex', 'Metallurgov 77', 16, 5000, '+77213001016'),
(17, 'Turkistan Conference Hall', 'Tauke Khan Avenue 2', 17, 1000, '+77533001017'),
(18, 'Kokshetau Theater', 'Abay Street 89', 18, 900, '+77162001018'),
(19, 'Taldykorgan Arena', 'Zhansugurova 145', 19, 3000, '+77282001019'),
(20, 'Ekibastuz Center', 'Energy Workers 25', 20, 2000, '+77187001020'),
(21, 'Almaty Open Air', 'Mountain Road 5', 1, 10000, '+77017002021'),
(22, 'Astana Palace', 'Republic Avenue 12', 2, 4500, '+77172002022'),
(23, 'Shymkent Stadium', 'Baidibek Bi 205', 3, 15000, '+77252002023'),
(24, 'Karaganda Conference', 'Buhar Zhyrau 144', 4, 800, '+77212002024'),
(25, 'Aktobe Theater', 'Altynsarin 88', 5, 700, '+77132002025'),
(26, 'Almaty Tech Hub', 'Nazarbayev Avenue 234', 1, 500, '+77017003026'),
(27, 'Astana Expo Center', 'Mangilik El 55', 2, 20000, '+77172003027'),
(28, 'Pavlodar Conference', 'Krivenko Street 42', 7, 600, '+77182002028'),
(29, 'Semey Stadium', 'Abay Avenue 178', 9, 8000, '+77222002029'),
(30, 'Almaty Grand Hall', 'Furmanov Street 91', 1, 3500, '+77017004030');
GO

-- ========================================
-- Вставка данных в таблицу Participant (30 записей)
-- ========================================
-- Вставка данных в таблицу Participant (30 записей)
INSERT INTO Participant (participant_id, first_name, last_name, email, phone, birth_date) VALUES
(1, 'Aidar', 'Karimov', 'aidar.karimov@mail.kz', '+77017771001', '1995-03-15'),
(2, 'Aizhan', 'Serikova', 'aizhan.serik@gmail.com', '+77027772002', '1998-07-22'),
(3, 'Bekzat', 'Akhmetov', 'bekzat.ahmet@mail.kz', '+77017773003', '1992-11-08'),
(4, 'Dana', 'Ospanova', 'dana.ospanova@gmail.com', '+77027774004', '2000-01-30'),
(5, 'Erasyl', 'Mustafin', 'erasyl.mustafin@mail.kz', '+77017775005', '1997-05-14'),
(6, 'Farida', 'Zhaksylykova', 'farida.zhak@gmail.com', '+77027776006', '1994-09-25'),
(7, 'Galym', 'Beketov', 'galym.beketov@mail.kz', '+77017777007', '1996-12-03'),
(8, 'Gaukhar', 'Nurlanova', 'gaukhar.nur@gmail.com', '+77027778008', '1999-04-18'),
(9, 'Erlan', 'Zhumabayev', 'erlan.zhuma@mail.kz', '+77017779009', '1993-08-27'),
(10, 'Kamila', 'Suleimenova', 'kamila.sulei@gmail.com', '+77027770010', '2001-02-11'),
(11, 'Marat', 'Isaev', 'marat.isaev@mail.kz', '+77017771011', '1991-06-19'),
(12, 'Nazgul', 'Abdualliyeva', 'nazgul.abd@gmail.com', '+77027772012', '1998-10-07'),
(13, 'Olzhas', 'Turganbayev', 'olzhas.turgan@mail.kz', '+77017773013', '1995-01-24'),
(14, 'Perizat', 'Kenzhebaeva', 'perizat.kenz@gmail.com', '+77027774014', '1997-05-30'),
(15, 'Ruslan', 'Alimzhanov', 'ruslan.alim@mail.kz', '+77017775015', '1994-09-12'),
(16, 'Saule', 'Baikadamova', 'saule.baik@gmail.com', '+77027776016', '1999-03-08'),
(17, 'Timur', 'Sarsenov', 'timur.sarsen@mail.kz', '+77017777017', '1992-07-16'),
(18, 'Ulzhan', 'Kassymbekova', 'ulzhan.kassym@gmail.com', '+77027778018', '2000-11-21'),
(19, 'Yerbol', 'Nurpeisov', 'yerbol.nur@mail.kz', '+77017779019', '1996-02-28'),
(20, 'Zhanar', 'Akhmetzhanova', 'zhanar.ahm@gmail.com', '+77027770020', '1998-06-05'),
(21, 'Askar', 'Zhunusov', 'askar.zhunus@mail.kz', '+77017771021', '1993-10-14'),
(22, 'Bibigul', 'Esimova', 'bibigul.esim@gmail.com', '+77027772022', '1997-04-23'),
(23, 'Damir', 'Tokhtarov', 'damir.tokh@mail.kz', '+77017773023', '1995-08-31'),
(24, 'Elmira', 'Sadykova', 'elmira.sadyk@gmail.com', '+77027774024', '2001-01-09'),
(25, 'Kanat', 'Urazbaev', 'kanat.urazb@mail.kz', '+77017775025', '1994-05-17'),
(26, 'Laura', 'Zhakupova', 'laura.zhakup@gmail.com', '+77027776026', '1999-09-26'),
(27, 'Nurzhan', 'Mukashev', 'nurzhan.muk@mail.kz', '+77017777027', '1992-12-04'),
(28, 'Saltanat', 'Bekturova', 'saltanat.bekt@gmail.com', '+77027778028', '1998-03-13'),
(29, 'Talgat', 'Orazalinov', 'talgat.oraz@mail.kz', '+77017779029', '1996-07-20'),
(30, 'Zarina', 'Abilova', 'zarina.abil@gmail.com', '+77027770030', '2000-11-28');

-- ========================================
-- Вставка данных в таблицу Event (30 записей)
-- ========================================
INSERT INTO Event (event_id, event_name, description, event_date, start_time, ticket_price, venue_id, organizer_id) VALUES
(1, 'Rock Festival 2025', 'Annual rock music festival with international bands', '2025-06-15', '18:00:00', '15000', 1, 2),
(2, 'Tech Summit Kazakhstan', 'Technology conference for IT professionals', '2025-05-20', '09:00:00', '25000', 2, 3),
(3, 'Marathon Almaty', 'City marathon for professional and amateur runners', '2025-04-10', '07:00:00', '5000', 21, 14),
(4, 'Art Exhibition', 'Contemporary art exhibition', '2025-07-01', '10:00:00', 'Free', 11, 11),
(5, 'Food Festival', 'International cuisine festival', '2025-08-12', '11:00:00', '3000', 12, 12),
(6, 'Business Forum', 'International business networking event', '2025-09-05', '09:30:00', '50000', 27, 6),
(7, 'Comedy Night', 'Stand-up comedy show', '2025-05-25', '19:00:00', '8000', 7, 21),
(8, 'Classical Concert', 'Symphony orchestra performance', '2025-06-08', '19:30:00', '12000', 9, 9),
(9, 'Gaming Championship', 'Esports tournament', '2025-10-15', '10:00:00', '10000', 22, 17),
(10, 'Fashion Week', 'Kazakhstan fashion week', '2025-11-20', '18:00:00', '20000', 15, 15),
(11, 'Film Festival', 'International film screening', '2025-07-22', '17:00:00', '7000', 18, 22),
(12, 'Book Fair', 'Annual book exhibition and sale', '2025-04-28', '10:00:00', 'Free', 24, 23),
(13, 'Dance Competition', 'National dance championship', '2025-05-16', '14:00:00', '6000', 19, 24),
(14, 'Startup Pitch Day', 'Startup pitching competition', '2025-06-30', '10:00:00', '15000', 26, 25),
(15, 'Jazz Evening', 'Jazz music concert', '2025-08-05', '20:00:00', '9000', 10, 2),
(16, 'Science Fair', 'School science projects exhibition', '2025-09-12', '09:00:00', 'Free', 14, 18),
(17, 'Charity Gala', 'Fundraising charity event', '2025-10-20', '18:30:00', '30000', 30, 16),
(18, 'Football Match', 'National league football game', '2025-05-03', '19:00:00', '4000', 11, 4),
(19, 'Theater Play', 'Classical drama performance', '2025-06-18', '19:00:00', '7500', 13, 13),
(20, 'Youth Forum', 'Youth leadership conference', '2025-07-10', '09:00:00', '5000', 17, 19),
(21, 'Wedding Expo', 'Wedding planning exhibition', '2025-08-25', '11:00:00', '2000', 5, 20),
(22, 'Pop Concert', 'Popular music concert', '2025-09-15', '19:30:00', '18000', 1, 2),
(23, 'Educational Seminar', 'Teaching methods workshop', '2025-04-15', '10:00:00', '8000', 28, 10),
(24, 'Cultural Festival', 'Traditional culture celebration', '2025-06-25', '12:00:00', 'Free', 6, 5),
(25, 'Basketball Tournament', 'Regional basketball competition', '2025-05-30', '15:00:00', '3500', 4, 4),
(26, 'Opera Performance', 'Classical opera show', '2025-07-15', '19:00:00', '16000', 7, 9),
(27, 'Tech Workshop', 'Programming workshop for beginners', '2025-08-20', '10:00:00', '12000', 26, 3),
(28, 'Photography Exhibition', 'Local photographers showcase', '2025-09-08', '11:00:00', 'Free', 11, 11),
(29, 'Cycling Race', 'Professional cycling competition', '2025-10-05', '08:00:00', '6000', 23, 14),
(30, 'New Year Gala', 'New Year celebration concert', '2025-12-31', '21:00:00', '25000', 2, 1);
GO

-- ========================================
-- Вставка данных в таблицу Registration (30 записей)
-- ========================================
INSERT INTO Registration (registration_id, participant_id, event_id, registration_date, ticket_number, payment_status, attendance_status) VALUES
(1, 1, 1, '2025-05-01', 'TICKET-001-RF2025', 'registered', 'Registered'),
(2, 2, 2, '2025-04-15', 'TICKET-002-TECH2025', 'registered', 'Registered'),
(3, 3, 3, '2025-03-20', 'TICKET-003-MAR2025', 'registered', 'Registered'),
(4, 4, 4, '2025-06-10', 'TICKET-004-ART2025', 'registered', 'Registered'),
(5, 5, 5, '2025-07-25', 'TICKET-005-FOOD2025', 'pending', 'Registered'),
(6, 6, 6, '2025-08-01', 'TICKET-006-BUS2025', 'registered', 'Registered'),
(7, 7, 7, '2025-05-10', 'TICKET-007-COM2025', 'registered', 'Registered'),
(8, 8, 8, '2025-05-28', 'TICKET-008-CLAS2025', 'registered', 'Attended'),
(9, 9, 9, '2025-09-20', 'TICKET-009-GAM2025', 'registered', 'Registered'),
(10, 10, 10, '2025-10-30', 'TICKET-010-FASH2025', 'pending', 'Registered'),
(11, 11, 11, '2025-07-01', 'TICKET-011-FILM2025', 'registered', 'Registered'),
(12, 12, 12, '2025-04-10', 'TICKET-012-BOOK2025', 'registered', 'Registered'),
(13, 13, 13, '2025-05-01', 'TICKET-013-DANC2025', 'registered', 'Attended'),
(14, 14, 14, '2025-06-15', 'TICKET-014-START2025', 'registered', 'Registered'),
(15, 15, 15, '2025-07-20', 'TICKET-015-JAZZ2025', 'pending', 'Registered'),
(16, 16, 16, '2025-08-25', 'TICKET-016-SCI2025', 'registered', 'Registered'),
(17, 17, 17, '2025-10-01', 'TICKET-017-CHAR2025', 'registered', 'Registered'),
(18, 18, 18, '2025-04-20', 'TICKET-018-FOOT2025', 'registered', 'Attended'),
(19, 19, 19, '2025-06-01', 'TICKET-019-THEA2025', 'registered', 'Registered'),
(20, 20, 20, '2025-06-28', 'TICKET-020-YOUTH2025', 'registered', 'Registered'),
(21, 21, 21, '2025-08-10', 'TICKET-021-WED2025', 'registered', 'Attended'),
(22, 22, 22, '2025-09-01', 'TICKET-022-POP2025', 'pending', 'Registered'),
(23, 23, 23, '2025-04-01', 'TICKET-023-EDU2025', 'registered', 'Attended'),
(24, 24, 24, '2025-06-10', 'TICKET-024-CULT2025', 'registered', 'Registered'),
(25, 25, 25, '2025-05-15', 'TICKET-025-BASK2025', 'registered', 'Attended'),
(26, 26, 26, '2025-07-01', 'TICKET-026-OPER2025', 'registered', 'Registered'),
(27, 27, 27, '2025-08-05', 'TICKET-027-TECH2025', 'pending', 'Registered'),
(28, 28, 28, '2025-08-28', 'TICKET-028-PHOT2025', 'registered', 'Registered'),
(29, 29, 29, '2025-09-20', 'TICKET-029-CYC2025', 'registered', 'Registered'),
(30, 30, 30, '2025-12-15', 'TICKET-030-NYG2025', 'registered', 'Registered');
GO

SELECT 'City' AS TableName, COUNT(*) AS RecordCount FROM City
UNION ALL
SELECT 'Organizer', COUNT(*) FROM Organizer
UNION ALL
SELECT 'Venue', COUNT(*) FROM Venue
UNION ALL
SELECT 'Participant', COUNT(*) FROM Participant
UNION ALL
SELECT 'Event', COUNT(*) FROM Event
UNION ALL
SELECT 'Registration', COUNT(*) FROM Registration;
GO

