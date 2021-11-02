import 'package:flutter/material.dart';

Route<dynamic> defaultRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Halaman tidak tersedia.'),
      ),
    );
  });
}
