import 'package:api_calling/Bloc/FormBloc/form_bloc.dart';
import 'package:api_calling/Bloc/PostBloc/post_bloc.dart';
import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Screens/PostScreens/post_screen.dart';
import 'package:api_calling/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<PostBloc>(
            create: (BuildContext context) => PostBloc()..add(FetchPost()),
          ),
          BlocProvider<FormBloc>(
            create: (BuildContext context) => FormBloc(),
          ),
        ], child: HomeScreen()));
  }
}
