import 'package:api_calling/Bloc/AuthBloc/auth_bloc.dart';
import 'package:api_calling/Bloc/FirebaseBloc/firebase_crud_bloc.dart';
import 'package:api_calling/Bloc/FormBloc/form_bloc.dart';
import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_bloc.dart';
import 'package:api_calling/Bloc/PostBloc/post_bloc.dart';
import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/ProductBloc/product_bloc.dart';
import 'package:api_calling/Bloc/hydrated_cubit.dart';
import 'package:api_calling/Services/auth_service.dart';
import 'package:api_calling/Services/database_helper.dart';
import 'package:api_calling/Services/firebase_options.dart';
import 'package:api_calling/Services/firebase_service.dart';
import 'package:api_calling/Services/product_service.dart';
import 'package:api_calling/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Impeller.disable();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final DatabaseReference _dbRef =
  //     FirebaseDatabase.instance.ref().child('user');

  @override
  Widget build(BuildContext context) {
    //   _dbRef.set({"Message": "Hello World"}).then((value) => print("Data Added"));

    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (BuildContext context) => PostBloc()..add(FetchPost()),
        ),
        BlocProvider<FormBloc>(
          create: (BuildContext context) => FormBloc(),
        ),
        BlocProvider<LocalCrudBloc>(
          create: (BuildContext context) =>
              LocalCrudBloc(LocalDatabaseHelper()),
        ),
        BlocProvider<FirebaseCrudBloc>(
          create: (BuildContext context) =>
              FirebaseCrudBloc(firebaseService: FirebaseService()),
        ),
        BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(AuthService())),
        BlocProvider<ProductBloc>(
            create: (BuildContext context) => ProductBloc(ProductService())),
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
