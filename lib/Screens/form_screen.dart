import 'package:api_calling/Bloc/FormBloc/form_event.dart';
import 'package:api_calling/Bloc/FormBloc/form_bloc.dart';
import 'package:api_calling/Bloc/FormBloc/form_state.dart' as form_state;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<FormBloc, form_state.FormState>(
              listener: (context, state) {
                if (state is form_state.FormSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is form_state.FormError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is form_state.FormLoading
                      ? null
                      : () {
                          final title = titleController.text;
                          final body = descriptionController.text;
                          if (title.isNotEmpty && body.isNotEmpty) {
                            context.read<FormBloc>().add(
                                  SubmitFormData(title: title, body: body),
                                );
                          }
                        },
                  child: state is form_state.FormLoading
                      ? const CircularProgressIndicator()
                      : const Text("Submit"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
