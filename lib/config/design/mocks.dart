import 'package:flutter/material.dart';

import 'package:my_blocs/domain/models/button_nav_bar_model.dart';
import 'package:my_blocs/ui/views/views.dart';

class Mocks {
  Mocks._();
  static List<ButtonNavBarModel> listButtonNavBar = [
    ButtonNavBarModel(
      label: 'Counter',
      icon: Icons.home,
    ),
    ButtonNavBarModel(
      label: 'Theme',
      icon: Icons.toggle_on,
    ),
  ];
  static List<Widget> views = const [CounterView(), ThemeView()];
}
