import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api_service.dart';
import 'blocs/product_bloc.dart';
import 'blocs/cart_bloc.dart';

// ✅ Import the missing event file
import 'blocs/product_event.dart';

import 'views/product_list_screen.dart';

void main() {
  final apiService = ApiService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(apiService)..add(LoadProducts(0))),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(),
    );
  }
}
