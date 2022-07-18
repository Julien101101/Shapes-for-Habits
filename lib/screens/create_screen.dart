import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    ShapeViewModel shapeViewModel = context.read<ShapeViewModel>();
    return Scaffold(
      body: Container(
          child: GestureDetector(
              onVerticalDragUpdate: (details) {
                print('drag');
              },
              child: Column(children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Shape()),
                      Flexible(child: ColorOnSelect()),
                      shapeViewModel.name.contains('polygon')
                          ? Flexible(
                              child: Polygon(
                                  sides: shapeViewModel.counter,
                                  color: shapeViewModel.color),
                            )
                          : shapeViewModel.name.contains('lines')
                              ? Flexible(
                                  child: Lines(
                                      length: shapeViewModel.linecounter,
                                      color: shapeViewModel.color),
                                )
                              : Flexible(child: Container())
                    ],
                  ),
                )
              ]))),
    );
  }
}
