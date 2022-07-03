import 'package:flutter/material.dart';
import 'package:vs/screens/intro_screen.dart';
import 'screens/home_page.dart';
import 'package:sizer/sizer.dart';
import './util/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          title: 'Shapes for Habits',
          theme: ThemeData.light(),
          home: FirstPageScreen(),
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}
