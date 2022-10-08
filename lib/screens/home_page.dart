import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs/screens/create_screen.dart';
import 'package:vs/screens/shape_screen.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/view%20model/user_view_model.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:animations/animations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? sharedPreferences;
  String? id;
  @override
  void initState() {
    initSharedPref();
    super.initState();
    Future.microtask(() => context.read<ShapeViewModel>().getHabit());
    Future.microtask(() => context.read<UserViewModel>().getUser());
  }

  initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences!.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    UserViewModel _userViewModel = context.read<UserViewModel>();
    // if (id == null) {
    //   Future.delayed(Duration.zero, () => showAlert(context));
    //   _isFirstTime = true;
    // }

    return Scaffold(
        key: _scaffoldKey,
        body: Consumer<ShapeViewModel>(builder: (context, shape, child) {
          return SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.1,
                ),
                child: Center(
                    child: Text(
                  _userViewModel.appUser.name! + "'s Shapes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                padding: shape.habits.isEmpty
                    ? EdgeInsets.only(top: size.height * 0.1)
                    : EdgeInsets.only(top: size.height * 0.05),
                child: FloatingActionButton(
                  onPressed: () {
                    pushNewScreen(context, screen: CreateScreen());
                  },
                  child: Icon(Icons.add),
                ),
              ),
              shape.habits.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text('Create a new habit',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ),
                      ))
                  : ReorderableListView.builder(
                      itemCount: shape.habits.length,
                      itemBuilder: (BuildContext context, int index) {
                        Duration transitionDuration =
                            const Duration(milliseconds: 800);

                        return OpenContainer(
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: transitionDuration,
                          closedBuilder:
                              (BuildContext _, VoidCallback openContainer) {
                            return InkWell(
                              onTap: openContainer,
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
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10.0,
                                              offset: Offset(0.0, 10.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 16.0),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Polygon(
                                                  sides:
                                                      shape.habits[index].count,
                                                  color: Color(shape
                                                      .habits[index].color),
                                                )),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  shape
                                                      .habits[index].objectName,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          },
                          openBuilder:
                              (BuildContext _, VoidCallback openContainer) {
                            return ShapeScreen(habit: shape.habits[index]);
                          },
                          onClosed: (_) => print('Closed'),
                        );
                      },
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // children: <Widget>[
                      //   for (int index = 0;
                      //       index < shape.habits.length;
                      //       index += 1)
                      //     InkWell(
                      //       key: Key('$index'),
                      //       onTap: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => ShapeScreen(
                      //                       habit: shape.habits[index],
                      //                     )));
                      //       },
                      //       child: Container(
                      //           height: size.height * 0.2,
                      //           margin: const EdgeInsets.symmetric(
                      //             vertical: 16.0,
                      //             horizontal: 24.0,
                      //           ),
                      //           child: Stack(
                      //             children: <Widget>[
                      //               Container(
                      //                 height: size.height * 0.3,
                      //                 margin: EdgeInsets.only(left: 0.0),
                      //                 decoration: BoxDecoration(
                      //                   color:
                      //                       Color.fromARGB(255, 255, 255, 255),
                      //                   shape: BoxShape.rectangle,
                      //                   borderRadius:
                      //                       BorderRadius.circular(8.0),
                      //                   boxShadow: <BoxShadow>[
                      //                     BoxShadow(
                      //                       color: Colors.black12,
                      //                       blurRadius: 10.0,
                      //                       offset: Offset(0.0, 10.0),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               Row(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 children: [
                      //                   Flexible(
                      //                     flex: 1,
                      //                     child: Container(
                      //                         margin: EdgeInsets.symmetric(
                      //                             vertical: 16.0),
                      //                         alignment: Alignment.centerRight,
                      //                         child: Polygon(
                      //                           sides:
                      //                               shape.habits[index].count,
                      //                           color: Color(
                      //                               shape.habits[index].color),
                      //                         )),
                      //                   ),
                      //                   Flexible(
                      //                     flex: 1,
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: Text(
                      //                           shape.habits[index].objectName,
                      //                           style: TextStyle(
                      //                               fontSize: 20,
                      //                               fontWeight: FontWeight.bold,
                      //                               color: Colors.black)),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           )),
                      //     )
                      // ],
                      // onReorder: (int oldIndex, int newIndex) {
                      //   setState(() {
                      //     if (oldIndex < newIndex) {
                      //       newIndex -= 1;
                      //     }
                      //     final item = shape.habits.removeAt(oldIndex);
                      //     shape.editIndex(shape.habits[newIndex].id!, newIndex);
                      //     shape.habits.insert(newIndex, item);
                      //   });
                      // },
                    )
            ]),
          );
        }));
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: Colors.blue,
          shadowColor: Colors.grey,
          child: child,
        );
      },
      child: child,
    );
  }
}
