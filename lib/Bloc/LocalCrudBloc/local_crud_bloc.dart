import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_event.dart';
import 'package:api_calling/Bloc/LocalCrudBloc/local_crud_state.dart';
import 'package:api_calling/Services/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCrudBloc extends Bloc<LocalCrudEvent, LocalCrudState> {
  final LocalDatabaseHelper dbHelper;

  LocalCrudBloc(this.dbHelper) : super(LocalCrudInitial()) {
    on<AddItem>((event, emit) async {
      emit(LocalCrudLoading());
      try {
        await dbHelper.insertItem(event.title, event.description);
        emit(LocalCrudSuccess());
      } catch (e) {
        emit(LocalCrudError("Insert Failed ${e.toString}"));
      }
    });
  }
}
