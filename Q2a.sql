SELECT sections.crn, courses.ctitle, courses.cprefix, courses.cno, students.sid, fname, lname
FROM sections
LEFT JOIN courses ON ( courses.cno = sections.cno
AND sections.cprefix = courses.cprefix )
LEFT JOIN enrolls ON ( enrolls.year = sections.year
AND sections.crn = enrolls.crn
AND sections.term = enrolls.term )
LEFT JOIN students ON enrolls.sid = students.sid
WHERE sections.crn =10101
AND sections.term = 'FA'
AND sections.year =2002