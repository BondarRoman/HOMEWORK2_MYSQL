

DROP DATABASE IF EXISTS client;

CREATE DATABASE client;
 Use client;

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


INSERT INTO Suppliers (Name, ContactPerson, Address, Email, Phone)
VALUES ('Supplier1', 'Contact1', 'Address1', 'supplier1@example.com', '123456789');

INSERT INTO Products (Name, Description, Price, QuantityInStock)
VALUES ('Product1', 'Description1', 10.99, 100);

INSERT INTO Customers (FullName, Address, Phone, Email, CustomerType)
VALUES ('Customer1', 'Address1', 987654321, 'customer1@example.com', 'Wholesale');

INSERT INTO Orders (CustomerID, OrderDate, TotalCost)
VALUES (1, '2023-11-23', 109.90);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Cost)
VALUES (1, 1, 10, 109.90);

INSERT INTO Staff (FullName, Position, ContactInformation, Salary)
VALUES ('Staff1', 'Manager', 'staff1@example.com', 50000.00);

SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Staff;

