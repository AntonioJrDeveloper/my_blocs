import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';
import 'package:my_blocs/config/design/theme.dart';
import 'package:my_blocs/config/routers/app_routes.dart';
import 'package:my_blocs/config/web_desktop/app_scroll_behavior.dart';

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
        ),
        BlocProvider(
          create: (_) => NavBarPageBloc(),
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
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'My Blocs',
        routerConfig: AppRoutes.appRouter,
        theme: theme ? MyTheme.lightTheme : MyTheme.darkTheme);
  }
}
