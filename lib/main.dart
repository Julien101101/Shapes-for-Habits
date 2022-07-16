import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs/screens/intro_screen.dart';
import 'package:vs/screens/welcome_screen.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/view%20model/user_view_model.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';
import 'package:sizer/sizer.dart';
import './util/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserViewModel()),
            ChangeNotifierProvider(create: (_) => ShapeViewModel())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Shapes for Habits',
            theme: ThemeData.light(),
            home: const WelcomeScreen(),
            onGenerateRoute: router.generateRoute,
          ),
        );
      },
    );
  }
}
