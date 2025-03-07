abstract class FormEvent {}

class SubmitFormData extends FormEvent {
  final String title;
  final String body;
  

  SubmitFormData({required this.title, required this.body});
}
