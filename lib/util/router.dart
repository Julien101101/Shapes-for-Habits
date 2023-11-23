import 'package:flutter/material.dart';
import 'package:sfh/screens/create_screen.dart';
import 'package:sfh/screens/login_screen.dart';
import 'package:sfh/screens/name_screen.dart';
import 'package:sfh/screens/sign_up_screen.dart';
import 'package:sfh/widgets/mainscreen.dart';

import '../screens/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'sign_up':
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case 'login_screen':
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case 'home':
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
    case 'create':
      return MaterialPageRoute(builder: (context) => const CreateScreen());
    case 'name':
      return MaterialPageRoute(builder: (context) => NameScreen());
    case 'main':
      return MaterialPageRoute(builder: (context) => MainScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Home Page',
              ));
  }
}

//logo//welcome//intro//home//blank_canvas//shapes
