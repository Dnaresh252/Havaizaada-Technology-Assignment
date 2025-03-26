import 'package:equatable/equatable.dart';
import '../models/product_model.dart';

abstract class CartState extends Equatable {
  final Map<Product, int> cartItems;
  const CartState({this.cartItems = const {}});

  @override
  List<Object> get props => [cartItems];
}

class CartUpdated extends CartState {
  const CartUpdated({required Map<Product, int> cartItems}) : super(cartItems: cartItems);
}
