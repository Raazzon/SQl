--CTE
WITH RankedSalary (DeptId,DeptName,SalRank,FName,LName,Salary)
AS(
	SELECT e.DepartmentId,d.DepartmentName,
		ROW_NUMBER() OVER(PARTITION BY e.DepartmentId ORDER BY Salary DESC) 'SalRank'
		,e.FirstName,e.LastName,e.Salary
	FROM Employee AS e
		JOIN Department AS d ON e.DepartmentId=d.DepartmentId
	)
SELECT * 
FROM RankedSalary;

--list the highest earning employee of Information System and second highest earning from Human resource department.
SELECT *
FROM(
	SELECT e.DepartmentId,d.DepartmentName,e.Salary
		,ROW_NUMBER() OVER(ORDER BY Salary DESC)AS 'RowNum'
	FROM Employee AS e
		JOIN Department d ON e.DepartmentId=d.DepartmentId
	WHERE LOWER(d.DepartmentName)='information system'
	) AS i
WHERE i.RowNum=1

UNION
SELECT *
FROM(
	SELECT e.DepartmentId,d.DepartmentName,e.Salary
		,ROW_NUMBER() OVER(ORDER BY Salary DESC) 'RowNum'
	FROM Employee AS e
		JOIN Department d ON e.DepartmentId=d.DepartmentId
	WHERE LOWER(d.DepartmentName)='human resource'
	) AS i
WHERE i.RowNum=2