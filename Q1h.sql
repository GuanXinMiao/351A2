CREATE VIEW dept_managers AS 
SELECT Dnumber, Dname, Fname, Lname, Salary
FROM DEPARTMENT
LEFT JOIN EMPLOYEE ON Mgr_ssn = Ssn
WHERE Dno = Dnumber