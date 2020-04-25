SELECT Ssn, Fname, Lname, Sex
FROM(
SELECT COUNT(*) as DependentNum, Essn
FROM DEPENDENT
GROUP BY Essn    
    )T1
LEFT JOIN EMPLOYEE ON Essn = Ssn
WHERE DependentNum >= 2
