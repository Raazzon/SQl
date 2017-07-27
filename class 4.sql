USE SampleEmpDB;
GO
--Retrive 10 highest paid employees.
SELECT TOP (10)
	Salary
FROM Employee
ORDER BY Salary DESC;
--OR
SELECT *
FROM Employee
ORDER BY Salary DESC
	OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;-- FETCH TOP TEN EMPLOYEES

--Retrieve 10% of the best paid employee.
SELECT TOP 10 PERCENT *
FROM Employee
ORDER BY Salary DESC;


--5 best paid employess from 3 onwards.
SELECT *
FROM Employee
ORDER BY Salary DESC
	OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;

--RETRIVE ALL THE EMPLOYES WHOSE FIRST NAME STARTS WITH 'B'
SELECT
	FirstName
FROM Employee
WHERE FirstName LIKE 'B%';

--RETRIVE ALL THE EMPLOYES WHOSE FIRST NAME STARTS WITH 'B' OR 'S'
SELECT
	FirstName
FROM Employee
WHERE FirstName LIKE 'B%'
	OR FirstName LIKE 'S%';

--RETRIVE ALL THE EMPLOYES WHOSE FIRST NAME STARTS WITH 'B',S,G OR R.
SELECT
	FirstName
FROM Employee
WHERE FirstName LIKE '[BSGR]%';

--RETRIVE ALL THE EMPLOYES WHOSE FIRST NAME has an 'A'Or 'I' in the second character.
SELECT
	FirstName
FROM Employee
WHERE FirstName LIKE '_a%'
	 OR FirstName LIKE '_i%';
-- OR
SELECT
	FirstName
FROM Employee
WHERE FirstName LIKE '_[ai]%';

--RETRIVE ALL THE EMPLOYES WHOSE CITIZENSHIP number has 4 to 7 last character.
SELECT
	FirstName
	,CitizenshipNo
FROM Employee
WHERE CitizenshipNo LIKE '%[4-7]';

--RETRIVE ALL THE EMPLOYES WHOSE lastname has a to g as last character.
SELECT
	FirstName
	,LastName
FROM Employee
WHERE LastName LIKE '%[a-g]';

--RETRIVE ALL THE EMPLOYES WHOSE lastname has 'h' or 't' in the second last character.
SELECT
	FirstName
	,LastName
FROM Employee
WHERE LastName LIKE '%[ht]_';

--List the maximum salary of the organization.
SELECT MAX(Salary)
FROM Employee;



--List the maximum salary of the organization by department wise.
SELECT DepartmentId,MAX(Salary)
FROM Employee
GROUP BY DepartmentId;

--List the maximum salary of the organization by department wise partitionedaccording to their cities..
SELECT DepartmentId,City,MAX(Salary) AS 'MaxSalary'
FROM Employee
GROUP BY DepartmentId,City
ORDER BY DepartmentId,City;

--list the employees who work in departmnet 5 and live in lalitpur..
SELECT *
FROM Employee
WHERE DepartmentId =5
	AND LOWER(City)= 'lalitpur';

SELECT *
FROM Employee
WHERE Salary NOT BETWEEN 20000 AND 60000;

--List the employees whose salary is more than the average salary.
--(Nested Query )
SELECT *
FROM Employee
WHERE Salary > (
	SELECT AVG(Salary)
	FROM Employee
);

--list the employees whose earn more than RAm Shrestha.
SELECT *
FROM Employee
WHERE Salary > (
	SELECT Salary
	FROM Employee
	WHERE UPPER(FirstName)='RAM' AND UPPER(LastName)='SHRESTHA'
);

--list the employees whose earn more than Ram.
SELECT *
FROM Employee
WHERE Salary > (
	SELECT TOP 1 Salary
	FROM Employee
	WHERE UPPER(FirstName)='RAM'
);
--list the employees whose live in the cities same as that of employees from department 5.
SELECT *
FROM Employee
WHERE City IN(
	SELECT City
	FROM Employee
	WHERE DepartmentId=5
);

--list the employees who have a common supervisor as that of ram shrestha.
SELECT *
FROM Employee
WHERE SupervisorId = (
	SELECT SupervisorId
	FROM Employee
	WHERE UPPER(FirstName)='RAM' AND UPPER(LastName)='SHRESTHA'
);

--list the employees along with their department id.
SELECT*
FROM Employee;

SELECT *FROM Employee;
SELECT* FROM Department;

--Count no of rows.
SELECT COUNT(*) FROM Employee;

--list the employees along with their department id and department name.
SELECT EmployeeId,E.FirstName,E.LastName,E.DepartmentId,D.DepartmentName
FROM Employee AS E, Department AS D
WHERE E.DepartmentId=D.DepartmentId;


--list the employees along with their departmentid,department name and office address.
SELECT EmployeeId,E.FirstName,E.LastName,E.DepartmentId,D.DepartmentName,L.City,L.Street
FROM Employee AS E, Department AS D,Location AS L
WHERE E.DepartmentId=D.DepartmentId
     AND D.LocationId=L.LocationId;

--you must have n-1 joining condition to join n number of tables with cartesian product.

--list all the employees with their employees department names.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.Street,D.DepartmentId,D.DepartmentName
FROM Employee AS E,Department AS D
WHERE E.DepartmentId=D.DepartmentId;

-- list the employees who work in information systm department.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.Street,D.DepartmentId,D.DepartmentName
FROM Employee AS E,Department AS D
WHERE E.DepartmentId=D.DepartmentId
	AND LOWER(D.DepartmentName) = 'information system';
--list the employees who work in IS department and live in gausala of kathmanduand earn more than 40,000.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.City,E.Street,D.DepartmentId,D.DepartmentName
FROM Employee AS E,Department AS D
WHERE E.DepartmentId=D.DepartmentId
	AND LOWER(D.DepartmentName) = 'information system'
	AND LOWER(E.Street)='gaushala'
	AND E.Salary > 40000;

--list the employees with their home and office.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.City AS 'Home City',E.Street AS 'Home Street'
,D.DepartmentId,D.DepartmentName,L.City AS 'Office City',L.Street AS 'Office Street'
FROM Employee AS E,Department AS D,Location AS L
WHERE E.DepartmentId=D.DepartmentId
	AND D.LocationId=L.LocationId;

--LIst the employees who earn more than 20000 and work in Baneshwor of Kathmandu.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.City AS 'Home City',E.Street AS 'Home Street'
		,L.City AS 'Office City',L.Street AS 'Office Street'
FROM Employee AS E,Department AS D,Location AS L
WHERE E.DepartmentId=D.DepartmentId
	AND D.LocationId=L.LocationId
	AND E.Salary> 20000
	AND LOWER(L.City)='kathmandu'
	AND LOWER(L.Street)='baneshwor'
	;
--Rewrting above query using Join clause.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary,E.City AS 'Home City',E.Street AS 'Home Street'
		,L.City AS 'Office City',L.Street AS 'Office Street'
FROM Employee AS E
	JOIN Department AS D ON E.DepartmentId=E.DepartmentId 
	JOIN Location AS L ON D.LocationId=L.LocationId
	WHERE E.Salary> 20000
	AND LOWER(L.City)='kathmandu'
	AND LOWER(L.Street)='baneshwor';

--list the employees who work in Is department and earn more than 50,000 and have '111' as supervisor.
SELECT E.EmployeeId,E.FirstName,E.LastName,E.Salary
	,E.City AS 'Home City',E.Street AS 'Home Street',E.SupervisorId
		,L.City AS 'Office City',L.Street AS 'Office Street'
FROM Employee AS E
	JOIN Department AS D ON E.DepartmentId=E.DepartmentId 
	JOIN Location AS L ON D.LocationId=L.LocationId
	WHERE E.Salary> 50000
	AND E.SupervisorId=111;

--List all the employees with their departments.
SELECT EmployeeId,E.FirstName,E.LastName,D.DepartmentId,D.DepartmentName
FROM Employee AS E
	 FULL OUTER JOIN Department AS D ON E.DepartmentId=D.DepartmentId;

-- If u want matching rows and non-matching row from left than left outer.
SELECT EmployeeId,E.FirstName,E.LastName,D.DepartmentId,D.DepartmentName
FROM Employee AS E
	 LEFT OUTER JOIN Department AS D ON E.DepartmentId=D.DepartmentId;

-- If u want matching rows and non-matching row from right than left outer.
SELECT EmployeeId,E.FirstName,E.LastName,D.DepartmentId,D.DepartmentName
FROM Employee AS E
	 RIGHT OUTER JOIN Department AS D ON E.DepartmentId=D.DepartmentId;

	--inserting data into table
	/* INSERT INTO Department
	 VALUES (6,'Counseling',4,103);*/

--list all the departments in alphabetical order with their employees.
SELECT E.EmployeeId,E.FirstName,E.LastName,D.DepartmentId,D.DepartmentName
FROM Department AS D
	 LEFT OUTER JOIN Employee AS E ON D.DepartmentId=E.DepartmentId
	 ORDER BY D.DepartmentName;
--list all the employees with their supervisor id.
SELECT E.EmployeeId,E.FirstName AS'Employee FName',E.LastName AS 'Employee LasstName',E.SupervisorId
	,S.FirstName AS'Supervisor FName',S.LastName AS 'Supervisor Lastname'
FROM Employee AS E
	LEFT OUTER JOIN Employee AS S ON E.SupervisorId=S.EmployeeId;

--Nested Query
--List all the employees who work in IS department,
SELECT E.EmployeeId,E.FirstName,E.LastName
FROM Employee AS E
WHERE E.DepartmentId=(
	SELECT D.DepartmentId
	FROM Department AS D
	WHERE LOWER(D.DepartmentName)='information system'
);

