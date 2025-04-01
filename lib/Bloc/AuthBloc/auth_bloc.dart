import 'package:api_calling/Bloc/AuthBloc/auth_event.dart';
import 'package:api_calling/Bloc/AuthBloc/auth_state.dart';
import 'package:api_calling/Services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<SignInWithEmail>((event, state) async {
      emit(AuthLoading());
      final user = _authService.signinWithEmail(event.email, event.pass);

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    });

    on<RegisterWithEmail>((event, state) async {
      emit(AuthLoading());
      final user = _authService.registerWithEmail(event.email, event.pass);

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    });

    on<SignOut>((event, state) async {
      await _authService.signOut();
      emit(UnAuthenticated());
    });
  }
}
