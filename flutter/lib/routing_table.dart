import 'package:flutter/material.dart';
import 'package:myflutterapp/dashboard.dart';
import 'package:myflutterapp/default_route.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
      return MaterialPageRoute(builder: (_) => Dashboard());

      default:
        return defaultRoute();
    }
  }
}