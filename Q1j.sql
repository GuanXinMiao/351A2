SELECT T1.*, Dname
FROM(
SELECT Ssn, Fname, Lname, SUM(Hours) AS Work_load, Salary, Dno
FROM EMPLOYEE
LEFT JOIN WORKS_ON ON Ssn = Essn
GROUP BY Ssn
)T1
LEFT JOIN DEPARTMENT ON Dno = Dnumber

ORDER BY T1.Work_load DESC
LIMIT 3