import 'package:api_calling/Bloc/FormBloc/form_event.dart';
import 'package:api_calling/Bloc/FormBloc/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormInitial()) {
    on<SubmitFormData>(_submitData);
  }

  Future<void> _submitData(SubmitFormData event, Emitter<FormState> emit) async {
    emit(FormLoading());
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var dataBody = jsonEncode({"title": event.title, "body": event.body, "userId": 1});
    var headers = {"Content-Type": "application/json"};

    try {
      final response = await http.post(url, body: dataBody, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(FormSuccess("Post created successfully!"));
      } else {
        emit(FormError("Something went wrong"));
      }
    } catch (e) {
      emit(FormError("Network error: ${e.toString()}"));
    }
  }
}
