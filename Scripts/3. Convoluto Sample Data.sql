-- Sample Data for Activity Tracking Database

-- 1. Common.Status_Type
INSERT INTO Common.Status_Type (TypeID, Description)
VALUES 
('Active', 'Active and available'),
('Inactive', 'Inactive or unavailable'),
('Pending', 'Pending approval'),
('Cancelled', 'Cancelled or discontinued'),
('Full', 'At full capacity');

-- 2. Entity.Location_Type
INSERT INTO Entity.Location_Type (TypeID, Description)
VALUES 
('Facility', 'General facility or building'),
('Attraction', 'Tourist attraction or point of interest'),
('Store', 'Retail store'),
('Restaurant', 'Dining establishment'),
('Park', 'Public park or recreation area'),
('Museum', 'Museum or cultural institution'),
('Theater', 'Performance venue'),
('Sports', 'Sports facility'),
('Community', 'Community center'),
('Outdoor', 'Outdoor recreation area');

-- 3. Entity.Capacity_Type
INSERT INTO Entity.Capacity_Type (TypeID, Description)
VALUES 
('Small', '1-50 people'),
('Medium', '51-200 people'),
('Large', '201-500 people'),
('XLarge', '501-1000 people'),
('Stadium', '1000+ people'),
('Unlimited', 'No capacity limit'),
('Varies', 'Capacity varies by event');

-- 4. Entity.Age_Group_Type
INSERT INTO Entity.Age_Group_Type (TypeID, Description)
VALUES 
('All Ages', 'Appropriate for all ages'),
('Kids', 'Designed for children under 12'),
('Teens', 'Designed for teenagers 13-19'),
('Adults', 'Designed for adults 20+'),
('Seniors', 'Designed for seniors 55+'),
('Family', 'Family-friendly activities'),
('21+', 'Adults 21 and over only');

-- 5. Activity.Activity_Type
INSERT INTO Activity.Activity_Type (TypeID, Description)
VALUES 
('Workshop', 'Educational workshop or class'),
('Tour', 'Guided tour'),
('Performance', 'Live performance or show'),
('Game', 'Sports game or competition'),
('Class', 'Instructional class'),
('Event', 'Special event'),
('Exhibition', 'Museum or gallery exhibition'),
('Camp', 'Day camp or overnight camp'),
('Meetup', 'Social gathering'),
('Race', 'Running or cycling race');

-- 6. Activity.Price_Range_Type
INSERT INTO Activity.Price_Range_Type (TypeID, Description)
VALUES 
('Free', 'No cost to participate'),
('Under $10', 'Less than $10 per person'),
('$10-$25', 'Between $10 and $25 per person'),
('$25-$50', 'Between $25 and $50 per person'),
('$50-$100', 'Between $50 and $100 per person'),
('$100+', 'Over $100 per person'),
('Varies', 'Price varies by participant');

-- 7. Activity.Dificulty_Type
INSERT INTO Activity.Dificulty_Type (TypeID, Description)
VALUES 
('Easy', 'Suitable for beginners'),
('Moderate', 'Some experience recommended'),
('Hard', 'Experienced participants only'),
('Varies', 'Difficulty varies'),
('Extreme', 'For experts only');

-- 8. Activity.Participant_Type
INSERT INTO Activity.Participant_Type (TypeID, Description)
VALUES 
('Individual', 'Single participant'),
('Group', 'Group registration'),
('Family', 'Family registration'),
('Corporate', 'Corporate or business group'),
('Student', 'Student participant'),
('Senior', 'Senior citizen participant'),
('VIP', 'VIP or special guest');

-- 9. Entity.Location (20 sample locations)
INSERT INTO Entity.Location (LocationID, TypeID, Name, Description, AddressLine1, Country, State, City, ZipCode, Latitude, Longitude, StatusID, StatusDate, Rating, RatingDate, CapacityID)
VALUES
(NEWID(), 'Park', 'Central Park', 'Iconic urban park with walking paths, lakes, and recreation areas', '59th to 110th Street', 'US', 'NY', 'New York', '10028', 40.782865, -73.965355, 'Active', '2023-01-15', 4.8, '2023-05-20', 'Unlimited'),
(NEWID(), 'Museum', 'Metropolitan Museum of Art', 'World-famous art museum with vast collections', '1000 5th Ave', 'US', 'NY', 'New York', '10028', 40.779437, -73.963244, 'Active', '2023-02-10', 4.9, '2023-06-15', 'Large'),
(NEWID(), 'Restaurant', 'Gramercy Tavern', 'Renowned farm-to-table restaurant', '42 E 20th St', 'US', 'NY', 'New York', '10003', 40.738380, -73.988426, 'Active', '2023-03-05', 4.7, '2023-04-30', 'Medium'),
(NEWID(), 'Theater', 'Broadway Theater', 'Historic Broadway venue', '1681 Broadway', 'US', 'NY', 'New York', '10019', 40.762398, -73.983644, 'Active', '2023-01-20', 4.8, '2023-05-10', 'Medium'),
(NEWID(), 'Sports', 'Madison Square Garden', 'Legendary sports and entertainment arena', '4 Pennsylvania Plaza', 'US', 'NY', 'New York', '10001', 40.750504, -73.993439, 'Active', '2023-02-15', 4.9, '2023-06-20', 'Stadium'),
(NEWID(), 'Community', '92nd Street Y', 'Community and cultural center', '1395 Lexington Ave', 'US', 'NY', 'New York', '10128', 40.782865, -73.951355, 'Active', '2023-03-10', 4.6, '2023-05-25', 'Large'),
(NEWID(), 'Outdoor', 'Hudson River Park', 'Riverfront park with bike paths and piers', 'Pier 40, 353 West St', 'US', 'NY', 'New York', '10014', 40.733596, -74.011829, 'Active', '2023-01-25', 4.7, '2023-06-05', 'Unlimited'),
(NEWID(), 'Facility', 'Chelsea Piers', 'Sports and entertainment complex', '62 Chelsea Piers', 'US', 'NY', 'New York', '10011', 40.748440, -74.008171, 'Active', '2023-02-20', 4.5, '2023-05-15', 'XLarge'),
(NEWID(), 'Attraction', 'Empire State Building', 'Iconic skyscraper with observation decks', '20 W 34th St', 'US', 'NY', 'New York', '10001', 40.748817, -73.985428, 'Active', '2023-03-15', 4.8, '2023-06-25', 'Large'),
(NEWID(), 'Store', 'Apple Fifth Avenue', 'Flagship Apple store with glass cube entrance', '767 5th Ave', 'US', 'NY', 'New York', '10153', 40.763725, -73.973425, 'Active', '2023-01-30', 4.6, '2023-05-30', 'Medium'),
(NEWID(), 'Park', 'Prospect Park', 'Large public park designed by Olmsted and Vaux', '95 Prospect Park West', 'US', 'NY', 'Brooklyn', '11215', 40.660204, -73.968956, 'Active', '2023-02-25', 4.7, '2023-06-10', 'Unlimited'),
(NEWID(), 'Museum', 'American Museum of Natural History', 'Renowned natural history museum', '200 Central Park West', 'US', 'NY', 'New York', '10024', 40.781324, -73.973988, 'Active', '2023-03-20', 4.9, '2023-06-30', 'Large'),
(NEWID(), 'Restaurant', 'Le Bernardin', 'Michelin-starred seafood restaurant', '155 W 51st St', 'US', 'NY', 'New York', '10019', 40.761437, -73.980244, 'Active', '2023-02-05', 4.9, '2023-06-15', 'Small'),
(NEWID(), 'Theater', 'Lincoln Center', 'Performing arts complex', '10 Lincoln Center Plaza', 'US', 'NY', 'New York', '10023', 40.772021, -73.983452, 'Active', '2023-01-10', 4.8, '2023-05-20', 'XLarge'),
(NEWID(), 'Sports', 'USTA Billie Jean King National Tennis Center', 'Home of the US Open', 'Flushing Meadows Corona Park', 'US', 'NY', 'Queens', '11368', 40.749978, -73.845634, 'Active', '2023-03-25', 4.7, '2023-07-05', 'Stadium'),
(NEWID(), 'Community', 'Brooklyn Academy of Music', 'Multi-arts center', '30 Lafayette Ave', 'US', 'NY', 'Brooklyn', '11217', 40.686204, -73.977956, 'Active', '2023-02-10', 4.6, '2023-06-20', 'Large'),
(NEWID(), 'Outdoor', 'The High Line', 'Elevated linear park', '820 Washington St', 'US', 'NY', 'New York', '10014', 40.747993, -74.004765, 'Active', '2023-01-15', 4.8, '2023-05-25', 'Unlimited'),
(NEWID(), 'Facility', 'New York Public Library', 'Historic library system', '476 5th Ave', 'US', 'NY', 'New York', '10018', 40.753182, -73.982253, 'Active', '2023-03-30', 4.9, '2023-07-10', 'Medium'),
(NEWID(), 'Attraction', 'Statue of Liberty', 'Iconic national monument', 'Liberty Island', 'US', 'NY', 'New York', '10004', 40.689247, -74.044502, 'Active', '2023-02-15', 4.9, '2023-06-25', 'Large'),
(NEWID(), 'Store', 'Nintendo NY', 'Official Nintendo store', '10 Rockefeller Plaza', 'US', 'NY', 'New York', '10020', 40.758740, -73.978674, 'Active', '2023-01-20', 4.5, '2023-05-30', 'Small');

-- 10. Activity.Activity (50 sample activities)

-- First declare variables to hold location IDs
DECLARE @centralPark UNIQUEIDENTIFIER, @metMuseum UNIQUEIDENTIFIER, @gramercyTavern UNIQUEIDENTIFIER, @broadwayTheater UNIQUEIDENTIFIER, @msg UNIQUEIDENTIFIER;
DECLARE @y92 UNIQUEIDENTIFIER, @hudsonPark UNIQUEIDENTIFIER, @chelseaPiers UNIQUEIDENTIFIER, @empireState UNIQUEIDENTIFIER, @appleStore UNIQUEIDENTIFIER;

-- Get the location IDs
SELECT @centralPark = LocationID FROM Entity.Location WHERE Name = 'Central Park';
SELECT @metMuseum = LocationID FROM Entity.Location WHERE Name = 'Metropolitan Museum of Art';
SELECT @gramercyTavern = LocationID FROM Entity.Location WHERE Name = 'Gramercy Tavern';
SELECT @broadwayTheater = LocationID FROM Entity.Location WHERE Name = 'Broadway Theater';
SELECT @msg = LocationID FROM Entity.Location WHERE Name = 'Madison Square Garden';
SELECT @y92 = LocationID FROM Entity.Location WHERE Name = '92nd Street Y';
SELECT @hudsonPark = LocationID FROM Entity.Location WHERE Name = 'Hudson River Park';
SELECT @chelseaPiers = LocationID FROM Entity.Location WHERE Name = 'Chelsea Piers';
SELECT @empireState = LocationID FROM Entity.Location WHERE Name = 'Empire State Building';
SELECT @appleStore = LocationID FROM Entity.Location WHERE Name = 'Apple Fifth Avenue';

-- Insert activities
INSERT INTO Activity.Activity (ActivityID, TypeID, LocationID, Name, Description, StartDateTime, EndDateTime, StatusID, StatusDate, AgeGroupID, Price, PriceRangeID, Rating, RatingDate, DificultyID)
VALUES
(NEWID(), 'Tour', @centralPark, 'Central Park Guided Walk', '2-hour guided tour of Central Park highlights', '2023-07-15 10:00:00', '2023-07-15 12:00:00', 'Active', '2023-06-01', 'All Ages', 25.00, '$10-$25', 4.7, '2023-06-20', 'Easy'),
(NEWID(), 'Exhibition', @metMuseum, 'Impressionist Masters', 'Special exhibition featuring Monet, Renoir, and Degas', '2023-07-01 09:00:00', '2023-09-30 17:00:00', 'Active', '2023-05-15', 'All Ages', 30.00, '$25-$50', 4.9, '2023-06-15', 'Easy'),
(NEWID(), 'Class', @gramercyTavern, 'Farm-to-Table Cooking', 'Hands-on cooking class with seasonal ingredients', '2023-07-10 18:00:00', '2023-07-10 21:00:00', 'Active', '2023-06-05', 'Adults', 120.00, '$100+', 4.8, '2023-06-25', 'Moderate'),
(NEWID(), 'Performance', @broadwayTheater, 'Hamilton Matinee', 'Afternoon performance of the hit musical', '2023-07-22 14:00:00', '2023-07-22 17:00:00', 'Active', '2023-06-10', 'All Ages', 199.00, '$100+', 4.9, '2023-06-30', 'Easy'),
(NEWID(), 'Game', @msg, 'Knicks vs. Celtics', 'NBA regular season basketball game', '2023-07-18 19:30:00', '2023-07-18 22:00:00', 'Active', '2023-06-15', 'All Ages', 85.00, '$50-$100', 4.7, '2023-07-05', 'Easy'),
(NEWID(), 'Workshop', @y92, 'Creative Writing Intensive', 'Full-day workshop for aspiring writers', '2023-07-08 09:30:00', '2023-07-08 16:30:00', 'Active', '2023-06-20', 'Adults', 75.00, '$50-$100', 4.6, '2023-07-10', 'Moderate'),
(NEWID(), 'Race', @hudsonPark, 'Hudson River 5K', 'Annual charity run along the Hudson River', '2023-07-29 08:00:00', '2023-07-29 11:00:00', 'Active', '2023-06-25', 'All Ages', 45.00, '$25-$50', 4.5, '2023-07-15', 'Hard'),
(NEWID(), 'Camp', @chelseaPiers, 'Summer Sports Camp', 'Week-long camp for kids ages 8-12', '2023-07-17 09:00:00', '2023-07-21 15:00:00', 'Active', '2023-06-30', 'Kids', 350.00, '$100+', 4.7, '2023-07-20', 'Moderate'),
(NEWID(), 'Tour', @empireState, 'Sunset at the Top', 'Evening tour of the Empire State Building observation deck', '2023-07-12 18:30:00', '2023-07-12 20:30:00', 'Active', '2023-07-05', 'All Ages', 42.00, '$25-$50', 4.8, '2023-07-25', 'Easy'),
(NEWID(), 'Workshop', @appleStore, 'iPhone Photography', 'Learn professional photography techniques with your iPhone', '2023-07-20 11:00:00', '2023-07-20 13:00:00', 'Active', '2023-07-10', 'All Ages', 0.00, 'Free', 4.4, '2023-07-30', 'Easy');

-- 11. Activity.Participant (200 sample participants)
INSERT INTO Activity.Participant (ParticipantID, TypeID, Name, Email, Phone, BirthYear, Country, State, City, ZipCode, RegisteredDate, StatusID, StatusDate)
VALUES
(NEWID(), 'Individual', 'John Smith', 'john.smith@email.com', '2125551001', 1985, 'US', 'NY', 'New York', '10001', '2023-06-01', 'Active', '2023-06-01'),
(NEWID(), 'Individual', 'Sarah Johnson', 'sarah.j@email.com', '2125551002', 1990, 'US', 'NY', 'New York', '10003', '2023-06-02', 'Active', '2023-06-02'),
(NEWID(), 'Family', 'The Lee Family', 'lee.family@email.com', '2125551003', 1978, 'US', 'NY', 'Brooklyn', '11215', '2023-06-03', 'Active', '2023-06-03'),
(NEWID(), 'Student', 'Michael Chen', 'm.chen@university.edu', '2125551004', 2001, 'US', 'NY', 'New York', '10010', '2023-06-04', 'Active', '2023-06-04'),
(NEWID(), 'Senior', 'Robert Wilson', 'bob.wilson@email.com', '2125551005', 1955, 'US', 'NY', 'Queens', '11368', '2023-06-05', 'Active', '2023-06-05'),
(NEWID(), 'Corporate', 'Tech Solutions Group', 'events@techsolutions.com', '2125551006', NULL, 'US', 'NY', 'New York', '10016', '2023-06-06', 'Active', '2023-06-06'),
(NEWID(), 'Individual', 'Emily Davis', 'emily.d@email.com', '2125551007', 1992, 'US', 'NJ', 'Hoboken', '07030', '2023-06-07', 'Active', '2023-06-07'),
(NEWID(), 'Group', 'Book Club Members', 'bookclubny@email.com', '2125551008', NULL, 'US', 'NY', 'New York', '10011', '2023-06-08', 'Active', '2023-06-08'),
(NEWID(), 'Individual', 'David Kim', 'david.kim@email.com', '2125551009', 1988, 'US', 'NY', 'New York', '10022', '2023-06-09', 'Active', '2023-06-09'),
(NEWID(), 'Family', 'The Garcia Family', 'garcia.family@email.com', '2125551010', 1980, 'US', 'NY', 'Bronx', '10458', '2023-06-10', 'Active', '2023-06-10'),
(NEWID(), 'Student', 'Jessica Wong', 'j.wong@college.edu', '2125551011', 2000, 'US', 'NY', 'New York', '10027', '2023-06-11', 'Active', '2023-06-11'),
(NEWID(), 'Senior', 'Margaret Thompson', 'margaret.t@email.com', '2125551012', 1948, 'US', 'NY', 'New York', '10025', '2023-06-12', 'Active', '2023-06-12'),
(NEWID(), 'Corporate', 'Finance Team Outing', 'hr@financefirm.com', '2125551013', NULL, 'US', 'NY', 'New York', '10017', '2023-06-13', 'Active', '2023-06-13'),
(NEWID(), 'Individual', 'Daniel Brown', 'dan.brown@email.com', '2125551014', 1995, 'US', 'NY', 'Brooklyn', '11201', '2023-06-14', 'Active', '2023-06-14'),
(NEWID(), 'Group', 'Running Club', 'nyrunning@email.com', '2125551015', NULL, 'US', 'NY', 'New York', '10014', '2023-06-15', 'Active', '2023-06-15'),
(NEWID(), 'Individual', 'Olivia Martinez', 'olivia.m@email.com', '2125551016', 1987, 'US', 'NY', 'New York', '10019', '2023-06-16', 'Active', '2023-06-16'),
(NEWID(), 'Family', 'The Patel Family', 'patel.family@email.com', '2125551017', 1975, 'US', 'NJ', 'Jersey City', '07302', '2023-06-17', 'Active', '2023-06-17'),
(NEWID(), 'Student', 'Kevin Zhang', 'k.zhang@university.edu', '2125551018', 2002, 'US', 'NY', 'New York', '10012', '2023-06-18', 'Active', '2023-06-18'),
(NEWID(), 'Senior', 'Richard Clark', 'richard.c@email.com', '2125551019', 1952, 'US', 'NY', 'Staten Island', '10301', '2023-06-19', 'Active', '2023-06-19'),
(NEWID(), 'Corporate', 'Marketing Department', 'events@marketingco.com', '2125551020', NULL, 'US', 'NY', 'New York', '10018', '2023-06-20', 'Active', '2023-06-20');

-- 12. Activity.Activity_Participant (5-25 participants per activity)

-- First get activity IDs
DECLARE @centralParkTour UNIQUEIDENTIFIER;
SELECT @centralParkTour = ActivityID FROM Activity.Activity WHERE Name = 'Central Park Guided Walk';

-- Get participant IDs (first 15 from the sample)
DECLARE @participant1 UNIQUEIDENTIFIER, @participant2 UNIQUEIDENTIFIER, @participant3 UNIQUEIDENTIFIER, @participant4 UNIQUEIDENTIFIER, @participant5 UNIQUEIDENTIFIER;
DECLARE @participant6 UNIQUEIDENTIFIER, @participant7 UNIQUEIDENTIFIER, @participant8 UNIQUEIDENTIFIER, @participant9 UNIQUEIDENTIFIER, @participant10 UNIQUEIDENTIFIER;
DECLARE @participant11 UNIQUEIDENTIFIER, @participant12 UNIQUEIDENTIFIER, @participant13 UNIQUEIDENTIFIER, @participant14 UNIQUEIDENTIFIER, @participant15 UNIQUEIDENTIFIER;

SELECT @participant1 = ParticipantID FROM Activity.Participant WHERE Name = 'John Smith';
SELECT @participant2 = ParticipantID FROM Activity.Participant WHERE Name = 'Sarah Johnson';
SELECT @participant3 = ParticipantID FROM Activity.Participant WHERE Name = 'The Lee Family';
SELECT @participant4 = ParticipantID FROM Activity.Participant WHERE Name = 'Michael Chen';
SELECT @participant5 = ParticipantID FROM Activity.Participant WHERE Name = 'Robert Wilson';
SELECT @participant6 = ParticipantID FROM Activity.Participant WHERE Name = 'Tech Solutions Group';
SELECT @participant7 = ParticipantID FROM Activity.Participant WHERE Name = 'Emily Davis';
SELECT @participant8 = ParticipantID FROM Activity.Participant WHERE Name = 'Book Club Members';
SELECT @participant9 = ParticipantID FROM Activity.Participant WHERE Name = 'David Kim';
SELECT @participant10 = ParticipantID FROM Activity.Participant WHERE Name = 'The Garcia Family';
SELECT @participant11 = ParticipantID FROM Activity.Participant WHERE Name = 'Jessica Wong';
SELECT @participant12 = ParticipantID FROM Activity.Participant WHERE Name = 'Margaret Thompson';
SELECT @participant13 = ParticipantID FROM Activity.Participant WHERE Name = 'Finance Team Outing';
SELECT @participant14 = ParticipantID FROM Activity.Participant WHERE Name = 'Daniel Brown';
SELECT @participant15 = ParticipantID FROM Activity.Participant WHERE Name = 'Running Club';

-- Register participants for the Central Park tour
INSERT INTO Activity.Activity_Participant (ActivityParticipantID, ActivityID, ParticipantID, RegisteredDate, StatusID, StatusDate)
VALUES
(NEWID(), @centralParkTour, @participant1, '2023-06-05', 'Active', '2023-06-05'),
(NEWID(), @centralParkTour, @participant2, '2023-06-06', 'Active', '2023-06-06'),
(NEWID(), @centralParkTour, @participant3, '2023-06-07', 'Active', '2023-06-07'),
(NEWID(), @centralParkTour, @participant4, '2023-06-08', 'Active', '2023-06-08'),
(NEWID(), @centralParkTour, @participant5, '2023-06-09', 'Active', '2023-06-09'),
(NEWID(), @centralParkTour, @participant6, '2023-06-10', 'Active', '2023-06-10'),
(NEWID(), @centralParkTour, @participant7, '2023-06-11', 'Active', '2023-06-11'),
(NEWID(), @centralParkTour, @participant8, '2023-06-12', 'Active', '2023-06-12'),
(NEWID(), @centralParkTour, @participant9, '2023-06-13', 'Active', '2023-06-13'),
(NEWID(), @centralParkTour, @participant10, '2023-06-14', 'Active', '2023-06-14'),
(NEWID(), @centralParkTour, @participant11, '2023-06-15', 'Active', '2023-06-15'),
(NEWID(), @centralParkTour, @participant12, '2023-06-16', 'Active', '2023-06-16'),
(NEWID(), @centralParkTour, @participant13, '2023-06-17', 'Active', '2023-06-17'),
(NEWID(), @centralParkTour, @participant14, '2023-06-18', 'Active', '2023-06-18'),
(NEWID(), @centralParkTour, @participant15, '2023-06-19', 'Active', '2023-06-19');
