import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/cart_event.dart';
import '../models/product_model.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text("₹${product.discountedPrice} x $quantity"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                context.read<CartBloc>().add(RemoveFromCart(product));
              },
            ),
            Text(quantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<CartBloc>().add(AddToCart(product));
              },
            ),
          ],
        ),
      ),
    );
  }
}
