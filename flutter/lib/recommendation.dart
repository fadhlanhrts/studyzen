import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String Rec_tugas;
  final String Rec_belajar;

  User({required this.Rec_tugas, required this.Rec_belajar});
}

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    final response = await http
        .get(Uri.parse('http://64a9-118-136-163-170.ngrok.io/getrec'));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          Rec_tugas: singleUser["Rec_tugas"],
          Rec_belajar: singleUser["Rec_belajar"]);

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
          title: Text("Recommendation"),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {},
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
                      // leading: Text(snapshot.data[index].Rec_tugas),
                      title: Text(
                        snapshot.data[index].Rec_tugas,
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        snapshot.data[index].Rec_belajar,
                        style: TextStyle(fontSize: 16),
                      ),
                      // trailing: Text(snapshot.data[index].Rec_belajar),
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
