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
  final String Hari;
  final int Course_id;
  final String Jam_end;
  final String Jam_start;
  final String Name;
  final int Sks;
  final int Term;

User({
	       required this.Hari,
         required this.Course_id,
         required this.Jam_end,
         required this.Jam_start,
         required this.Name,
         required this.Sks,
         required this.Term
});
}

Future<Album> createAlbum(String name) async {
  final response = await http.post(
    Uri.parse('http://c473-118-136-163-170.ngrok.io/pilih'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String Hari;
  final int Course_id;
  final String Jam_end;
  final String Jam_start;
  final String Name;
  final int Sks;
  final int Term;


  Album({
         required this.Hari,
         required this.Course_id,
         required this.Jam_end,
         required this.Jam_start,
         required this.Name,
         required this.Sks,
         required this.Term});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      Hari: json['Hari'],
      Course_id: json['Course_id'],
      Jam_end: json['Jam_end'],
      Jam_start: json['Jam_start'],
      Name: json['Name'],
      Sks: json['Sks'],
      Term: json['Term']
    );
  }
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

Future<List<User>> getRequest() async {
	//replace your restFull API here.
	final response = await http.get(Uri.parse('http://c473-118-136-163-170.ngrok.io/'));

	var responseData = json.decode(response.body);

	//Creating a list to store input data;
	List<User> users = [];
	for (var singleUser in responseData) {
	User user = User(
    Hari: singleUser["Hari"],
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
		title: Text("GET Jadwal"),
		actions: [
            IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {},
            ),
    ]
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
					leading: Text(snapshot.data[index].Hari),
					title: Text(snapshot.data[index].Jam_start,
                      style: TextStyle(fontSize: 16),
                        ),
          subtitle: Text(snapshot.data[index].Jam_end,
                        style: TextStyle(fontSize: 16),
                        ),
          trailing: Text(snapshot.data[index].Name),
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