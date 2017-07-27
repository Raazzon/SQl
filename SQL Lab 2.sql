--RESTRICTING Rows using WHERE CLAUSE!!
Use SampleEmpDB;
go

--1#. List ALL the employees who work in Department no. 90.
SELECT * 
FROM Employee
WHERE DepartmentId = 90;

--2.# List the Employee id, last name, and department id of the employees who work in department id. 80.
SELECT EmployeeId, LastName, DepartmentId
FROM Employee
WHERE DepartmentId = 80;

--3.# List the Employee id, first name, and department id of the employees with the surname 'Shrestha'.
--String literlas are enclosed by single quote marks.
SELECT EmployeeId, FirstName, DepartmentId
FROM Employee
WHERE LastName = 'Shrestha';
--The string literal (Shrestha) should be enclosed in single quotes, and the values to compare are case sensitive.

SELECT EmployeeId, FirstName, DepartmentId
FROM Employee
WHERE LastName = 'SHRESTHA';
-- NOT SAME. values are case sensitive.
--COMPARISION conditions: =, >, >=, <, <=, <>

--4.# List Employee id, first name, last name, department id of the employees other than with Surname 'Shrestha'
SELECT EmployeeId, FirstName, LastName, DepartmentId
FROM Employee
WHERE LastName <> 'Shrestha';

--5.# List Employee id, first name, last name, and salary of the employees who earn more than 1,50,000.
SELECT EmployeeId, FirstName, LastName, Salary
FROM Employee
WHERE Salary > 150000;

--6.# List Employee id, first name, last name, and salary of the employees who earn
-- between 1,50,000 and 2,00,000.
SELECT EmployeeId, FirstName, LastName, Salary
FROM Employee
WHERE Salary >= 150000
	AND Salary <= 200000;
--The conditions can be combined with logical operators: AND, OR..

--Alternatively, for #6.: BETWEEN Operator.
SELECT EmployeeId, FirstName, LastName, Salary
FROM Employee
WHERE Salary BETWEEN 150000 AND 200000;

----AND // OR
--7.# List Employee id, first name, last name, City, department id, and salary of the employees who earn more
--then 50,000 and live in Kathmandu.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE Salary > 50000
	AND City = 'Kathmandu';

--8.# List Employee id, first name, last name, City, department id, and salary of the employees who earn more
--then 50,000 and live in Kathmandu, and work in department no. 80.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE Salary > 50000
	AND City = 'Kathmandu'
	AND DepartmentId = 80;

--9.# List Employee id, first name, last name, city, department id, and salary of the employees who earn more
--then 50,000 and live in Kathmandu; and work in either department no. 80 or 10.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE Salary > 50000
	AND City = 'Kathmandu'
	AND (DepartmentId = 80
		OR DepartmentId = 10);
--Use parentheses to properly group the CONDITIONS.

--The following query for the same qus. will return WRONG result. (Watch the city)
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE Salary > 50000
	AND City = 'Kathmandu'
	AND DepartmentId = 80
	OR DepartmentId = 10;
--The Operator AND takes higher pecedence Over OR.

--In the following 	query, (Salary > 50000 AND City = 'Kathmandu') and (DepartmentId = 10 AND DepartmentId = 80)
-- are evaluated separately first then OR is executed between the two results. The second part is logically
-- incorrect as an employee cannot be in both in Departments 10 & 80. So, the result is equivalnet to the
-- first part ONLY.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE Salary > 50000
	AND City = 'Kathmandu'
	OR DepartmentId = 10
	AND DepartmentId = 80;
	
--NULL values.
--10.# List Employee id, First name, last name, city, department id of the employees whose city
-- address is null.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE City IS NULL;

--Null values CANNOT be Compared using comparision operators: e.g. = // A Null value is not equal
-- to even ANOTHER Null value.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE City = NULL;

--11.# List Employee id, First name, last name, city, department id of the employees whose city
-- address is not null.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE City IS NOT NULL;

----Matching a LIST of Values.
--12.# List Employee id, First name, last name, city, department id of the employees who work in
-- departments 20, 50, 80, or 90.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE DepartmentId = 20
	OR DepartmentId = 50
	OR DepartmentId = 80
	OR DepartmentId = 90;

--Alternatively, for ease, IN Operator can be used to match a value from LIST.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE DepartmentId IN (20, 50, 80, 90);

--13.# List Employee id, First name, last name, city, department id of the employees who live
-- in either Kathmandu, or Bhaktapur.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE City in ('Kathmandu', 'Bhaktapur');
--IN Can be used with both Numerical values, and strings.

----STRING Comparision with pattern: LIKE operator
--14.# List all the employees whose first name starts with an upper case 'S'.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE 'S%';

--LIKE Operator uses Wildcard characters % (percentage): any no. of characters
-- and _ (underscore): exactly One character.

--15.# List all the employees whose first name starts with an upper case 'S' and 
-- ends with lower case 'n'.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE 'S%n';

--16.# List all the employees whose first name starts with an upper case 'S' and 
-- has 5 characters.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE 'S____';
--S followed by 4 underscores

--17.# List all the employees whose first name starts with an upper case 'S' followed by lowercase
-- letter 'u'.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE 'Su%';

--18.# List all the employees whose first name consists a lower case letter 's'.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE '%s%';

--19.# List all the employees whose First name OR Last name consists an Upper case letter 'A'.
SELECT EmployeeId, FirstName, LastName, City, DepartmentId, Salary
FROM Employee
WHERE FirstName LIKE '%A%'
	OR LastName LIKE '%A%';

----ORDERING the Result Set: ORDER BY Clause.
--20.# List all the employees Sorted in ascending alphabetical order of the first name.
SELECT *
FROM Employee
ORDER BY FirstName ASC;
--ORDER BY clause takes operators ASC (for ascending) and DESC (for descending). If nothing is provided,
-- ASC is assumed default.

SELECT *
FROM Employee
ORDER BY FirstName;

--21.# List all the employees Sorted in descending alphabetical order of the first name.
SELECT *
FROM Employee
ORDER BY FirstName DESC;

--22.# List First name, Last name, Department id, and City of all the employees 
-- Sorted in Ascending order of the Department id, then City in Ascending order, followed by
-- Last name In descending order.
SELECT FirstName, LastName, DepartmentId, City
FROM Employee
ORDER BY DepartmentId ASC, City ASC, LastName DESC;
-- Multiple columns can be used to sort. ASC is optional but DESC Is mandarory.

--23.# List First name, Last name, Department id of the employees. Alias the columns as
-- 'Naam', 'Thar', and 'Bibhag' respectively. Sort the result set in ascending order of 'Bibhag'.
SELECT FirstName 'Naam', LastName 'Thar', DepartmentId 'Bibhag'
FROM Employee
ORDER BY Bibhag;
--The ORDER BY clause is evaluated at last, so Column Alias can be used In ORDER BY clause 
--to sort the result set.

--Column alias CANNOT However be used with WHERE Clause.
--24.# List First name, Last name, Department id of the employees who work in department no.# 10.
SELECT FirstName 'Naam', LastName 'Thar', DepartmentId 'Bibhag'
FROM Employee
WHERE Bibhag = 10;
--Returns ERROR.
----MORE ON THIS Later.