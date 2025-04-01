import 'package:api_calling/Bloc/FirebaseBloc/firebasae_crud_event.dart';
import 'package:api_calling/Bloc/FirebaseBloc/firebase_crud_state.dart';
import 'package:api_calling/Services/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseCrudBloc extends Bloc<FirebasaeCrudEvent, FirebaseCrudState> {
  final FirebaseService _firebaseService;

  FirebaseCrudBloc({required FirebaseService firebaseService})
      : _firebaseService = firebaseService,
        super(FirebaseCrudInitial()) {
    on<LoadUser>((event, state) async {
      emit(FirebaseCrudLoading());
      try {
        await for (final users in _firebaseService.streamUsers()) {
          emit(FirebaseCrudLoaded(users));
        }
      } catch (e) {
        emit(FirebaseCrudError(e.toString()));
      }
    });

    on<AddUser>((event, state) async {
      await _firebaseService.addUser(event.user);
    });

    on<DeleteUser>((event, state) async {
      await _firebaseService.deleteUser(event.id);
    });
  }
}
