import 'package:flutter/material.dart';
import 'jadwal.dart';
import 'mycourse.dart';
import 'table.dart';
import 'get.dart';
import 'post.dart';
import 'recommendation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: '',
      ),
      routes: <String, WidgetBuilder>{
        '/jadwalpage': (context) => JadwalPage(),
        '/tablepage': (context) => TablePage(),
        '/getpage': (context) => GetPage(),
        '/postpage': (context) => PostPage(),
        '/mycoursepage': (context) => MyCoursePage(),
        '/recommendationpage': (context) => RecommendationPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Icon(Icons.search, size: 100),
    Icon(Icons.home, size: 100),
    Icon(Icons.person, size: 100),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'StudyZen',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Pilih Jadwal'),
              onTap: () {
                Navigator.of(context).pushNamed('/getpage');
              },
            ),
            // ListTile(
            //   title: const Text('POST'),
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/postpage');
            //   },
            // ),
            ListTile(
              title: const Text('My Course'),
              onTap: () {
                Navigator.of(context).pushNamed('/mycoursepage');
              },
            ),
            ListTile(
              title: const Text('Recommendation'),
              onTap: () {
                Navigator.of(context).pushNamed('/recommendationpage');
              },
            ),
            ListTile(
              title: const Text('Table'),
              onTap: () {
                Navigator.of(context).pushNamed('/tablepage');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('StudyZen'),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //   // ),
        //   // IconButton(
        //   //   icon: const Icon(Icons.calendar_today),
        //   //   onPressed: () {
        //   //     Navigator.of(context).pushNamed('/jadwalpage');
        //   //   },
        //   // ),
        // ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Image.asset(
                    "images/pilihjadwal.png",
                  ),
                  iconSize: 130,
                  tooltip: 'Pilih Jadwal',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/getpage');
                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Image.asset(
                    "images/mycourse.png",
                  ),
                  iconSize: 130,
                  tooltip: 'My Course',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/mycoursepage');
                  },
                ),
              ),
              // Container(
              //   child: IconButton(
              //     icon: Image.asset(
              //       "images/recommendation.png",
              //     ),
              //     iconSize: 130,
              //     tooltip: 'Recommendation',
              //     onPressed: () {
              //       Navigator.of(context).pushNamed('/recommendationpage');
              //     },
              //   ),
              // ),
              Container(
                child: IconButton(
                  icon: Image.asset(
                    "images/lihatjadwal.png",
                  ),
                  iconSize: 130,
                  tooltip: 'Table',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/tablepage');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text('Search'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text('Profile'),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.black,
      //   iconSize: 30,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
