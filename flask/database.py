# Buat troubleshoot & debugging database 

import sqlite3 

# tabel 
# matkul - daftar matkul 
# mycourse - matkul yang diambil 
#connect to database and create database
conn = sqlite3.connect('course.db')

#membuat cursor untuk membuat query
c = conn.cursor()


c.execute("SELECT * FROM mycourse")
tes = c.fetchall()

#c.execute("CREATE TABLE matkul(id INTEGER PRIMARY KEY, nama TEXT, sks INTEGER, term INTEGER)")
#c.execute("CREATE TABLE mycourse(id INTEGER PRIMARY KEY, nama_matkul TEXT, sks INTEGER, term INTEGER, kode_matkul INTEGER)")

#c.execute("INSERT INTO mycourse(nama_matkul, sks, term, kode_matkul) VALUES(?, ?, ?, ?)", [pilihan_matkul, sks_matkul, term_matkul, kode_matkul])


#c.execute("INSERT INTO matkul VALUES(1, 'Despro', 3, 7), (2, 'Sistem Waktu Nyata dan IoT', 3, 5), (3, 'Teknologi Big Data', 3, 7), (4, 'Jaringan Komputer', 4, 3), (5, 'Keamanan Jaringan', 3, 5)")


for isi in tes:
    print(isi)
    


print("Command executed successfully...")
#execute cursor command
conn.commit()

#close connection
conn.close()
