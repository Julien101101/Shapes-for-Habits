import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:vs/screens/name_screen.dart';
import 'package:vs/util/app_colors.dart';
import 'package:vs/widgets/bullet.dart';
import 'package:vs/widgets/color_on_select.dart';
import 'package:vs/widgets/drawer.dart';
import 'package:vs/widgets/lines.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:vs/widgets/shapes.dart';
import 'package:vs/widgets/swipe_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences sharedPreferences;
  bool _isFirstTime = false;
  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  initSharedPref() async {
    print('initSharedPref');
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
  
    String? id = sharedPreferences.getString('id');
    if (id == null) {
      _isFirstTime = true;
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Enter your name'),
                content: NameScreen(),
              ));
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body: GestureDetector(
            onVerticalDragUpdate: (details) {
              print('drag');
            },
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: IconButton(
                      icon: Icon(Icons.menu, size: 30),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    )),
              ),
            ])));
  }
}
