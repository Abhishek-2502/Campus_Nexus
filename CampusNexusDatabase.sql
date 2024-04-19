-- DROP DATABASE IF EXISTS gui;
CREATE DATABASE gui;
USE gui;

-- Admin Table
CREATE TABLE Admin(
    AdminID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50) UNIQUE
);

CREATE TABLE BRANCH(
	BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50)
);

-- Student Table
CREATE TABLE Student (
    PRN INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Year INT,
    BranchID INT,
    Semester INT,
    DOB DATE,
    FathersName VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    AddressStreetName VARCHAR(50),
    AddressStreetNumber VARCHAR(50),
    AddressZipCode VARCHAR(10),
    AddressState VARCHAR(50),
    AddressCity VARCHAR(50),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- PhoneNumber Table
CREATE TABLE PhoneNumber (
    PRN INT PRIMARY KEY,
    PhoneNumber1 VARCHAR(15) UNIQUE,
    PhoneNumber2 VARCHAR(15) UNIQUE,
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);


-- AdminLogin Table
CREATE TABLE AdminLogin (
    AdminID INT PRIMARY KEY,
    AdminPassword VARCHAR(50),
	FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);


-- StudentLogin Table
CREATE TABLE StudentLogin (
    PRN INT PRIMARY KEY,
    StudentPassword VARCHAR(50),
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);

-- Hostel Table
CREATE TABLE Hostel (
    PRN INT PRIMARY KEY,
    Gender VARCHAR(6),
    SimpleRoom VARCHAR(3),
    LuxuryRoom VARCHAR(3),
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);

-- Library Table
CREATE TABLE Library (
    LibraryID INT,
    Category VARCHAR(50),
    Issue DATE,
    Return1 DATE
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY, 
    FacultyName VARCHAR(50),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(50),
	BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- TimeTable Table
CREATE TABLE TimeTable (
    TimetableID INT PRIMARY KEY,
    CourseID INT,
    FacultyID INT,
    RoomNumber VARCHAR(50),
    Timing VARCHAR(50),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);



-- Grades Table
CREATE TABLE Grades (
    PRN INT PRIMARY KEY,
    MidSem FLOAT,
    EndSem FLOAT,
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);

-- Attendance Table
CREATE TABLE Attendance (
    PRN INT PRIMARY KEY,
    Percentage FLOAT,
    Date1 DATE,
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);


-- Fees Table
CREATE TABLE Fees (
    PRN INT PRIMARY KEY,
    PaidUnpaid VARCHAR(10),
    Fine FLOAT,
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);


-- Insert values into Admin Table
INSERT INTO Admin (AdminID, FirstName, LastName, Email) 
VALUES 
    (1, 'Raj', 'Patel', 'raj@gmail.com'),
    (2, 'Priya', 'Sharma', 'priya@gmail.com'),
    (3, 'Amit', 'Gupta', 'amit@gmail.com'),
    (4, 'Sneha', 'Desai', 'sneha@gmail.com');


-- Insert values into Branch Table
INSERT INTO BRANCH (BranchID, BranchName)
VALUES
(5001, 'Computer Science Engineering'),
(5002, 'Electrical Engineering'),
(5003, 'Mechanical Engineering'),
(5004, 'Civil Engineering'),
(5005, 'Aritifical Intelligence Engineering'),
(5006, 'Robotics And Automation Engineering');

-- Insert values into Student Table
INSERT INTO Student (PRN, FirstName, LastName, Year, BranchID, Semester, DOB, FathersName, Email, AddressStreetName, AddressStreetNumber, AddressZipCode, AddressState, AddressCity)
VALUES
(1001, 'Abhishek', 'Rajput', 2, 5001, 4, '2000-05-15', 'Mr. Rajput', 'abhishek@gmail.com', 'Main Street', '123', '400001', 'Maharashtra', 'Mumbai'),
(1002, 'Aditya', 'Raj', 3, 5001, 6, '1999-08-20', 'Mr. Raj', 'aditya@gmail.com', 'Park Avenue', '456', '110001', 'Delhi', 'New Delhi'),
(1003, 'Archit', 'Patil', 1, 5002, 2, '2001-02-10', 'Mr. Patil', 'archit@gmail.com', 'Broadway', '789', '560001', 'Karnataka', 'Bangalore'),
(1004, 'Arnav', 'Jain', 4, 5002, 8, '1998-11-25', 'Mr. Jain', 'arnav@gmail.com', 'Green Street', '1011', '600001', 'Tamil Nadu', 'Chennai'),
(1005, 'Aryan', 'Sharma', 2, 5003, 4, '2000-07-12', 'Mr. Sharma', 'aryan@gmail.com', 'High Street', '1314', '700001', 'West Bengal', 'Kolkata'),
(1006, 'Avinash', 'Gupta', 3, 5003, 6, '1999-09-18', 'Mr. Gupta', 'avinash@gmail.com', 'River Road', '1516', '500001', 'Telangana', 'Hyderabad'),
(1007, 'Amita', 'Singh', 1, 5004, 2, '2001-03-22', 'Mr. Singh', 'amita@gmail.com', 'Lake Street', '1718', '380001', 'Gujarat', 'Ahmedabad'),
(1008, 'Akash', 'Kumar', 4, 5004, 8, '1998-12-30', 'Mr. Kumar', 'akash@gmail.com', 'Gandhi Road', '1920', '250001', 'Uttar Pradesh', 'Agra'),
(1009, 'Ananya', 'Yadav', 2, 5005, 4, '2000-06-08', 'Mr. Yadav', 'ananya@gmail.com', 'Market Street', '2122', '560002', 'Karnataka', 'Mysore'),
(1010, 'Ankit', 'Verma', 3, 5005, 6, '1999-10-14', 'Mr. Verma', 'ankit@gmail.com', 'Station Road', '2324', '110002', 'Delhi', 'New Delhi'),
(1011, 'Aditi', 'Shah', 1, 5006, 2, '2001-04-26', 'Mr. Shah', 'aditi@gmail.com', 'Victoria Street', '2526', '600002', 'Tamil Nadu', 'Coimbatore'),
(1012, 'Ayesha', 'Malik', 4, 5006, 8, '1998-11-03', 'Mr. Malik', 'ayesha@gmail.com', 'Church Street', '2728', '700002', 'West Bengal', 'Howrah');


-- Insert values into PhoneNumber Table
INSERT INTO PhoneNumber (PRN, PhoneNumber1, PhoneNumber2) 
VALUES
(1001, '9650104541','9650104541'),
(1002, '7720860456','9650104542'),
(1003, '8639914092','9650104543'),
(1004, '9377852020','9650104544'),
(1005, '9234567890','9876543210'),
(1006, '9345678901','9012345678'),
(1007, '9456789012','8901234567'),
(1008, '9567890123','9890123456'),
(1009, '9678901234','8789012345'),
(1010, '6789012345','9678901234'),
(1011, '8890123456','9567890123'),
(1012, '8901234567','8456789012');


-- Insert values into AdminLogin Table
INSERT INTO AdminLogin (AdminID, AdminPassword) 
VALUES
(1, 'password1'),
(2, 'password2'),
(3, 'password3'),
(4, 'password4');

-- Insert values into StudentLogin Table
INSERT INTO StudentLogin (PRN, StudentPassword) 
VALUES
(1001, 'studentpass1'),
(1002, 'studentpass2'),
(1003, 'studentpass3'),
(1004, 'studentpass4'),
(1005, 'studentpass5'),
(1006, 'studentpass6'),
(1007, 'studentpass7'),
(1008, 'studentpass8'),
(1009, 'studentpass9'),
(1010, 'studentpass10'),
(1011, 'studentpass11'),
(1012, 'studentpass12');


-- Insert values into Hostel Table
INSERT INTO Hostel (PRN, Gender, SimpleRoom, LuxuryRoom) 
VALUES
(1001, 'Male', 'Yes', 'No'),
(1002, 'Male', 'No', 'Yes'),
(1003, 'Male', 'Yes', 'No'),
(1004, 'Male', 'No', 'Yes'),
(1005, 'Male', 'Yes', 'No'),
(1006, 'Male', 'Yes', 'No'),
(1007, 'Female', 'No', 'Yes'),
(1008, 'Male', 'Yes', 'No'),
(1009, 'Female', 'No', 'Yes'),
(1010, 'Male', 'Yes', 'No'),
(1011, 'Female', 'Yes', 'No'),
(1012, 'Female', 'No', 'Yes');


-- Insert values into Library Table
INSERT INTO Library (LibraryID, Category, Issue, Return1) 
VALUES
(1001, 'Science', '2023-01-10', '2023-02-10'),
(1002, 'Literature', '2023-02-15', '2023-03-15'),
(1003, 'Mathematics', '2023-03-20', '2023-04-20'),
(1004, 'History', '2023-04-25', '2023-05-25'),
(1001, 'Civics', '2023-05-26', '2023-06-28'),
(1001, 'Geo', '2023-05-26', Null),

(1005, 'Science', '2023-03-10', '2023-06-10'),
(1007, 'Physics', '2023-01-17', Null),
(1012, 'Mathematics-3', '2023-02-20', '2023-04-20'),
(1009, 'C++', '2023-07-24', '2023-10-25'),
(1010, 'Python', '2023-05-26', Null),
(1004, 'Geo', '2023-05-26', '2023-08-11');

-- Insert values into Faculty Table
INSERT INTO Faculty (FacultyID, FacultyName, BranchID) 
VALUES
(101, 'Dr. Sahil Gupta', 5001),
(102, 'Prof. Aryan Sharma', 5001),
(103, 'Dr. Arnav Singh', 5001),
(104, 'Prof. Archit Patel', 5002),
(105, 'Dr. Faraj Khan', 5002),
(106, 'Prof. Dhurmil Verma', 5002),
(107, 'Dr. Dhruv Joshi', 5003),
(108, 'Prof. Pranav Reddy', 5003),
(109, 'Dr. Ankit Malhotra', 5003),
(110, 'Prof. Aman Gupta', 5004),
(111, 'Dr. Ansh Sharma', 5004),
(112, 'Prof. Vijay Singh', 5004),
(113, 'Dr. Harsh Kumar', 5005),
(114, 'Prof. Abhay Desai', 5005),
(115, 'Dr. Ram Patel', 5005),
(116, 'Prof. Amit Shah', 5006),
(117, 'Dr. Tarak Mehta', 5006),
(118, 'Prof. Divyansh Choudhury', 5006);


-- Insert values into Course Table
INSERT INTO Course (CourseID, CourseName,  Duration, BranchID) 
VALUES
(601, 'Database Management',  '3 months', 5001),
(602, 'Power Systems', '4 months', 5001),
(603, 'Thermodynamics', '5 months', 5001),
(604, 'Structural Analysis', '6 months', 5002),
(605, 'Java', '5 months', 5002),
(606, 'Data Structures', '3 months', 5002),
(607, 'Renewable Energy', '4 months', 5003),
(608, 'Fluid Mechanics', '5 months', 5003),
(609, 'Transportation Engineering', '6 months', 5003),
(610, 'Python Programming', '5 months', 5004),
(611, 'Machine Learning', '4 months', 5004),
(612, 'Control Systems', '5 months', 5004),
(613, 'Construction Management', '6 months', 5005),
(614, 'Web Development', '5 months', 5005),
(615, 'Artificial Intelligence', '4 months', 5005),
(616, 'Heat Transfer', '5 months', 5006),
(617, 'Automation ', '6 months', 5006),
(618, 'Mobile App Development', '5 months', 5006);


-- Insert values into TimeTable Table
INSERT INTO TimeTable (TimetableID, CourseID, FacultyID, RoomNumber, Timing) 
VALUES
(501, 601, 101, 'Room 101', '9:00 AM - 10:00 AM'),
(502, 602, 102, 'Room 101', '10:00 AM - 11:00 AM'),
(503, 603, 103, 'Room CL1', '11:00 AM - 1:00 PM'),

(504, 604, 104, 'Room 102', '9:00 AM - 10:00 AM'),
(505, 605, 105, 'Room 102', '10:00 AM - 11:00 AM'),
(506, 606, 106, 'Room CL2', '11:00 AM - 1:00 PM'),

(507, 607, 107, 'Room 104', '9:00 AM - 10:00 AM'),
(508, 608, 108, 'Room 105', '10:00 AM - 11:00 AM'),
(509, 609, 109, 'Room CL3', '11:00 AM - 1:00 PM'),

(510, 610, 110, 'Room 106', '9:00 AM - 10:00 AM'),
(511, 611, 111, 'Room 106', '10:00 AM - 11:00 AM'),
(512, 612, 112, 'Room CL4', '11:00 AM - 1:00 PM'),

(513, 613, 113, 'Room 108', '9:00 AM - 10:00 AM'),
(514, 614, 114, 'Room 108', '10:00 AM - 11:00 AM'),
(515, 615, 115, 'Room CL5', '11:00 AM - 1:00 PM'),

(516, 616, 116, 'Room 110', '9:00 AM - 10:00 AM'),
(517, 617, 117, 'Room 110', '10:00 AM - 11:00 AM'),
(518, 618, 118, 'Room CL6', '11:00 AM - 1:00 PM');

-- Insert values into Grades Table
INSERT INTO Grades (PRN, MidSem, EndSem) 
VALUES
(1001, 85, 90),
(1002, 78, 85),
(1003, 80, 88),
(1004, 75, 82),
(1005, 88, 92),
(1006, 82, 89),
(1007, 85, 90),
(1008, 79, 86),
(1009, 83, 88),
(1010, 77, 84),
(1011, 86, 91),
(1012, 81, 88);

-- Insert values into Attendance Table
INSERT INTO Attendance (PRN, Percentage, Date1) 
VALUES
(1001, 90, '2023-01-15'),
(1002, 85, '2023-02-20'),
(1003, 88, '2023-03-25'),
(1004, 82, '2023-04-30'),
(1005, 86, '2023-05-05'),
(1006, 83, '2023-06-10'),
(1007, 88, '2023-07-15'),
(1008, 80, '2023-08-20'),
(1009, 85, '2023-09-25'),
(1010, 89, '2023-10-30'),
(1011, 87, '2023-11-05'),
(1012, 84, '2023-12-10');

-- Insert values into Fees Table
INSERT INTO Fees (PRN, PaidUnpaid, Fine) 
VALUES
(1001, 'Paid', 0),
(1002, 'Unpaid', 50),
(1003, 'Paid', 0),
(1004, 'Paid', 0),
(1005, 'Unpaid', 50),
(1006, 'Paid', 0),
(1007, 'Unpaid', 500),
(1008, 'Paid', 0),
(1009, 'Paid', 0),
(1010, 'Unpaid', 250),
(1011, 'Paid', 0),
(1012, 'Unpaid', 90);


SELECT * FROM Admin;
SELECT * FROM Student;
SELECT * FROM PhoneNumber;
SELECT * FROM AdminLogin;
SELECT * FROM StudentLogin;
SELECT * FROM Hostel;
SELECT * FROM Library;
SELECT * FROM Faculty;
SELECT * FROM TimeTable;
SELECT * FROM Course;
SELECT * FROM Grades;
SELECT * FROM Attendance;
SELECT * FROM Fees;

use gui;
-- Some Queries
-- 1. Retrieve the names of students who have a mid-semester grade above 80. 

SELECT s.prn,s.FirstName, s.LastName,g.midsem FROM Student s 
JOIN Grades g ON s.PRN = g.PRN WHERE g.MidSem > 80;

-- 2. Find out the course which has the maximum duration.

SELECT * FROM Course WHERE Duration = (SELECT MAX(Duration) FROM Course);

-- 3. Retrieve the total number of students enrolled in each branch.

SELECT b.BranchName, COUNT(s.PRN) AS TotalStudents FROM Branch b
JOIN Student s ON b.BranchID = s.BranchID
GROUP BY b.BranchName; 

-- 4. Retrieve all students who have unpaid fees along with their details.
SELECT * FROM Student
WHERE PRN IN (SELECT PRN FROM Fees WHERE PaidUnpaid = 'Unpaid');

-- 5. Retrieve the students who have a mid-semester grade between 80 and 90, and are enrolled in either the 'Computer Science Engineering' or 'Mechanical Engineering' branch.

SELECT * FROM Student
WHERE PRN IN (
    SELECT PRN
    FROM Grades
    WHERE MidSem BETWEEN 80 AND 90
)
AND BranchID IN (
    SELECT BranchID
    FROM Branch
    WHERE BranchName IN ('Computer Science Engineering', 'Mechanical Engineering')
);

-- 6. Retrieve the library books that are currently not returned.

SELECT *
FROM Library
WHERE Return1 IS NULL;

-- 7. Query: Retrieve all students whose last name has exactly six characters:

SELECT *
FROM Student
WHERE LastName LIKE '______';
 
-- 8. Find the number of books issued in each category from the library.

SELECT Category, COUNT(*) AS BooksIssued
FROM Library
GROUP BY Category;

-- 9.Retrieve the student details along with their branch names and sorted by branch names in descending order.

SELECT s.prn,s.Firstname,s.lastname,b.branchid,b.BranchName
FROM Student s
INNER JOIN Branch b ON s.BranchID = b.BranchID
ORDER BY b.BranchName DESC;

-- 10. Create a view to display student details along with their branch names.
-- drop view studentDetailsWithBranch;
CREATE VIEW StudentDetailsWithBranch AS
SELECT s.prn,s.Firstname,s.lastname, b.BranchName
FROM Student s
INNER JOIN Branch b ON s.BranchID = b.BranchID;

select * from studentdetailswithbranch;
 
 
 
 




