import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs/screens/name_screen.dart';
import 'package:vs/screens/shape_screen.dart';
import 'package:vs/util/app_colors.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/widgets/bullet.dart';
import 'package:vs/widgets/color_on_select.dart';
import 'package:vs/widgets/drawer.dart';
import 'package:vs/widgets/lines.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:vs/widgets/shapes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? sharedPreferences;
  bool _isFirstTime = false;
  String? id;
  @override
  void initState() {
    initSharedPref();
    Future.microtask(() => context.read<ShapeViewModel>().getHabit('userId'));
    super.initState();
  }

  initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences!.getString('id');
    print('initSharedPref');
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
        body: Consumer<ShapeViewModel>(builder: (context, shape, child) {
          return GestureDetector(
              onVerticalDragUpdate: (details) {
                print('drag');
              },
              child: SingleChildScrollView(
                child: Column(children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shape.habits.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShapeScreen(
                                          habit: shape.habits[index],
                                        )));
                          },
                          child: Container(
                              height: size.height * 0.2,
                              margin: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.3,
                                    margin: EdgeInsets.only(left: 0.0),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10.0,
                                          offset: Offset(0.0, 10.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16.0),
                                      alignment: FractionalOffset.centerLeft,
                                      child: Polygon(
                                        sides: shape.habits[index].count,
                                        color: Color(shape.habits[index].color),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(shape.habits[index].objectName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                ],
                              )),
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
