import 'package:api_calling/Bloc/counter_bloc_stream_controller.dart';
import 'package:flutter/material.dart';


class HdratedWithStreamController extends StatefulWidget {
  @override
  _HdratedWithStreamControllerState createState() => _HdratedWithStreamControllerState();
}

class _HdratedWithStreamControllerState extends State<HdratedWithStreamController> {
  final bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose(); // Always dispose BLoC
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLoC StreamController')),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Counter: ${snapshot.data}',
              style: TextStyle(fontSize: 28),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.incrementSink.add(null); // Send event to BLoC
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
