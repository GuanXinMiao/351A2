SELECT sections.crn, courses.ctitle, courses.cno, sections.days, sections.startTime, sections.endTime, room, instructor
FROM enrolls
LEFT JOIN sections ON ( enrolls.crn = sections.crn
AND enrolls.year = sections.year
AND enrolls.term = sections.term )
LEFT JOIN courses ON ( courses.cno = sections.cno
AND sections.cprefix = courses.cprefix )
WHERE enrolls.sid =1111
AND enrolls.term = 'FA'
AND enrolls.year =2002