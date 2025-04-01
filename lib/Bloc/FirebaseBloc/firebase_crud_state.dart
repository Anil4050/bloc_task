import 'package:api_calling/Models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class FirebaseCrudState extends Equatable {
  const FirebaseCrudState();

  @override
  List<Object?> get props => [];
}

class FirebaseCrudInitial extends FirebaseCrudState {}

class FirebaseCrudLoading extends FirebaseCrudState {}

class FirebaseCrudLoaded extends FirebaseCrudState {
  final List<UserModel> users;
  FirebaseCrudLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class FirebaseCrudError extends FirebaseCrudState {
  final String messaage;

  FirebaseCrudError(this.messaage);
    @override
  List<Object?> get props => [messaage];
}
