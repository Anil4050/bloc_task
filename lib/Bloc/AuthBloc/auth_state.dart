abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User;
  Authenticated(this.User);
}

class UnAuthenticated extends AuthState {}
