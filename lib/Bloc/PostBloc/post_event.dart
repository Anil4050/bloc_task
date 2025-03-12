abstract class PostEvent {}

class FetchPost extends PostEvent {}

class SearchPost extends PostEvent {
  final String query;
  SearchPost(this.query);
}
