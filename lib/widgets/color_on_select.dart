import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view model/shape_view_model.dart';

class ColorOnSelect extends StatelessWidget {
  ColorOnSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ShapeViewModel shapeViewModel = context.read<ShapeViewModel>();
    return Padding(
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: shapeViewModel.colors.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      shapeViewModel.setColor(shapeViewModel.colors[index]);
                    },
                    child: GridTile(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: shapeViewModel.colors[index],
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
