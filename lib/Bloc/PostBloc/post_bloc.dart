import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/PostBloc/post_state.dart';
import 'package:api_calling/Services/api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<dynamic> _allPosts = [];
  PostBloc() : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await ApiService.fetchPosts();
        _allPosts = posts;
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<SearchPost>((event, emit) {
      if (state is PostLoaded) {
        final filtredPosts = _allPosts
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(event.query.toLowerCase()))
            .toList();

        emit(PostLoaded(filtredPosts));
      }
    });
  }
}
