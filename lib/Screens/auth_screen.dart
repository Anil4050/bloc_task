import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_bloc.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_event.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_state.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome ${state.user.email}'))
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message))
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Authenticated) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logged in as ${state.user.email}"),
                  ElevatedButton(
                    onPressed: () => context.read<AuthBloc>().add(SignOut()),
                    child: Text("Sign Out")
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
                TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final pass = _passwordController.text.trim();

                    if (isLogin) {
                      context.read<AuthBloc>().add(SignInWithEmail(email, pass));
                    } else {
                      context.read<AuthBloc>().add(RegisterWithEmail(email, pass));
                    }
                  },
                  child: Text(isLogin ? "Login" : "Register"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(SignInWithGoogle());
                  },
                  child: Text("Sign in with Google"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
