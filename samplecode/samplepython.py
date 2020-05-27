import pymysql

mydb = pymysql.connect( host = '127.0.0.1', port = 3306 , user = "smia076",passwd = "smia076", db = "stu_smia076_COMPSCI_351_C_S1_2020_A2_Q1")


mycursor = mydb.cursor()

# Please adapt the following parts to complete Lab 9
# For the useage of .execute() please refer to https://www.w3schools.com/python/python_mysql_getstarted.asp
sql = """
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'stu_smia076_COMPSCI_351_C_S1_2020_A2_Q1' 
AND table_name = 'PROJECT'
AND column_name = 'Hours'
"""
mycursor.execute(sql)

hour_col = mycursor.fetchall()[0][0]
if hour_col == 0: mycursor.execute("ALTER TABLE PROJECT ADD Hours FLOAT")

query = "SELECT MIN(Pnumber), MAX(Pnumber) FROM PROJECT"
mycursor.execute(query)

pmin, pmax = mycursor.fetchall()[0]

for i in range(pmin, pmax, 1):
	sum_hour = "SELECT SUM( Hours ) FROM WORKS_ON WHERE Pno = %d"%i
	mycursor.execute(sum_hour)
	hours = mycursor.fetchall()[0][0]
	hours = 0 if hours is None else hours

	update = "UPDATE PROJECT SET Hours = %d WHERE Pnumber = %d"%(hours, i)
	mycursor.execute(update)

query = "SELECT * FROM PROJECT"
mycursor.execute(query)

project = mycursor.fetchall()
for i in project:
	type = "Short" if i[4] < 100 else "Long"
	print("%s %s"%(i[0], type))




