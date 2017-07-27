
USE SampleEmpDB;
GO

SELECT e.EmployeeId,e.FirstName,e.LastName,e.Salary,e.DepartmentId
	,(SELECT SUM(emp.Salary)
	FROM  Employee emp) AS'TotalSalary'
	,(SELECT SUM(emp.Salary)
	FROM  Employee emp
	WHERE emp.DepartmentId=e.DepartmentId) AS'DepartSalary'--Correlated Sub Query
FROM Employee AS e;