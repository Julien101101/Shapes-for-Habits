import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'dart:math' as math;

class Polygon extends StatefulWidget {
  final int sides;
  final Color color;

  const Polygon({Key? key, required this.sides, required this.color})
      : super(key: key);
  @override
  PolygonState createState() => PolygonState();
}

class PolygonState extends State<Polygon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.2,
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                  ),*/
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: ClipPolygon(
          
          sides: widget.sides,
          borderRadius: 0.0, // Default 0.0 degrees
          rotate: 0.0, // Default 0.0 degrees
          boxShadows: [
            PolygonBoxShadow(color: Colors.black, elevation: 1.0),
            PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
          ],
          child: Container(color: widget.color),
        ),
      ),
    );
  }
}
