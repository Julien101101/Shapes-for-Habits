import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vs/screens/calendar.dart';
import 'package:vs/screens/home_page.dart';
import 'package:vs/screens/profile.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController? _controller;
  List<Widget> _buildscreens = [];
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(
      initialIndex: 0,
    );
    _buildscreens.add(MyHomePage(
      title: 'Home',
    ));
    _buildscreens.add(ProfileScreen());
    _buildscreens.add(CalendarPage());
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.category_sharp),
          title: 'Home',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.calendar_month),
          title: 'Calendar',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('nav');
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildscreens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.blue, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
