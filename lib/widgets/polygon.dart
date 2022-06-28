import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class Polygon extends StatefulWidget {
  final int sides;

  const Polygon({Key? key, required this.sides}) : super(key: key);
  @override
  PolygonState createState() => PolygonState();
}

class PolygonState extends State<Polygon> {
  @override
  Widget build(BuildContext context) {
    print(widget.sides);
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.2,
          horizontal: MediaQuery.of(context).size.width * 0.3,
        ),
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
          child: Container(color: Color(0xFF8BA1EF)),
        )));
  }
}
