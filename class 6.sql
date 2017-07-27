USE SampleEmpDB;
GO


--list all employees working in IT department.
SELECT *
FROM Employee
WHERE DepartmentId=(
	SELECT DepartmentId
	FROM Department
	WHERE LOWER(DepartmentName) = 'information system'
	);

--List employess from each department with lowest salary.
SELECT e.EmployeeId,e.FirstName,e.LastName,e.Salary,d.DepartmentId,d.DepartmentName
FROM Employee AS e
	JOIN Department AS d ON e.DepartmentId =d.DepartmentId
WHERE e.Salary=(
	SELECT MIN(ei.Salary)
	FROM Employee AS ei
	WHERE ei.DepartmentId=e.DepartmentId
	);
--List the top 2 salary earning employees from every department.
SELECT *
FROM(
	SELECT e.EmployeeId,e.FirstName,e.LastName,e.Salary,d.DepartmentId,d.DepartmentName,
	ROW_NUMBER() OVER(PARTITION BY e.DepartmentId ORDER BY Salary DESC) 'SalRank'
	FROM Employee AS e
	JOIN Department AS d ON e.DepartmentId=d.DepartmentId 
	--ORDER BY e.DepartmentId
	) AS a
WHERE a.SalRank <=2
ORDER BY a.DepartmentId;

/*
Table Expression
->Derived Table
->CTE(Common Table Expression)
->View
->Inline Table Valued Function
*/

--CTE
WITH RankedSalary (DeptId,DetName,SalRank,FName,LName,Salary)
AS(
	SELECT e.DepartmentId,d.DepartmentName,
		ROW_NUMBER() OVER(PARTITION BY e.DepartmentId ORDER BY Salary DESC) 'SalRank'
		,e.FirstName,e.LastName,e.Salary
	FROM Employee AS e
		JOIN Department AS d ON e.DepartmentId=d.DepartmentId
	)
SELECT * 
FROM RankedSalary;