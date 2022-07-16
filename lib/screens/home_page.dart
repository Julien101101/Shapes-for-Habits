import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:vs/widgets/bullet.dart';
import 'package:vs/widgets/color_on_select.dart';
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
  int _counter = 3;
  int _linecounter = 1;
  Color color = Colors.red;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List names = ['polygon', 'dots', 'lines'];
  String choice = '';
  List<Color> colors = [
    Colors.black,
    Colors.orange,
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.amber
  ];
  List taps = [];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementLine() {
    setState(() {
      _linecounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          print('drag');
        },
        child: Column(children: [
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
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: names.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  taps.clear();
                                                  taps.add(names[index]);
                                                  choice = names[index];
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ShapeRow(
                                                    taps.contains(names[index]),
                                                    names[index]),
                                              ));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      /*VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                      ),*/
                      Flexible(
                          flex: 1,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.15),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.7,
                                        width: size.height * 0.7,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount: colors.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  color = colors[index];
                                                });
                                              },
                                              child: GridTile(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: colors[index],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                      /*VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                      ),*/
                      choice.contains('polygon')
                          ? Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  //changed GestureDetector to Inkwell
                                  child: Polygon(
                                    sides: _counter,
                                    color: color,
                                  ),
                                  onTap: () {
                                    _incrementCounter();
                                  },
                                ),
                              ),
                            )
                          : choice.contains('lines')
                              ? Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      //changed GestureDetector to Inkwell
                                      child: Lines(
                                        length: _linecounter,
                                        color: color,
                                      ),
                                      onTap: () {
                                        _incrementLine();
                                      },
                                    ),
                                  ),
                                )
                              : Flexible(child: Container())
                    ],
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }

  Widget ShapeRow(bool selected, String name) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyBullet(color: selected ? Colors.orange[400] : Colors.grey),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(name,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: selected ? Colors.orange[400] : Colors.grey,
                )),
          ),
        )
      ],
    );
  }
}
