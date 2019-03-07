CREATE DATABASE tavernDb
GO
USE tavernDb

CREATE TABLE Tavern
(
    tavernID int PRIMARY KEY NOT NULL,
    tavernName varchar(255) NOT NULL,
    tavernLocation varchar(255) NOT NULL,
    tavernOwner varchar(255) NOT NULL,
    tavernFloor int NOT NULL
);

CREATE TABLE User
(
    userID int PRIMARY KEY NOT NULL,
    userName varchar(255) NOT NULL,
    userRole varchar(255) NOT NULL,
);


CREATE TABLE Rats 
(
    ratID int PRIMARY KEY NOT NULL,
    ratsNumber int
);


CREATE TABLE Supplies
(
    supplyID int PRIMARY KEY NOT NULL,
    supplyName varchar(255) NOT NULL,
    supplyUnit int NOT NULL,
    supplyDate varchar(255) NOT NULL,
);

CREATE TABLE Inventory 
(
    InventoryID int PRIMARY KEY NOT NULL,
    supplyID int,
    tavernID int,
    cost int NOT NULL
);

CREATE TABLE Services
(
    servicesID int PRIMARY KEY NOT NULL,
    servicesName varchar(255) NOT NULL,
);

CREATE TABLE servicesStatus
(
    servicesStatusID int PRIMARY KEY NOT NULL,
    servicesStatusName varchar(255) NOT NULL
);


-- SEEDING  TAVERN TABLE --

INSERT Tavern( tavernID, tavernName, tavernLocation, tavernOwner, tavernFloor)
    VALUES(1, 'Wizz Tavern', 'Philadelphia', 'Mike', 3)

INSERT Tavern( tavernID, tavernName, tavernLocation, tavernOwner, tavernFloor)
    VALUES(2, 'The Third Hog', 'New Jersey', 'Yessi', 2)

INSERT Tavern( tavernID, tavernName, tavernLocation, tavernOwner, tavernFloor)
    VALUES(3, 'The Messy Angel', 'California', 'Ricky', 1)

INSERT Tavern( tavernID, tavernName, tavernLocation, tavernOwner, tavernFloor)
    VALUES(4, 'The French Yak Bar', 'New York', 'Milly', 1)

INSERT Tavern( tavernID, tavernName, tavernLocation, tavernOwner, tavernFloor)
    VALUES(5, 'The Flashy Cake Inn', 'Philadelphia', 'Aaron', 2)

-- SEEDING USER TABLE --

INSERT User( userID, userName, userRole)
    VALUES(1, 'Lorry', 'Cashier')

INSERT User( userID, userName, userRole)
    VALUES(2, 'Ricky', 'Dish Washer')

INSERT User( userID, userName, userRole)
    VALUES(3, 'Mina', 'Chef')

INSERT User( userID, userName, userRole)
    VALUES(4, 'Larry', 'Server')

INSERT User( userID, userName, userRole)
    VALUES(5, 'Stark', 'Server')


-- SEEDING RATS TABLE --
INSERT Rats( ratID, ratsNumber)
    VALUES(1, 10)

INSERT Rats( ratID, ratsNumber)
    VALUES(2, 100)

INSERT Rats( ratID, ratsNumber)
    VALUES(3, 15)

INSERT Rats( ratID, ratsNumber)
    VALUES(4, 0)

INSERT Rats( ratID, ratsNumber)
    VALUES(5, 9)


-- SEEDING  TAVERN TABLE --
INSERT Supplies (supplyID, supplyName, supplyUnit, supplyDate) 
    VALUES(1, 'Heineken', 100,'July 7, 2019')

INSERT Supplies (supplyID, supplyName, supplyUnit, supplyDate) 
    VALUES(2, 'Vodka', 50,'June 17, 2019')

INSERT Supplies (supplyID, supplyName, supplyUnit, supplyDate) 
    VALUES(3, 'Henesys', 1000,'June 20, 2019')

INSERT Supplies (supplyID, supplyName, supplyUnit, supplyDate) 
    VALUES(4, 'Corona', 109,'June 5, 2019')

INSERT Supplies (supplyID, supplyName, supplyUnit, supplyDate) 
    VALUES(5, 'Budweiser', 300,'June 28, 2019')

-- SEEDING INVENTORY TABLE --
INSERT Inventory (InventoryID, supplyID, tavernID, cost) 
    VALUES(1, 2, 3, 1000)

INSERT Inventory (InventoryID, supplyID, tavernID, cost) 
    VALUES(2, 1, 1, 1500)

INSERT Inventory (InventoryID, supplyID, tavernID, cost) 
    VALUES(3, 3, 4, 3000)

INSERT Inventory (InventoryID, supplyID, tavernID, cost) 
    VALUES(4, 5, 3, 500)

INSERT Inventory (InventoryID, supplyID, tavernID, cost) 
    VALUES(5, 3, 2, 1200)

-- SEEDING  SERVICE TABLE --

INSERT Services (servicesID, servicesName) 
    VALUES(1, 'Weapon Sharpening')

INSERT Services (servicesID, servicesName) 
    VALUES(2, 'Hunting')

INSERT Services (servicesID, servicesName) 
    VALUES(3, 'Job Posting')

INSERT Services (servicesID, servicesName) 
    VALUES(4, 'Pool')

INSERT Services (servicesID, servicesName) 
    VALUES(5, 'Dancing Class')

-- SEEDING SERVICESSTATUS TABLE -- 
INSERT servicesStatus (servicesStatusID, servicesStatusName) 
    VALUES(1, 'Inactive')

INSERT servicesStatus (servicesStatusID, servicesStatusName) 
    VALUES(2, 'Active')

INSERT servicesStatus (servicesStatusID, servicesStatusName) 
    VALUES(3, 'Active')

INSERT servicesStatus (servicesStatusID, servicesStatusName) 
    VALUES(4, 'Inactive')

INSERT servicesStatus (servicesStatusID, servicesStatusName) 
    VALUES(5, 'Active')