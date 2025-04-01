import 'package:api_calling/Bloc/AuthBloc/auth_bloc.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_event.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_state.dart';
import 'package:api_calling/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(AuthService()),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Authentication'),
            ),
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Welcome ${state.User.email}')));
                } else if (state is UnAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Authentication Failed!')));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is Authenticated) {
                  return Center(
                    child: Column(
                      children: [
                        Text("Logged in As ${state.User.email}"),
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(SignOut());
                            },
                            child: Text("SignOut"))
                      ],
                    ),
                  );
                }

                return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10.0,
                      children: [
                        TextField(
                          controller: _emailController,
                        ),
                        TextField(
                          controller: _passWordController,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              final email = _emailController.text.trim();
                              final pass = _passWordController.text.trim();

                              if (isLogin) {
                                context
                                    .read<AuthBloc>()
                                    .add(SignInWithEmail(email, pass));
                              } else {
                                context
                                    .read<AuthBloc>()
                                    .add(RegisterWithEmail(email, pass));
                              }
                            },
                            child: Text(isLogin ? "Login" : "Register")),
                      ],
                    ));
              },
            )));
  }
}
