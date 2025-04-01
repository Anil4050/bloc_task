import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../Services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<SignInWithEmail>((event, emit) async {
      emit(AuthLoading());
      User? user = await _authService.signInWithEmail(event.email, event.pass);

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Email sign-in failed"));
      }
    });

    on<RegisterWithEmail>((event, emit) async {
      emit(AuthLoading());
      User? user = await _authService.registerWithEmail(event.email, event.pass);

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Email registration failed"));
      }
    });

    on<SignInWithGoogle>((event, emit) async {
      emit(AuthLoading());
      User? user = await _authService.signInWithGoogle();

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Google sign-in failed"));
      }
    });

    on<SignOut>((event, emit) async {
      await _authService.signOut();
      emit(UnAuthenticated());
    });
  }
}
