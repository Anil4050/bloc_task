import 'dart:async';

class CounterBloc {
  int _counter = 0;

  // StreamController for output (data)
  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;

  // StreamController for input (events)
  final _eventController = StreamController<void>();
  Sink<void> get incrementSink => _eventController.sink;

  CounterBloc() {
    // Listen to events
    _eventController.stream.listen((_) {
      _counter++;
      _counterController.sink.add(_counter);
    });
  }

  void dispose() {
    _counterController.close();
    _eventController.close();
  }
}
