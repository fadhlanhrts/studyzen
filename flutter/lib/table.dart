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
        .get(Uri.parse('http://0b80-118-136-163-170.ngrok.io/mycourse'));

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

  var Jarkom = '';
  var Kemjar = '';
  var Despro = '';
  var Iot = '';
  var Bigdata = '';

  var Rec_Jarkom = '';
  var Rec_Kemjar = '';
  var Rec_Despro = '';
  var Rec_Iot = '';
  var Rec_Bigdata = '';

  var T_Jarkom = '';
  var T_Kemjar = '';
  var T_Despro = '';
  var T_Iot = '';
  var T_Bigdata = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Jadwal'), actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {},
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
                    if (snapshot.data[i].Name == "Jaringan Komputer") {
                      Jarkom = "Jaringan Komputer";
                      Rec_Jarkom = "(Rekomendasi) Jaringan Komputer";
                      T_Jarkom = "(Tugas) Jaringan Komputer";
                    }
                    if (snapshot.data[i].Name == "Keamanan Jaringan") {
                      Kemjar = "Keamanan Jaringan";
                      Rec_Kemjar = "(Rekomendasi) Keamanan Jaringan";
                      T_Kemjar = "(Tugas) Keamanan Jaringan";
                    }
                    if (snapshot.data[i].Name == "Desain Proyek Komputer") {
                      Despro = "Desain Proyek Komputer";
                      Rec_Despro = "(Rekomendasi) Desain Proyek Komputer";
                      T_Despro = "(Tugas) Desain Proyek Komputer";
                    }
                    if (snapshot.data[i].Name == "Iot") {
                      Iot = "Sistem Waktu Nyata dan IoT";
                      Rec_Iot = "(Rekomendasi) Sistem Waktu Nyata dan IoT";
                      T_Iot = "(Tugas) Sistem Waktu Nyata dan IoT";
                    }
                    if (snapshot.data[i].Name == "Bigdata") {
                      Bigdata = "Big Data";
                      Rec_Bigdata = "(Rekomendasi) Big Data";
                      T_Bigdata = "(Tugas) Big Data";
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
                            DataCell(Text(Rec_Jarkom)),
                            DataCell(Text(Jarkom)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('10.00 - 12.00')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('13.00 - 15.00')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('16.00 - 18.00')),
                            DataCell(Text(Bigdata)),
                            DataCell(Text('')),
                            DataCell(Text(Kemjar)),
                            DataCell(Text(Iot)),
                            DataCell(Text(Despro)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('19.00 - 21.00')),
                            DataCell(Text(T_Bigdata)),
                            DataCell(Text(T_Jarkom)),
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
