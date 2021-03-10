CREATE TABLE Customer
	(CustomerID int IDENTITY(1,1),
	CustomerFirstName varchar(40) NOT NULL,
	CustomerLastName varchar(40) NOT NULL,
	InitialContact varchar(40) NULL,
	Discovered varchar(40) NULL,
	CustomerPhone BigInt NOT NULL,
	CustomerInterest varchar(40) NULL,
	CustomerEmail varchar(40) NOT NULL,
	CustomerState varchar(40) NOT NULL,
	CustomerCity varchar(40) NOT NULL,
	CustomerZip varchar(10) NOT NULL,
	CustomerDate dateTime NULL,
	CustomerName varchar(40) NOT NULL,
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));

INSERT INTO Customer (CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerName) VALUES ('Noah', 'Khan', '5404244549', 'khan2na@dukes.jmu.edu', 'VA', 'Fredericksburg', '22801', 'Noah Khan');
INSERT INTO Customer (CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerName) VALUES ('Kobe', 'Bryant', '7039669495', 'mamba@gmail.com', 'CA', 'Los Angeles', '22315', 'Kobe Bryant');
INSERT INTO Customer (CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerName) VALUES ('Dwight', 'Schrute', '8089091011', 'schrute@hotmail.com', 'PA', 'Colonial', '21121', 'Dwight Schrute');
INSERT INTO Customer (CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerName) VALUES ('Chase', 'Young', '7573420908', 'cyoung@aol.com', 'VA', 'D.C.', '22318', 'Chase Young');


Create Table Request(
	RequestID int IDENTITY(1,1) NOT NULL,
	EmailRequest varchar(50) NOT NULL,
	ServiceType varchar(25) NOT NULL,
	R_Description varchar(MAX) NOT NULL,
	R_Date datetime NOT NULL,
CONSTRAINT Request_PK PRIMARY KEY (RequestID));


CREATE TABLE Employee
	(EmployeeID int IDENTITY(1,1),
	EmployeeName varchar(40) NOT NULL,
	EmployeePhone BigInt NULL,
	CustomerEmail varchar(40) NOT NULL,
	EmployeeType varchar(20) NOT NULL,
	EmployeeTerm varchar(20) NULL,
CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID));

INSERT INTO Employee VALUES ('Dante Jack', '5403322345', 'jack@dukes.jmu.edu', 'Mover', 'Part-Time');
INSERT INTO Employee VALUES ('George Uzumaki', '8937465092', 'uzumaki@dukes.jmu.edu', 'Auctioner', 'Full-Time');
INSERT INTO Employee VALUES ('Cal Freezy', '8976438902', 'cal@dukes.jmu.edu', 'Mover', 'Seasonal');
INSERT INTO Employee VALUES ('Joe Dimagio', '3478902987', 'joe@dukes.jmu.edu', 'Manager', 'Full-Time');




CREATE TABLE Equipment
	(EquipmentID int IDENTITY(1,1),
	EquipmentType varchar(20) NOT NULL,
	EquipmentCount int NULL,
	EquipmentDescription varchar(30) NOT NULL);



CREATE TABLE Service_T
	(ServiceID int IDENTITY(1,1),
	ServiceType varchar(30) NOT NULL,
	DateStarted date NULL,
	DateCompleted date NULL,
	DateLastModified date NOT NULL,
	CompletionPercentage varchar(10) NULL,
	ServiceDescription varchar(45) NOT NULL,
CONSTRAINT Service_PK PRIMARY KEY (ServiceID));

INSERT INTO Service_T (ServiceType, DateStarted, DateLastModified, ServiceDescription)  VALUES ('Auction', '02/01/2021', '02/25/2021', 'Auctioning used car');
INSERT INTO Service_T (ServiceType, DateStarted, DateLastModified, DateCompleted, ServiceDescription)  VALUES ('Auction', '01/03/2021', '01/15/2021', '01/16/2021', 'Auctioning autographed basketball');
INSERT INTO Service_T (ServiceType, DateStarted, DateLastModified, ServiceDescription)  VALUES ('Moving', '12/18/2020', '02/15/2021', 'Random office service');
INSERT INTO Service_T (ServiceType, DateStarted, DateLastModified, ServiceDescription)  VALUES ('Miscellaneous', '12/01/2020', '02/18/2021', 'Moving furniture');


CREATE TABLE ServiceTicket
	(ServiceTicketID int IDENTITY(1,1),
	TicketStatus varchar(30) NOT NULL,
	TicketStartDate date NOT NULL,
	CustomerID int NOT NULL,
	ServiceID int NOT NULL,
	EmployeeID int NOT NULL,
	ServiceTicketName varchar(40)NOT NULL,
CONSTRAINT ServiceTicket_PK PRIMARY KEY (ServiceTicketID),
CONSTRAINT ServiceTicket_FK1 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
CONSTRAINT ServiceTicket_FK2 FOREIGN KEY (ServiceID) REFERENCES Service_T(ServiceID),
CONSTRAINT ServiceTicket_FK3 FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID));

INSERT INTO ServiceTicket VALUES ('New', '02/12/2021', '1', '1', '1', 'Noah Khans Ticket');
INSERT INTO ServiceTicket VALUES ('New', '02/15/2021', '2', '2', '2', 'Kobe Bryants Ticket');
INSERT INTO ServiceTicket VALUES ('New', '02/18/2021', '3', '3', '3', 'Dwight Schrutes Ticket');
INSERT INTO ServiceTicket VALUES ('New', '02/18/2021', '4', '4', '4', 'Chase Youngs Ticket');



CREATE TABLE TicketHistory
	(TicketHistoryID int IDENTITY(1,1),
	TicketMovingStatus varchar(40)NOT NULL,
	TicketDateChanged date NOT NULL,
	ServiceTicketID int NOT NULL,
	EmployeeID int NOT NULL,
	NoteHeading varchar(30) NULL,
	NoteContents varchar(MAX),
CONSTRAINT TicketHistory_PK PRIMARY KEY (TicketHistoryID),
CONSTRAINT TicketHistory_FK1 FOREIGN KEY (ServiceTicketID) REFERENCES ServiceTicket(ServiceTicketID),
CONSTRAINT TicketHistory_FK2 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID));

INSERT INTO TicketHistory VALUES ('New', '02/20/2021', '1', '1','Email Confirmation', 'Call to confirm Email.');
INSERT INTO TicketHistory VALUES ('New', '02/20/2021', '2', '2','Award Auction', 'Auctioning Trophies.');
INSERT INTO TicketHistory VALUES ('New', '02/20/2021', '3', '3','Dunder Miflin Printer Moving', 'Moving printers to new location.');
INSERT INTO TicketHistory VALUES ('New', '02/20/2021', '4', '4','Random Task', 'Clean out storage garage.');




CREATE TABLE Workflow
	(WorkflowID int IDENTITY(1,1),
	WorkflowStatus varchar(50) NOT NULL,
	ServiceID int NOT NULL);

CREATE TABLE Inventory
	(ItemID int IDENTITY(1,1),
	ItemType varchar(20) NULL,
	ItemCount int NULL,
	ItemCost money NULL,
	ItemDescription varchar(45) NOT NULL,
	WorkflowID int NOT NULL);

CREATE TABLE CustomerWorkflow
	(CustomerPhone BigInt NOT NULL,
	WorkflowID int NOT NULL,
	WorkflowDate date NULL,
	WorkflowCost money NULL);

CREATE TABLE EquipmentService
	(ServiceID int NOT NULL,
	EquipmentID int NOT NULL,
	EquipmentStatus date NULL);


CREATE TABLE EmployeeWorkflow
	(EmployeeID int NOT NULL,
	WorkflowID int NOT NULL);


Create Table Auction(
	AuctionID int IDENTITY(1,1) NOT NULL,
	AuctionHeading varchar(50) NOT NULL,
	AuctionDate DateTime NOT NULL,
	R_CustomerName varchar(30) NOT NULL,
	R_Item varchar(50),
	CustomerID int NOT NULL,
CONSTRAINT Auction_PK PRIMARY KEY (AuctionID),
CONSTRAINT Auction_FK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)); 

INSERT INTO Auction (AuctionHeading, AuctionDate, R_CustomerName, R_Item, CustomerID) VALUES ('Clothing Auction', '03/03/2021', 'Noah Khan', 'Clothing', '1');
INSERT INTO Auction (AuctionHeading, AuctionDate, R_CustomerName, R_Item, CustomerID) VALUES ('Basketball Auction', '03/08/2021', 'Kobe Bryant', 'Clothing', '2');