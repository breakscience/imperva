-- Create the database
CREATE DATABASE IF NOT EXISTS SensitiveDataDB;

-- Use the database
USE SensitiveDataDB;

-- Create a table for user information
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,  -- Assume passwords are hashed
    SSN VARCHAR(11) NOT NULL,  -- Social Security Number
    DOB DATE NOT NULL,  -- Date of Birth
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for financial records
CREATE TABLE IF NOT EXISTS FinancialRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL,
    BankName VARCHAR(100) NOT NULL,
    Balance DECIMAL(15, 2) NOT NULL,
    LastTransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create a table for transactions
CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    TransactionType ENUM('debit', 'credit') NOT NULL,
    Amount DECIMAL(15, 2) NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert initial sample data into Users table
INSERT INTO Users (FirstName, LastName, Email, PasswordHash, SSN, DOB)
VALUES
('John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '123-45-6789', '1980-01-01'),
('Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '987-65-4321', '1990-02-02'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword3', '111-22-3333', '1975-03-03'),
('Bob', 'Brown', 'bob.brown@example.com', 'hashedpassword4', '444-55-6666', '1985-04-04'),
('Charlie', 'Davis', 'charlie.davis@example.com', 'hashedpassword5', '777-88-9999', '1995-05-05');

-- Insert more sample data into Users table
INSERT INTO Users (FirstName, LastName, Email, PasswordHash, SSN, DOB)
VALUES
('David', 'Anderson', 'david.anderson@example.com', 'hashedpassword6', '112-23-4455', '1982-06-06'),
('Eva', 'Martinez', 'eva.martinez@example.com', 'hashedpassword7', '223-34-5566', '1984-07-07'),
('Frank', 'Garcia', 'frank.garcia@example.com', 'hashedpassword8', '334-45-6677', '1986-08-08'),
('Grace', 'Martinez', 'grace.martinez@example.com', 'hashedpassword9', '445-56-7788', '1988-09-09'),
('Henry', 'Wilson', 'henry.wilson@example.com', 'hashedpassword10', '556-67-8899', '1990-10-10'),
('Isabella', 'Lee', 'isabella.lee@example.com', 'hashedpassword11', '667-78-9900', '1992-11-11'),
('Jack', 'Harris', 'jack.harris@example.com', 'hashedpassword12', '778-89-1011', '1994-12-12'),
('Katherine', 'Clark', 'katherine.clark@example.com', 'hashedpassword13', '889-90-1122', '1996-01-13'),
('Liam', 'Lewis', 'liam.lewis@example.com', 'hashedpassword14', '990-01-2233', '1998-02-14'),
('Mia', 'Walker', 'mia.walker@example.com', 'hashedpassword15', '101-12-3344', '2000-03-15'),
('Noah', 'Hall', 'noah.hall@example.com', 'hashedpassword16', '212-23-4455', '1981-04-16'),
('Olivia', 'Allen', 'olivia.allen@example.com', 'hashedpassword17', '323-34-5566', '1983-05-17'),
('Paul', 'Young', 'paul.young@example.com', 'hashedpassword18', '434-45-6677', '1985-06-18'),
('Quinn', 'Hernandez', 'quinn.hernandez@example.com', 'hashedpassword19', '545-56-7788', '1987-07-19'),
('Ruby', 'King', 'ruby.king@example.com', 'hashedpassword20', '656-67-8899', '1989-08-20'),
('Samuel', 'Wright', 'samuel.wright@example.com', 'hashedpassword21', '767-78-9900', '1991-09-21'),
('Tina', 'Lopez', 'tina.lopez@example.com', 'hashedpassword22', '878-89-1011', '1993-10-22'),
('Uma', 'Hill', 'uma.hill@example.com', 'hashedpassword23', '989-90-1122', '1995-11-23'),
('Victor', 'Scott', 'victor.scott@example.com', 'hashedpassword24', '101-01-2233', '1997-12-24'),
('Wendy', 'Green', 'wendy.green@example.com', 'hashedpassword25', '212-12-3344', '1999-01-25'),
('Xander', 'Adams', 'xander.adams@example.com', 'hashedpassword26', '323-23-4455', '2001-02-26'),
('Yara', 'Baker', 'yara.baker@example.com', 'hashedpassword27', '434-34-5566', '2003-03-27'),
('Zane', 'Nelson', 'zane.nelson@example.com', 'hashedpassword28', '545-45-6677', '2005-04-28'),
('Amelia', 'Carter', 'amelia.carter@example.com', 'hashedpassword29', '656-56-7788', '1982-05-29'),
('Brandon', 'Mitchell', 'brandon.mitchell@example.com', 'hashedpassword30', '767-67-8899', '1984-06-30'),
('Catherine', 'Perez', 'catherine.perez@example.com', 'hashedpassword31', '878-78-9900', '1986-07-31'),
('Daniel', 'Roberts', 'daniel.roberts@example.com', 'hashedpassword32', '989-89-1011', '1988-08-01'),
('Ella', 'Turner', 'ella.turner@example.com', 'hashedpassword33', '101-01-1122', '1990-09-02'),
('Felix', 'Phillips', 'felix.phillips@example.com', 'hashedpassword34', '212-12-2233', '1992-10-03'),
('Georgia', 'Campbell', 'georgia.campbell@example.com', 'hashedpassword35', '323-23-3344', '1994-11-04'),
('Harrison', 'Parker', 'harrison.parker@example.com', 'hashedpassword36', '434-34-4455', '1996-12-05'),
('Ivy', 'Evans', 'ivy.evans@example.com', 'hashedpassword37', '545-45-5566', '1998-01-06'),
('Jackson', 'Edwards', 'jackson.edwards@example.com', 'hashedpassword38', '656-56-6677', '2000-02-07'),
('Kayla', 'Collins', 'kayla.collins@example.com', 'hashedpassword39', '767-67-7788', '2002-03-08'),
('Leo', 'Stewart', 'leo.stewart@example.com', 'hashedpassword40', '878-78-8899', '2004-04-09'),
('Megan', 'Sanchez', 'megan.sanchez@example.com', 'hashedpassword41', '989-89-9900', '2006-05-10'),
('Nathan', 'Morris', 'nathan.morris@example.com', 'hashedpassword42', '101-10-1011', '1981-06-11'),
('Olga', 'Rogers', 'olga.rogers@example.com', 'hashedpassword43', '212-21-2122', '1983-07-12'),
('Peter', 'Reed', 'peter.reed@example.com', 'hashedpassword44', '323-32-3233', '1985-08-13'),
('Quincy', 'Cook', 'quincy.cook@example.com', 'hashedpassword45', '434-43-4344', '1987-09-14'),
('Rachel', 'Morgan', 'rachel.morgan@example.com', 'hashedpassword46','545-54-5455', '1989-10-15'),
('Stephen', 'Bell', 'stephen.bell@example.com', 'hashedpassword47', '656-65-6566', '1991-11-16'),
('Tara', 'Murphy', 'tara.murphy@example.com', 'hashedpassword48', '767-76-7677', '1993-12-17'),
('Uri', 'Bailey', 'uri.bailey@example.com', 'hashedpassword49', '878-87-8788', '1995-01-18'),
('Vera', 'Rivera', 'vera.rivera@example.com', 'hashedpassword50', '989-98-9899', '1997-02-19'),
('William', 'Cooper', 'william.cooper@example.com', 'hashedpassword51', '101-09-0101', '1999-03-20'),
('Xenia', 'Richardson', 'xenia.richardson@example.com', 'hashedpassword52', '212-10-1112', '2001-04-21'),
('Yosef', 'Ward', 'yosef.ward@example.com', 'hashedpassword53', '323-11-1123', '2003-05-22'),
('Zara', 'Peterson', 'zara.peterson@example.com', 'hashedpassword54', '434-12-2234', '2005-06-23');

– Insert sample data into FinancialRecords table
INSERT INTO FinancialRecords (UserID, AccountNumber, BankName, Balance)
VALUES
(1, '1234567890', 'Bank of America', 10000.00),
(2, '0987654321', 'Chase Bank', 20000.00),
(3, '5678901234', 'Wells Fargo', 15000.00),
(4, '4321098765', 'Citibank', 12000.00),
(5, '6789012345', 'HSBC', 18000.00),
(6, '7890123456', 'US Bank', 11000.00),
(7, '8901234567', 'PNC Bank', 12000.00),
(8, '9012345678', 'TD Bank', 13000.00),
(9, '0123456789', 'Capital One', 14000.00),
(10, '1234509876', 'Ally Bank', 15000.00),
(11, '2345610987', 'SunTrust Bank', 16000.00),
(12, '3456721098', 'BB&T', 17000.00),
(13, '4567832109', 'Regions Bank', 18000.00),
(14, '5678943210', 'Fifth Third Bank', 19000.00),
(15, '6789054321', 'KeyBank', 20000.00),
(16, '7890165432', 'Huntington Bank', 21000.00),
(17, '8901276543', 'M&T Bank', 22000.00),
(18, '9012387654', 'Citizens Bank', 23000.00),
(19, '0123498765', 'Silicon Valley Bank', 24000.00),
(20, '1234509876', 'First Republic Bank', 25000.00),
(21, '2345610987', 'Union Bank', 26000.00),
(22, '3456721098', 'Bank of the West', 27000.00),
(23, '4567832109', 'Zions Bank', 28000.00),
(24, '5678943210', 'Comerica Bank', 29000.00),
(25, '6789054321', 'Santander Bank', 30000.00),
(26, '7890165432', 'First Citizens Bank', 31000.00),
(27, '8901276543', 'BMO Harris Bank', 32000.00),
(28, '9012387654', 'People's United Bank', 33000.00),
(29, '0123498765', 'Valley National Bank', 34000.00),
(30, '1234509876', 'New York Community Bank', 35000.00),
(31, '2345610987', 'East West Bank', 36000.00),
(32, '3456721098', 'Wintrust Bank', 37000.00),
(33, '4567832109', 'Frost Bank', 38000.00),
(34, '5678943210', 'UMB Bank', 39000.00),
(35, '6789054321', 'Banner Bank', 40000.00),
(36, '7890165432', 'First Hawaiian Bank', 41000.00),
(37, '8901276543', 'Pinnacle Bank', 42000.00),
(38, '9012387654', 'Old National Bank', 43000.00),
(39, '0123498765', 'Cadence Bank', 44000.00),
(40, '1234509876', 'Prosperity Bank', 45000.00),
(41, '2345610987', 'Texas Capital Bank', 46000.00),
(42, '3456721098', 'ServisFirst Bank', 47000.00),
(43, '4567832109', 'First Bank', 48000.00),
(44, '5678943210', 'SouthState Bank', 49000.00),
(45, '6789054321', 'Community Bank', 50000.00),
(46, '7890165432', 'Civista Bank', 51000.00),
(47, '8901276543', 'Atlantic Union Bank', 52000.00),
(48, '9012387654', 'Arvest Bank', 53000.00),
(49, '0123498765', 'City National Bank', 54000.00),
(50, '1234509876', 'First National Bank', 55000.00),
(51, '2345610987', 'Great Western Bank', 56000.00),
(52, '3456721098', 'MidFirst Bank', 57000.00),
(53, '4567832109', 'Southwest Bank', 58000.00),
(54, '5678943210', 'Heartland Bank', 59000.00);

– Insert sample data into Transactions table
INSERT INTO Transactions (UserID, TransactionType, Amount)
VALUES
(1, 'credit', 500.00),
(1, 'debit', 200.00),
(2, 'credit', 1500.00),
(2, 'debit', 300.00),
(3, 'credit', 700.00),
(3, 'debit', 400.00),
(4, 'credit', 800.00),
(4, 'debit', 500.00),
(5, 'credit', 600.00),
(5, 'debit', 250.00),
(6, 'credit', 1100.00),
(6, 'debit', 100.00),
(7, 'credit', 1200.00),
(7, 'debit', 200.00),
(8, 'credit', 1300.00),
(8, 'debit', 300.00),
(9, 'credit', 1400.00),
(9, 'debit', 400.00),
(10, 'credit', 1500.00),
(10, 'debit', 500.00),
(11, 'credit', 1600.00),
(11, 'debit', 600.00),
(12, 'credit', 1700.00),
(12, 'debit', 700.00),
(13, 'credit', 1800.00),
(13, 'debit', 800.00),
(14, 'credit', 1900.00),
(14, 'debit', 900.00),
(15, 'credit', 2000.00),
(15, 'debit', 1000.00),
(16, 'credit', 2100.00),
(16, 'debit', 1100.00),
(17, 'credit', 2200.00),
(17, 'debit', 1200.00),
(18, 'credit', 2300.00),
(18, 'debit', 1300.00),
(19, 'credit', 2400.00),
(19, 'debit', 1400.00),
(20, 'credit', 2500.00),
(20, 'debit', 1500.00),
(21, 'credit', 2600.00),
(21, 'debit', 1600.00),
(22, 'credit', 2700.00),
(22, 'debit', 1700.00),
(23, 'credit', 2800.00),
(23, 'debit', 1800.00),
(24, 'credit', 2900.00),
(24, 'debit', 1900.00),
(25, 'credit', 3000.00),
(25, 'debit', 2000.00),
(26, 'credit', 3100.00),
(26, 'debit', 2100.00),
(27, 'credit', 3200.00),
(27, 'debit', 2200.00),
(28, 'credit', 3300.00),
(28, 'debit', 2300.00),
(29, 'credit', 3400.00),
(29, 'debit', 2400.00),
(30, 'credit', 3500.00),
(30, 'debit', 2500.00),
(31, 'credit', 3600.00),
(31, 'debit', 2600.00),
(32, 'credit', 3700.00),
(32, 'debit', 2700.00),
(33, 'credit', 3800.00),
(33, 'debit', 2800.00),
(34, 'credit', 3900.00),
(34, 'debit', 2900.00),
(35, 'credit', 4000.00),
(35, 'debit', 3000.00),
(36, 'credit', 4100.00),
(36, 'debit', 3100.00),
(37, 'credit', 4200.00),
(37, 'debit', 3200.00),
(38, 'credit', 4300.00),
(38, 'debit', 3300.00),
(39, 'credit', 4400.00),
(39, 'debit', 3400.00),
(40, 'credit', 4500.00),
(40, 'debit', 3500.00),
(41, 'credit', 4600.00),
(41, 'debit', 3600.00),
(42, 'credit', 4700.00),
(42, 'debit', 3700.00),
(43, 'credit', 4800.00),
(43, 'debit', 3800.00),
(44, 'credit', 4900.00),
(44, 'debit', 3900.00),
(45, 'credit', 5000.00),
(45, 'debit', 4000.00),
(46, 'credit', 5100.00),
(46, 'debit', 4100.00),
(47, 'credit', 5200.00),
(47, 'debit', 4200.00),
(48, 'credit', 5300.00),
(48, 'debit', 4300.00),
(49, 'credit', 5400.00),
(49, 'debit', 4400.00),
(50, 'credit', 5500.00),
(50, 'debit', 4500.00),
(51, 'credit', 5600.00),
(51, 'debit', 4600.00),
(52, 'credit', 5700.00),
(52, 'debit', 4700.00),
(53, 'credit', 5800.00),
(53, 'debit', 4800.00),
(54, 'credit', 5900.00),
(54, 'debit', 4900.00);