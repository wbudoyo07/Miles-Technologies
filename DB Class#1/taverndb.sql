CREATE DATABASE taverndb
GO
USE taverndb
GO

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
    userDescription varchar(255)
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
    suppliyDate varchar(255) NOT NULL,
);