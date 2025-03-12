import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_bloc.dart';
import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_event.dart';
import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCrudScreen extends StatefulWidget {
  const LocalCrudScreen({super.key});

  @override
  State<LocalCrudScreen> createState() => _LocalCrudScreenState();
}

class _LocalCrudScreenState extends State<LocalCrudScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descController,
                decoration: InputDecoration(hintText: "Descrition"),
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<LocalCrudBloc, LocalCrudState>(
                  builder: (context, state) {
                return ElevatedButton(
                    onPressed: state is LocalCrudLoading
                        ? null
                        : () {
                            context.read<LocalCrudBloc>().add(AddItem(
                                _titleController.text, _descController.text));
                          },
                    child: state is LocalCrudLoading
                        ? CircularProgressIndicator()
                        : Text("Insert"));
              }, listener: (context, state) {
                if (state is LocalCrudSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data Inserted Success")));
      
                  _titleController.clear();
                  _descController.clear();
                } else if (state is LocalCrudError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
