USE SampleEmpDB;  /*Use database*/
GO --break statement


SELECT * --Select all from employees.
FROM Employee;

SELECT TOP 2 * --Retrieve 2 rows from employees.
FROM Employee;

--Retrieve the first name and last name from employees.
SELECT FirstName,LastName
FROM Employee;

--Display firstname and last name and rename the column 'Naam' and 'Thar' respectively.
--ALAIS or Rename
SELECT FirstName AS 'Naam',LastName AS 'Thar'
FROM Employee;

--Display the name and salary of the employees.
SELECT FirstName,LastName,Salary
FROM Employee;

--Display the name and salary with 10% increment of the employees.
SELECT FirstName,LastName,Salary
	,Salary +(Salary*10/100) AS 'IncresedSalary'--Derived column
FROM Employee;

--Display the employees in alphabetic order of firstname.
SELECT FirstName,LastName,EmployeeId
FROM Employee
ORDER BY FirstName;