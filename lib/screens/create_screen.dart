import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe/swipe.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/widgets/color_on_select.dart';
import 'package:vs/widgets/lines.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:vs/widgets/shapes.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Consumer<ShapeViewModel>(builder: (context, shape, child) {
      return Swipe(
        onSwipeDown: () {
          setState(() {
            print('drag');
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shape(),
                  )),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColorOnSelect(),
                  )),
              shape.name.contains('polygon')
                  ? Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          shape.incrementCounter();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Polygon(sides: shape.counter, color: shape.color),
                        ),
                      ),
                    )
                  : shape.name.contains('lines')
                      ? Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              shape.incrementLine();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Lines(
                                  length: shape.linecounter,
                                  color: shape.color),
                            ),
                          ),
                        )
                      : Flexible(child: Container())
            ],
          ),
        ),
      );
    }));
  }
}
