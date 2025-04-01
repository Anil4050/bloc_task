abstract class AuthEvent {}

class SignInWithEmail extends AuthEvent {
  final String email, pass;
  SignInWithEmail(this.email, this.pass);
}

class RegisterWithEmail extends AuthEvent {
  final String email, pass;
  RegisterWithEmail(this.email, this.pass);
}

class SignInWithGoogle extends AuthEvent {}

class SignOut extends AuthEvent {}
