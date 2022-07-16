import 'package:flutter/material.dart';
class ColorOnSelect extends StatelessWidget {
  ColorOnSelect({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.15),
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
                itemCount: colors.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(8.0),
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
