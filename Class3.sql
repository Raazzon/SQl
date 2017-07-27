USE SampleEmpDB;
GO

SELECT *
FROM Employee;

-- Display the firstname, Upper case firstname,lower case first name,first 3 characters of firstname,
--last three character of firstname and 3 characters of first name starting from nd character.
--Length of firstname.
SELECT 
	FirstName
	,UPPER(FirstName) AS 'UpperCase'
	,LOWER(FirstName) AS 'LowerCase'
	,LEFT(FirstName,3) AS 'First3'
	,RIGHT(FirstName,3) As 'Last3'
	,SUBSTRING(FirstName,2,3) AS 'Substring'
	,LEN(FirstName) AS 'Length'
FROM Employee;

--Display the employees sorted in order of the highest to lowest salary.
SELECT
	EmployeeId
	,FirstName
	,LastName
	,Salary
FROM Employee
ORDER BY Salary DESC;

--list the three highest paid employees.
SELECT TOP 3 
	FirstName
	,LastName
	,Salary
FROM Employee
ORDER BY Salary DESC;

--List the maximum salary,minimum salary,average salary among the employees.
SELECT 
	MAX(Salary) AS 'MaxSalary'
	,MIN(Salary) As 'MinSalary'
	,AVG(Salary) AS 'AvgSalary'
FROM Employee;

--Round off and nested functions.
SELECT 45.436
	,ROUND(45.436,2), ROUND(45.436,0), ROUND(45.436,-1)
	,MAX(Salary) AS 'MaxSalary'
	,MIN(Salary) As 'MinSalary'
	,ROUND(AVG(Salary),2) AS 'RoundedAvgSalary'
FROM Employee;

-- Display the employees with their ids. salaries and list based on the rank .
SELECT
	EmployeeId
	,FirstName
	,LastName
	,Salary
	,RANK() OVER (ORDER BY Salary DESC) AS 'Rank'
	,DENSE_RANK() OVER (ORDER BY Salary DESC) AS 'DenseRank'
	,ROW_NUMBER() OVER (ORDER BY Salary DESC) AS 'RowNumber'
FROM Employee;

--list the employees ranked to highest salary according to department id.
SELECT
	DepartmentId
	,FirstName
	,LastName
	,Salary
	,RANK() OVER (Partition BY DepartmentId ORDER BY Salary DESC) AS 'Rank'
FROM Employee
ORDER BY DepartmentId;

--Display the employees with their salaries and salary with a bonus of 3000.
SELECT 
	FirstName
	,LastName
	,Salary
	,ISNULL(Salary,0) 'NullRemovedSalary'
	,ISNULL(Salary,0) + 3000 AS 'SalaryWithBonus'
	,COALESCE(Salary,0) As 'COALESCESalary'
FROM Employee;

