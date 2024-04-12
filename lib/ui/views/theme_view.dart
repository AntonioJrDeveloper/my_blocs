import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: IconButton(
            onPressed: () => context.read<ThemeBloc>().add(ThemeUpdateEvent()),
            icon: Icon(
              state.theme
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              size: 100,
            ),
          )),
        );
      },
    );
  }
}
