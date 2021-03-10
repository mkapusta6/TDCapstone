CREATE PROCEDURE JeremyEzellLab3
	@EmpUsername AS NVARCHAR(50),
	@EmpPassword AS NVARCHAR(50)

as
BEGIN

	SET NOCOUNT ON;
	
	SELECt EmpUsername, EmpPassword
	FROM EmployeeCredentials
	WHERE EmpUsername = @EmpUsername 
	AND EmpPassword = @EmpPassword;

END;