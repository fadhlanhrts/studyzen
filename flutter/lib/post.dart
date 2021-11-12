import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  TextEditingController postNum = TextEditingController();

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POST DATA',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('POST DATA'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: postNum,
              decoration: InputDecoration(
                hintText: "Enter Post Id",
                // border: InputBorder.none,
              ),

            ),
            RaisedButton(child: Text("Post"),
                onPressed: () => {setState(() {
               pressed = true;
              //fetchData(postNum);
            })}),

            pressed ? fetchData(postNum): SizedBox(),

          ],
        ),
      ),
    );
  }
}

class Posts {
  final String hari;
  // final int id;
  final String jam_end;
  final String jam_start;
  final String name;
  // final int sks;
  // final int term;

  Posts({required this.hari,
        //  required this.id,
         required this.jam_end,
         required this.jam_start,
         required this.name,
        //  required this.sks,
        //  required this.term
         });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      hari: json['hari'],
      // id: json['id'],
      jam_end: json['jam_end'],
      jam_start: json['jam_start'],
      name: json['name'],
      // sks: json['sks'],
      // term: json['term']
    );
  }
}

Future<Posts> fetchPosts(String name) async {
  final response =
  await http.get(Uri.parse('http://96f9-118-136-163-170.ngrok.io/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Posts.fromJson(json.decode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

FutureBuilder<Posts> fetchData(postNum) {
  return FutureBuilder<Posts>(
    future: fetchPosts(postNum.text.toString()),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getData(snapshot);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}

Widget getData(snapshot) {
  return Padding(
    padding: const EdgeInsets.all(35.0),
    child: Column(
      children: <Widget>[

        Padding(padding: EdgeInsets.all(5)),
        Text("Hari : " + snapshot.data.hari, style: TextStyle(fontSize: 20)),
        // Padding(padding: EdgeInsets.all(20)),
        // Text("Id : " + snapshot.data.id, style: TextStyle(fontSize: 20)),
        Padding(padding: EdgeInsets.all(5)),
        Text("Jam End : " + snapshot.data.jam_end, style: TextStyle(fontSize: 20)),
        Padding(padding: EdgeInsets.all(5)),
        Text("Jam Start : " + snapshot.data.jam_start, style: TextStyle(fontSize: 20)),
        Padding(padding: EdgeInsets.all(5)),
        Text("Name : " + snapshot.data.name, style: TextStyle(fontSize: 20)),
        // Padding(padding: EdgeInsets.all(20)),
        // Text("SKS : " + snapshot.data.sks, style: TextStyle(fontSize: 20)),
        // Padding(padding: EdgeInsets.all(20)),
        // Text("Term : " + snapshot.data.term, style: TextStyle(fontSize: 20)),
      ],
    ),
  );
}