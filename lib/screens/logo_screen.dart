import 'package:flutter/material.dart';
import 'package:vs/util/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    });
    return Container(
        color: Colors.blue,
        child: Center(child: SvgPicture.asset(Constant.IMG_5)));
  }
}
