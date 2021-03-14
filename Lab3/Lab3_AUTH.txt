-- PLEASE CREATE THE STORED PROCEDURED IN 'JeremyEzellLab3', BEFORE RUNNING THE COMMANDS IN THIS FILE. THANK YOU! --

-- Creation Of Tables --
CREATE TABLE CustomerCredentials(
	CustomerCredentialsID int IDENTITY (1,1) NOT NULL,
	Username varchar(40) NOT NULL,
	PRIMARY KEY (CustomerCredentialsID));


CREATE TABLE EmployeeCredentials(
	EmpCredentialsID int IDENTITY (1,1) NOT NULL,
	EmpUsername nvarchar(50) NOT NULL,
	EmpPassword nvarchar(50) NOT NULL,
	PRIMARY KEY (EmpCredentialsID));


CREATE TABLE Pass(
	CustomerCredentialsID int FOREIGN KEY references CustomerCredentials(CustomerCredentialsID) NOT NULL,
	Username varchar(50) NOT NULL,
	PasswordHash varchar(256) NOT NULL,
	PRIMARY KEY (CustomerCredentialsID));

-- End Of Table Creations --


-- Declaration and Execution of Store Procedure
Declare @EmpUsername as NVARCHAR(40);
Declare @EmpPassword as NVARCHAR(40);

SET @EmpUsername = 'admin';
SET @EmpPassword = 'password';

EXEC JeremyEzellLab3 INSERT INTO EmployeeCredentials Values (@EmpUsername, @EmpPassword)