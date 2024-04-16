import 'package:flutter/material.dart';

import 'package:my_blocs/config/design/designs.dart';

class MyTheme {
  MyTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyColors.brandPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColors.brandSecondaryColor,
      foregroundColor: MyColors.brandPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: MyColors.brandPrimaryColor),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MyColors.brandSecondaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColors.brandSecondaryColor,
      foregroundColor: MyColors.brandPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: MyColors.brandSecondaryColor),
  );
}
