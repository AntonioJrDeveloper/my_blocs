import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool theme = context.read<ThemeBloc>().state.theme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: theme ? Colors.black : Colors.white),
        ),
      ),
      body: Center(child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return IconButton(
              onPressed: () =>
                  context.read<ThemeBloc>().add(ThemeUpdateEvent()),
              icon: state.theme
                  ? const Icon(
                      Icons.light_mode_outlined,
                      size: 100,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.dark_mode_outlined,
                      size: 100,
                      color: Colors.white,
                    ));
        },
      )),
    );
  }
}
