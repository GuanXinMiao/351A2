CREATE ASSERTION workload_restriction
CHECK(NOT EXISTS(
SELECT s.*, e.*, sec.*, c.*
FROM students AS s
LEFT JOIN enrolls AS e ON e.sid = s.sid
LEFT JOIN sections AS sec ON (e.crn = sec.crn
                              AND e.year = sec.year
                              AND e.term = sec.term)
LEFT JOIN courses AS c ON (sec.cno = c.cno 
                           AND sec.cprefix = c.cprefix)

LEFT JOIN
(SELECT s.sid, e.term, e.year, SUM(chours) AS totalHours
FROM students AS s
LEFT JOIN enrolls AS e ON e.sid = s.sid
LEFT JOIN sections AS sec ON (e.crn = sec.crn
                              AND e.year = sec.year
                              AND e.term = sec.term)
LEFT JOIN courses AS c ON (sec.cno = c.cno 
                           AND sec.cprefix = c.cprefix)
WHERE sType = 'UGRAD'
GROUP BY s.sid, e.term, e.year)T1

ON (s.sid = T1.sid AND e.term = T1.term AND e.year = T1.term)

WHERE T1.totalHours > 15));