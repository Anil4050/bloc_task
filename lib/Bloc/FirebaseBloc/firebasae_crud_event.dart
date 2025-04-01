import 'package:api_calling/Models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class FirebasaeCrudEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUser extends FirebasaeCrudEvent {}

class AddUser extends FirebasaeCrudEvent {
  final UserModel user;
  AddUser(this.user);
  @override
  List<Object> get props => [user];
}

// class UpdateUser extends FirebasaeCrudEvent {
//   final UserModel user;
//   UpdateUser(this.user);
// }

class DeleteUser extends FirebasaeCrudEvent {
  final String id;
  DeleteUser(this.id);
  @override
  List<Object> get props => [id];
}
