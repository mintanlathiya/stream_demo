import 'dart:async';

class CounterBlocInDe {
  static final StreamController<int> _counterStreamController =
      StreamController<int>();
  static Stream<int> get counterStream => _counterStreamController.stream;
  static Sink<int> get counterSink => _counterStreamController.sink;
  static set counterValue(int data) => counterSink.add(data);

  static final StreamController<int> _doubleCounterStreamController =
      StreamController<int>();
  static Stream<int> get doublecounterStream =>
      _doubleCounterStreamController.stream;
  static Sink<int> get doubleCounterSink => _doubleCounterStreamController.sink;
  static set doubleCounterValue(int data) => doubleCounterSink.add(data);
}
