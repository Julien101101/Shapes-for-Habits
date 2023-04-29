import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfh/screens/logo_screen.dart';
import 'package:sfh/screens/sign_up_screen.dart';
import 'package:sfh/screens/splash.dart';
import 'package:sfh/view%20model/shape_view_model.dart';
import 'package:sfh/view%20model/user_view_model.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';
import './util/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ShapeViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shapes for Habits',
        theme: ThemeData(fontFamily: 'Quicksand'),
        home: SplashScreen(),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
