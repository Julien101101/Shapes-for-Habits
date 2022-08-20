import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vs/models/habits.dart';
import 'package:vs/screens/home_page.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/widgets/polygon.dart';

class ShapeScreen extends StatefulWidget {
  final Habits habit;

  const ShapeScreen({super.key, required this.habit});

  @override
  State<ShapeScreen> createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.habit.count;
  }

  @override
  Widget build(BuildContext context) {
    ShapeViewModel shapeViewModel = context.read<ShapeViewModel>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1,
            ),
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: size.height * 0.05,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: size.height * 0.05,
                ),
                onPressed: () async {
                  await shapeViewModel.deleteHabit(widget.habit.id!);
                  Navigator.of(context).push(_createRoute());
                },
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: size.height * 0.3,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    count++;
                  });
                  await shapeViewModel.editHabit(widget.habit.id!, count);
                },
                child: Polygon(
                  sides: count,
                  color: Color(widget.habit.color),
                ),
              )),
          SizedBox(height: size.height * 0.1),
          InkWell(
              onTap: () async {
                print("count--->" + count.toString());
                setState(() {
                  if (count > 3) {
                    count--;
                  }
                  print("new count--->" + count.toString());
                });

                await shapeViewModel.editHabit(widget.habit.id!, count);
              },
              child: Icon(Icons.close,
                  color: Colors.black, size: size.height * 0.06)),
          SizedBox(height: size.height * 0.1),
          Text(widget.habit.objectName,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MyHomePage(title: 'Home'),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
