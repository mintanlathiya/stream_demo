import 'package:flutter/material.dart';
import 'package:stream_demo/counter_strean.dart';

class CounterDemoUi extends StatelessWidget {
  const CounterDemoUi({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: CounterBloc.counterStream,
          builder: (context, snapshot) => Text(snapshot.data.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            CounterBloc.counterValue = ++counter;
          },
          child: const Icon(Icons.add)),
    );
  }
}
