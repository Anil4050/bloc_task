abstract class NewState {}

class NewInitial extends NewState {}

class NewLoading extends NewState {}

class NewLoaded extends NewState {
  final List<dynamic> users;
  NewLoaded(this.users);
}

class NewError extends NewState {
  final String message;
  NewError(this.message);
}
