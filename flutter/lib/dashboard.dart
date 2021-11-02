import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/history/history.dart';
import 'package:homepage/pages/dashboard_tabs/notification/notification.dart';
import 'package:homepage/pages/dashboard_tabs/home/home.dart';
import 'package:homepage/pages/dashboard_tabs/profile/profile.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, addres}) : super(key: key);
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final tabs = [
    HomePage(),
    NotificationPage(),
    HistoryPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/ic_home.png', width: 24),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
  //============================= main function ===============================
}
