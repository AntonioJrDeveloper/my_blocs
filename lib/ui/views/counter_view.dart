import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:my_blocs/config/blocs/blocs.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (_, state) {
          return Column(
            children: <Widget>[
              Gap.expand(top),
              CounterWidget(counter: state.counter),
              const Expanded(
                  child: SizedBox(
                height: double.infinity,
              )),
              const GroupButtons(),
            ],
          );
        },
      ),
    );
  }
}

class GroupButtons extends StatelessWidget {
  const GroupButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementeEvent()),
            child: const Icon(
              Icons.add,
            ),
          ),
          const Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementeEvent()),
            child: const Icon(
              Icons.remove,
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
    return Center(
        child: Text(
      counter.toString(),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
    ));
  }
}
