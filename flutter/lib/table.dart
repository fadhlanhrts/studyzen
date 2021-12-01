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

class TablePage extends StatelessWidget {
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    final response = await http
        .get(Uri.parse('http://64a9-118-136-163-170.ngrok.io/mycourse'));

    var responseData = json.decode(response.body);
    // final l = responseData.length;

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
                final response = await http.get(Uri.parse('http://64a9-118-136-163-170.ngrok.io/mycourse'));
                var responseData = json.decode(response.body);
                final l = responseData.length;
                for (var i = 0; i < l; i++) {
                  if (snapshot.data[i].Name == "Jaringan Komputer") {
                    Jarkom = "Jaringan Komputer";
                  }
                  if (snapshot.data[i].Name == "Keamanan Jaringan") {
                    Kemjar = "Keamanan Jaringan";
                  }
                  if (snapshot.data[i].Name == "Despro") {
                    Despro = "Despro";
                  }
                }
                return ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      DataTable(
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
                            DataCell(Text(Jarkom)),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('10.00 - 12.00')),
                            DataCell(Text(Kemjar)),
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
                            DataCell(Text('15.00 - 17.00')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('19.00 - 21.00')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                        ],
                      ),
                    ]);
              }
            },
          )),
    );
  }
}
