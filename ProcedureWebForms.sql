CREATE DATABASE HospitalDB;
GO
USE HospitalDB;


-- Users Table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

-- Patients Table
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    AdmissionDate DATETIME NOT NULL
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Specialization NVARCHAR(100) NOT NULL
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATETIME NOT NULL
);

select * from Users;



-- Register User
CREATE PROCEDURE USP_RegisterUser
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(MAX),
    @Role NVARCHAR(50)
AS
BEGIN
    INSERT INTO Users (Username, PasswordHash, Role)
    VALUES (@Username, @PasswordHash, @Role);
END;
GO

-- Login User
CREATE PROCEDURE USP_LoginUser
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(MAX)
AS
BEGIN
    SELECT UserID, Role
    FROM Users
    WHERE Username = @Username AND PasswordHash = @PasswordHash;
END;
GO

-- Add Patient
CREATE PROCEDURE USP_AddPatient
    @Name NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @AdmissionDate DATETIME
AS
BEGIN
    INSERT INTO Patients (Name, Age, Gender, AdmissionDate)
    VALUES (@Name, @Age, @Gender, @AdmissionDate);
END;
GO


-- Fetch All Patients
CREATE PROCEDURE USP_GetPatients
AS
BEGIN
    SELECT PatientID, Name, Age, Gender, AdmissionDate FROM Patients;
END;
GO

-- Fetch All Doctors
CREATE PROCEDURE USP_GetDoctors
AS
BEGIN
    SELECT DoctorID, Name, Specialization FROM Doctors;
END;
GO



INSERT INTO Doctors (Name, Specialization)
VALUES
('Dr. Rajesh Kumar', 'Cardiologist'),
('Dr. Priya Sharma', 'Dermatologist'),
('Dr. Amit Verma', 'Orthopedic Surgeon'),
('Dr. Rani Singh', 'Pediatrician'),
('Dr. Vivek Patel', 'General Physician'),
('Dr. Anjali Rao', 'Gynecologist'),
('Dr. Suraj Yadav', 'Neurologist'),
('Dr. Neha Gupta', 'Opthalmologist'),
('Dr. Rahul Mehta', 'ENT Specialist'),
('Dr. Rekha Desai', 'Dentist'),
('Dr. Sanjay Reddy', 'Urologist'),
('Dr. Aarti Joshi', 'Psychiatrist'),
('Dr. Manish Tiwari', 'Rheumatologist'),
('Dr. Sangeeta Bansal', 'Cardiologist'),
('Dr. Shubham Aggarwal', 'Orthopedic Surgeon'),
('Dr. Seema Kapoor', 'Pediatrician'),
('Dr. Ankit Singh', 'General Surgeon'),
('Dr. Kavita Iyer', 'Gynecologist'),
('Dr. Dinesh Kumar', 'Dermatologist'),
('Dr. Sunita Verma', 'Nephrologist');




INSERT INTO Patients (Name, Age, Gender, AdmissionDate)
VALUES
('Aarav Sharma', 30, 'Male', '2023-01-10'),
('Ishita Verma', 25, 'Female', '2023-01-12'),
('Vivaan Gupta', 35, 'Male', '2023-02-05'),
('Ananya Patel', 28, 'Female', '2023-02-10'),
('Aditya Reddy', 40, 'Male', '2023-03-01'),
('Sneha Desai', 33, 'Female', '2023-03-15'),
('Arjun Singh', 45, 'Male', '2023-04-05'),
('Priya Kumar', 29, 'Female', '2023-04-12'),
('Sai Kumar', 38, 'Male', '2023-05-07'),
('Neha Mehta', 31, 'Female', '2023-05-10'),
('Rohan Joshi', 26, 'Male', '2023-06-05'),
('Simran Bhatt', 36, 'Female', '2023-06-10'),
('Karan Singh', 32, 'Male', '2023-07-02'),
('Sanya Patel', 27, 'Female', '2023-07-08'),
('Manish Shah', 41, 'Male', '2023-08-01'),
('Ritika Verma', 34, 'Female', '2023-08-09'),
('Yash Mehta', 29, 'Male', '2023-09-01'),
('Kavya Reddy', 32, 'Female', '2023-09-14'),
('Rahul Desai', 39, 'Male', '2023-10-10'),
('Sanya Kapoor', 26, 'Female', '2023-10-20'),
('Nikhil Sharma', 30, 'Male', '2023-11-05'),
('Tanvi Joshi', 28, 'Female', '2023-11-12'),
('Pranav Gupta', 43, 'Male', '2023-12-01'),
('Kriti Sharma', 34, 'Female', '2023-12-03'),
('Varun Patel', 31, 'Male', '2023-12-10');
