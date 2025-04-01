import 'package:api_calling/Bloc/PostBloc/post_event.dart';
import 'package:api_calling/Bloc/PostBloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/PostBloc/post_bloc.dart';

// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});

//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<PostBloc>().add(FetchPost());
//   }
//   @override
//   Widget build(BuildContext context) {

//         return Scaffold(
//       appBar: AppBar(title: Text('Posts List')),
//       body: BlocBuilder<PostBloc, PostState>(
//         builder: (context, state) {
//           if (state is PostLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is PostLoaded) {
//             return ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(state.posts[index]['title']),
//                   subtitle: Text(state.posts[index]['body']),
//                 );
//               },
//             );
//           } else if (state is PostError) {
//             return Center(child: Text(state.message));
//           }
//           return Center(child: Text('Press the button to fetch posts.'));
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     context.read<PostBloc>().add(FetchPost()); // Trigger API call
//       //   },
//       //   child: Icon(Icons.cloud_download),
//       // ),
//     );
//   }
// }

class PostScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts List')),
      body: Column(
        children: [
//Search functionality -------------------------------12/3/25
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        // searchController.clear();
                        context.read<PostBloc>().add((FetchPost()));
                      },
                      icon: Icon(Icons.search))),
              onChanged: (value) {
                context.read<PostBloc>().add(SearchPost(value));
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<PostBloc, PostState>(
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
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<PostBloc>().add(FetchPost()); // Trigger API call
      //   },
      //   child: Icon(Icons.cloud_download),
      // ),
    );
  }
}
