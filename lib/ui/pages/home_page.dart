import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';
import 'package:my_blocs/config/design/designs.dart';
import 'package:my_blocs/config/routers/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    bool theme = context.read<ThemeBloc>().state.theme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Blocs',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: theme ? Colors.black : Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                style: Styles.buttonStyle,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.counterPage);
                },
                child: Text(
                  'Counter',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            ElevatedButton(
              style: Styles.buttonStyle,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.themePage);
              },
              child: Text(
                'Theme',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
