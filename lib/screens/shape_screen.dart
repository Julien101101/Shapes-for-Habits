import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vs/models/habits.dart';
import 'package:vs/screens/home_page.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/widgets/polygon.dart';

class ShapeScreen extends StatelessWidget {
  final Habits habit;

  const ShapeScreen({super.key, required this.habit});
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
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () async {
                  await shapeViewModel.deleteHabit(habit.id!);
                  pushNewScreen(context,
                      screen: MyHomePage(
                        title: 'Home',
                      ));
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
                  int count = habit.count;
                  count++;
                  await shapeViewModel.editHabit(habit.id!, count);
                },
                child: Polygon(
                  sides: habit.count,
                  color: Color(habit.color),
                ),
              )),
          Text(habit.objectName + " : " + habit.count.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
