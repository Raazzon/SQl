USE SampleEmpDB;
GO
--Retrive all the tuples from employees table
SELECT *
FROM Employee;

--select selected columns from employee from Employee: Employee id,First Name, Last name,and department Id
SELECT EmployeeId,FirstName, LastName, DepartmentId
FROM Employee;

--List first name ,last name .salary and salary increased by 3000.
SELECT FirstName, LastName, Salary,Salary + 3000 AS 'IncreasedSaL'
FROM Employee;

--Precedence right to left.
SELECT 9*4/2,9/4*2,9+4-2,9-4+2
FROM Employee;

--NULL values:(this e.g. Only for test.)
--Any value operated with NULL results is null.
SELECT EmployeeId,SupervisorId
FROM Employee;

--CONCATINATION:+ on string
--List first name,last name as full namefrom employee.
SELECT FirstName, LastName,(FirstName +' '+ LastName) AS FullName
FROM Employee;

--List all the employees records in the following format.
--Ram Shrestha lives in Gausala of Kathmandu.
SELECT FirstName, LastName, Street,City,(FirstName +' '+ LastName+' lives in '+ Street+' of '+ City+'.') AS Sentence
FROM Employee;
--ISNULL(Column_name,Return Value)
SELECT FirstName, LastName, Street,City,(FirstName +' '+ LastName+' lives in '+ ISNULL(Street,'')
+' of '+ ISNULL(City,'')+'.') AS Sentence
FROM Employee;

--Duplicate Rows
--List all the cities where employees live.
-- Use DISTINCT clause
SELECT DISTINCT  City
FROM Employee;

--List distinct address acombinations of City and address.
SELECT DISTINCT Street,  City
FROM Employee;

--List all the employees who work in deparmrnt no.1.
SELECT *
FROM Employee
WHERE DepartmentId=1; --Not equal to symbol-> <>.

--List all the employees who donot work in deparmrnt no.1.
SELECT *
FROM Employee
WHERE ISNULL(DepartmentId,'0') <>'1' ;  --Not equal to symbol-> <>.

SELECT *
FROM Employee
WHERE DepartmentId<>1
	OR DepartmentId IS NULL;

--List employee id,firstname, and department id of employees with surname  Shrestha.
SELECT EmployeeId,FirstName,DepartmentId
FROM Employee
WHERE UPPER(LastName)='SHRESTHA';

SELECT EmployeeId,FirstName,DepartmentId
FROM Employee
WHERE LOWER(LastName)='shrestha';

--List employee id,firstname,lastname and salary of employee who earn more than 55,000.
SELECT EmployeeId,FirstName,LastName,Salary
FROM Employee
WHERE Salary > 55000;

--List employee id,firstname,lastname and salary of employee who earn between 55,000 and 20,000.
SELECT EmployeeId,FirstName,LastName,Salary
FROM Employee
WHERE Salary >=20000
	AND Salary<=55000;

--OR
SELECT EmployeeId,FirstName,LastName,Salary
FROM Employee
WHERE Salary BETWEEN 20000 AND 55000;

SELECT EmployeeId,FirstName,LastName,Salary
FROM Employee
WHERE (Salary =20000 OR Salary >20000)
	AND (Salary=55000 OR Salary<55000);   --NOT has the highest execution precedence following AND and OR.

--List employee id,firstname,lastname,city,department id  and salary of the employeewho earn more than 50,000
-- and live in Kathmandu and work either in department no 1 or 2. 
SELECT EmployeeId,FirstName,LastName,Salary,DepartmentId
FROM Employee
WHERE Salary>50000
	AND UPPER(City)='KATHMANDU'
	AND (DepartmentId=1
	OR DepartmentId=2);
--List employeeid,firstname,lastname,city,departmentid working in department no 1,2 and 5.
SELECT EmployeeId,FirstName,LastName,Salary,DepartmentId
FROM Employee
WHERE (DepartmentId=1
	OR DepartmentId=2
	OR DepartmentId=5);
--OR
SELECT EmployeeId,FirstName,LastName,Salary,DepartmentId
FROM Employee
WHERE DepartmentId IN (1,2,5);

--LIst all the employees whose firstname starts from uppercase S.
SELECT * 
FROM Employee
WHERE FirstName LIKE 'S%';   --Wildcard character %(all character e.g Sun,Shasi,Shirish),_(only one charactere.g.Sun,Son)

--LIst all the employees whose firstname starts from uppercase S has 4 character.
SELECT * 
FROM Employee
WHERE FirstName LIKE 'S____';

--LIst all the employees whose firstname consists lower s.
SELECT * 
FROM Employee
WHERE FirstName LIKE '%s%';
