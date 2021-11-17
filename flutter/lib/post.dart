import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Album(
      {required this.Hari,
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
        Term: json['Term']);
  }
}

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() {
    return _PostPageState();
  }
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POST DATA',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POST DATA'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter POST'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('POST DATA'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.Hari);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
