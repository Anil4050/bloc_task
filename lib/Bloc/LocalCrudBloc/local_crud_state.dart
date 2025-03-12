abstract class LocalCrudState {}

class LocalCrudInitial extends LocalCrudState {}

class LocalCrudLoading extends LocalCrudState {}

class LocalCrudSuccess extends LocalCrudState {}

class LocalCrudError extends LocalCrudState {
  final String message;
  LocalCrudError(this.message);
}
