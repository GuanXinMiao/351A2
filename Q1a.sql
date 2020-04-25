(SELECT DISTINCT Pname,Pnumber, Plocation, Dnum 
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Lname = 'James')
UNION
(SELECT DISTINCT Pname, Pnumber, Plocation, Dnum
 FROM PROJECT, WORKS_ON, EMPLOYEE
 WHERE Pnumber = Pno AND Essn = Ssn AND Lname = 'James')