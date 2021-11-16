from flask import Flask, g, render_template, url_for, request, redirect, jsonify
import sqlite3
import json



app = Flask(__name__)
conn = sqlite3.connect('course.db', check_same_thread=False)
db = conn.cursor()

 
@app.route('/', methods=['POST', 'GET'])
def index():
    response = ''
    if request.method == 'POST':
          
        #dipilih = request.form.get('kuliah')
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        name = request_data['name']
        response = f' Hello {name} !'
        return " "
        #name = content["name"]
        '''
        db.execute("SELECT name FROM course WHERE name=(?)", (name,) )
        nama_matkul = db.fetchone()[0]
        db.execute("SELECT sks FROM course WHERE name=(?)", (name,) )
        sks_matkul = db.fetchone()[0]
        db.execute("SELECT term FROM course WHERE name=(?)", (name,) )
        term_matkul = db.fetchone()[0]
        db.execute("SELECT id FROM course WHERE name=(?)", (name,) )
        kode_matkul = db.fetchone()[0]
        '''
        try:
            db.execute("INSERT INTO mycourse(course_id) VALUES(?)", [kode_matkul])
            mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, pertemuan.jam_start AS jam_start, pertemuan.jam_end AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
            for mycrs in mycourse:     
                all_mycrs = [{'id':mycrs[0],'course_id':mycrs[1],'course_name':mycrs[2],'sks':mycrs[3],'term':mycrs[4],'jam_start':mycrs[5],'jam_end':mycrs[6],'hari':mycrs[7]} for mycrs in mycourse]

           
            #res = all_mycrs[len(all_mycrs)-1]
            #print(res)
            #return jsonify(res)
            #return redirect('/')
        except:
            return 'There was an issue adding your task'

    else:
        return jsonify( {'name': response} )
        course = db.execute("SELECT course.id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM course INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari GROUP BY harienum.hari ORDER BY term").fetchall()
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, pertemuan.jam_start AS jam_start, pertemuan.jam_end AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        
        for crs in course:
           all_course = [{'id':crs[0],'name':crs[1],'sks':crs[2],'term':crs[3],'jam_start':crs[4],'jam_end':crs[5],'hari':crs[6]} for crs in course]
        
        for mycrs in mycourse:     
            all_mycrs = [{'id':mycrs[0],'course_id':mycrs[1],'course_name':mycrs[2],'sks':mycrs[3],'term':mycrs[4],'jam_start':mycrs[5],'jam_end':mycrs[6],'hari':mycrs[7]} for mycrs in mycourse]

            
        #return jsonify(all_mycrs)
        return jsonify(all_course)
        #return render_template('index.html', course=course, mycourse=mycourse)


@app.route('/submit', methods=['POST', 'GET'])
def submit():
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        
        return render_template('submit.html', mycourse=mycourse)


@app.route('/generate', methods=['POST', 'GET'])
def generate():
        mycourse = db.execute("SELECT mycourse.id, mycourse.course_id AS course_id, course.name AS name, course.sks AS sks, course.term AS term, time(pertemuan.jam_start) AS jam_start, time(pertemuan.jam_end) AS jam_end, harienum.hari AS hari FROM mycourse INNER JOIN course ON course.id = mycourse.course_id INNER JOIN pertemuan ON pertemuan.course_id = course.id INNER JOIN harienum ON harienum.id = pertemuan.hari ORDER BY term").fetchall()
        
        sched = [] # array isinya nama matkul yang dipilih
        day = []
        rec = [] # array isinya rekomendasi jadwal 
        for j in mycourse:
            sched.append(j[2]) # array diisi nama matkul
            day.append(j[7])
        
        # sched udah keisi 
        # [jarkom, kemjar, big data]
        
        for i in sched:
            # jarkom - selasa & kamis
            if i == "Jaringan Komputer": # 4 sks 
                # rekomendasi jarkom selasa malem
                rec.append("Rec Jarkom Selasa")
                
                # kalo ga ngambil kemjar
                if 'Keamanan Jaringan' not in sched:
                    # rekomendasi jarkom rabu sore
                    rec.append("Rec Jarkom Rabu ")
                    
                else: # ada kemjar 
                    # rekomendasi jarkom rabu pagi 
                    rec.append("Rec Jarkom Rabu Pagi")

            elif i == "Keamanan Jaringan":
                rec.append("Rec Kemjar Rabu")

            elif i == "Teknologi Big Data":
                rec.append("Rec Big Data")

            
            elif i == "Sistem Waktu Nyata dan IoT":
                rec.append("Rec IoT Kamis")

            elif i == "Despro":
                rec.append("Rec Despro") 


        db.execute("SELECT MAX(id) FROM mycourse")
        start = db.fetchone()[0]
        total_sks = 0
        for rows in range(1, start+1):
            db.execute("SELECT mycourse.id AS mycourse_id, course.sks AS sks FROM mycourse INNER JOIN course ON course.id = mycourse.course_id WHERE mycourse_id=(?)", [rows])
            curr_sks = db.fetchone()[1]
            total_sks = total_sks + curr_sks
        
        alokasi = total_sks * 120

        return render_template('generate.html', mycourse=mycourse, total_sks=total_sks, alokasi=alokasi, sched=sched, rec=rec)
    

if __name__ == '__main__':
    app.run(debug=True)