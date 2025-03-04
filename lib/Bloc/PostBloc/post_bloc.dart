import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/PostBloc/post_state.dart';
import 'package:api_calling/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await ApiService.fetchPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
