USE amine_airbnb;

-- =========================================================
-- RESET ALL TABLES (safe for re-seeding)
-- =========================================================
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE referrals;
TRUNCATE TABLE social_profiles;
TRUNCATE TABLE host_verifications;
TRUNCATE TABLE complaints;
TRUNCATE TABLE messages;
TRUNCATE TABLE wishlist_items;
TRUNCATE TABLE wishlists;
TRUNCATE TABLE favorites;
TRUNCATE TABLE reviews;
TRUNCATE TABLE incomes;
TRUNCATE TABLE platform_commissions;
TRUNCATE TABLE payments;
TRUNCATE TABLE bookings;
TRUNCATE TABLE calendars;
TRUNCATE TABLE property_amenities;
TRUNCATE TABLE amenities;
TRUNCATE TABLE properties;
TRUNCATE TABLE guests;
TRUNCATE TABLE hosts;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================
-- 1) USERS (20 rows)
-- =========================================================
INSERT INTO users (id, name, email, password, phone, created_at) VALUES
(1,'Alice Johnson','alice@example.com','pwd123','+1-555-0001','2023-01-01 10:00:00'),
(2,'Bob Smith','bob@example.com','pwd123','+1-555-0002','2023-01-05 11:00:00'),
(3,'Charlie Brown','charlie@example.com','pwd123','+1-555-0003','2023-01-10 09:30:00'),
(4,'Diana Prince','diana@example.com','pwd123','+1-555-0004','2023-01-12 14:15:00'),
(5,'Ethan Clark','ethan@example.com','pwd123','+1-555-0005','2023-01-20 16:45:00'),
(6,'Fiona Davis','fiona@example.com','pwd123','+1-555-0006','2023-02-01 10:20:00'),
(7,'George Miller','george@example.com','pwd123','+1-555-0007','2023-02-05 18:00:00'),
(8,'Hannah Wilson','hannah@example.com','pwd123','+1-555-0008','2023-02-10 08:50:00'),
(9,'Ian Gupta','ian@example.com','pwd123','+91-90000-0009','2023-02-15 12:10:00'),
(10,'Julia Clark','julia@example.com','pwd123','+49-170-0010','2023-02-18 19:30:00'),
(11,'Kevin Lee','kevin@example.com','pwd123','+1-555-0011','2023-03-01 09:00:00'),
(12,'Laura Gomez','laura@example.com','pwd123','+34-600-0012','2023-03-05 13:25:00'),
(13,'Mark Novak','mark@example.com','pwd123','+44-700-0013','2023-03-10 15:40:00'),
(14,'Nina Rossi','nina@example.com','pwd123','+39-380-0014','2023-03-15 17:55:00'),
(15,'Oscar Diaz','oscar@example.com','pwd123','+34-600-0015','2023-03-20 11:10:00'),
(16,'Paula Schmidt','paula@example.com','pwd123','+49-170-0016','2023-03-25 20:05:00'),
(17,'Quinn Parker','quinn@example.com','pwd123','+1-555-0017','2023-04-01 07:45:00'),
(18,'Rhea Kapoor','rhea@example.com','pwd123','+91-90000-0018','2023-04-05 09:15:00'),
(19,'Sam Turner','sam@example.com','pwd123','+1-555-0019','2023-04-08 16:35:00'),
(20,'Tina Müller','tina@example.com','pwd123','+49-170-0020','2023-04-12 21:10:00');

-- =========================================================
-- 2) HOSTS (10 rows, users 1–10)
-- =========================================================
INSERT INTO hosts (id, user_id, host_since, overall_rating, is_superhost) VALUES
(1,1,'2020-01-01',4.80,1),
(2,2,'2020-03-15',4.50,0),
(3,3,'2021-06-10',4.60,1),
(4,4,'2019-11-20',4.90,1),
(5,5,'2022-02-05',4.30,0),
(6,6,'2021-01-25',4.70,1),
(7,7,'2020-08-18',4.40,0),
(8,8,'2022-03-30',4.55,0),
(9,9,'2021-09-01',4.65,1),
(10,10,'2019-05-12',4.75,1);

-- =========================================================
-- 3) GUESTS (20 rows, all users 1–20)
-- =========================================================
INSERT INTO guests (id, user_id, preferred_language, default_currency) VALUES
(1,1,'English','USD'),
(2,2,'English','USD'),
(3,3,'German','EUR'),
(4,4,'English','USD'),
(5,5,'French','EUR'),
(6,6,'English','USD'),
(7,7,'Spanish','EUR'),
(8,8,'English','USD'),
(9,9,'Hindi','INR'),
(10,10,'German','EUR'),
(11,11,'English','USD'),
(12,12,'Spanish','EUR'),
(13,13,'English','USD'),
(14,14,'Italian','EUR'),
(15,15,'English','USD'),
(16,16,'German','EUR'),
(17,17,'English','USD'),
(18,18,'Hindi','INR'),
(19,19,'English','USD'),
(20,20,'German','EUR');

-- =========================================================
-- 4) PROPERTIES (20 rows, host_id 1–10)
-- =========================================================
INSERT INTO properties (id, host_id, title, description, type, address, city, country, price_per_night, created_at) VALUES
(1,1,'Cozy Loft in Berlin','Modern loft near city center','apartment','Loftstrasse 10','Berlin','Germany',120.00,'2023-05-01 10:00:00'),
(2,1,'Studio near Alexanderplatz','Small studio ideal for solo travelers','studio','Alexstrasse 5','Berlin','Germany',80.00,'2023-05-03 11:00:00'),
(3,2,'Beach House LA','Spacious house near the beach','house','Ocean Drive 77','Los Angeles','USA',250.00,'2023-05-05 12:00:00'),
(4,2,'Downtown LA Apartment','City apartment with skyline view','apartment','Sunset Blvd 100','Los Angeles','USA',190.00,'2023-05-08 09:30:00'),
(5,3,'Paris Eiffel View','Apartment with Eiffel Tower view','apartment','Rue de Paris 15','Paris','France',220.00,'2023-05-10 14:20:00'),
(6,3,'Cozy Montmartre Studio','Artistic studio in Montmartre','studio','Rue des Arts 3','Paris','France',95.00,'2023-05-12 15:45:00'),
(7,4,'NYC Times Square Flat','Central flat near Times Square','apartment','7th Ave 21','New York','USA',260.00,'2023-05-15 16:30:00'),
(8,4,'Brooklyn Brownstone Room','Private room in brownstone','room','Brooklyn St 12','New York','USA',110.00,'2023-05-18 18:10:00'),
(9,5,'Tokyo Shibuya Apartment','Compact unit near Shibuya','apartment','Shibuya 1-2-3','Tokyo','Japan',130.00,'2023-05-20 19:00:00'),
(10,5,'Kyoto Traditional House','Traditional machiya house','house','Old Town 9','Kyoto','Japan',180.00,'2023-05-22 20:45:00'),
(11,6,'Goa Beach Hut','Beach hut near Anjuna','house','Beach Road 5','Goa','India',90.00,'2023-06-01 09:00:00'),
(12,6,'Mumbai City Apartment','Business apartment in Mumbai','apartment','Marine Drive 18','Mumbai','India',140.00,'2023-06-03 10:10:00'),
(13,7,'Barcelona City Loft','Loft in city center','apartment','La Rambla 33','Barcelona','Spain',150.00,'2023-06-05 11:20:00'),
(14,7,'Seaside Apartment Barcelona','Sea-facing apartment','apartment','Beach Line 9','Barcelona','Spain',170.00,'2023-06-07 12:30:00'),
(15,8,'Amsterdam Canal House','Historic canal-side house','house','Canalweg 7','Amsterdam','Netherlands',210.00,'2023-06-10 13:40:00'),
(16,8,'Rotterdam Modern Flat','Modern flat near station','apartment','Stationstraat 20','Rotterdam','Netherlands',130.00,'2023-06-12 14:50:00'),
(17,9,'Dubai Marina View','Luxury high-rise apartment','apartment','Marina Road 4','Dubai','UAE',300.00,'2023-06-15 15:00:00'),
(18,9,'Old Dubai Heritage Home','Authentic heritage home','house','Heritage Lane 2','Dubai','UAE',190.00,'2023-06-18 16:10:00'),
(19,10,'London Kensington Flat','Flat in Kensington','apartment','Kensington High St 8','London','UK',240.00,'2023-06-20 17:20:00'),
(20,10,'Manchester City Room','Budget room in Manchester','room','City Road 14','Manchester','UK',75.00,'2023-06-22 18:30:00');

-- =========================================================
-- 5) AMENITIES (20 rows)
-- =========================================================
INSERT INTO amenities (id, name) VALUES
(1,'WiFi'),
(2,'Heating'),
(3,'Air Conditioning'),
(4,'Kitchen'),
(5,'Washer'),
(6,'Dryer'),
(7,'Parking'),
(8,'Elevator'),
(9,'Pool'),
(10,'Gym'),
(11,'Pet Friendly'),
(12,'Breakfast Included'),
(13,'Work Desk'),
(14,'TV'),
(15,'Coffee Maker'),
(16,'Balcony'),
(17,'Sea View'),
(18,'Garden Access'),
(19,'Fireplace'),
(20,'24/7 Check-in');

-- =========================================================
-- 6) PROPERTY_AMENITIES (>=20 rows, unique pairs)
-- =========================================================
INSERT INTO property_amenities (id, property_id, amenity_id) VALUES
(1,1,1),
(2,1,4),
(3,1,14),
(4,2,1),
(5,2,3),
(6,3,1),
(7,3,7),
(8,3,9),
(9,4,1),
(10,4,13),
(11,5,1),
(12,5,16),
(13,6,1),
(14,6,4),
(15,7,1),
(16,7,10),
(17,8,1),
(18,8,11),
(19,9,1),
(20,9,3),
(21,10,1),
(22,10,12),
(23,11,1),
(24,11,17),
(25,12,1),
(26,12,13),
(27,13,1),
(28,13,10),
(29,14,1),
(30,14,9),
(31,15,1),
(32,15,18),
(33,16,1),
(34,16,4),
(35,17,1),
(36,17,10),
(37,18,1),
(38,18,19),
(39,19,1),
(40,19,7),
(41,20,1),
(42,20,2);

-- =========================================================
-- 7) CALENDARS (>=20 rows – 2 dates per first 10 properties)
-- =========================================================
INSERT INTO calendars (id, property_id, available_date, is_available) VALUES
(1,1,'2025-01-10',1),
(2,1,'2025-01-11',0),
(3,2,'2025-01-10',1),
(4,2,'2025-01-11',1),
(5,3,'2025-01-10',1),
(6,3,'2025-01-12',1),
(7,4,'2025-01-15',1),
(8,4,'2025-01-16',0),
(9,5,'2025-02-01',1),
(10,5,'2025-02-02',1),
(11,6,'2025-02-10',1),
(12,6,'2025-02-11',0),
(13,7,'2025-03-05',1),
(14,7,'2025-03-06',1),
(15,8,'2025-03-10',1),
(16,8,'2025-03-11',1),
(17,9,'2025-04-01',1),
(18,9,'2025-04-02',0),
(19,10,'2025-04-05',1),
(20,10,'2025-04-06',1),
(21,11,'2025-05-01',1),
(22,12,'2025-05-02',1),
(23,13,'2025-05-03',1),
(24,14,'2025-05-04',1);

-- =========================================================
-- 8) BOOKINGS (20 rows)
-- =========================================================
INSERT INTO bookings (id, guest_id, property_id, checkin_date, checkout_date, total_price, status, created_at) VALUES
(1,1,1,'2025-01-10','2025-01-12',240.00,'completed','2024-12-15 10:00:00'),
(2,2,3,'2025-02-01','2025-02-04',750.00,'completed','2024-12-20 09:30:00'),
(3,3,5,'2025-03-01','2025-03-05',880.00,'booked','2025-01-10 11:00:00'),
(4,4,2,'2025-01-15','2025-01-17',360.00,'cancelled','2024-12-18 15:20:00'),
(5,5,4,'2025-02-10','2025-02-14',760.00,'completed','2025-01-05 16:40:00'),
(6,6,6,'2025-02-20','2025-02-22',190.00,'completed','2025-01-15 09:15:00'),
(7,7,7,'2025-03-10','2025-03-13',780.00,'booked','2025-01-20 10:10:00'),
(8,8,8,'2025-03-15','2025-03-18',330.00,'completed','2025-01-22 11:05:00'),
(9,9,9,'2025-04-01','2025-04-03',260.00,'completed','2025-01-25 12:00:00'),
(10,10,10,'2025-04-05','2025-04-07',150.00,'cancelled','2025-01-28 13:00:00'),
(11,11,11,'2025-05-01','2025-05-04',270.00,'completed','2025-02-01 14:00:00'),
(12,12,12,'2025-05-02','2025-05-06',560.00,'completed','2025-02-03 15:00:00'),
(13,13,13,'2025-05-10','2025-05-14',600.00,'booked','2025-02-05 16:00:00'),
(14,14,14,'2025-06-01','2025-06-03',340.00,'completed','2025-02-07 17:00:00'),
(15,15,15,'2025-06-05','2025-06-09',840.00,'completed','2025-02-09 18:00:00'),
(16,16,16,'2025-06-10','2025-06-12',260.00,'completed','2025-02-11 19:00:00'),
(17,17,17,'2025-06-15','2025-06-18',900.00,'booked','2025-02-13 20:00:00'),
(18,18,18,'2025-07-01','2025-07-04',570.00,'completed','2025-02-15 21:00:00'),
(19,19,19,'2025-07-10','2025-07-13',720.00,'completed','2025-02-17 22:00:00'),
(20,20,20,'2025-07-15','2025-07-18',225.00,'completed','2025-02-19 23:00:00');


SELECT id FROM bookings ORDER BY id;

SELECT id FROM bookings ORDER BY id;

SELECT COUNT(*) FROM bookings;

INSERT INTO bookings (guest_id, property_id, checkin_date, checkout_date, total_price, status)
VALUES
(1,1,'2025-01-10','2025-01-12',240.00,'completed'),
(2,2,'2025-01-15','2025-01-18',450.00,'completed'),
(3,3,'2025-01-20','2025-01-22',300.00,'completed'),
(4,4,'2025-02-01','2025-02-05',800.00,'booked'),
(5,5,'2025-02-10','2025-02-12',220.00,'completed'),
(6,6,'2025-02-14','2025-02-18',760.00,'completed'),
(7,7,'2025-02-20','2025-02-23',360.00,'completed'),
(8,8,'2025-03-01','2025-03-04',540.00,'booked'),
(9,9,'2025-03-05','2025-03-07',280.00,'completed'),
(10,10,'2025-03-10','2025-03-14',760.00,'completed'),
(11,11,'2025-03-15','2025-03-19',880.00,'completed'),
(12,12,'2025-03-20','2025-03-24',330.00,'completed'),
(13,13,'2025-03-25','2025-03-28',260.00,'completed'),
(14,14,'2025-03-29','2025-04-01',450.00,'booked'),
(15,15,'2025-04-02','2025-04-06',900.00,'completed'),
(16,16,'2025-04-07','2025-04-10',570.00,'completed'),
(17,17,'2025-04-11','2025-04-14',720.00,'completed'),
(18,18,'2025-04-15','2025-04-17',225.00,'completed'),
(19,19,'2025-04-18','2025-04-21',310.00,'completed'),
(20,20,'2025-04-22','2025-04-25',660.00,'completed');


SELECT id FROM bookings ORDER BY id;

INSERT INTO payments (booking_id, amount, payment_method, paid_at)
SELECT id,
       total_price,
       IF(RAND()>0.5,'card','paypal'),
       DATE_ADD(checkout_date, INTERVAL 1 DAY)
FROM bookings;

SELECT * FROM payments;





-- =========================================================
-- 9) PAYMENTS (20 rows, one per booking)
-- =========================================================
INSERT INTO payments (booking_id, amount, payment_method, paid_at) VALUES
(1,240.00,'card','2024-12-16 10:00:00'),
(2,750.00,'paypal','2024-12-21 09:30:00'),
(3,880.00,'card','2025-01-11 11:00:00'),
(4,360.00,'card','2024-12-19 15:20:00'),
(5,760.00,'paypal','2025-01-06 16:40:00'),
(6,190.00,'card','2025-01-16 09:15:00'),
(7,780.00,'card','2025-01-21 10:10:00'),
(8,330.00,'paypal','2025-01-23 11:05:00'),
(9,260.00,'card','2025-01-26 12:00:00'),
(10,150.00,'card','2025-01-29 13:00:00'),
(11,270.00,'card','2025-02-02 14:00:00'),
(12,560.00,'paypal','2025-02-04 15:00:00'),
(13,600.00,'card','2025-02-06 16:00:00'),
(14,340.00,'card','2025-02-08 17:00:00'),
(15,840.00,'card','2025-02-10 18:00:00'),
(16,260.00,'paypal','2025-02-12 19:00:00'),
(17,900.00,'card','2025-02-14 20:00:00'),
(18,570.00,'paypal','2025-02-16 21:00:00'),
(19,720.00,'card','2025-02-18 22:00:00'),
(20,225.00,'card','2025-02-20 23:00:00');


-- =========================================================
-- 10) PLATFORM_COMMISSIONS (20 rows)
-- =========================================================
INSERT INTO platform_commissions (id, booking_id, guest_fee, host_fee) VALUES
(1,1,24.00,12.00),
(2,2,75.00,30.00),
(3,3,88.00,35.00),
(4,4,36.00,15.00),
(5,5,76.00,30.00),
(6,6,19.00,8.00),
(7,7,78.00,32.00),
(8,8,33.00,14.00),
(9,9,26.00,11.00),
(10,10,15.00,6.00),
(11,11,27.00,10.00),
(12,12,56.00,22.00),
(13,13,60.00,24.00),
(14,14,34.00,13.00),
(15,15,84.00,34.00),
(16,16,26.00,10.00),
(17,17,90.00,36.00),
(18,18,57.00,23.00),
(19,19,72.00,29.00),
(20,20,22.50,9.00);

-- =========================================================
-- 11) INCOMES (20 rows, host earnings)
-- =========================================================
INSERT INTO incomes (id, host_id, year, month, income) VALUES
(1,1,2024,'January',1200.00),
(2,1,2024,'February',900.00),
(3,2,2024,'January',850.00),
(4,2,2024,'March',920.00),
(5,3,2024,'April',1000.00),
(6,3,2024,'May',1100.00),
(7,4,2024,'January',1300.00),
(8,4,2024,'June',1400.00),
(9,5,2024,'February',700.00),
(10,5,2024,'March',750.00),
(11,6,2024,'April',800.00),
(12,6,2024,'May',820.00),
(13,7,2024,'June',780.00),
(14,7,2024,'July',790.00),
(15,8,2024,'August',910.00),
(16,8,2024,'September',930.00),
(17,9,2024,'October',950.00),
(18,9,2024,'November',970.00),
(19,10,2024,'December',1200.00),
(20,10,2023,'December',1150.00);

-- =========================================================
-- 12) REVIEWS (20 rows)
-- reviewer_id → guests.id, reviewed_id → hosts.id, property_id → properties.id
-- =========================================================
INSERT INTO reviews (id, reviewer_id, reviewed_id, property_id, rating, comment, created_at) VALUES
(1,1,1,1,5,'Amazing loft, very clean.','2025-01-13 10:00:00'),
(2,2,2,3,4,'Nice beach house, a bit noisy.','2025-02-05 11:00:00'),
(3,3,3,5,5,'Beautiful view of Eiffel Tower.','2025-03-06 12:00:00'),
(4,4,1,2,4,'Good location, small bathroom.','2025-01-18 09:30:00'),
(5,5,4,7,5,'Excellent host and flat.','2025-02-15 14:20:00'),
(6,6,5,9,4,'Compact but convenient stay.','2025-03-01 15:45:00'),
(7,7,6,11,5,'Loved the beach hut!','2025-03-10 16:30:00'),
(8,8,7,13,4,'Great loft, good for work.','2025-03-20 18:10:00'),
(9,9,8,15,5,'Beautiful canal house.','2025-04-03 19:00:00'),
(10,10,9,17,5,'Luxury stay with marina view.','2025-04-07 20:45:00'),
(11,11,10,19,4,'Nice Kensington flat.','2025-05-03 09:00:00'),
(12,12,2,4,4,'Enjoyed the skyline view.','2025-05-05 10:10:00'),
(13,13,3,6,5,'Artistic and cozy studio.','2025-05-08 11:20:00'),
(14,14,4,8,3,'Room was okay, bit small.','2025-05-10 12:30:00'),
(15,15,5,10,5,'Traditional house was amazing.','2025-05-12 13:40:00'),
(16,16,6,12,4,'Good business apartment.','2025-05-14 14:50:00'),
(17,17,7,14,4,'Nice seaside apartment.','2025-05-16 15:00:00'),
(18,18,8,16,4,'Modern and clean flat.','2025-05-18 16:10:00'),
(19,19,9,18,5,'Loved the heritage home.','2025-05-20 17:20:00'),
(20,20,10,20,3,'Budget room, good for price.','2025-05-22 18:30:00');

-- =========================================================
-- 13) FAVORITES (20 rows, unique guest–property pairs)
-- =========================================================
INSERT INTO favorites (id, guest_id, property_id, favorited_at) VALUES
(1,1,1,'2025-01-01 10:00:00'),
(2,1,3,'2025-01-02 10:00:00'),
(3,2,5,'2025-01-03 10:00:00'),
(4,2,7,'2025-01-04 10:00:00'),
(5,3,9,'2025-01-05 10:00:00'),
(6,3,11,'2025-01-06 10:00:00'),
(7,4,13,'2025-01-07 10:00:00'),
(8,4,15,'2025-01-08 10:00:00'),
(9,5,17,'2025-01-09 10:00:00'),
(10,5,19,'2025-01-10 10:00:00'),
(11,6,2,'2025-01-11 10:00:00'),
(12,7,4,'2025-01-12 10:00:00'),
(13,8,6,'2025-01-13 10:00:00'),
(14,9,8,'2025-01-14 10:00:00'),
(15,10,10,'2025-01-15 10:00:00'),
(16,11,12,'2025-01-16 10:00:00'),
(17,12,14,'2025-01-17 10:00:00'),
(18,13,16,'2025-01-18 10:00:00'),
(19,14,18,'2025-01-19 10:00:00'),
(20,15,20,'2025-01-20 10:00:00');

-- =========================================================
-- 14) WISHLISTS (20 rows)
-- =========================================================
INSERT INTO wishlists (id, guest_id, name, created_at) VALUES
(1,1,'Berlin Business Trips','2025-01-01 09:00:00'),
(2,2,'US Beach Holidays','2025-01-02 09:00:00'),
(3,3,'Romantic Europe','2025-01-03 09:00:00'),
(4,4,'City Breaks','2025-01-04 09:00:00'),
(5,5,'Asia Adventures','2025-01-05 09:00:00'),
(6,6,'Weekend Getaways','2025-01-06 09:00:00'),
(7,7,'Family Trips','2025-01-07 09:00:00'),
(8,8,'Luxury Stays','2025-01-08 09:00:00'),
(9,9,'Budget Trips','2025-01-09 09:00:00'),
(10,10,'Work & Travel','2025-01-10 09:00:00'),
(11,11,'Summer Plans','2025-01-11 09:00:00'),
(12,12,'Winter Escapes','2025-01-12 09:00:00'),
(13,13,'City Explorations','2025-01-13 09:00:00'),
(14,14,'Island Vacations','2025-01-14 09:00:00'),
(15,15,'Cultural Trips','2025-01-15 09:00:00'),
(16,16,'Conference Stays','2025-01-16 09:00:00'),
(17,17,'Friends Trips','2025-01-17 09:00:00'),
(18,18,'Backpacking List','2025-01-18 09:00:00'),
(19,19,'European Tour','2025-01-19 09:00:00'),
(20,20,'World Tour','2025-01-20 09:00:00');

-- =========================================================
-- 15) WISHLIST_ITEMS (20 rows, unique per wishlist)
-- =========================================================
INSERT INTO wishlist_items (id, wishlist_id, property_id) VALUES
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,4),
(5,3,5),
(6,3,6),
(7,4,7),
(8,4,8),
(9,5,9),
(10,5,10),
(11,6,11),
(12,6,12),
(13,7,13),
(14,7,14),
(15,8,15),
(16,8,16),
(17,9,17),
(18,9,18),
(19,10,19),
(20,10,20);

-- =========================================================
-- 16) MESSAGES (20 rows, users ↔ users)
-- =========================================================
INSERT INTO messages (id, sender_id, receiver_id, message, sent_at) VALUES
(1,2,1,'Hi, is your Berlin loft available in March?','2025-01-01 10:00:00'),
(2,1,2,'Yes, those dates are free.','2025-01-01 10:05:00'),
(3,4,3,'Can I check in early?','2025-01-02 11:00:00'),
(4,3,4,'Early check-in is possible after 12.','2025-01-02 11:10:00'),
(5,6,5,'Is there parking available?','2025-01-03 09:30:00'),
(6,5,6,'Yes, free parking is included.','2025-01-03 09:40:00'),
(7,8,7,'Does the loft have good WiFi?','2025-01-04 08:20:00'),
(8,7,8,'Yes, 200 Mbps fibre connection.','2025-01-04 08:25:00'),
(9,10,9,'Do you allow pets?','2025-01-05 12:00:00'),
(10,9,10,'Small pets are allowed.','2025-01-05 12:10:00'),
(11,12,11,'Can I store luggage after checkout?','2025-01-06 13:00:00'),
(12,11,12,'Yes, for 3 hours.','2025-01-06 13:05:00'),
(13,14,13,'Is breakfast included?','2025-01-07 07:50:00'),
(14,13,14,'Light breakfast is included.','2025-01-07 08:00:00'),
(15,16,15,'Is public transport nearby?','2025-01-08 14:20:00'),
(16,15,16,'Metro station is 5 min walk.','2025-01-08 14:30:00'),
(17,18,17,'Can you provide an invoice?','2025-01-09 10:10:00'),
(18,17,18,'Yes, we will send it by email.','2025-01-09 10:20:00'),
(19,20,19,'Is late checkout possible?','2025-01-10 16:00:00'),
(20,19,20,'Late checkout until 1 PM is okay.','2025-01-10 16:10:00');

-- =========================================================
-- 17) COMPLAINTS (20 rows)
-- =========================================================
INSERT INTO complaints (id, booking_id, user_id, complaint_text, resolved) VALUES
(1,4,4,'Booking was cancelled by host late.',0),
(2,10,10,'Room was smaller than expected.',1),
(3,1,1,'Heating did not work on first night.',1),
(4,2,2,'Noise from street at night.',0),
(5,3,3,'WiFi speed was slower than listed.',1),
(6,5,5,'Check-in instructions were unclear.',1),
(7,6,6,'Water pressure was low.',0),
(8,7,7,'Host arrived late for key handover.',1),
(9,8,8,'TV remote was missing.',1),
(10,9,9,'Some kitchen utensils were missing.',0),
(11,11,11,'Bed was uncomfortable.',1),
(12,12,12,'Shower did not drain well.',0),
(13,13,13,'Smell of smoke in apartment.',1),
(14,14,14,'Construction noise nearby.',0),
(15,15,15,'Listing photos slightly outdated.',1),
(16,16,16,'Noisy neighbours.',0),
(17,17,17,'Poor mobile network coverage.',0),
(18,18,18,'Host replied slowly to messages.',1),
(19,19,19,'Difficulty with smart lock.',1),
(20,20,20,'Check-in code initially incorrect.',1);

-- =========================================================
-- 18) HOST_VERIFICATIONS (20 rows)
-- =========================================================
INSERT INTO host_verifications (id, host_id, id_document_url, verified, verified_at) VALUES
(1,1,'/ids/host1_passport.png',1,'2022-01-01 10:00:00'),
(2,2,'/ids/host2_idcard.png',1,'2022-02-01 11:00:00'),
(3,3,'/ids/host3_passport.png',1,'2022-03-01 12:00:00'),
(4,4,'/ids/host4_idcard.png',1,'2022-04-01 13:00:00'),
(5,5,'/ids/host5_passport.png',0,NULL),
(6,6,'/ids/host6_idcard.png',1,'2022-06-01 14:00:00'),
(7,7,'/ids/host7_passport.png',0,NULL),
(8,8,'/ids/host8_idcard.png',1,'2022-08-01 15:00:00'),
(9,9,'/ids/host9_passport.png',1,'2022-09-01 16:00:00'),
(10,10,'/ids/host10_idcard.png',1,'2022-10-01 17:00:00'),
(11,1,'/ids/host1_address.png',1,'2022-01-10 10:00:00'),
(12,2,'/ids/host2_address.png',1,'2022-02-10 11:00:00'),
(13,3,'/ids/host3_address.png',1,'2022-03-10 12:00:00'),
(14,4,'/ids/host4_address.png',1,'2022-04-10 13:00:00'),
(15,5,'/ids/host5_address.png',0,NULL),
(16,6,'/ids/host6_address.png',1,'2022-06-10 14:00:00'),
(17,7,'/ids/host7_address.png',0,NULL),
(18,8,'/ids/host8_address.png',1,'2022-08-10 15:00:00'),
(19,9,'/ids/host9_address.png',1,'2022-09-10 16:00:00'),
(20,10,'/ids/host10_address.png',1,'2022-10-10 17:00:00');

-- =========================================================
-- 19) SOCIAL_PROFILES (20 rows)
-- =========================================================
INSERT INTO social_profiles (id, user_id, platform, profile_url) VALUES
(1,1,'facebook','https://facebook.com/alice'),
(2,2,'google','https://accounts.google.com/bob'),
(3,3,'linkedin','https://linkedin.com/in/charlie'),
(4,4,'facebook','https://facebook.com/diana'),
(5,5,'instagram','https://instagram.com/ethan'),
(6,6,'facebook','https://facebook.com/fiona'),
(7,7,'linkedin','https://linkedin.com/in/george'),
(8,8,'instagram','https://instagram.com/hannah'),
(9,9,'facebook','https://facebook.com/ian'),
(10,10,'linkedin','https://linkedin.com/in/julia'),
(11,11,'google','https://accounts.google.com/kevin'),
(12,12,'facebook','https://facebook.com/laura'),
(13,13,'instagram','https://instagram.com/mark'),
(14,14,'linkedin','https://linkedin.com/in/nina'),
(15,15,'facebook','https://facebook.com/oscar'),
(16,16,'google','https://accounts.google.com/paula'),
(17,17,'instagram','https://instagram.com/quinn'),
(18,18,'facebook','https://facebook.com/rhea'),
(19,19,'linkedin','https://linkedin.com/in/sam'),
(20,20,'instagram','https://instagram.com/tina');

-- =========================================================
-- 20) REFERRALS (20 rows)
-- =========================================================
INSERT INTO referrals (id, referrer_id, referred_email, referral_code, joined) VALUES
(1,1,'friend1@example.com','REF-ALICE-001',1),
(2,2,'friend2@example.com','REF-BOB-002',0),
(3,3,'friend3@example.com','REF-CHARLIE-003',1),
(4,4,'friend4@example.com','REF-DIANA-004',0),
(5,5,'friend5@example.com','REF-ETHAN-005',1),
(6,6,'friend6@example.com','REF-FIONA-006',0),
(7,7,'friend7@example.com','REF-GEORGE-007',1),
(8,8,'friend8@example.com','REF-HANNAH-008',0),
(9,9,'friend9@example.com','REF-IAN-009',1),
(10,10,'friend10@example.com','REF-JULIA-010',0),
(11,11,'friend11@example.com','REF-KEVIN-011',1),
(12,12,'friend12@example.com','REF-LAURA-012',0),
(13,13,'friend13@example.com','REF-MARK-013',1),
(14,14,'friend14@example.com','REF-NINA-014',0),
(15,15,'friend15@example.com','REF-OSCAR-015',1),
(16,16,'friend16@example.com','REF-PAULA-016',0),
(17,17,'friend17@example.com','REF-QUINN-017',1),
(18,18,'friend18@example.com','REF-RHEA-018',0),
(19,19,'friend19@example.com','REF-SAM-019',1),
(20,20,'friend20@example.com','REF-TINA-020',0);
