// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/cart_bloc.dart';
// import '../blocs/cart_event.dart';
// import '../blocs/cart_state.dart';
// import '../models/product_model.dart';
// import 'product_list_screen.dart';
//
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shopping Cart"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ProductListScreen()),
//             );
//           },
//         ),
//       ),
//       body: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state.cartItems.isEmpty) {
//             return Center(
//               child: Text(
//                 "Your cart is empty!",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             );
//           }
//
//           double total = state.cartItems.entries.fold(0, (sum, entry) {
//             return sum + (entry.key.discountedPrice * entry.value);
//           });
//
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.all(12.0),
//                   children: state.cartItems.entries.map((entry) {
//                     return CartItemWidget(product: entry.key, quantity: entry.value);
//                   }).toList(),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Total:",
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "₹${total.toStringAsFixed(2)}",
//                           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 180,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // TODO: Implement checkout functionality
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           padding: EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         ),
//                         child: Text("Place Order", style: TextStyle(fontSize: 18, color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class CartItemWidget extends StatelessWidget {
//   final Product product;
//   final int quantity;
//
//   const CartItemWidget({required this.product, required this.quantity});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2)
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               product.image,
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   "₹${product.discountedPrice.toStringAsFixed(2)}",
//                   style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         context.read<CartBloc>().add(RemoveFromCart(product));
//                       },
//                       icon: Icon(Icons.remove_circle_outline, color: Colors.red),
//                     ),
//                     Text(
//                       "$quantity",
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         context.read<CartBloc>().add(AddToCart(product));
//                       },
//                       icon: Icon(Icons.add_circle_outline, color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/cart_event.dart';
import '../blocs/cart_state.dart';
import '../models/product_model.dart';
import 'product_list_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart",style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
       // backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );
          },
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          double total = state.cartItems.entries.fold(0, (sum, entry) {
            return sum + (entry.key.discountedPrice * entry.value);
          });

          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.all(12.0),
                children: state.cartItems.entries.map((entry) {
                  return CartItemWidget(product: entry.key, quantity: entry.value);
                }).toList(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "₹${total.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement checkout functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text("Checkout", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemWidget({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹${product.discountedPrice.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(RemoveFromCart(product));
                        },
                        icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(AddToCart(product));
                        },
                        icon: Icon(Icons.add_circle_outline, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}