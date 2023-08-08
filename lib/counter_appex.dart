import 'package:flutter/material.dart';
import 'package:stream_demo/counterinde_stream.dart';

class CounterAppExDemo extends StatelessWidget {
  const CounterAppExDemo({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    //int doubleCounter = 0;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  CounterBlocInDe.counterValue = --counter;
                },
                icon: const Icon(Icons.minimize),
              ),
              StreamBuilder(
                initialData: 0,
                stream: CounterBlocInDe.counterStream,
                builder: (context, snapshot) => Text(snapshot.data.toString()),
              ),
              IconButton(
                onPressed: () {
                  CounterBlocInDe.counterValue = ++counter;
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  CounterBlocInDe.doubleCounterValue = counter -= 2;
                },
                icon: const Icon(Icons.minimize),
              ),
              StreamBuilder(
                initialData: 0,
                stream: CounterBlocInDe.doublecounterStream,
                builder: (context, snapshot) => Text(snapshot.data.toString()),
              ),
              IconButton(
                onPressed: () {
                  CounterBlocInDe.doubleCounterValue = counter += 2;
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
