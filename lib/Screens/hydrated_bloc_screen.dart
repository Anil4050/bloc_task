import 'package:api_calling/Bloc/hydrated_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HydratedBlocScreen extends StatefulWidget {
  const HydratedBlocScreen({super.key});

  @override
  State<HydratedBlocScreen> createState() => _HydratedBlocScreenState();
}

class _HydratedBlocScreenState extends State<HydratedBlocScreen> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: BlocBuilder<CounterCubit, int>(builder: (context, count) {
        return Center(
          child: Text(
            '$count',
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w800),
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: counterCubit.increment,
            heroTag: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: counterCubit.decrement,
            heroTag: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
