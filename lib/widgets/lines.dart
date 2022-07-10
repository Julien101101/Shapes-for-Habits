import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
              height: 1.h,
              endIndent: 10.h,
            ),
          );
        },
      ),
    );
  }
}
