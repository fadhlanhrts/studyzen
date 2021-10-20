from flask import Flask, g, render_template, url_for, request, redirect
import sqlite3

app = Flask(__name__)
conn = sqlite3.connect('course.db', check_same_thread=False)
db = conn.cursor()

 
@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
          
        dipilih = request.form.get('kuliah')
        db.execute("SELECT name FROM course WHERE name=(?)", [dipilih])
        nama_matkul = db.fetchone()[0]
        db.execute("SELECT sks FROM course WHERE name=(?)", [dipilih])
        sks_matkul = db.fetchone()[0]
        db.execute("SELECT term FROM course WHERE name=(?)", [dipilih])
        term_matkul = db.fetchone()[0]
        db.execute("SELECT id FROM course WHERE name=(?)", [dipilih])
        kode_matkul = db.fetchone()[0]

        try:
            
            db.execute("INSERT INTO mycourse(course_id) VALUES(?)", [kode_matkul])
            return redirect('/')
        except:
            return 'There was an issue adding your task'

    else:
        course = db.execute("SELECT course.id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM course INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari GROUP BY harienum.hari ORDER BY term").fetchall()
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, pertemuan.jam_start AS jam_start, pertemuan.jam_end AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        return render_template('index.html', course=course, mycourse=mycourse)


@app.route('/submit', methods=['POST', 'GET'])
def submit():
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        return render_template('submit.html', mycourse=mycourse)


@app.route('/generate', methods=['POST', 'GET'])
def generate():
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        db.execute("SELECT MAX(id) FROM mycourse")
        start = db.fetchone()[0]
        total_sks = 0
        for rows in range(1, start+1):
            db.execute("SELECT mycourse.id AS mycourse_id, course.sks AS sks FROM mycourse INNER JOIN course ON course.id = mycourse.course_id WHERE mycourse_id=(?)", [rows])
            curr_sks = db.fetchone()[0]
            total_sks = total_sks + curr_sks
        
        alokasi = total_sks * 120

        return render_template('submit.html', mycourse=mycourse, total_sks=total_sks, alokasi=alokasi)
    

if __name__ == '__main__':
    app.run(debug=True)