DROP DATABASE IF EXISTS team2;
CREATE DATABASE team2; 

USE team2;

DROP TABLE IF EXISTS User;
CREATE TABLE User(
    UserID INT AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    HashPass VARCHAR(200) NOT NULL,
    ContactInfo VARCHAR(200),
    InformationVis TINYINT,
    Email VARCHAR(100),
    UserType VARCHAR(100) NOT NULL,
    PRIMARY KEY (UserID)
);

INSERT INTO User (UserName, HashPass, ContactInfo, InformationVis, Email, UserType) VALUES
    ('MarkFontenot', '123123123123', 'slack', 1, 'mfonten@smu.edu', 'Manager'),
    ('KristinaCannon', '222222222222', 'slack', 0, 'kristinac@smu.edu', 'Manager'),
    ('JamesZhai', '33333333333333', '111-222-3333', 1, 'xzhai@smu.edu', 'Contractor'),
    ('WillDunn', '444444444444444', '222-333-4444', 0, 'rrogan@smu.edu', 'Vendor'),
    ('RaniRogan', '55555555555', '333-444-5555', 1, 'wjdunn@smu.edu', 'Contractor');


DROP TABLE IF EXISTS Project;
CREATE TABLE Project(
    ProjectID INT AUTO_INCREMENT,
    ProjectName VARCHAR(50) NOT NULL,
    ApplyDate DATE,
    ExpireDate DATE,
    ProjectStatus VARCHAR(100),
    ProjectType VARCHAR(100),
    ManagerID INT,
    PRIMARY KEY (ProjectID),
	FOREIGN KEY(ManagerID)
		REFERENCES User(UserID)
        ON UPDATE CASCADE
);

INSERT INTO Project (ProjectName, ApplyDate, ExpireDate, ProjectStatus, ProjectType, ManagerID) VALUES
    ('F22-2020', '2020-10-27', '2020-11-03', 'Unfinished', 'AirPlane', 1),
    ('M1A2-2020', '2020-04-12', '2020-10-27', 'Finished', 'Tank', 2),
    ('F18-2020', '2020-01-01', '2020-09-03', 'Unfinished', 'AirPlane', 1),
    ('M16-2020', '2020-10-05', '2021-01-21', 'Unfinished', 'Rifle', 2),
    ('HK416-2020', '2020-11-13', '2021-12-05', 'Unfinished', 'Rifle', 1);


DROP TABLE IF EXISTS NotificationBox;
CREATE TABLE NotificationBox(
    NotificationID INT AUTO_INCREMENT,
    UserID INT,
    NotificationMessage VARCHAR(200),
    PRIMARY KEY (NotificationID),
	FOREIGN KEY(UserID)
		REFERENCES User(UserID)
        ON UPDATE CASCADE
);

INSERT INTO NotificationBox (UserID, NotificationMessage) VALUES
    (1, 'Hey, this is James, I just finished my work.'),
    (2, 'Hi, Manager! I probably need more time.'),
    (3, 'Thank!'),
    (4, 'Hurry Up!, the deadline is coming.'),
    (5, 'I just received your work.');

DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
    ProductID INT AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CurrentPrice DECIMAL(8,2),
    DiscountPrice DECIMAL(8,2),
    Details VARCHAR(300),
    IsDiscount TINYINT,
    PRIMARY KEY (ProductID)
);

INSERT INTO Product (ProductName, CurrentPrice, DiscountPrice, Details, IsDiscount) VALUES
    ("Cement Mix", 900.00, 850.00, "Half a ton of cement mix", 0),
    ("Rebar", 50.00, 45.00, "100ft of rebar", 1),
    ("Sand", 500.00, 479.99, "1 ton of sand", 0),
    ("Glass pane", 125.00, 120.00, "Tempered glass pane", 1),
    ("Wood", 15.00, 13.99, "20ft of 2x4 wood", 0);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
    OrderID INT AUTO_INCREMENT,
    OrderStatus VARCHAR(45),
    ApplyDate DATE,
    ExpireDate DATE,
    VendorID INT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (VendorID)
        REFERENCES User(UserID)
        ON UPDATE CASCADE
);

INSERT INTO Orders (OrderStatus, ApplyDate, ExpireDate, VendorID) VALUES
    ("Not started", '2020-10-27', '2020-11-1', 4),
    ("In progress", '2020-10-27', '2020-11-7', 4),
    ("Shipping", '2020-10-27', '2020-10-29', 4);
    
DROP TABLE IF EXISTS Order_Product;
CREATE TABLE Order_Product(
    Order_ProductID INT AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (Order_ProductID),
    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE,
    FOREIGN KEY (ProductID)
        REFERENCES Product(ProductID)
        ON UPDATE CASCADE
);

INSERT INTO Order_Product (OrderID, ProductID) VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (3, 4),
    (3, 5);

DROP TABLE IF EXISTS Project_Order;
CREATE TABLE Project_Order(
    Project_OrderID INT AUTO_INCREMENT,
    ProjectID INT,
    OrderID INT,
    PRIMARY KEY (Project_OrderID),
    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE,
    FOREIGN KEY (ProjectID)
        REFERENCES Project(projectID)
        ON UPDATE CASCADE
);

INSERT INTO Project_Order (ProjectID, OrderID) VALUES
    (1, 1),
    (2, 2),
    (3, 3);