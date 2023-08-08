import 'dart:async';

class CounterBloc {
  static final StreamController<int> _counterStreamController =
      StreamController<int>();
  static Stream<int> get counterStream => _counterStreamController.stream;
  static Sink<int> get counterSink => _counterStreamController.sink;
  static set counterValue(int data) => counterSink.add(data);
}
