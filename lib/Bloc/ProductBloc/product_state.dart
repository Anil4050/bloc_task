import 'package:api_calling/Models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasMore;

  ProductLoaded(this.products, this.hasMore);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}