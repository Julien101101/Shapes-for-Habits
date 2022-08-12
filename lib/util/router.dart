import 'package:flutter/material.dart';
import 'package:vs/screens/create_screen.dart';
import 'package:vs/screens/login_screen.dart';
import 'package:vs/screens/name_screen.dart';
import 'package:vs/screens/sign_up_screen.dart';
import 'package:vs/widgets/mainscreen.dart';

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
      return MaterialPageRoute(builder: (context) => const Create());
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
