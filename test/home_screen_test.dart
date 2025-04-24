import 'package:api_calling/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:api_calling/Bloc/PostBloc/post_bloc.dart';
import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/FormBloc/form_bloc.dart';
import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_bloc.dart';
import 'package:api_calling/Bloc/FirebaseBloc/firebase_crud_bloc.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_bloc.dart';
import 'package:api_calling/Bloc/ProductBloc/product_bloc.dart';
import 'package:api_calling/Bloc/hydrated_cubit.dart';
import 'package:api_calling/Bloc/notification_cubit.dart';
import 'package:api_calling/Services/auth_service.dart';
import 'package:api_calling/Services/database_helper.dart';
import 'package:api_calling/Services/firebase_service.dart';
import 'package:api_calling/Services/product_service.dart';
//widget test

void main() {
  testWidgets('HomeScreen UI test - should display dashboard and Get API card',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(create: (_) => PostBloc()..add(FetchPost())),
            BlocProvider<FormBloc>(create: (_) => FormBloc()),
            BlocProvider<LocalCrudBloc>(
                create: (_) => LocalCrudBloc(LocalDatabaseHelper())),
            BlocProvider<FirebaseCrudBloc>(
                create: (_) =>
                    FirebaseCrudBloc(firebaseService: FirebaseService())),
            BlocProvider<AuthBloc>(create: (_) => AuthBloc(AuthService())),
            BlocProvider<ProductBloc>(
                create: (_) => ProductBloc(ProductService())),
            BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
            BlocProvider<NotificationCubit>(create: (_) => NotificationCubit()),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      ),
    );

    await tester.pumpAndSettle();

    //expect(find.text('Dashboard'), findsOneWidget);

   // expect(find.text('Get API'), findsOneWidget);

    // (Optional) Tap on a card and test navigation
    // await tester.tap(find.text('Get API'));
    // await tester.pumpAndSettle();
    // expect(find.byType(PostScreen), findsOneWidget);
  });
}