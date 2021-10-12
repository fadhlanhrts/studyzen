from flask import Flask, g, render_template, url_for, request, redirect
import sqlite3

app = Flask(__name__)
conn = sqlite3.connect('course.db', check_same_thread=False)
db = conn.cursor()

 
@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
          
        dipilih = request.form.get('kuliah')
        db.execute("SELECT nama FROM matkul WHERE nama=(?)", [dipilih])
        nama_matkul = db.fetchone()[0]
        db.execute("SELECT sks FROM matkul WHERE nama=(?)", [dipilih])
        sks_matkul = db.fetchone()[0]
        db.execute("SELECT term FROM matkul WHERE nama=(?)", [dipilih])
        term_matkul = db.fetchone()[0]
        db.execute("SELECT id FROM matkul WHERE nama=(?)", [dipilih])
        kode_matkul = db.fetchone()[0]

        try:
            
            db.execute("INSERT INTO mycourse(nama_matkul, sks, term, kode_matkul) VALUES(?,?,?,?)", [nama_matkul, sks_matkul, term_matkul, kode_matkul])
            
            return redirect('/')
        except:
            return 'There was an issue adding your task'

    else:
        course = db.execute("SELECT * FROM matkul ORDER BY term").fetchall()
        mycourse = db.execute("SELECT * FROM mycourse ORDER BY term").fetchall()
        return render_template('index.html', course=course, mycourse=mycourse)


@app.route('/submit', methods=['POST', 'GET'])
def submit():
        mycourse = db.execute("SELECT * FROM mycourse ORDER BY term").fetchall()
        return render_template('submit.html', mycourse=mycourse)


@app.route('/generate', methods=['POST', 'GET'])
def generate():
        # saran = []
        mycourse = db.execute("SELECT * FROM mycourse ORDER BY term").fetchall()
        db.execute("SELECT MAX(id) FROM mycourse")
        start = db.fetchone()[0]
        total_sks = 0
        for rows in range(1, start+1):
            db.execute("SELECT sks FROM mycourse WHERE rowid=(?)", [rows])
            curr_sks = db.fetchone()[0]
            total_sks = total_sks + curr_sks
        
        alokasi = total_sks * 120

        return render_template('submit.html', mycourse=mycourse, total_sks=total_sks, alokasi=alokasi)
    

if __name__ == '__main__':
    app.run(debug=True)