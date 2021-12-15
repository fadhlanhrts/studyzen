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

class MyCoursePage extends StatefulWidget {
  @override
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    final response = await http
        .get(Uri.parse('http://80d3-103-125-43-133.ngrok.io/mycourse'));

    var responseData = json.decode(response.body);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("MyCourse"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).pushNamed('/recommendationpage');
              },
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
            child: FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => ListTile(
                      dense: true,
                      leading: Text(snapshot.data[index].Hari),
                      title: Text(
                        snapshot.data[index].Jam_start,
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        snapshot.data[index].Jam_end,
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(snapshot.data[index].Name),
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
