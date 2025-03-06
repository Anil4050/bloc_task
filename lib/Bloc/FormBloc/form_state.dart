abstract class FormState {}

class FormInitial extends FormState {}

class FormLoading extends FormState {}

class FormSuccess extends FormState {
  final String message;
  FormSuccess(this.message);
}

class FormError extends FormState {
  final String error;
  FormError(this.error);
}
