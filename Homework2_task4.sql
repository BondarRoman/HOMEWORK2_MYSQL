DROP DATABASE IF EXISTS HRSystem;
CREATE DATABASE IF NOT EXISTS HRSystem;
USE HRSystem;

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    ContactPerson VARCHAR(255),
    Address VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10,2),
    QuantityInStock INT
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    CustomerType VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Cost DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255),
    Position VARCHAR(255),
    ContactInformation VARCHAR(255),
    Salary DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255),
    Address VARCHAR(255),
    Position VARCHAR(255),
    Department VARCHAR(255),
    HireDate DATE,
    Salary DECIMAL(10,2),
    SupervisorID INT,
    FOREIGN KEY (SupervisorID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Vacancies (
    VacancyID INT AUTO_INCREMENT PRIMARY KEY,
    Position VARCHAR(255),
    Department VARCHAR(255),
    Requirements TEXT,
    Responsibilities TEXT,
    SalaryRange VARCHAR(255)
);

CREATE TABLE Trainings (
    TrainingID INT AUTO_INCREMENT PRIMARY KEY,
    TrainingName VARCHAR(255),
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    Location VARCHAR(255),
    Trainer VARCHAR(255)
);

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    TrainingID INT,
    EmployeeID INT,
    AttendanceDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (TrainingID) REFERENCES Trainings(TrainingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Suppliers (Name, ContactPerson, Address, Email, Phone)
VALUES ('Supplier1', 'Contact1', 'Address1', 'supplier1@example.com', '123456789');

INSERT INTO Products (Name, Description, Price, QuantityInStock)
VALUES ('Product1', 'Description1', 10.99, 100);

INSERT INTO Customers (FullName, Address, Phone, Email, CustomerType)
VALUES ('Customer1', 'Address1', '987654321', 'customer1@example.com', 'Wholesale');

INSERT INTO Orders (CustomerID, OrderDate, TotalCost)
VALUES (1, '2023-11-23', 109.90);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Cost)
VALUES (1, 1, 10, 109.90);

INSERT INTO Employees (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address, Position, Department, HireDate, Salary, SupervisorID)
VALUES ('John', 'Doe', '1990-01-01', 'Male', '123456789', 'john.doe@example.com', 'Address2', 'Sales Associate', 'Sales', '2023-01-15', 50000.00, NULL);

INSERT INTO Departments (DepartmentName)
VALUES ('Sales');

INSERT INTO Trainings (TrainingName, Description, StartDate, EndDate, Location, Trainer)
VALUES ('Sales Training', 'Training for Sales Team', '2023-12-01', '2023-12-03', 'Training Room A', 'Sales Trainer');

INSERT INTO Attendance (TrainingID, EmployeeID, AttendanceDate, Status)
VALUES (1, 1, '2023-12-01', 'Present');

INSERT INTO Vacancies (Position, Department, Requirements, Responsibilities, SalaryRange)
VALUES ('Sales Manager', 'Sales', 'Experience in sales management', 'Manage sales team and meet targets', 'Negotiable');

SELECT * FROM Suppliers; 
SELECT * FROM Products; 
SELECT * FROM Customers; 
SELECT * FROM Orders; 
SELECT * FROM OrderDetails; 
SELECT * FROM Staff; 
SELECT * FROM Employees; 
SELECT * FROM Departments; 
SELECT * FROM Trainings; 
SELECT * FROM Attendance; 
SELECT * FROM Vacancies;
