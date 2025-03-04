import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/PostBloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/PostBloc/post_bloc.dart';


class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts List')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.posts[index]['title']),
                  subtitle: Text(state.posts[index]['body']),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Press the button to fetch posts.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(FetchPost()); // Trigger API call
        },
        child: Icon(Icons.cloud_download),
      ),
    );
  }
}
