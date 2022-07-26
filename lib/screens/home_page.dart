import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs/screens/name_screen.dart';
import 'package:vs/util/app_colors.dart';
import 'package:vs/view%20model/shape_view_model.dart';
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
  String? id;
  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  initSharedPref() async {
    id = sharedPreferences.getString('id');
    print('initSharedPref');
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // if (id == null) {
    //   Future.delayed(Duration.zero, () => showAlert(context));
    //   _isFirstTime = true;
    // }

    return Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body: Consumer<ShapeViewModel>(builder: (context, shape, child) {
          shape.getHabit('userId');
          return GestureDetector(
              onVerticalDragUpdate: (details) {
                print('drag');
              },
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: IconButton(
                          icon: Icon(Icons.menu, size: 30),
                          onPressed: () {
                            _scaffoldKey.currentState!
                                .openDrawer(); //drawer remove later
                          },
                        )),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: shape.habits.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Container(
                                height: size.height * 0.3,
                                padding: const EdgeInsets.all(8.0),
                                child: Polygon(
                                  sides: shape.habits[index].count,
                                  color: Color(shape.habits[index].color),
                                )),
                            Text(shape.habits[index].objectName,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        );
                      }))
                ]),
              ));
        }));
  }

  showAlert(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Enter your name'), // TODO: change to only 1
              content:
                  Container(height: size.height * 0.3, child: NameScreen()),
            ));
  }
}
