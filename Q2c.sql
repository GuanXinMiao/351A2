SELECT enrolls.year, enrolls.term, sections.cprefix, sections.cno, courses.ctitle, grade
FROM enrolls
LEFT JOIN sections ON ( enrolls.crn = sections.crn
AND enrolls.year = sections.year
AND enrolls.term = sections.term )
LEFT JOIN courses ON ( sections.cno = courses.cno
AND sections.cprefix = courses.cprefix )
WHERE enrolls.sid =1111