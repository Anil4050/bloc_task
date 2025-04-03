import 'package:api_calling/Models/product_model.dart';
import 'package:api_calling/Services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService;
  int _offset = 0;
  final int _limit = 10;
  List<Product> _allProducts = [];
  bool _hasMore = true;

  ProductBloc(this._productService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      if (!_hasMore) return;

      try {
        emit(ProductLoading());
        List<Product> newProducts = await _productService.fetchProducts(_offset, _limit);

        _hasMore = newProducts.length == _limit;
        _offset += _limit;
        _allProducts.addAll(newProducts);

        emit(ProductLoaded(_allProducts, _hasMore));
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });
  }
}