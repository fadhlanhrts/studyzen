import sqlite3

#connect to database & create database 
conn = sqlite3.connect('calendar.db')

#membuat cursor untuk membuat query
c = conn.cursor()

#memasukkan beberapa row menggunakan list
#many_job = [
#    ('Data Analyst', 'Gojek', '25 Juli 2021'),
#    ('Backend Developer', 'Tokopedia', '20 Juli 2021'), 
#   ('Full Stack Developer', 'Bukalapak', '21 Juli 2021'), 
#    ('Network Engineer', 'Cisco', '17 Juli 2021')
#]

#c.executemany("INSERT INTO job VALUES(?,?,?)", many_job)
#melakukan query terhadap database

#c.execute("SELECT rowid, * FROM job")




#update records
c.execute("""
    UPDATE job SET company = 'GoTo' WHERE rowid = 1
""")
c.execute("SELECT rowid, * FROM job")


#print(c.fetchone()[1])


job_list = c.fetchall()
for jobs in job_list:
    print(jobs)

#membuat tabel

#c.execute("""
#INSERT INTO job VALUES(
#    1, 'Data Analyst', 'Gojek', '23 Juli 2021'
#)
#""")


#data types in sqlite - null, integer, real, text, blob
#real - decimal number 1.8 2.3 
#blob - image, mp3 file

print("Command executed successfully...")
#execute cursor command
conn.commit()

#close connection
conn.close()

