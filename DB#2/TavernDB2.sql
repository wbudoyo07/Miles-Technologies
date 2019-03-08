
USE TavernDB2;

DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS ServiceStatuses;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS GuestStatues;
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS TavernLocation;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Counts;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS TavernReceived;


CREATE TABLE Roles (
    RoleID TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    RolesName VARCHAR(250) NOT NULL,
    RolesDescription VARCHAR(MAX)
);

CREATE TABLE Users (
    UsersID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Fname VARCHAR(250) NOT NULL,
    Lname VARCHAR(250) NOT NULL,
    RoleID TINYINT NOT NULL FOREIGN KEY REFERENCES Roles(RoleID)

);

CREATE TABLE ServiceStatuses (
    ServiceStatusID TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ServiceStatusName VARCHAR(255) NOT NULL
);

CREATE TABLE Guests (
    GuestID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    GuestName VARCHAR(250) NOT NULL,
    Notes VARCHAR(250),
    Birthday DATE NOT NULL DEFAULT(GETDATE()),
    CakeDay DATE NOT NULL DEFAULT(GETDATE()),
    ServiceStatusID TINYINT NOT NULL FOREIGN KEY REFERENCES ServiceStatuses(ServiceStatusID)
);

CREATE TABLE GuestStatues (
    ServiceStatusID TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    GuestStatusName VARCHAR(50) NOT NULL
);


CREATE TABLE TavernLocation(
    LocationID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    LocationName VARCHAR(255)
);

CREATE TABLE Taverns(
    TavernID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TavernName VARCHAR(255) NOT NULL,
    LocationID INT NOT NULL FOREIGN KEY REFERENCES TavernLocation(LocationID),
    OwnerID INT NOT NULL
);

CREATE TABLE Supplies (
    SupplyID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SupplyName VARCHAR(255) NOT NULL,
    SupplyUnit VARCHAR(255) NOT NULL
);

CREATE TABLE Services (
    ServicesID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ServiceName VARCHAR(255) NOT NULL,
    StatusID TINYINT NOT NULL FOREIGN KEY REFERENCES ServiceStatuses(ServiceStatusID),
    TavernID INT NOT NULL FOREIGN KEY REFERENCES Taverns(TavernID)
);

CREATE TABLE Classes(
    ClassID SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ClassName VARCHAR(50) NOT NULL
);
CREATE TABLE Levels(
    LevelID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    GuessID INT NOT NULL FOREIGN KEY REFERENCES Guests(GuestID),
    ClassID SMALLINT NOT NULL FOREIGN KEY REFERENCES Classes(ClassID),
    LevelDate DATE NOT NULL DEFAULT(GETDATE())
);

CREATE TABLE Counts(
    CountDate DATE NOT NULL DEFAULT(GETDATE()),
    SupplyID INT NOT NULL FOREIGN KEY REFERENCES Supplies(SupplyID),
    TavernID INT NOT NULL FOREIGN KEY REFERENCES Taverns(TavernID),
    CountDecimal DECIMAL(18,2)
);

CREATE TABLE Sales(
    SalesID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ServicesID INT NOT NULL FOREIGN KEY REFERENCES Services(ServicesID),
    GuestID INT NOT NULL FOREIGN KEY REFERENCES Guests(GuestID),
    SalesPrice DECIMAL(18,2),
    SaleSDate DATETIME NOT NULL DEFAULT(GETDATE()),
    SalesAmount INT NOT NULL,
    TavernID INT NOT NULL FOREIGN KEY REFERENCES Taverns(TavernID)
);

CREATE TABLE TavernReceived(
    TavernReceiveID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SupplyID INT NOT NULL FOREIGN KEY REFERENCES Supplies(SupplyID),
    TavernReceiveDate DATETIME NOT NULL DEFAULT(GETDATE()),
    TavernReceiveAmount DECIMAL(18,2),
    TavernReceiveCost DECIMAL(18,2),
    TavernID INT NOT NULL FOREIGN KEY REFERENCES Taverns(TavernID)
);

-- Roles Seeding
INSERT INTO Roles(RolesName, RolesDescription)
    VALUES('Chef','Cooking food'), ('Waiter','Serve the Customer'),('Cashier','Count the Money'),('Hostess','Greet the Customers'),('Dish Washer','Cleaning the dishes');
SELECT * FROM Roles;

-- User Seeding
INSERT INTO Users(Fname,Lname,RoleID)
    VALUES('Mike','Simmons',1),('Jim','Brown',3),('Lex','Angel',2),('Nik','Cildex',5), ('Joel','Allen',5);
SELECT * FROM Users;

-- ServiceStatus Seeding
INSERT INTO ServiceStatuses(ServiceStatusName)
    VALUES('Active'),('Inactice');
SELECT * FROM ServiceStatuses;

-- Guests Seeding
INSERT INTO Guests(GuestName, Notes, ServiceStatusID)
    VALUES('Kiki','I am a vegetarian',1),('Ray','I will be there at 9:00PM',1),('Kevin','Reservation for 2',1), ('Michael','Reservation for 10',1),('Ben','Canceling my reservation',1);
SELECT * FROM Guests;

-- GuestStatues Seeding
INSERT INTO GuestStatues(GuestStatusName)
    VALUES('Drunk'),('Happy'),('Sad');
SELECT * FROM GuestStatues;

-- TavernLocation Seeding
INSERT INTO TavernLocation(LocationName)
    VALUES('Philadelphia'),('Lumberton'),('CherryHill'),('FranklinMills'),('Allen Town');
SELECT * FROM TavernLocation;

-- Taverns Seeding
INSERT INTO Taverns(TavernName, LocationID,OwnerID)
    VALUES('The NightClown', 1, 2),('The Excited Bird Bar', 2, 1),('The Chilly Jester', 4, 2),('The Incredible Piano', 2, 1),('The Hissing Shoe', 3, 3);
SELECT * FROM Taverns;

-- Supplies Seeding
INSERT INTO Supplies(SupplyName, SupplyUnit)
    VALUES('Heineken', 'Cases'),('Vodka', '20 Ounches'),('Samuel Adams', ' 24 Ounches'),('Corona', '12 Ounches');
SELECT * FROM Supplies;

-- Services Seeding
INSERT INTO Services(ServiceName, StatusID, TavernID)
    VALUES('Pool',1,2),('Dance Club',2,4),('Buy 1 Get 1 free',1,5);
SELECT * FROM Services;

-- Classes Seeding
INSERT INTO Classes(ClassName)
    VALUES('Archer'),('Warrior'),('Wizard'),('Thief');
SELECT * FROM Classes;

-- Levels Seeding
INSERT INTO Levels(GuessID,ClassID)
    VALUES(1,1),(2,3),(4,1),(2,2);
SELECT * FROM Levels;

-- Levels Counts
INSERT INTO Counts(SupplyID,TavernID,CountDecimal)
    VALUES(1,1,123.14),(3,2,103.20),(3,1,155.75),(4,5, 200.50),(3,1,200.25);
SELECT * FROM Counts;

-- Levels Sales
INSERT INTO Sales(ServicesID,GuestID,SalesPrice,SalesAmount,TavernID)
    VALUES(1,1,150.50, 20, 1),(1,3,100.50, 200, 5),(2,4,100.50, 5, 4),(1,2,50.50, 30, 4),(1,1,190.50, 20, 1);
SELECT * FROM Sales;


-- Levels TavernReceived
INSERT INTO TavernReceived( SupplyID,TavernReceiveAmount,TavernReceiveCost,TavernID)
    VALUES(1, 100.50, 200.50, 1),(1, 120.50, 200.50, 1),(3, 120.50, 300.50, 3),(3, 100.50, 20.50, 3),(1, 102.50, 220.50, 3),(3, 100.50, 250.50, 4);
SELECT * FROM TavernReceived;


-- Alert Tables

ALTER TABLE Taverns ADD TavernOwnerName VARCHAR(255);
ALTER TABLE Taverns ADD TavernFloors INT;
ALTER TABLE Supplies ADD SuppliesFK INT;
ALTER TABLE Supplies ADD FOREIGN KEY(SuppliesFK) REFERENCES TavernLocation(LocationID);
