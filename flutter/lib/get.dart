import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GetPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: HomePage(),
	);
}
}

//Creating a class user to store the data;
class User {
  final String hari;
  final int id;
  final String jam_end;
  final String jam_start;
  final String name;
  final int sks;
  final int term;

User({
	       required this.hari,
         required this.id,
         required this.jam_end,
         required this.jam_start,
         required this.name,
         required this.sks,
         required this.term
});
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

Future<List<User>> getRequest() async {
	//replace your restFull API here.
	final response = await http.get(Uri.parse('http://1dca-118-136-163-170.ngrok.io/'));

	var responseData = json.decode(response.body);

	//Creating a list to store input data;
	List<User> users = [];
	for (var singleUser in responseData) {
	User user = User(
    hari: singleUser["hari"],
		id: singleUser["id"],
		jam_end: singleUser["jam_end"],
    jam_start: singleUser["jam_start"],
    name: singleUser["name"],
    sks: singleUser["sks"],
    term: singleUser["term"]);

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
		title: Text("Jadwal"),
		leading: Icon(
			Icons.calendar_today,
		),
		),
		body: Container(
		padding: EdgeInsets.all(16.0),
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
				itemCount: snapshot.data.length,
				itemBuilder: (ctx, index) => ListTile(
          dense: true,
					leading: Text(snapshot.data[index].hari),
					title: Text(snapshot.data[index].jam_start,
                      style: TextStyle(fontSize: 16),
                        ),
          subtitle: Text(snapshot.data[index].jam_end,
                        style: TextStyle(fontSize: 16),
                        ),
          trailing: Text(snapshot.data[index].name),
					contentPadding: EdgeInsets.only(bottom: 20.0),
				),
				);
			}
			},
		),
		),
	),
	);
}
}
