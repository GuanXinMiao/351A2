SELECT DISTINCT EMPLOYEE.Ssn AS Ssn, Fname, Lname
FROM EMPLOYEE
LEFT JOIN WORKS_ON ON EMPLOYEE.Ssn = WORKS_ON.Essn
LEFT JOIN PROJECT ON WORKS_ON.Pno = PROJECT.Pnumber
WHERE Address LIKE "%, Houston,%"
AND PROJECT.Plocation = 'Houston'