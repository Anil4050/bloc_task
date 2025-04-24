import 'package:api_calling/Bloc/FirebaseBloc/firebasae_crud_event.dart';
import 'package:api_calling/Bloc/FirebaseBloc/firebase_crud_bloc.dart';
import 'package:api_calling/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseCrudScreen extends StatelessWidget {
  FirebaseCrudScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Firebase CRUD")),
        //   appBar: AppBar(
        //     title: const Text("Firebase CRUD"),
        //   ),
        //   body:

        //    BlocBuilder<FirebaseCrudBloc, FirebaseCrudState> (builder: (context, state) {
        //     if(state is FirebaseCrudLoading){
        //         return Center(child: CircularProgressIndicator(),);
        //     }else if(state is FirebaseCrudLoaded){
        //         return ListView.builder(itemBuilder: )
        //     }
        //   })
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: mobileCotroller,
              ),
              ElevatedButton(
                  onPressed: () {
                    final user = UserModel(
                        id: '',
                        name: nameController.text.trim(),
                        mobile: mobileCotroller.text.trim());

                    context.read<FirebaseCrudBloc>().add(AddUser(user));
                    nameController.clear();
                    mobileCotroller.clear();
                  },
                  child: const Text("Add User"))
            ],
          ),
        ));
  }
}
