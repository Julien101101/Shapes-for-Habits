import 'package:flutter/material.dart';
import 'package:vs/screens/create_screen.dart';

import '../screens/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
    case 'create':
      return MaterialPageRoute(builder: (context) => const Create());
    default:
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
  }
}
