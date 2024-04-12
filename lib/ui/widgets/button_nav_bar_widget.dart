import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';
import 'package:my_blocs/config/design/designs.dart';

class ButtonNavBarWidget extends StatelessWidget {
  const ButtonNavBarWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
  });

  final String label;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *
        0.25 /
        Mocks.listButtonNavBar.length;
    int page = context.watch<NavBarPageBloc>().state.page;
    return Column(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 2),
          height: 4,
          width: page == index ? width : 0,
          decoration: const BoxDecoration(
            color: MyColors.brandPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Icon(icon,
            color: page == index ? MyColors.brandPrimaryColor : Colors.grey),
        Text(
          label,
          style: TextStyle(
              color: page == index ? MyColors.brandPrimaryColor : Colors.grey),
        ),
      ],
    );
  }
}
