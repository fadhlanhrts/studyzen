import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Jadwal'),
          ),
          body: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Jam',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Senin',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Selasa',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Rabu',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Kamis',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Jumat',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sabtu',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Minggu',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Actor')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('John')),
                  DataCell(Text('Student')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Harry')),
                  DataCell(Text('Leader')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Scientist')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Scientist')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
              ],
            ),
          ])),
    );
  }
}
