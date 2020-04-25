SELECT *
FROM (

SELECT Pnumber, Pname, COUNT( * ) Team_Size, SUM( Hours ) Total_Hours
FROM EMPLOYEE
LEFT JOIN WORKS_ON ON Essn = Ssn
LEFT JOIN PROJECT ON Pno = Pnumber
GROUP BY Pnumber, Pname
)T1
WHERE Team_Size >3