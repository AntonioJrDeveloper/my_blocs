import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_blocs/config/blocs/blocs.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool theme = context.read<ThemeBloc>().state.theme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: theme ? Colors.black : Colors.white),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (_, state) {
          if (state is CounterInitial) {
            return CounterWidget(counter: state.counter);
          }
          if (state is CounterUpdate) {
            return CounterWidget(counter: state.counter);
          }
          return Container();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '+',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementeEvent()),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          FloatingActionButton(
            heroTag: '-',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementeEvent()),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CounterWidget extends StatelessWidget {
  late int counter;
  CounterWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    bool theme = context.read<ThemeBloc>().state.theme;
    return Center(
        child: Text(
      counter.toString(),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: theme ? Colors.black : Colors.white),
    ));
  }
}
