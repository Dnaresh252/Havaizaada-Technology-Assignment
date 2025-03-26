import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartUpdated(cartItems: {})) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final updatedCart = Map<Product, int>.from(state.cartItems);
    updatedCart[event.product] = (updatedCart[event.product] ?? 0) + 1;

    print("✅ Added ${event.product.name} to cart. Total: ${updatedCart[event.product]}");
    emit(CartUpdated(cartItems: updatedCart));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedCart = Map<Product, int>.from(state.cartItems);
    if (updatedCart.containsKey(event.product)) {
      if (updatedCart[event.product]! > 1) {
        updatedCart[event.product] = updatedCart[event.product]! - 1;
      } else {
        updatedCart.remove(event.product);
      }
    }

    print("🛒 Removed ${event.product.name} from cart. Remaining: ${updatedCart[event.product] ?? 0}");
    emit(CartUpdated(cartItems: updatedCart));
  }
}
