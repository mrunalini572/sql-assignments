CREATE DATABASE IF NOT EXISTS CourierDB;
USE CourierDB;

-- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

-- Create Couriers Table
CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)  
);

-- Create Courier Services Table
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Create Locations Table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- Insert Sample Users
INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address) VALUES  
(1, 'priya', 'priya@gmail.com', 'password123', '1234567890', '123 Main St, City, Country'),
(2, 'ram', 'ram@gmail.com.com', 'password456', '0987654321', '456 Elm St, City, Country');

-- Insert Sample Couriers
INSERT INTO Couriers (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, UserID) VALUES
(1, 'priya', '123 Main St, City, Country', 'kavya', '789 Pine St, City, Country', 2.5, 'In Transit', 'TRACK123', '2023-10-15', 1),
(2, 'ram', '456 Elm St, City, Country', 'kajal', '321 Oak St, City, Country', 1.0, 'Delivered', 'TRACK456', '2023-10-10', 2);

-- Insert Sample Courier Services
INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard Delivery', 5.00),
(2, 'Express Delivery', 10.00);

-- Insert Sample Employees
INSERT INTO Employees (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(1, ' John', 'jhon@gmail.com', '1112223333', 'Courier', 3000.00),
(2, 'Sara ', 'sara@example.com', '4445556666', 'Manager', 5000.00);

-- Insert Sample Locations
INSERT INTO Locations (LocationID, LocationName, Address) VALUES
(1, 'Warehouse A', '789 Warehouse Rd, City, Country'),
(2, 'Warehouse B', '321 Depot Rd, City, Country');

-- Insert Sample Payments
INSERT INTO Payments (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 1, 1, 5.00, '2023-10-01'),
(2, 2, 2, 10.00, '2023-10-05');