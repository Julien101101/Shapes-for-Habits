import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs/util/color_on_select.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:vs/widgets/shapes.dart';

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
  int _counter = 3;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        /*Container(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(Icons.menu, size: 30),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              )),
        ),*/
        _counter >= 3
            ? Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shape(),
                    )),
                    /*VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),*/
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ColorOnSelect(),
                    )),
                    /*VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),*/
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell( //changed GestureDetector to Inkwell
                          child: Polygon(
                            sides: _counter,
                          ),
                          onTap: () {
                            _incrementCounter();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
      ]),
    );
  }
}
