import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final int page; // ✅ Requires an integer parameter

  LoadProducts(this.page); // ✅ Constructor with page number

  @override
  List<Object> get props => [page];
}
