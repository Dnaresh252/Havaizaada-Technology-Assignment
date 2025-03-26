import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/api_service.dart';
import '../models/product_model.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;
  int currentPage = 0;
  bool hasMore = true; // ✅ Track if more products exist

  ProductBloc(this.apiService) : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    if (!hasMore) return; // ✅ Stop loading if no more products

    try {
      final currentState = state;
      List<Product> products = [];

      if (currentState is ProductLoaded) {
        products = currentState.products;
      }

      final newProducts = await apiService.fetchProducts(currentPage * 10, 10);
      hasMore = newProducts.length == 10; // ✅ If less than 10, stop pagination

      currentPage++; // ✅ Move to next page

      print("Loaded ${newProducts.length} products");

      emit(ProductLoaded(products: products + newProducts, hasMore: hasMore));
    } catch (e) {
      emit(ProductError("Error loading products."));
    }
  }
}
