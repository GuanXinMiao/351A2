SELECT Fname, Lname, Dname as HoD
FROM DEPARTMENT
LEFT JOIN EMPLOYEE ON DEPARTMENT.Mgr_ssn = EMPLOYEE.Ssn
WHERE Super_ssn IS NULL