import 'package:api_calling/Bloc/FormBloc/form_event.dart';
import 'package:api_calling/Bloc/FormBloc/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormBloc extends Bloc<SubmitForm, NewState> {
  FormBloc() : super(NewInitial());
}
