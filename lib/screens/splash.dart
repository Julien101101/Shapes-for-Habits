import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sfh/util/constants.dart';
import 'package:sfh/util/dimensions.dart';
import 'package:sfh/view%20model/user_view_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<UserViewModel>().isUserLoggedIn().then((value) {
              if (value) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "main", (route) => false);
                });
              } else {
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "login_screen", (route) => false);
                });
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(child: SvgPicture.asset(Constant.IMG_4)));
  }
}
