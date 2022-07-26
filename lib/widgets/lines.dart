import 'dart:html';

import 'package:flutter/material.dart';
import 'package:vs/util/dimensions.dart';

class Lines extends StatelessWidget {
  Lines({Key? key, required this.length, required this.color})
      : super(key: key);
  final int length;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: color,
              thickness: 5,
              height: DeviceDimension.screenHeight * 0.01,
              endIndent: DeviceDimension.screenHeight * 0.1,
            ),
          );
        },
      ),
    );
  }
}
