SELECT Dname, COUNT( * ) 'No_Of_Employees', SUM( Salary ) 'Total_Sal', MAX( Salary ) 'Highest_Sal', MIN( Salary ) 'Lowest_Sal', AVG( Salary ) 'Average_Sal'
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dnumber
GROUP BY Dname, Dnumber