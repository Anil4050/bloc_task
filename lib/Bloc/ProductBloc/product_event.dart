abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  final int offset;
  final int limit;

  FetchProducts(this.offset, this.limit);
}