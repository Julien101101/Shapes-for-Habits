import 'package:flutter/widgets.dart';

class DeviceDimension {
  static late double screenHeight;
  static late double screenWidth;

  static late double sizedBoxHeight;
  static late double height250;
  static late double borderRadius;
  static late double borderSmallRadius;
  static late double textFormFieldContainerWidth;
  static late double appButtonContainerWidth;
  static late double appButtonContainerHeight;
  static late double appTwentyPadding;
  static late double appFortyPadding;
  static late double appFiftyPadding;
  static late double appTenPadding;
  static late double navDrawerHeaderHeight;
  static late double navDrawerHeaderBigTextSize;
  static late double navDrawerHeaderBigIconSize;
  static late double searchIconSize;
  static late double smallIconSize;
  static late double appIconSize;
  static late double sideNavHeight;
  static late double bigTextSize;
  static late double bigText60Size;
  static late double smallTextSize;
  static late double verySmallTextSize;
  static late double footerTextSize;
  static late double securityButtonHeight;
  static late double toolBarHeight;
  static late double navBarItemMargin;
  static late double planCardWidth;
  static late double planCardOuterHeight;
  static late double planBrandsCardHeight;
  static late double leftRightFourMargin;
  static late double youtubeMargin;
  static late double appBarPadding;
  static late double height200;
  static late double height100;
  static late double height140;
  static late double width140;
  static late double height10;
  static late double width10;
  static late double width5;
  static late double fundManagerLogoHeight;
  static late double fundManagerLogoWidth;
  static late double buttonHeight;
  static late double mainCardHeight;
  static late double planCardHeight;
  static late double smallButtonContainerWidth;
  static late double height20;
  static late double tabsSectionHeight;
  static late double tabLinerHeight;
  static late double tabTextHeight;
  static late double heightImageInner;
  static late double heightImageOuter;
  static late double drawerHeaderImageHeight;

  static void init({
    required context,
  }) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    sizedBoxHeight = screenHeight / 84;
    borderRadius = screenHeight / 21;
    borderSmallRadius = screenHeight / 62;
    textFormFieldContainerWidth = screenWidth / 1.20;
    appButtonContainerWidth = screenWidth / 1.6;
    appButtonContainerHeight = screenHeight / 16;
    appTwentyPadding = screenHeight / 60;
    appFortyPadding = screenHeight / 30;
    appFiftyPadding = screenHeight / 16;
    appTenPadding = screenHeight / 120;
    navDrawerHeaderHeight = screenHeight / 8;
    navDrawerHeaderBigTextSize = screenHeight / 38;
    navDrawerHeaderBigIconSize = screenHeight / 11;
    searchIconSize = screenHeight / 35;
    smallIconSize = screenHeight / 35;
    appIconSize = screenHeight / 26;
    sideNavHeight = screenHeight / 1.5;
    bigTextSize = screenHeight / 42;
    bigText60Size = screenHeight / 14;
    smallTextSize = screenHeight / 56;
    verySmallTextSize = screenHeight / 70;
    footerTextSize = screenHeight / 56;
    securityButtonHeight = screenHeight / 14;
    toolBarHeight = screenHeight / 10;
    navBarItemMargin = screenHeight / 106;
    planCardWidth = screenWidth / 1.28;
    planCardOuterHeight = screenHeight / 1.60;
    planBrandsCardHeight = screenHeight / 16;
    leftRightFourMargin = screenHeight / 102;
    youtubeMargin = screenHeight / 50;
    appBarPadding = screenHeight / 84.3;
    height200 = screenHeight / 4.2;
    height100 = screenHeight / 8.4;
    height10 = screenHeight / 84.3;
    width10 = screenWidth / 41.1;
    width5 = screenWidth / 82.2;
    fundManagerLogoHeight = screenHeight / 14;
    fundManagerLogoWidth = screenWidth / 7.4;
    buttonHeight = screenHeight / 14;
    mainCardHeight = screenHeight / 2.1;
    planCardHeight = screenHeight / 1.60;
    smallButtonContainerWidth = screenWidth / 3.2;
    height20 = screenHeight / 42;
    tabsSectionHeight = screenHeight / 10.5;
    tabLinerHeight = screenHeight / 421.5;
    tabTextHeight = screenHeight / 46.8;
    heightImageInner = screenHeight / 8.43;
    heightImageOuter = screenHeight / 8.20;
    drawerHeaderImageHeight = screenHeight / 21;
    height140 = screenHeight / 6;
    width140 = screenWidth / 3;
    height250 = screenHeight / 3.5;
  }
}