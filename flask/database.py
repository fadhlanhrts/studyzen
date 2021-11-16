# Buat troubleshoot & debugging database 

import sqlite3 

# tabel 
# course - daftar matkul 
# harienum - enum untuk hari
# pertemuan - jadwal course
# mycourse - matkul yang diambil 
#connect to database and create database
conn = sqlite3.connect('course.db')

#membuat cursor untuk membuat query
c = conn.cursor()
'''c.execute("DROP TABLE mycourse")
c.execute("DROP TABLE harienum")
c.execute("DROP TABLE pertemuan")
c.execute("DROP TABLE course")
c.execute("CREATE TABLE harienum(id INTEGER PRIMARY KEY AUTOINCREMENT, hari TEXT)")
c.execute("CREATE TABLE pertemuan(id INTEGER PRIMARY KEY AUTOINCREMENT, hari REFERENCES harienum(id), jam_start TEXT, jam_end TEXT)")
c.execute("CREATE TABLE course(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, sks INTEGER, term INTEGER, pertemuan_id REFERENCES pertemuan(id))")
c.execute("CREATE TABLE mycourse(id INTEGER PRIMARY KEY AUTOINCREMENT, course_id REFERENCES course(id))")
<<<<<<< HEAD

c.execute("INSERT INTO harienum(hari) VALUES ('SENIN'), ('SELASA'), ('RABU'), ('KAMIS'), ('JUMAT'), ('SABTU'), ('MINGGU')")
c.execute("INSERT INTO pertemuan(hari, jam_start, jam_end) VALUES(1, '2021-10-13 08:00:00.000', '2021-10-13 10:00:00.000'), (1, '2021-10-13 10:00:00.000', '2021-10-13 12:00:00.000'),(1, '2021-10-13 13:00:00.000', '2021-10-13 15:00:00.000'), (1, '2021-10-13 16:00:00.000', '2021-10-13 18:00:00.000'), (2, '2021-10-13 08:00:00.000', '2021-10-13 10:00:00.000'), (2, '2021-10-13 10:00:00.000', '2021-10-13 12:00:00.000'),(2, '2021-10-13 13:00:00.000', '2021-10-13 15:00:00.000'), (2, '2021-10-13 16:00:00.000', '2021-10-13 18:00:00.000'), (3, '2021-10-13 08:00:00.000', '2021-10-13 10:00:00.000'), (3, '2021-10-13 10:00:00.000', '2021-10-13 12:00:00.000'),(3, '2021-10-13 13:00:00.000', '2021-10-13 15:00:00.000'), (3, '2021-10-13 16:00:00.000', '2021-10-13 18:00:00.000'), (4, '2021-10-13 08:00:00.000', '2021-10-13 10:00:00.000'), (4, '2021-10-13 10:00:00.000', '2021-10-13 12:00:00.000'),(4, '2021-10-13 13:00:00.000', '2021-10-13 15:00:00.000'), (4, '2021-10-13 16:00:00.000', '2021-10-13 18:00:00.000'), (5, '2021-10-13 08:00:00.000', '2021-10-13 10:00:00.000'), (5, '2021-10-13 10:00:00.000', '2021-10-13 12:00:00.000'),(5, '2021-10-13 13:00:00.000', '2021-10-13 15:00:00.000'), (5, '2021-10-13 16:00:00.000', '2021-10-13 18:00:00.000')")
c.execute("INSERT INTO course(name, sks, term, pertemuan_id) VALUES('Despro', 3, 7, 20), ('Sistem Waktu Nyata dan IoT', 3, 5, 16), ('Teknologi Big Data', 3, 7 , 4), ('Jaringan Komputer Selasa', 2, 5, 5),('Jaringan Komputer Kamis', 2, 5, 13), ('Keamanan Jaringan',3, 5, 12)")
'''
#c.execute("SELECT * FROM course")
c.execute("SELECT course.id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, course.pertemuan_id AS pertemuan_id, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM course INNER JOIN pertemuan ON course.pertemuan_id = pertemuan.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term")
=======
'''

c.execute("SELECT * FROM pertemuan")
#c.execute("DROP TABLE mycourse")
>>>>>>> e848d95ca69e4f3c4824aca936f1fa6ff062ab03
tes = c.fetchall()


for isi in tes:
    print(isi)
    



print("Command executed successfully...")
#execute cursor command
conn.commit()

#close connection
conn.close()