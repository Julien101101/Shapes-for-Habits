import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vs/widgets/bullet.dart';

class Shape extends StatefulWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  State<Shape> createState() => _ShapeState();
}

class _ShapeState extends State<Shape> {
  bool _isSelected = false;
  final Color color = Colors.white;
  List names = ['polygon', 'dots', 'lines'];
  List taps = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            ShapeRow(taps.contains(names[index]), names[index]),
                      ));
                }),
          ),
        ],
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
                  fontSize: MediaQuery.of(context).size.height * 0.1,
                  color: selected ? Colors.orange[400] : Colors.grey,
                )),
          ),
        )
      ],
    );
  }
}
