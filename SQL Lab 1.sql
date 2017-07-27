--BASIC queries: SELECT and FROM CLAUSES.
--1#. Select ALL columns from Employee table.
USE SampleEmpDB;
SELECT *
FROM Employee;

--2.# Select Selected columns from Employee: Employee id, First name, Last name, and department id.
SELECT EmployeeId, FirstName, LastName, DepartmentId
FROM Employee;

----USING ARITHMETIC OPERATORS: + -  * /
--3.# List First name, last name, salary, and Salary increased by 3000.
SELECT FirstName, LastName, Salary, Salary + 3000
FROM Employee;

--4.# Operator precedence: /* same precedence, +- // same precedence left to right.
SELECT 9*4/2, 9/4*2, 9+4-2, 9-4+2
FROM Employee;

--5.# Operator precedence: ()brackets
SELECT FirstName, LastName, Salary, 12 * Salary + 100, 12 * (Salary + 100)
FROM Employee;

--6.# NULL values: (this e.g. Only for test.) // Any value operated with NULL results in Null.
SELECT EmployeeId, Supervisor, EmployeeId + Supervisor, EmployeeId * Supervisor
FROM Employee;

----Column ALIAS: AS (optional)
--7.# List First name, last name, Salary, and Salary raised by 3000; column aliased as 'NewSalary'
SELECT FirstName, LastName, Salary, Salary + 3000 AS 'NewSalary'
FROM Employee;

--8.# List First name, last name, salary, and salary raised by 5%.
--Rename columns as 'naam', 'thar', 'talab', 'naya_talab' repectively.
--Quotes are optional in sql server but recommended for clarity.
SELECT FirstName AS 'naam', LastName 'thar', Salary talab, (Salary + (Salary * 5 / 100)) AS 'naya_talab'
FROM Employee;

--CONCATENATION: + on string
--9.# List First name, last name, and full name combined of the employees.
SELECT FirstName, LastName, (FirstName + ' ' + LastName) AS 'FullName'
FROM Employee;

--10.# List All the employee records in the following format.
--Francis Acharyal lives in Sinamangal of Kathmandu.
SELECT FirstName, LastName, Street, City
	, (FirstName + ' ' + LastName + ' lives in ' +  Street + ' of ' + City) AS 'Sentence'
FROM Employee;
-- this Returns Nulls for some records as the City and/or Street are null for some rows.

--11.# to address this Problem:
SELECT FirstName, LastName, Street, City
	, (FirstName + ' ' + LastName + ' lives in ' +  ISNULL(Street, '') + ' of ' + ISNULL(City, '')) AS 'Sentence'
FROM Employee;
--ISNULL: function, to be covered later.

--DUPLICATE Rows
--12.# List ALL the Cities where employees live.
SELECT City
FROM Employee;

--13.# To eliminate duplicate rows:
SELECT DISTINCT City
FROM Employee;

--14.# List distinct address combinations of City and Street.
SELECT DISTINCT City, Street
FROM Employee;

--15.# List various Department id's in the bank.
SELECT DISTINCT DepartmentId
FROM Employee;