import 'package:flutter/material.dart';

import '../screens/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
  }
}
