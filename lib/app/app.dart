import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';
import 'package:my_blocs/config/routers/app_routes.dart';
import 'package:my_blocs/ui/pages/pages.dart';

class MyBlocsProviders extends StatelessWidget {
  const MyBlocsProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool theme = context.watch<ThemeBloc>().state.theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Blocs',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.counterPage:
            return MaterialPageRoute(builder: (_) => const CounterPage());
          case AppRoutes.themePage:
            return MaterialPageRoute(builder: (_) => const ThemePage());
          default:
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
      theme: ThemeData(
        brightness: theme ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
