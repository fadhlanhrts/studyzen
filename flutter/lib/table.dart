import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String Hari;
  final int Mycourse_id;
  final int Course_id;
  final String Jam_end;
  final String Jam_start;
  final String Name;
  final int Sks;
  final int Term;

  User(
      {required this.Hari,
      required this.Mycourse_id,
      required this.Course_id,
      required this.Jam_end,
      required this.Jam_start,
      required this.Name,
      required this.Sks,
      required this.Term});
}

var l;

class TablePage extends StatelessWidget {
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    final response = await http
        .get(Uri.parse('http://aa42-103-125-43-133.ngrok.io/mycourse'));

    var responseData = json.decode(response.body);
    l = responseData.length;

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          Hari: singleUser["Hari"],
          Mycourse_id: singleUser["Mycourse_id"],
          Course_id: singleUser["Course_id"],
          Jam_end: singleUser["Jam_end"],
          Jam_start: singleUser["Jam_start"],
          Name: singleUser["Name"],
          Sks: singleUser["Sks"],
          Term: singleUser["Term"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  var Jarkom1 = '';
  var Jarkom2 = '';
  var Kemjar = '';
  var Despro = '';
  var Iot = '';
  var Bigdata = '';
  var dsd = '';
  var jartel = '';
  var sinsis = '';
  var rpl = '';
  var rl = '';
  var diskrit = '';
  var statis = '';
  var oop = '';
  var probstok = '';

  var Rec_Jarkom1 = '';
  var Rec_Jarkom2 = '';
  var Rec_Kemjar = '';
  var Rec_Despro = '';
  var Rec_Iot = '';
  var Rec_Bigdata = '';
  var Rec_dsd = '';
  var Rec_oop = '';
  var Rec_statis = '';
  var Rec_diskrit = '';
  var Rec_rl = '';
  var Rec_probstok = '';
  var Rec_rpl = '';
  var Rec_sinsis = '';
  var Rec_jartel = '';

  var T_Jarkom1 = '';
  var T_Jarkom2 = '';
  var T_Kemjar = '';
  var T_Despro = '';
  var T_Iot = '';
  var T_Bigdata = '';
  var T_dsd = '';
  var T_oop = '';
  var T_statis = '';
  var T_diskrit = '';
  var T_rl = '';
  var T_probstok = '';
  var T_rpl = '';
  var T_sinsis = '';
  var T_jartel = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Jadwal'), actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ]),
          body: FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  for (var i = 0; i < l; i++) {
                    if (snapshot.data[i].Name == "Jaringan Komputer Selasa") {
                      Jarkom1 = "Jaringan Komputer Selasa";
                      Rec_Jarkom1 = "(Rekomendasi) Jaringan Komputer Selasa";
                      T_Jarkom1 = "(Tugas) Jaringan Komputer Selasa";
                    }
                    if (snapshot.data[i].Name == "Jaringan Komputer Kamis") {
                      Jarkom2 = "Jaringan Komputer Kamis";
                      Rec_Jarkom2 = "(Rekomendasi) Jaringan Komputer Kamis";
                      T_Jarkom2 = "(Tugas) Jaringan Komputer Kamis";
                    }
                    if (snapshot.data[i].Name == "Keamanan Jaringan") {
                      Kemjar = "Keamanan Jaringan";
                      Rec_Kemjar = "(Rekomendasi) Keamanan Jaringan";
                      T_Kemjar = "(Tugas) Keamanan Jaringan";
                    }
                    if (snapshot.data[i].Name == "Despro") {
                      Despro = "Despro";
                      Rec_Despro = "(Rekomendasi) Despro";
                      T_Despro = "(Tugas) Despro";
                    }
                    if (snapshot.data[i].Name == "Sistem Waktu Nyata dan IoT") {
                      Iot = "Sistem Waktu Nyata dan IoT";
                      Rec_Iot = "(Rekomendasi) Sistem Waktu Nyata dan IoT";
                      T_Iot = "(Tugas) Sistem Waktu Nyata dan IoT";
                    }
                    if (snapshot.data[i].Name == "Teknologi Big Data") {
                      Bigdata = "Teknologi Big Data";
                      Rec_Bigdata = "(Rekomendasi) Teknologi Big Data";
                      T_Bigdata = "(Tugas)Teknologi Big Data";
                    }      
                    if (snapshot.data[i].Name == "Dasar Sistem Digital") {
                      dsd = "Dasar Sistem Digital";
                      Rec_dsd = "(Rekomendasi) Dasar Sistem Digital";
                      T_dsd = "(Tugas) Dasar Sistem Digital";
                    }
                    if (snapshot.data[i].Name == "Object Oriented Programming") {
                      oop  = "Object Oriented Programming";
                      Rec_oop = "(Rekomendasi) Object Oriented Programming";
                      T_oop = "(Tugas) Object Oriented Programming";
                    }
                    if (snapshot.data[i].Name == "Statistika") {
                      statis = "Statistika";
                      Rec_statis = "(Rekomendasi) Statistika";
                      T_statis = "(Tugas) Statistika";
                    }
                    if (snapshot.data[i].Name == "Diskrit") {
                      diskrit = "Diskrit";
                      Rec_diskrit = "(Rekomendasi) Diskrit";
                      T_diskrit = "(Tugas) Diskrit";
                    }
                    if (snapshot.data[i].Name == "Rangkaian Listrik") {
                      rl = "Rangkaian Listrik";
                      Rec_rl = "(Rekomendasi) Rangkaian Listrik";
                      T_rl = "(Tugas) Rangkaian Listrik";
                    }
                    if (snapshot.data[i].Name == "Probstok") {
                      probstok = "Probstok";
                      Rec_probstok = "(Rekomendasi) Probstok";
                      T_probstok = "(Tugas) Probstok";
                    }
                    if (snapshot.data[i].Name == "RPL") {
                      rpl = "RPL";
                      Rec_rpl = "(Rekomendasi) RPL";
                      T_rpl = "(Tugas) RPL";
                    }
                    if (snapshot.data[i].Name == "Sinsis") {
                      sinsis ="Sinsis";
                      Rec_sinsis ="(Rekomendasi) Sinsis";
                      T_sinsis ="(Tugas) Sinsis";
                    }
                    if (snapshot.data[i].Name == "Jaringan Telekomunikasi") {
                      jartel = "Jaringan Telekomunikasi";
                      Rec_jartel = "(Rekomendasi) Jaringan Telekomunikasi";
                      T_jartel = "(Tugas) Jaringan Telekomunikasi";
                    }
                  }
                }
                return ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      DataTable(
                        dataRowHeight: 60,
                        showBottomBorder: true,
                        columns: [
                          DataColumn(
                              label: Text('Jam',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Senin',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Selasa',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Rabu',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Kamis',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Jumat',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Sabtu',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Minggu',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('08.00 - 10.00')),
                            DataCell(Text(Rec_Jarkom1)),
                            DataCell(Text(Jarkom1)),
                            DataCell(Text(Rec_Jarkom2)),
                            DataCell(Text(Jarkom2)),
                            DataCell(Text(statis)),
                            DataCell(Text(Rec_statis)),
                            DataCell(Text(Rec_Bigdata)),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('10.00 - 12.00')),
                            DataCell(Text('')),
                            DataCell(Text(Rec_diskrit)),
                            DataCell(Text(Rec_dsd)),
                            DataCell(Text(diskrit)),
                            DataCell(Text(dsd)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('13.00 - 15.00')),
                            DataCell(Text(rpl)),
                            DataCell(Text(rl)),
                            DataCell(Text(oop)),
                            DataCell(Text(Rec_oop)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('16.00 - 18.00')),
                            DataCell(Text(Bigdata)),
                            DataCell(Text(probstok)),
                            DataCell(Text(Kemjar)),
                            DataCell(Text(Iot)),
                            DataCell(Text(Despro)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('19.00 - 21.00')),
                            DataCell(Text(T_Bigdata)),
                            DataCell(Text(T_Jarkom1)),
                            DataCell(Text(T_Kemjar)),
                            DataCell(Text(T_Iot)),
                            DataCell(Text(T_Despro)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                        ],
                      ),
                    ]);
              })),
    );
  }
}
